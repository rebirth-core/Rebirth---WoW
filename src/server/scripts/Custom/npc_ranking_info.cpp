#include "ScriptPCH.h"
#include "Player.h"

class rank_info : public CreatureScript
{
	public:

    	rank_info()
        	: CreatureScript("rank_info")
    	{
    	}

    	void Options(Player* pPlayer, Creature* pCreature, int option)
    	{
		
   		 QueryResult result_kills = CharacterDatabase.PQuery("SELECT points_this_week, points_last_week, ranked, srank FROM character_ranks WHERE player = '%u'", pPlayer->GetGUIDLow());
		 QueryResult result_reset = CharacterDatabase.PQuery("SELECT FROM_UNIXTIME(value) FROM worldstates WHERE entry = 41000");
		 Field* field = result_reset->Fetch();
		 
   		 char str_kills[200];
			
   		 
        	if (!result_kills) 
        	{
            	sprintf(str_kills,"Du hast noch keinen ehrenhaften Sieg erlangt, seit dem dieses PVP System existiert!");
            	pPlayer->PlayerTalkClass->ClearMenus();
            	OnGossipHello(pPlayer, pCreature);
            	pPlayer->MonsterWhisper(str_kills,pPlayer->GetGUID(),true);
            	return;
        	}   		 
   		 
        	else if (option == 1)
        	{
				Field *fieldd = result_kills->Fetch();
				uint32 points_this_week = fieldd[0].GetUInt32(); 
				uint32 points_last_week = fieldd[1].GetUInt32(); 
            	sprintf(str_kills,"Du hast diese Woche %u Ranking Points erlangt!", points_this_week);
            	pPlayer->MonsterWhisper(str_kills,pPlayer->GetGUID(),true);
        	}
			
			else if (option == 2)
        	{
				Field *fieldd = result_kills->Fetch();
				uint32 points_this_week = fieldd[0].GetUInt32(); 
				uint32 points_last_week = fieldd[1].GetUInt32(); 
            	sprintf(str_kills,"Du hast letzte Woche %u Ranking Points erlangt!", points_last_week);
            	pPlayer->MonsterWhisper(str_kills,pPlayer->GetGUID(),true);
        	}
			
			else if (option == 3)
        	{
				Field *fieldd = result_kills->Fetch();
				uint32 ranked = fieldd[2].GetUInt32(); 
				uint32 srank = fieldd[3].GetUInt32(); 
				if(ranked == 0)
				{
					sprintf(str_kills,"Du warst letzte Woche nicht unter den besten 10!");
					pPlayer->MonsterWhisper(str_kills,pPlayer->GetGUID(),true);
				}
				
				else if(ranked == 1)
				{
					sprintf(str_kills,"Du warst letzte Woche auf Rang %u!", srank);
					pPlayer->MonsterWhisper(str_kills,pPlayer->GetGUID(),true);
				}
        	}
			
			else if (option == 4)
			{
			  sprintf(str_kills,"Die Wochenraenge werden vergeben am: %s!", field[0].GetCString());
			  pPlayer->MonsterWhisper(str_kills,pPlayer->GetGUID(),true);
			}


        	pPlayer->PlayerTalkClass->ClearMenus();
        	OnGossipHello(pPlayer, pCreature);
    	}

    	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    	{
          pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wieviele Ranking Points habe ich diese Woche erlangt?", GOSSIP_SENDER_MAIN, 1000);
   		  pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wieviele Ranking Points habe ich letzte Woche erlangt?", GOSSIP_SENDER_MAIN, 1001);
		  pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Welchen Rang hatte ich letzte Woche?", GOSSIP_SENDER_MAIN, 1002);
		  pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wann werden die Wochen Raenge vergeben?", GOSSIP_SENDER_MAIN, 1003);
       	 

        	pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());

        	return true;
    	}

    	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 , uint32 uiAction)
    	{
        	pPlayer->PlayerTalkClass->ClearMenus();
       	 
        	switch (uiAction)
        	{
        	case 1000:
            	Options(pPlayer, pCreature, 1);
            	break;
        	case 1001:
            	Options(pPlayer, pCreature, 2);
            	break;
			case 1002:
            	Options(pPlayer, pCreature, 3);
            	break;
			case 1003:
            	Options(pPlayer, pCreature, 4);
            	break;
        	}
        	return true;
    	}

};

void AddSC_rank_info()
{
	new rank_info();
}
