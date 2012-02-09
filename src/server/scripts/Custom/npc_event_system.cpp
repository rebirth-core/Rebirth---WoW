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
            QueryResult result = LoginDatabase.PQuery("SELECT event_punkte FROM account WHERE id = %u", player->GetSession()->GetAccountId());

            if (result)
            {
                Field* field = result->Fetch();
                uint32 eventPunkte = field[0].GetUInt32();
                char str_info[200];
                sprintf(str_info,"Du hast %u Event Punkte!", eventPunkte);
                player->PlayerTalkClass->ClearMenus();
                OnGossipHello(player, creature);
                player->MonsterWhisper(str_info,player->GetGUID(),true);
            }

            else if (!result)
            {
                char str_info[200];
                sprintf(str_info,"Es ist ein Fehler aufgetreten. Bitte wende dich an einen Administrator und melde FehlerID 100!");
                player->PlayerTalkClass->ClearMenus();
                OnGossipHello(player, creature);
                player->MonsterWhisper(str_info,player->GetGUID(),true);
            }

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
