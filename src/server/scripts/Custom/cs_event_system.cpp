#include "ScriptPCH.h"
#include "Chat.h"

class rebirth_commandscript : public CommandScript
{
    public:
        rebirth_commandscript() : CommandScript("rebirth_commandscript") { }

        static bool HandleAddPointsCommand(ChatHandler* handler, const char* args)
        {
            if (!*args)
               return false;

            int points = atoi((char*)args);

            if(points <  0 || points > 10000)
               return false;

            LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte + %d WHERE id = %u", points, handler->getSelectedPlayer()->GetSession()->GetAccountId());
            (ChatHandler(handler->GetSession()->GetPlayer())).PSendSysMessage("%d Eventpunkte wurden hinzugefügt.",points);
            (ChatHandler(handler->getSelectedPlayer())).PSendSysMessage("Du hast %d Eventpunkt(e) erhalten!", points);
            LoginDatabase.PExecute("INSERT INTO rebirth_command_log (command, fromAccount, toAccount, param1, date) VALUES ('rebirth event addpoints',%d,%d,%d,UNIX_TIMESTAMP())",handler->getSelectedPlayer()->GetSession()->GetAccountId(), handler->GetSession()->GetAccountId(), points);
            return true;
        }

        static bool HandleAddRewardItemCommand(ChatHandler* handler, const char* args)
        {
            if (!*args)
               return false;

            int itemID = atoi((char*)args);
            std::string name = "";
            QueryResult result = WorldDatabase.PQuery("SELECT name FROM item_template WHERE entry = %d", itemID);
            if (result)
            {
                Field* field = result->Fetch();
                name = field[0].GetCString();
            }
            else
                return false;

            WorldDatabase.PExecute("INSERT INTO rebirth_event_rewards (type, name, param1) VALUES (0, %s, %d)", name.c_str(), itemID);

            result = WorldDatabase.PQuery("SELECT id FROM rebirth_event_rewards WHERE type = 0 AND catid = null AND param1 = %d", itemID);
            if (result)
            {
                handler->PSendSysMessage(
                    "Neuer Event Reward mit der ID %d und dem Namen %s erstellt. Nutze .rebirth event set #OPTION um weitere Optionen wie Preis, Anzahl, Kategorie usw festzulegen!", 
                    itemID, name.c_str());
            }

            return true;
        }

        static bool HandleRemovePointsCommand(ChatHandler* handler, const char* args)
        {
            if (!*args)
               return false;

            int points = atoi((char*)args);

            if(points <  0 || points > 10000)
               return false;

            QueryResult result = LoginDatabase.PQuery("SELECT event_punkte FROM account WHERE id = %u", handler->getSelectedPlayer()->GetSession()->GetAccountId());
            if (!result)
               return false;

            Field *field = result->Fetch();
            int32 eventPoints = field[0].GetInt32();

            if (eventPoints - points < 0)
                points = eventPoints;

            LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", points, handler->getSelectedPlayer()->GetSession()->GetAccountId());
            (ChatHandler(handler->GetSession()->GetPlayer())).PSendSysMessage("Spieler %s wurden %d Eventpunkte abgezogen.",handler->getSelectedPlayer()->GetName(), points);
            LoginDatabase.PExecute("INSERT INTO rebirth_command_log (command, fromAccount, toAccount, param1, date) VALUES ('rebirth event removepoints',%d,%d,%d,UNIX_TIMESTAMP())",handler->getSelectedPlayer()->GetSession()->GetAccountId(), handler->GetSession()->GetAccountId(), points);
            return true;
        }

        static bool HandleSetCostCommand(ChatHandler* handler, const char* args)
        {
            if (!*args)
               return false;

            char* arg1 = strtok((char*)args, " ");
            char* arg2 = strtok(NULL, " ");

            int id = atoi(arg1);
            int cost = atoi(arg2);

            QueryResult result = WorldDatabase.PQuery("SELECT cost FROM rebirth_event_rewards WHERE id = %d", id);
            if (!result)
            {
                handler->PSendSysMessage("Event Reward mit der ID %d nicht gefunden!", id);
                return true;
            }

            Field* field = result->Fetch();
            int oldCost = field[0].GetInt32();

            WorldDatabase.PExecute("UPDATE rebirth_event_rewards SET cost = %d WHERE id = %d",cost,id);
            handler->PSendSysMessage("Preis von ID %d wurde von %d auf %d Eventpunkte gesetzt.",id, oldCost,cost);
            return true;
        }

        static bool HandleSetCountCommand(ChatHandler* handler, const char* args)
        {
            if (!*args)
               return false;

            char* arg1 = strtok((char*)args, " ");
            char* arg2 = strtok(NULL, " ");

            int id = atoi(arg1);
            int count = atoi(arg2);

            QueryResult result = WorldDatabase.PQuery("SELECT param2 FROM rebirth_event_rewards WHERE id = %d AND type = 0 OR id = %d AND type = 1", id, id);
            if (!result)
            {
                handler->PSendSysMessage("Event Reward mit der ID %d nicht gefunden oder ist kein Item oder Ehrenpunkte!", id);
                return true;
            }

            Field* field = result->Fetch();
            int oldCount = field[0].GetInt32();

            WorldDatabase.PExecute("UPDATE rebirth_event_rewards SET param2 = %d WHERE id = %d",count,id);
            handler->PSendSysMessage("Count von ID %d wurde von %d auf %d gesetzt.",id, oldCount,count);
            return true;
        }

        static bool HandleActivateCommand(ChatHandler* handler, const char* args)
        {
            if (!*args)
            {
                handler->PSendSysMessage(".rebirth event activate #ID");
                return true;
            }

            int eventID = atoi((char*)args);

            QueryResult result = LoginDatabase.PQuery("SELECT * FROM rebirth_next_event WHERE id = %d", eventID);
            if (result)
            {
                LoginDatabase.PExecute("UPDATE rebirth_next_event SET active = 1 WHERE id = %d", eventID);
                handler->PSendSysMessage("Event wurde aktiviert!");
                return true;
            }
            else
            {
                handler->PSendSysMessage("Event nicht gefunden!");
                return true;
            }
        }

        static bool HandlePlayerInfoCommand(ChatHandler* handler, const char* args)
        {
            int accountid = 0;
            std::string charname = "";
            if (!*args)
            {
                Player* player = NULL;

                if (player = handler->getSelectedPlayer())
                {
                    accountid = player->GetSession()->GetAccountId();
                    charname = player->GetSession()->GetPlayerName();
                }

                else
                {
                    accountid = handler->GetSession()->GetAccountId();
                    charname = player->GetSession()->GetPlayerName();
                }
            }
            else
            {
                char* cname = strtok((char*)args, " ");
                std::string name = cname;
                charname = name;
                QueryResult result = CharacterDatabase.PQuery("SELECT account FROM characters WHERE name = '%s'", name.c_str());
                if (!result)
                {
                    handler->PSendSysMessage("Charakter nicht gefunden");
                    return true;
                }
                Field* field = result->Fetch();
                accountid = field[0].GetInt32();
            }
            QueryResult result = LoginDatabase.PQuery("SELECT event_punkte FROM account WHERE id = %d", accountid);
            int punkte = 0;
            if (result)
            {
                Field* field = result->Fetch();
                punkte = field[0].GetInt32();
            }
            (ChatHandler(handler->GetSession()->GetPlayer())).PSendSysMessage("%s verfuegt ueber %d Eventpunkte",charname.c_str(), punkte);
        }

        static bool HandleDeactivateCommand(ChatHandler* handler, const char* args)
        {
            if (!*args)
            {
                handler->PSendSysMessage(".rebirth event deactivate #ID");
                return true;
            }

            int eventID = atoi((char*)args);

            QueryResult result = LoginDatabase.PQuery("SELECT * FROM rebirth_next_event WHERE id = %d", eventID);
            if (result)
            {
                LoginDatabase.PExecute("UPDATE rebirth_next_event SET active = 0 WHERE id = %d", eventID);
                handler->PSendSysMessage("Event wurde deaktiviert!");
                return true;
            }
            else
            {
                handler->PSendSysMessage("Event nicht gefunden!");
                return true;
            }
        }

        ChatCommand* GetCommands() const
        {

            static ChatCommand RebirthSubSubSubCommandTable[] =
            {
                //{ "item", SEC_MODERATOR, true, &HandleAddRewardItemCommand, "", NULL },
                //{ "honor", SEC_MODERATOR, true, &HandleRemovePointsCommand, "", NULL },
				//{ "title", SEC_MODERATOR, true, &HandleRemovePointsCommand, "", NULL },
                { NULL, 0, false, NULL, "", NULL }
            };

            static ChatCommand RebirthSetCommandTable[] =
            {
                //{ "cost", SEC_MODERATOR, true, &HandleSetCostCommand, "", NULL },
                //{ "count", SEC_MODERATOR, true, &HandleSetCountCommand, "", NULL },
                { NULL, 0, false, NULL, "", NULL }
            };

            static ChatCommand RebirthSubSubCommandTable[] =
            {
                { "addpoints", SEC_MODERATOR, true, &HandleAddPointsCommand, "", NULL },
                { "removepoints", SEC_MODERATOR, true, &HandleRemovePointsCommand, "", NULL },
                { "activate", SEC_MODERATOR, true, &HandleActivateCommand, "", NULL },
                { "deactivate", SEC_MODERATOR, true, &HandleDeactivateCommand, "", NULL },
                //{ "addreward", SEC_MODERATOR, true, NULL, "", RebirthSubSubSubCommandTable  },
                //{ "delreward", SEC_MODERATOR, true, NULL, "", RebirthSubSubSubCommandTable  },
                //{ "set", SEC_MODERATOR, true, NULL, "", RebirthSetCommandTable  },
                { NULL, 0, false, NULL, "", NULL }
            };
		
            static ChatCommand RebirthSubCommandTable[] =
            {
                { "event", SEC_MODERATOR, true, NULL, "", RebirthSubSubCommandTable  },
                { "playerinfo", SEC_MODERATOR, true, &HandlePlayerInfoCommand, "", NULL },
                { NULL, 0, false, NULL, "", NULL }
            };

            static ChatCommand RebirthCommandTable[] =
            {
                { "rebirth", SEC_MODERATOR, true, NULL, "", RebirthSubCommandTable  },
                { NULL, 0, false, NULL, "", NULL }
            };

            return RebirthCommandTable;
        }
};



void AddSC_rebirth_commandscript()
{
    new rebirth_commandscript();
}
