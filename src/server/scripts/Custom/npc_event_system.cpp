#include "ScriptPCH.h"
#include "Player.h"

class event_npc : public CreatureScript
{
	public:

    	event_npc()
        	: CreatureScript("event_npc")
    	{
    	}

		void RequestEventPoints(Player* player, Creature* creature)
		{

		}

    	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    	{
          pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wieviele Event Punkte habe ich?", GOSSIP_SENDER_MAIN, 1000);
		  
          pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());

        	return true;
    	}

    	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 , uint32 uiAction)
    	{
        	pPlayer->PlayerTalkClass->ClearMenus();
       	 
        	switch (uiAction)
        	{
        	case 1000:
            	RequestEventPoints(pPlayer, pCreature);
            	break;
        	}
        	return true;
    	}

};

void AddSC_event_npc()
{
	new event_npc();
}
