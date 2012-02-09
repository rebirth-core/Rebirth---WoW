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

        void RequestNextEvents(Player* player, Creature* creature)
        {
            QueryResult result = LoginDatabase.PQuery("SELECT FROM_UNIXTIME(date), type, reqLevel FROM rebirth_next_event WHERE date > UNIX_TIMESTAMP()");

            if (result)
            {
                do
                {
                     Field* field = result->Fetch();
                     std::string eventType = "";
                     std::string date = field[0].GetCString();
                     uint32 type = field[1].GetUInt32();
                     uint32 reqLevel = field[2].GetUInt32();

                     if (type == 0)
                         eventType = "PvP";
                     else if (type == 1)
                         eventType = "PvE";
                     else if (type == 2)
                         eventType = "Fun";
                     else
                         eventType = "Sonstiges";

                     char str_info[200];
                     sprintf(str_info,"Event Info: Datum: %s || Typ: %s || Empfohlenes Level: %u",date.c_str(),eventType.c_str(),reqLevel);
                     player->PlayerTalkClass->ClearMenus();
                     OnGossipHello(player, creature);
                     player->MonsterWhisper(str_info,player->GetGUID(),true);
                } while (result->NextRow());
            }
            else
            {
                char str_info[200];
                sprintf(str_info,"Es ist zurzeit kein Event in Planung!");
                player->PlayerTalkClass->ClearMenus();
                OnGossipHello(player, creature);
                player->MonsterWhisper(str_info,player->GetGUID(),true);
            }
        }

        void TeleportToEvent(Player* player, Creature* creature)
        {
            QueryResult result = LoginDatabase.PQuery("SELECT x, y, z, map, reqLevel FROM rebirth_next_event WHERE active = 1");
            if (result)
            {
                Field* field = result->Fetch();
                float x = field[0].GetFloat();
                float y = field[1].GetFloat();
                float z = field[2].GetFloat();
                int map = field[3].GetInt32();
                int reqLevel = field[4].GetInt32();

                if (player->getLevel() >= reqLevel)
                    player->TeleportTo(map, x, y, z, 0.0f, 0);
                else
                {
                    char str_info[200];
                    sprintf(str_info,"Deine Stufe ist zu niedrig um an diesem Event teilnehmen zu koennen!");
                    player->PlayerTalkClass->ClearMenus();
                    OnGossipHello(player, creature);
                    player->MonsterWhisper(str_info,player->GetGUID(),true);
                }

            }
        }

        bool isActive()
        {
            QueryResult result = LoginDatabase.PQuery("SELECT * FROM rebirth_next_event WHERE active = 1");
            if (result)
                return true;
            else
                return false;
        }

    	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    	{
          pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wieviele Event Punkte habe ich?", GOSSIP_SENDER_MAIN, 1);
          pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wann findet das naechste Event statt?", GOSSIP_SENDER_MAIN, 2);
          if (isActive())
              pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleportiere mich zum Event!", GOSSIP_SENDER_MAIN, 3);
          pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());

        	return true;
    	}

    	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 , uint32 uiAction)
    	{
        	pPlayer->PlayerTalkClass->ClearMenus();
       	 
            switch (uiAction)
            {
            case 1:
                RequestEventPoints(pPlayer, pCreature);
                break;
            case 2:
                RequestNextEvents(pPlayer, pCreature);
                break;
            case 3:
                TeleportToEvent(pPlayer, pCreature);
                break;
            }
            return true;
       }

};

void AddSC_event_npc()
{
	new event_npc();
}
