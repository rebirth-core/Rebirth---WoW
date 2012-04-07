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
          if (sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_ENABLED))
          {
            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wieviele Event Punkte habe ich?", GOSSIP_SENDER_MAIN, 1);
            if (sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_NEXT_EVENT_INFO_ENABLED))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wann finden die naechsten Events statt?", GOSSIP_SENDER_MAIN, 2);
            if (isActive() && sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_TELEPORT_ENABLED))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleportiere mich zum Event!", GOSSIP_SENDER_MAIN, 3);
            if (sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_REWARDS_ENABLED))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Ich will Eventbelohnungen kaufen!", GOSSIP_SENDER_MAIN, 4);
            pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
          }
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
                case 5:
                    OnGossipHello(pPlayer,pCreature);
                    break;
                case 4:
                    QueryResult result = WorldDatabase.PQuery("SELECT id, name FROM rebirth_event_reward_categorie");
                    if (result)
                    {
                        do
                        {
                            Field* field = result->Fetch();
                            int catId = field[0].GetInt32();
                            std::string catName = field[1].GetCString();
                            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, catName.c_str(), GOSSIP_SENDER_MAIN, catId+100);
                        } while (result->NextRow());
                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<<Hauptmenue>>", GOSSIP_SENDER_MAIN, 5);
                        pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
                    }
                    break;

            }

                if (uiAction >= 100 && uiAction < 1000)
                {
                    QueryResult result = WorldDatabase.PQuery("SELECT id, name, type, param1, param2, param3, cost FROM rebirth_event_rewards WHERE catid = %u", uiAction-100);
                    sLog->outError("Rebirth Debug: Kategorie == %d", uiAction-100);
                    if (result)
                    {
                        do
                        {
                           Field* field = result->Fetch();
                           int id = field[0].GetInt32();
                           std::string name = field[1].GetCString();
                           int cost = field[6].GetInt32();

                           char str_info[200];
                           sprintf(str_info,"%s (%d EP)",name.c_str(), cost);
                           pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, str_info, GOSSIP_SENDER_MAIN, id+1000);
                           
                        } while (result->NextRow());
                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<<Kategorien>>", GOSSIP_SENDER_MAIN, 4);
                        pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
                    }
                }

                if (uiAction >= 1000 && uiAction < 10000)
                {
                    QueryResult result = WorldDatabase.PQuery("SELECT type, param1, param2, param3, cost FROM rebirth_event_rewards WHERE id = %u AND catid != ''", uiAction-1000);
                    QueryResult resulta = LoginDatabase.PQuery("SELECT event_punkte FROM account WHERE id = %u", pPlayer->GetSession()->GetAccountId());
                    int pEP = 0;
                    if (resulta)
                    {
                        sLog->outError("Rebirth Debug: resulta == true");
                        Field* field = resulta->Fetch();
                        int pEP = field[0].GetInt32();
                        sLog->outError("Rebirth Debug: pEP = %d",pEP);
                    
                        if (result)
                        {
                            sLog->outError("Rebirth Debug: pEP = %d",pEP);
                            sLog->outError("Rebirth Debug: result == true");
                            Field* field = result->Fetch();
                            int type = field[0].GetInt32();
                            int param1 = field[1].GetInt32();
                            int param2 = field[2].GetInt32();
                            int param3 = field[3].GetInt32();
                            int cost = field[4].GetInt32();
                            sLog->outError("Rebirth Debug: GetRewards %d %d %d %d %d",type,param1,param2,param3,cost);
                            switch (type)
                            {
                               sLog->outError("Rebirth Debug: pEP = %d",pEP);
                               sLog->outError("Rebirth Debug: 'OnBuy' case: %d",type);
                               case 0:
                                   sLog->outError("Rebirth Debug: 'ItemBuy' %d <= %d",cost,pEP);
                                   sLog->outError("Rebirth Debug: pEP = %d",pEP);
                                   if (cost <= pEP)
                                   {
                                       sLog->outError("Rebirth Debug: pEP = %d",pEP);
                                       Item* item = pPlayer->GetItemByEntry(param1);
                                       sLog->outError("Rebirth Debug: 'ItemBuy' %d <= %d  >>true<<",cost,pEP);
                                       if (pPlayer->HasItemCount(param1, 1, true))
                                       {
                                           if (item->GetTemplate()->MaxCount <= pPlayer->GetItemCount(param1, true, 0))
                                           {
                                               char str_info[200];
                                               sprintf(str_info,"Du hast bereits die maximale Anzahl dieses Gegenstands erreicht. Du kannst keine weiteren aufnehmen!");
                                               pPlayer->PlayerTalkClass->ClearMenus();
                                               OnGossipHello(pPlayer, pCreature);
                                               pPlayer->MonsterWhisper(str_info,pPlayer->GetGUID(),true);
                                               OnGossipHello(pPlayer, pCreature);
                                               return true;
                                           }
                                       }
                                       sLog->outError("Rebirth Debug: 'ItemBuy' ItemID: %d  -- ItemCount: %d",param1,param2);
                                       pPlayer->AddItem(param1, param2);
                                       OnGossipHello(pPlayer, pCreature);
                                       LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                   }

                                   else
                                   {
                                       char str_info[200];
                                       sprintf(str_info,"Du hast nicht genug Eventpunkte um diese Belohnung zu kaufen!");
                                       OnGossipHello(pPlayer, pCreature);
                                       pPlayer->MonsterWhisper(str_info,pPlayer->GetGUID(),true);
                                   }

                                   break;
                               case 1:
                                   if (cost <= pEP)
                                   {
                                       pPlayer->ModifyHonorPoints(param1);
                                       LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                       OnGossipHello(pPlayer, pCreature);
                                   }

                                   else
                                   {
                                       char str_info[200];
                                       sprintf(str_info,"Du hast nicht genug Eventpunkte um diese Belohnung zu kaufen!");
                                       OnGossipHello(pPlayer, pCreature);
                                       pPlayer->MonsterWhisper(str_info,pPlayer->GetGUID(),true);
                                   }

                                   break;
                               case 2:
                                   if (cost <= pEP)
                                   {
                                       CharTitlesEntry const* title;
                                       title = sCharTitlesStore.LookupEntry(param1);
                                       pPlayer->SetTitle(title);
                                       LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                       OnGossipHello(pPlayer, pCreature);
                                   }

                                   else
                                   {
                                       char str_info[200];
                                       sprintf(str_info,"Du hast nicht genug Eventpunkte um diese Belohnung zu kaufen!");
                                       OnGossipHello(pPlayer, pCreature);
                                       pPlayer->MonsterWhisper(str_info,pPlayer->GetGUID(),true);
                                   }

                                   break;

                               case 3: 
                                   if (cost <= pEP)
                                   {
                                       if (pPlayer->getLevel() < 80)
                                       {
                                           pPlayer->GiveXP(param1,pPlayer,1.0f);
                                           LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           OnGossipHello(pPlayer, pCreature);
                                       }

                                       else
                                       {
                                           char str_info[200];
                                           sprintf(str_info,"Du kannst keine Erfahrung mehr erhalten!");
                                           OnGossipHello(pPlayer, pCreature);
                                           pPlayer->MonsterWhisper(str_info,pPlayer->GetGUID(),true);
                                       }
                                   }

                                   else
                                   {
                                       char str_info[200];
                                       sprintf(str_info,"Du hast nicht genug Eventpunkte um diese Belohnung zu kaufen!");
                                       OnGossipHello(pPlayer, pCreature);
                                       pPlayer->MonsterWhisper(str_info,pPlayer->GetGUID(),true);
                                   }
                                   break;
                            }
                        }
                    }
                }

            return true;
       }

};

void AddSC_event_npc()
{
	new event_npc();
}
