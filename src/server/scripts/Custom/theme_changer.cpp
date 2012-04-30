#include "ScriptPCH.h"


#define OFFSET_THEME 10000 


class npc_gurubashi_theme : public CreatureScript
{
	public:

    	npc_gurubashi_theme()
        	: CreatureScript("npc_gurubashi_theme")
    	{
    	}

        int GetLastThemeTime()
        {
  	        QueryResult result = WorldDatabase.PQuery("SELECT `time` FROM `gurubashi_lastspawned`");

	          if (result)
	          {
	               Field *fields = result->Fetch();
	               return fields[0].GetInt32();
	          }
	          else 
                  return 0;

        }

        bool OnGossipHello(Player* pPlayer, Creature* pCreature)
        {
            if (GetLastThemeTime() + 600 <= time (NULL))
            {
                QueryResult result = WorldDatabase.PQuery("SELECT `id`, `name` FROM `gurubashi_themes`");
                if (result)
                {
                      do
                      {
          	                Field *fields = result->Fetch();
          	                pPlayer->ADD_GOSSIP_ITEM(4, fields[1].GetString(), GOSSIP_SENDER_MAIN, OFFSET_THEME + fields[0].GetInt32());
                      } while (result->NextRow());
                }
            }
            else
            {
                char msg[100];
      	        int time2 = GetLastThemeTime() + 600 - time (NULL);

      	        if (time2 < 60)
                  sprintf(msg, "Next change possible in less than minute.");
                else
                  sprintf(msg, "Next change possible in %u minute/s.", time2 / 60);

                pPlayer->ADD_GOSSIP_ITEM(0, msg, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            }
            pPlayer->ADD_GOSSIP_ITEM(0, "Good bye", GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            pPlayer->PlayerTalkClass->SendGossipMenu(1, pCreature->GetGUID());

            return true;
        }

        bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 , uint32 uiAction)
        {
            if (uiAction > OFFSET_THEME)
            {
                  WorldDatabase.PExecute("DELETE FROM `gurubashi_lastspawned`");
                  WorldDatabase.PExecute("INSERT INTO `gurubashi_lastspawned` VALUES (%u)", time (NULL));
	              QueryResult result = WorldDatabase.PQuery("SELECT `x`, `y`, `z`, `o`, `entry` FROM `gurubashi_spawns` WHERE `theme` = %u", uiAction - OFFSET_THEME);
                  if (result)
                  {
    	                pCreature->MonsterSay("Spawning gameobjects..", LANG_UNIVERSAL, pPlayer->GetGUID());
    	                do
      	                {
      		                Field *fields = result->Fetch();
      		                pCreature->SummonGameObject(fields[4].GetInt32(), fields[0].GetFloat(), fields[1].GetFloat(), fields[2].GetFloat(), fields[3].GetFloat(), 0, 0, 0, 0, 600); 
                        } while (result->NextRow());
                  }
                  else
                  {
                        pCreature->MonsterSay("No gameobjects found.", LANG_UNIVERSAL, pPlayer->GetGUID());
                  }

                  pPlayer->PlayerTalkClass->ClearMenus();
            }
            else
            {
                  switch (uiAction)
                  {
                         case GOSSIP_ACTION_INFO_DEF + 1:
                              pPlayer->PlayerTalkClass->ClearMenus();
                              break;
                         case GOSSIP_ACTION_INFO_DEF + 2:
                              OnGossipHello(pPlayer, pCreature);
                              break;
                  }
            }
    
            return true;
        }
};

void AddSC_npc_gurubashi_theme()
{
    new npc_gurubashi_theme();
}