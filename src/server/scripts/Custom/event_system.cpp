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

            return true;
        }

        ChatCommand* GetCommands() const
        {
            static ChatCommand RebirthSubSubCommandTable[] =
            {
                { "addpoints", SEC_MODERATOR, true, &HandleAddPointsCommand, "", NULL },
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
            return WarnCommandTable;
        }
};

void AddSC_rebirth_commandscript()
{
    new rebirth_commandscript();
}
