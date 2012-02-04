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

            if (points - eventPoints < 0)
                points = eventPoints;

            LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", points, handler->getSelectedPlayer()->GetSession()->GetAccountId());

            return true;
        }

        ChatCommand* GetCommands() const
        {
            static ChatCommand RebirthSubSubCommandTable[] =
            {
                { "addpoints", SEC_MODERATOR, true, &HandleAddPointsCommand, "", NULL },
                { "removepoints", SEC_MODERATOR, true, &HandleRemovePointsCommand, "", NULL },
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
