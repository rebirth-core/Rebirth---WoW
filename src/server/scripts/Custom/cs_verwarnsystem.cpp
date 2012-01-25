#include "ScriptPCH.h"

class warn_commandscript : public CommandScript
{
    public:
        warn_commandscript() : CommandScript("warn_commandscript") { }



		static int GetCharInfo(std::string charName, int getInfo)
		{
			QueryResult result = CharacterDatabase.PQuery("SELECT guid, account, online FROM characters WHERE name = '%s'", charName.c_str());
			if(result)
			{
				Field *field = result->Fetch();
				uint32 char_guid;
				uint32 accountId;
				uint32 IsOnline;

				switch(getInfo)
				{
					case 1:
						char_guid = field[0].GetUInt32();
						return char_guid;
					break;

					case 2:
						accountId = field[1].GetUInt32();
						return accountId;
					break;

					case 3:
						IsOnline = field[2].GetUInt32();
						return IsOnline;
					break;
				}

				return 0;
			}

			return 0;
		}


		static int GetWarnLevel(int accountId)
		{
			QueryResult result = LoginDatabase.PQuery("SELECT warn_level FROM account WHERE id = '%d'", accountId);
			if(result)
			{
			    Field *field = result->Fetch();
			    uint32 warnLevel = field[0].GetUInt32();
				return warnLevel;
			}
			else 
				return 0;
		}

		static int GetWarnings(int accountId)
		{
			QueryResult result = LoginDatabase.PQuery("SELECT warnings FROM account WHERE id = '%d'", accountId);
			if(result)
			{
			    Field *field = result->Fetch();
			    uint32 warnings = field[0].GetUInt32();
				return warnings;
			}
			else 
				return 0;
		}

		static void WarnPlayer(int accountId)
		{
			LoginDatabase.PExecute("UPDATE account SET warnings = warnings+1 WHERE id = '%d'", accountId);
		}

		static int GetMaxWarnings(int warnOption)
		{
			QueryResult result = LoginDatabase.PQuery("SELECT maxWarnings FROM warning_conf WHERE id = '%d'", warnOption);

			if(result)
			{
			    Field *field = result->Fetch();
			    uint32 maxWarnings = field[0].GetUInt32();
				return maxWarnings;
			}
			else
			    return 0;
		}

		static void BanAccount(int accountId, int warnLevel)
		{
			QueryResult result = LoginDatabase.PQuery("SELECT banTime FROM warning_ban_time WHERE warnlevel = '%d'", warnLevel);
			uint32 banTime;
			if(result)
			{
			    Field *field = result->Fetch();
			    banTime = field[0].GetUInt32();
			}
			else
				banTime = -1;

			LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%d', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+'%u', 'VERWARNSYSTEM','', 1)", accountId, banTime);
			LoginDatabase.PExecute("UPDATE account SET warn_level = warn_level+1 WHERE id = '%d'", accountId);
			LoginDatabase.PExecute("UPDATE account SET warnings = 0 WHERE id = '%d'", accountId);
		}

        static bool HandleWarnLowCommand(ChatHandler* handler, const char* args)
        {
			if (!*args)  return false;
			char* char_name = strtok((char*)args, " ");
			if (!char_name)   return false;	
			std::string playerName = char_name;	

			int playerGUID = GetCharInfo(playerName, 1);
			int accountId = GetCharInfo(playerName, 2);
			int isOnline = GetCharInfo(playerName, 3);
			int warnLevel = GetWarnLevel(accountId);
			int warnings = GetWarnings(accountId);
			Player* player = ObjectAccessor::FindPlayer(playerGUID);

			if(playerGUID != 0 && accountId != 0)
			{
				WarnPlayer(accountId);

				if(isOnline != 0)
				{
					(ChatHandler(player)).PSendSysMessage("Du wurdest soeben verwarnt! Um deinen Verwarnstatus zu erfahren nutze den Befehl !warnings");
				}

				if(GetWarnings(accountId) >= GetMaxWarnings(1/*Verwarnoption 1 = Low*/)-1)
				{
					BanAccount(accountId, warnLevel);

					if(isOnline != 0)
					{
						player->GetSession()->KickPlayer();
					}
				}
			}

			return true;
		}
		
        ChatCommand* GetCommands() const
        {
			
		    static ChatCommand WarnSubCommandTable[] =
            {
                { "low", SEC_MODERATOR, true, &HandleWarnLowCommand, "", NULL },
                { NULL, 0, false, NULL, "", NULL }
            };
		
            static ChatCommand WarnCommandTable[] =
            {
                { "verwarnen", SEC_MODERATOR, true, NULL, "", WarnSubCommandTable  },
                { NULL, 0, false, NULL, "", NULL }
            };
            return WarnCommandTable;
        }
		
};

void AddSC_verwarn_command()
{
    new warn_commandscript();
}
