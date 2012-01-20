#include "ScriptPCH.h"
#include "Chat.h"
#include "Common.h"
#include "World.h"
#include "Player.h"
#include "Opcodes.h"
#include "Chat.h"
#include "ObjectAccessor.h"
#include "Language.h"
#include "AccountMgr.h"
#include "SystemConfig.h"
#include "revision.h"
#include "Util.h"
#include "ScriptPCH.h"
#include <cstring>
#include "CharacterDatabaseCleaner.h"
#include "DatabaseEnv.h"
#include "ObjectMgr.h"
#include "Unit.h"
#include "Player.h"
#include <unistd.h>

class warn_commandscript : public CommandScript
{
    public:
        warn_commandscript() : CommandScript("warn_commandscript") { }

        static bool HandleWarnBeleidigungCommand(ChatHandler* handler, const char* args)
        {
		
			QueryResult result_warnings;
			QueryResult result_warning_type;
			QueryResult result_char_guid;
			
			if (!*args)
            return false;

			char* char_namee = strtok((char*)args, " ");
			if (!char_namee)
				return false;	
				
            std::string char_name = char_namee;
			result_char_guid = CharacterDatabase.PQuery("SELECT guid, account, online FROM characters WHERE name = '%s'", char_name.c_str());
			
			if(result_char_guid)
			{
				Field *fieldcg = result_char_guid->Fetch();
				uint32 char_guid = fieldcg[0].GetUInt32();
				uint32 accountIdFromChar = fieldcg[1].GetUInt32();
				uint32 check_online = fieldcg[2].GetUInt32();
				Player* player;
				
				player = ObjectAccessor::FindPlayer(char_guid);
				//uint32 accountIdFromChar = player->GetAccountId();
				
				result_warnings = LoginDatabase.PQuery("SELECT warnings FROM account WHERE id = '%u'", accountIdFromChar);
				char str_warn[200];
				
				result_warning_type = LoginDatabase.PQuery("SELECT warning_type FROM account WHERE id = '%u'", accountIdFromChar);
				char str_warntype[200];
				
				
				Field *fieldw = result_warnings->Fetch();
				uint32 warnings = fieldw[0].GetUInt32();
				
				Field *fieldwt = result_warning_type->Fetch();
				uint32 warning_type = fieldwt[0].GetUInt32();
			
		
			if (!AccountMgr::normalizeString(char_name))
			{
				 return false;
			}

			if (accountIdFromChar)
			{
				if(warnings == 2 && warning_type == 0)
				{
				 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+3600, 'VERWARNSYSTEM','Haeufige Verwarnung', 1)", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
				 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'BELEIDIGUNG BAN')", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
				 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
				 if(check_online == 1)
				 player->GetSession()->KickPlayer();
				 return true;
				}
				else if(warnings == 2 && warning_type == 1)
				{
				 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+10800, 'VERWARNSYSTEM','Haeufige Verwarnung', 1)", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
				 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'BELEIDIGUNG BAN')", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
				 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
				 if(check_online == 1)
				 player->GetSession()->KickPlayer();
				 return true;
				}
				else if(warnings == 2 && warning_type == 2)
				{
				 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+86400, 'VERWARNSYSTEM','Haeufige Verwarnung', 1)", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
				 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'BELEIDIGUNG BAN')", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
				 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
				 if(check_online == 1)
				 player->GetSession()->KickPlayer();
				 return true;
				}
				else if(warnings == 2 && warning_type == 3)
				{
				 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+259200, 'VERWARNSYSTEM','Haeufige Verwarnung', 1)", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
				 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'BELEIDIGUNG BAN')", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
				 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
				 if(check_online == 1)
				 player->GetSession()->KickPlayer();
				 return true;
				}
				else if(warnings == 2 && warning_type >= 4)
				{
				 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', 0, 0, 'VERWARNSYSTEM','Haeufige Verwarnung', 1)", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
				 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'BELEIDIGUNG BAN')", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
				 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
				 if(check_online == 1)
				 player->GetSession()->KickPlayer();
				 return true;
				}
				else
				{
				 LoginDatabase.PExecute("UPDATE account SET warnings = warnings+1 WHERE id = '%u'", accountIdFromChar);
				 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'BELEIDIGUNG WARNING')", accountIdFromChar);
				 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
				 handler->PSendSysMessage("%s wurde wegen Beleidigung verwarnt!", char_name.c_str());
				 if(check_online == 1)
			     (ChatHandler(player)).PSendSysMessage("Du wurdest soeben verwarnt! Um deinen Verwarnstatus zu erfahren nutze den Befehl !warnings");
				 return true;
				} 
			}
        }else{handler->PSendSysMessage("Charakter nicht gefunden!"); return true;}
		
		
        }
		
        static bool HandleWarnWidersetzungCommand(ChatHandler* handler, const char* args)
        {
		
			QueryResult result_warnings;
			QueryResult result_warning_type;
			QueryResult result_char_guid;
			
			if (!*args)
            return false;

			char* char_namee = strtok((char*)args, " ");
			if (!char_namee)
				return false;	
				
            std::string char_name = char_namee;
			result_char_guid = CharacterDatabase.PQuery("SELECT guid, account, online FROM characters WHERE name = '%s'", char_name.c_str());
			if(result_char_guid)
			{
			Field *fieldcg = result_char_guid->Fetch();
            uint32 char_guid = fieldcg[0].GetUInt32();
			uint32 accountIdFromChar = fieldcg[1].GetUInt32();
			uint32 check_online = fieldcg[2].GetUInt32();
			
			Player* player = ObjectAccessor::FindPlayer(char_guid);
			
			result_warnings = LoginDatabase.PQuery("SELECT warnings FROM account WHERE id = '%u'", accountIdFromChar);
            char str_warn[200];
			
			result_warning_type = LoginDatabase.PQuery("SELECT warning_type FROM account WHERE id = '%u'", accountIdFromChar);
            char str_warntype[200];
			
			
			Field *fieldw = result_warnings->Fetch();
            uint32 warnings = fieldw[0].GetUInt32();
			
			Field *fieldwt = result_warning_type->Fetch();
            uint32 warning_type = fieldwt[0].GetUInt32();
			
		
        if (!AccountMgr::normalizeString(char_name))
        {
			 return false;
        }
		
		if (accountIdFromChar)
        {
            if(warning_type == 0 && warnings >= 1)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+600, 'VERWARNSYSTEM','[VERWARNSYSTEM]WIDERSETZUNG', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'Widersetzung BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
		    else if(warning_type == 1 && warnings >= 1)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+3600, 'VERWARNSYSTEM','[VERWARNSYSTEM]WIDERSETZUNG', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'Widersetzung BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
		    else if(warning_type == 2 && warnings >= 1)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+86400, 'VERWARNSYSTEM','[VERWARNSYSTEM]WIDERSETZUNG', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'Widersetzung BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
			else if(warning_type == 3 && warnings >= 1)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+259200, 'VERWARNSYSTEM','[VERWARNSYSTEM]WIDERSETZUNG', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'Widersetzung BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
			else if(warning_type >= 4 && warnings >= 1)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', 0, 0, 'VERWARNSYSTEM','[VERWARNSYSTEM]WIDERSETZUNG', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'Widersetzung BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
			else
			{
			 LoginDatabase.PExecute("UPDATE account SET warnings = warnings+2 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'Widersetzung WARNING')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen Widersetzung verwarnt!", char_name.c_str());
			 if(check_online == 1)
			 {
			   (ChatHandler(player)).PSendSysMessage("Du wurdest soeben verwarnt! Um deinen Verwarnstatus zu erfahren nutze den Befehl !warnings");
			   (ChatHandler(player)).PSendSysMessage("!!ACHTUNG!!Der Verwarngrund ist Widersetzung einer GM Anweisung! Die naechste Verwarnung hat eine Accountsperre zur Folge!");
			 }
			 return true;
			} 
        }
		}else{handler->PSendSysMessage("Charakter nicht gefunden!"); return true;}
        }
		
		
        static bool HandleWarnCheatCommand(ChatHandler* handler, const char* args)
        {
		
			QueryResult result_warnings;
			QueryResult result_warning_type;
			QueryResult result_char_guid;
			
			if (!*args)
            return false;

			char* char_namee = strtok((char*)args, " ");
			if (!char_namee)
				return false;	
				
            std::string char_name = char_namee;
			result_char_guid = CharacterDatabase.PQuery("SELECT guid , account , online FROM characters WHERE name = '%s'", char_name.c_str());
			if(result_char_guid)
			{
			Field *fieldcg = result_char_guid->Fetch();
            uint32 char_guid = fieldcg[0].GetUInt32();
			uint32 accountIdFromChar = fieldcg[1].GetUInt32();
			uint32 check_online = fieldcg[2].GetUInt32();
			
			Player* player = ObjectAccessor::FindPlayer(char_guid);
			
			result_warnings = LoginDatabase.PQuery("SELECT warnings FROM account WHERE id = '%u'", accountIdFromChar);
            char str_warn[200];
			
			result_warning_type = LoginDatabase.PQuery("SELECT warning_type FROM account WHERE id = '%u'", accountIdFromChar);
            char str_warntype[200];
			
			
			Field *fieldw = result_warnings->Fetch();
            uint32 warnings = fieldw[0].GetUInt32();
			
			Field *fieldwt = result_warning_type->Fetch();
            uint32 warning_type = fieldwt[0].GetUInt32();
			
		
        if (!AccountMgr::normalizeString(char_name))
        {
			 return false;
        }

        if (accountIdFromChar)
        {
            if(warning_type == 0)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+3600, 'VERWARNSYSTEM','[VERWARNSYSTEM]BAN WEGEN CHEAT', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'CHEAT BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
		    else if(warning_type == 1)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+10800, 'VERWARNSYSTEM','[VERWARNSYSTEM]BAN WEGEN CHEAT', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'CHEAT BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
		    else if(warning_type == 2)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+86400, 'VERWARNSYSTEM','[VERWARNSYSTEM]BAN WEGEN CHEAT', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'CHEAT BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
			else if(warning_type == 3)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()+259200, 'VERWARNSYSTEM','[VERWARNSYSTEM]BAN WEGEN CHEAT', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'CHEAT BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
			else if(warning_type >= 4)
			{
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', 0, 0, 'VERWARNSYSTEM','[VERWARNSYSTEM]BAN WEGEN CHEAT', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'CHEAT BAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen haeufiger Verwarnung gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;
			}
			else
			{
			 LoginDatabase.PExecute("UPDATE account SET warnings = warnings+1 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'CHEAT WARNING')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde wegen CHEAT verwarnt!", char_name.c_str());
			 return true;
			} 
        }
		}else{handler->PSendSysMessage("Charakter nicht gefunden!"); return true;}
        }
		
		
        static bool HandleWarnHardCoreCommand(ChatHandler* handler, const char* args)
        {
			QueryResult result_warnings;
			QueryResult result_warning_type;
			QueryResult result_char_guid;
			
			if (!*args)
            return false;

			char* char_namee = strtok((char*)args, " ");
			if (!char_namee)
				return false;	
				
            std::string char_name = char_namee;
			result_char_guid = CharacterDatabase.PQuery("SELECT guid , account , online FROM characters WHERE name = '%s'", char_name.c_str());
			if(result_char_guid)
			{
			Field *fieldcg = result_char_guid->Fetch();
            uint32 char_guid = fieldcg[0].GetUInt32();
			uint32 accountIdFromChar = fieldcg[1].GetUInt32();
			uint32 check_online = fieldcg[2].GetUInt32();
			
			Player* player = ObjectAccessor::FindPlayer(char_guid);
			
			result_warnings = LoginDatabase.PQuery("SELECT warnings FROM account WHERE id = '%u'", accountIdFromChar);
            char str_warn[200];
			
			result_warning_type = LoginDatabase.PQuery("SELECT warning_type FROM account WHERE id = '%u'", accountIdFromChar);
            char str_warntype[200];
			
			
			Field *fieldw = result_warnings->Fetch();
            uint32 warnings = fieldw[0].GetUInt32();
			
			Field *fieldwt = result_warning_type->Fetch();
            uint32 warning_type = fieldwt[0].GetUInt32();
			
		
        if (!AccountMgr::normalizeString(char_name))
        {
			 return false;
        }

        if (accountIdFromChar)
        {
			 LoginDatabase.PExecute("INSERT INTO account_banned VALUES ('%u', 0, 0, 'VERWARNSYSTEM','PERMANENTBAN', 1)", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type+1 , warnings = 0 WHERE id = '%u'", accountIdFromChar);
			 LoginDatabase.PExecute("INSERT INTO account_warnings VALUES  ('%u', UNIX_TIMESTAMP(), 'PERMANENTBAN')", accountIdFromChar);
			 LoginDatabase.PExecute("UPDATE account SET warning_reset = UNIX_TIMESTAMP()+604800 WHERE id = '%u'", accountIdFromChar);
			 handler->PSendSysMessage("%s wurde PERMANENT gesperrt!", char_name.c_str());
			 if(check_online == 1)
			 player->GetSession()->KickPlayer();
			 return true;	
        }
		}
        }
		
		
        static bool HandleWarnPInfoCommand(ChatHandler* handler, const char* args)
        {
			QueryResult result_warnings;
			QueryResult result_warning_type;
			QueryResult result_char_guid;
			
			if (!*args)
            return false;

			char* char_namee = strtok((char*)args, " ");
			if (!char_namee)
				return false;	
				
            std::string char_name = char_namee;
			result_char_guid = CharacterDatabase.PQuery("SELECT guid , account , online FROM characters WHERE name = '%s'", char_name.c_str());
			if(result_char_guid)
			{
			Field *fieldcg = result_char_guid->Fetch();
            uint32 char_guid = fieldcg[0].GetUInt32();
			uint32 accountIdFromChar = fieldcg[1].GetUInt32();
			uint32 check_online = fieldcg[2].GetUInt32();
			
			Player* player = ObjectAccessor::FindPlayer(char_guid);
			
			QueryResult result_reset_date = LoginDatabase.PQuery("SELECT FROM_UNIXTIME(warning_reset) FROM account WHERE id = '%u'", accountIdFromChar);
			Field* fields = result_reset_date->Fetch();
			time_t reset_date = time_t(fields[0].GetUInt64());
			
			result_warnings = LoginDatabase.PQuery("SELECT warnings FROM account WHERE id = '%u'", accountIdFromChar);
            char str_warn[200];
			
			result_warning_type = LoginDatabase.PQuery("SELECT warning_type FROM account WHERE id = '%u'", accountIdFromChar);
            char str_warntype[200];
			
			
			Field *fieldw = result_warnings->Fetch();
            uint32 warnings = fieldw[0].GetUInt32();
			
			Field *fieldwt = result_warning_type->Fetch();
            uint32 warning_type = fieldwt[0].GetUInt32();
			
		
			if(warning_type < 4 && warnings == 2)
			{
				handler->PSendSysMessage("------------------------------------------------------------------");
				handler->PSendSysMessage("%s hat %u von 3 Verwarnungen und befindet sich auf der Verwarnstufe %u von 4!",char_name.c_str(), warnings, warning_type);
				handler->PSendSysMessage("Die naechste Verwarnung hat eine zeitliche Sperre zur Folge!");
				handler->PSendSysMessage("Verwarnung zuruecksetzen am: %s",fields[0].GetCString());
				handler->PSendSysMessage("------------------------------------------------------------------");
				return true;
			}
			
		    else if(warning_type >= 4 && warnings == 2)
			{
				handler->PSendSysMessage("------------------------------------------------------------------");
				handler->PSendSysMessage("%s hat %u von 3 Verwarnungen und befindet sich auf der Verwarnstufe %u von 4!",char_name.c_str(), warnings, warning_type);
				handler->PSendSysMessage("Die naechste Verwarnung hat eine permanente Sperre zur Folge!");
				handler->PSendSysMessage("Verwarnung zuruecksetzen am: %s",fields[0].GetCString());
				handler->PSendSysMessage("------------------------------------------------------------------");
				return true;
			}
			
			else
			{
				handler->PSendSysMessage("------------------------------------------------------------------");
				handler->PSendSysMessage("%s hat %u von 3 Verwarnungen und befindet sich auf der Verwarnstufe %u von 4!",char_name.c_str(), warnings, warning_type);
				handler->PSendSysMessage("Verwarnung zuruecksetzen am: %s",fields[0].GetCString());
				handler->PSendSysMessage("------------------------------------------------------------------");
				return true;
			}	
			
			
		}
        }		
		
		
		
		
		static bool HandleWarnInfo(ChatHandler* handler, const char* args)
        {
			QueryResult result_warnings;
			QueryResult result_warning_type;
			uint32 accountId = handler->GetSession()->GetAccountId();
			result_warnings = LoginDatabase.PQuery("SELECT warnings FROM account WHERE id = '%u'", accountId);
            char str_warn[200];
			
			result_warning_type = LoginDatabase.PQuery("SELECT warning_type FROM account WHERE id = '%u'", accountId);
            char str_warntype[200];
			
			Field *fieldw = result_warnings->Fetch();
            uint32 warnings = fieldw[0].GetUInt32();
			
			Field *fieldwt = result_warning_type->Fetch();
            uint32 warning_type = fieldwt[0].GetUInt32();
			
		    if(warning_type < 4 && warnings == 2)
			{
				handler->PSendSysMessage("Du hast %u von 3 Verwarnungen und befindest dich auf der Verwarnstufe %u von 4!", warnings, warning_type);
				handler->PSendSysMessage("!!ACHTUNG!! Die naechste Verwarnung hat eine zeitliche Sperre zur Folge!");
				return true;
			}
			
		    else if(warning_type >= 4 && warnings == 2)
			{
				handler->PSendSysMessage("Du hast %u von 3 Verwarnungen und befindest dich auf der Verwarnstufe %u!", warnings, warning_type);
				handler->PSendSysMessage("!!ACHTUNG!! Die naechste Verwarnung hat eine permanente Sperre zur Folge!");
				return true;
			}
			
			else
			{
				handler->PSendSysMessage("Du hast %u von 3 Verwarnungen und befindest dich auf der Verwarnstufe %u von 4!", warnings, warning_type);
				return true;
			}
        }
		
		
		
		
		
        static bool HandleWarnResetCommand(ChatHandler* handler, const char* args)
        {
			QueryResult result_warnings;
			QueryResult result_warning_type;
			QueryResult result_warning_reset;
			uint32 accountId = handler->GetSession()->GetAccountId();
			result_warnings = LoginDatabase.PQuery("SELECT warnings FROM account WHERE id = '%u'", accountId);
            char str_warn[200];

			result_warning_type = LoginDatabase.PQuery("SELECT warning_type FROM account WHERE id = '%u'", accountId);
            char str_warntype[200];
			
			result_warning_reset = LoginDatabase.PQuery("SELECT warning_reset FROM account WHERE id = '%u'", accountId);
            char str_warnreset[200];
			
			Field *fieldw = result_warnings->Fetch();
            uint32 warnings = fieldw[0].GetUInt32();
			
			Field *fieldwt = result_warning_type->Fetch();
            uint32 warning_type = fieldwt[0].GetUInt32();
			
			Field *fieldwr = result_warning_reset->Fetch();
            uint32 warning_reset = fieldwr[0].GetUInt32();
			
			LoginDatabase.PExecute("UPDATE account SET warning_type = warning_type-1 , warnings = 0, warning_reset = UNIX_TIMESTAMP()+604800 WHERE warning_reset <= UNIX_TIMESTAMP() AND warning_type > 0");
			handler->PSendSysMessage("Die Spieler, die eine Woche keine Verwarnung bekommen und ein Verwarnlevel > 0 haben, wurden eine Verwarnstufe herabgesetzt!");
			return true;
        }
		

		
        ChatCommand* GetCommands() const
        {
			
		    static ChatCommand WarnSubCommandTable[] =
            {
                { "beleidigung", SEC_MODERATOR, true, &HandleWarnBeleidigungCommand, "", NULL },
			    { "cheat", SEC_MODERATOR, true, &HandleWarnCheatCommand, "", NULL },
				{ "widersetzung", SEC_MODERATOR, true, &HandleWarnWidersetzungCommand, "", NULL },
			    { "reset", SEC_MODERATOR, true, &HandleWarnResetCommand, "", NULL },
				{ "pinfo", SEC_MODERATOR, true, &HandleWarnPInfoCommand, "", NULL },
				{ "hardcore", SEC_MODERATOR, true, &HandleWarnHardCoreCommand, "", NULL },
                { NULL, 0, false, NULL, "", NULL }
            };
		
            static ChatCommand WarnCommandTable[] =
            {
                { "verwarnen", SEC_MODERATOR, true, NULL, "", WarnSubCommandTable  },
				{ "warnings", SEC_PLAYER, true, &HandleWarnInfo, "", NULL },
                { NULL, 0, false, NULL, "", NULL }
            };
            return WarnCommandTable;
        }
		
};

void AddSC_warn_commandscript()
{
    new warn_commandscript();
}
