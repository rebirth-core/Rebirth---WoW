#include "ScriptPCH.h"

class warn_commandscript : public CommandScript
{
    public:
        warn_commandscript() : CommandScript("warn_commandscript") { }



		static int GetCharInfo(std::string charName, int getInfo)
		{
			QueryResult result_char_guid = CharacterDatabase.PQuery("SELECT guid, account, online FROM characters WHERE name = '%s'", charName.c_str());
			if(result_char_guid)
			{
				Field *field = result_char_guid->Fetch();
				switch(getInfo)
				{
					case 1:
						uint32 char_guid = field[0].GetUInt32();
						return char_guid;
					break;

					case 2:
						uint32 accountId = field[1].GetUInt32();
						return accountId;
					break;

					case 3:
						uint32 IsOnline = field[2].GetUInt32();
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
