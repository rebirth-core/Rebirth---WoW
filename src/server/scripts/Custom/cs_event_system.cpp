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
            handler->PSendSysMessage("Spieler %s wurden %d Eventpunkte hinzugefügt.",handler->getSelectedPlayer()->GetName(), points);

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
            handler->PSendSysMessage("Spieler %s wurden %d Eventpunkte abgezogen.",handler->getSelectedPlayer()->GetName(), points);
            return true;
        }

        ChatCommand* GetCommands() const
        {

            static ChatCommand RebirthSubSubSubCommandTable[] =
            {
                { "item", SEC_MODERATOR, true, &HandleAddRewardItemCommand, "", NULL },
                //{ "honor", SEC_MODERATOR, true, &HandleRemovePointsCommand, "", NULL },
				//{ "title", SEC_MODERATOR, true, &HandleRemovePointsCommand, "", NULL },
                { NULL, 0, false, NULL, "", NULL }
            };

            static ChatCommand RebirthSubSubCommandTable[] =
            {
                { "addpoints", SEC_MODERATOR, true, &HandleAddPointsCommand, "", NULL },
                { "removepoints", SEC_MODERATOR, true, &HandleRemovePointsCommand, "", NULL },
				{ "addreward", SEC_MODERATOR, true, NULL, "", RebirthSubSubSubCommandTable  },
				//{ "delreward", SEC_MODERATOR, true, NULL, "", RebirthSubSubSubCommandTable  },
                { NULL, 0, false, NULL, "", NULL }
            };
		
            static ChatCommand RebirthSubCommandTable[] =
            {
                { "event", SEC_MODERATOR, true, NULL, "", RebirthSubSubCommandTable  },
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
