#include "ScriptPCH.h"
#include "Player.h"

class event_npc : public CreatureScript
{
	public:

    	event_npc()
        	: CreatureScript("event_npc")
    	{
    	}

        int isVote;
        int rewardType;

        enum GOSSIPMENU
        {
            VOTE_MENU         = 10,
            EVENT_MENU        = 11,
            REQ_VOTEPOINTS    = 6,
            VOTE_CATEGORIES   = 7,
            REQ_EVENTPOINTS   = 1,
            EVENT_CATEGORIES  = 4,
            REQ_NEXT_EVENTS   = 2,
            EVENT_TELEPORT    = 3,
            MAIN_MENU         = 5
        };

        enum REWARDTYPES
        {
            REWARD_TYPE_ITEM      = 0,
            REWARD_TYPE_HONOR     = 1,
            REWARD_TYPE_TITLE     = 2,
            REWARD_TYPE_XP        = 3,
            REWARD_TYPE_SPELL     = 4,
            REWARD_TYPE_BUFF      = 5,
        };

        void RequestVotePoints(Player* player, Creature* creature)
        {

            QueryResult result = LoginDatabase.PQuery("SELECT vote_punkte FROM account WHERE id = %u", player->GetSession()->GetAccountId());

            if (result)
            {
                Field* field = result->Fetch();
                uint32 votePunkte = field[0].GetUInt32();
                char str_info[200];
                sprintf(str_info,"Du hast %u Vote Punkt(e)!", votePunkte);
                player->PlayerTalkClass->ClearMenus();
                player->MonsterWhisper(str_info,player->GetGUID(),true);
                OnGossipHello(player, creature);
            }

            else if (!result)
                SendMessageToPlayer(player, creature,"Es ist ein Fehler aufgetreten. Bitte wende dich an einen Administrator und melde FehlerID 101!");

        }

        void SendMessageToPlayer(Player* player, Creature* creature, std::string message)
        {
            char str_info[200];
            sprintf(str_info,"%s",message.c_str());
            OnGossipHello(player, creature);
            player->MonsterWhisper(str_info,player->GetGUID(),true);
        }

        bool CheckCondition(int condition, int cParam1, int cParam2, int cParam3, int negation, Player* player)
        {
            int TEAM = 0;
            switch (condition)
            {

                case 0:   //Keine Condition
                    return true;
                    break;

                case 1:    //Spell Condition
                    if (player->HasSpell(cParam1) && negation == 0)  //Wenn er den Spell hat und negation = 0 ist dann True
                        return true;
                    else if (!player->HasSpell(cParam1) && negation == 0)
                        return false;

                    if (!player->HasSpell(cParam1) && negation == 1)  //Wenn er den Spell hat und negation = 1 ist dann False
                        return true;
                    else if (player->HasSpell(cParam1) && negation == 1)
                        return false;
                    break;

                case 2:   //Title Condition
                    if (player->HasTitle(sCharTitlesStore.LookupEntry(cParam1)) && negation == 0)
                        return true;
                    else if (!player->HasTitle(sCharTitlesStore.LookupEntry(cParam1)) && negation == 0)
                        return false;

                    if (player->HasTitle(sCharTitlesStore.LookupEntry(cParam1)) && negation == 1)
                        return false;
                    else if (!player->HasTitle(sCharTitlesStore.LookupEntry(cParam1)) && negation == 1)
                        return true;
                    break;

                case 3:   //Item Condition
                    if (player->HasItemCount(cParam1,cParam2,true) && negation == 0)
                        return true;
                    else if (!player->HasItemCount(cParam1,cParam2,true) && negation == 0)
                        return false;

                    if (player->HasItemCount(cParam1,cParam2,true) && negation == 1)
                        return false;
                    else if (!player->HasItemCount(cParam1,cParam2,true) && negation == 1)
                        return true;
                    break;

                case 4:  //Level Condition
                    if (player->getLevel() >= cParam1 && negation == 0)
                        return true;
                    else if (player->getLevel() <= cParam1 && negation == 0)
                        return false;
                    if (player->getLevel() >= cParam1 && negation == 1)
                        return false;
                    else if (player->getLevel() <= cParam1 && negation == 1)
                        return true;
                    break;

                case 5: //Faction Condition
                    TEAM = cParam1 == 1 ? ALLIANCE : HORDE;
                    if (player->GetTeam() == TEAM && negation == 0)
                        return true;
                    else if (player->GetTeam() != TEAM && negation == 0)
                        return false;

                    if (player->GetTeam() != TEAM && negation == 1)
                        return true;
                    else if (player->GetTeam() == TEAM && negation == 1)
                        return false;
                    break;

                case 6: //Race Condition
                    if (player->getRace() == cParam1 && negation == 0)
                        return true;
                    else if (player->getRace() != cParam1 && negation == 0) 
                        return false;

                    if (player->getRace() != cParam1 && negation == 1)
                        return true;
                    else if (player->getRace() == cParam1 && negation == 1)
                        return false;
                    break;

                case 7: //Class Condition
                    if (player->getClass() == cParam1 && negation == 0)
                        return true;
                    else if (player->getClass() != cParam1 && negation == 0)
                        return false;

                    if (player->getClass() != cParam1 && negation == 1)
                        return true;
                    else if (player->getClass() == cParam1 && negation == 1)
                        return false;
                    break;
            }
            return true;
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
                player->MonsterWhisper(str_info,player->GetGUID(),true);
                OnGossipHello(player, creature);
            }

            else if (!result)
                SendMessageToPlayer(player, creature,"Es ist ein Fehler aufgetreten. Bitte wende dich an einen Administrator und melde FehlerID 100!");

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
                     player->MonsterWhisper(str_info,player->GetGUID(),true);
                     OnGossipHello(player, creature);

                } while (result->NextRow());
            }
            else
                SendMessageToPlayer(player, creature,"Es ist zurzeit kein Event in Planung!");

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
                    SendMessageToPlayer(player, creature,"Deine Stufe ist zu niedrig um an diesem Event teilnehmen zu koennen!");

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
            if (sWorld->getBoolConfig(CONFIG_REBIRTH_VOTESYSTEM_ENABLED))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "VOTE MENUE", GOSSIP_SENDER_MAIN, VOTE_MENU);

            if (sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_ENABLED))
                pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "EVENT MENUE", GOSSIP_SENDER_MAIN, EVENT_MENU);

            pPlayer->PlayerTalkClass->SendGossipMenu(120100, pCreature->GetGUID());

            return true;
    	}

    	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 , uint32 uiAction)
    	{
        	pPlayer->PlayerTalkClass->ClearMenus();
       	    QueryResult resultEvent;
            QueryResult resultVote;
            

            switch (uiAction)
            {
                case VOTE_MENU:
                    if (sWorld->getBoolConfig(CONFIG_REBIRTH_VOTESYSTEM_ENABLED))
                    {
                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wieviele Vote-Punkte habe ich?", GOSSIP_SENDER_MAIN, 6);

                        if (sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_REWARDS_ENABLED))
                            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Ich will Votebelohnungen kaufen!", GOSSIP_SENDER_MAIN, 7);

                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, ">> Hauptmenue <<", GOSSIP_SENDER_MAIN, 5);
                        pPlayer->PlayerTalkClass->SendGossipMenu(120101, pCreature->GetGUID());
                    }
                    break;
                case EVENT_MENU:
                    if (sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_ENABLED))
                    {
                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wieviele Event-Punkte habe ich?", GOSSIP_SENDER_MAIN, 1);

                        if (sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_NEXT_EVENT_INFO_ENABLED))
                            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Wann finden die naechsten Events statt?", GOSSIP_SENDER_MAIN, 2);

                        if (isActive() && sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_TELEPORT_ENABLED))
                            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Teleportiere mich zum Event!", GOSSIP_SENDER_MAIN, 3);

                        if (sWorld->getBoolConfig(CONFIG_REBIRTH_EVENTSYSTEM_REWARDS_ENABLED))
                            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Ich will Eventbelohnungen kaufen!", GOSSIP_SENDER_MAIN, 4);

                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, ">> Hauptmenue <<", GOSSIP_SENDER_MAIN, 5);
                        pPlayer->PlayerTalkClass->SendGossipMenu(120100, pCreature->GetGUID());
                    }
                    break;

                case REQ_EVENTPOINTS:
                    RequestEventPoints(pPlayer, pCreature);
                    break;

                case REQ_NEXT_EVENTS:
                    RequestNextEvents(pPlayer, pCreature);
                    break;

                case EVENT_TELEPORT:
                    TeleportToEvent(pPlayer, pCreature);
                    break;

                case MAIN_MENU:
                    OnGossipHello(pPlayer,pCreature);
                    break;

                case EVENT_CATEGORIES: //EventReward Menu
                    resultEvent = WorldDatabase.PQuery("SELECT id, name FROM rebirth_event_reward_categorie WHERE eventsystem = 1");

                    if (resultEvent)
                    {

                        do
                        {
                            Field* field = resultEvent->Fetch();
                            int catId = field[0].GetInt32();
                            std::string catName = field[1].GetCString();
                            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, catName.c_str(), GOSSIP_SENDER_MAIN, catId+100);
                        } while (resultEvent->NextRow());

                        rewardType = 1;  //EventRewards
                        isVote = false;

                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, ">> Hauptmenue <<", GOSSIP_SENDER_MAIN, 5);
                        pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());

                    }
                    break;

                case VOTE_CATEGORIES:  //VoteReward Menu
                    resultVote = WorldDatabase.PQuery("SELECT id, name FROM rebirth_event_reward_categorie WHERE votesystem = 1");

                    if (resultVote)
                    {

                        do
                        {
                            Field* field = resultVote->Fetch();
                            int catId = field[0].GetInt32();
                            std::string catName = field[1].GetCString();
                            pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, catName.c_str(), GOSSIP_SENDER_MAIN, catId+100);
                        } while (resultVote->NextRow());

                        rewardType = 2;  //VoteRewards
                        isVote = true;

                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, ">> Hauptmenue <<", GOSSIP_SENDER_MAIN, 5);
                        pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());

                    }

                    break;

                case REQ_VOTEPOINTS:
                    RequestVotePoints(pPlayer, pCreature);
                    break;

            }


                /*
                    Hier wird die Liste der Rewards erstellt
                    ToDo: Eine schönere Umsetzung finden
                */
                if (uiAction >= 100 && uiAction < 1000)
                {
                    QueryResult result = WorldDatabase.PQuery("SELECT id, name, type, param1, param2, param3, cost FROM rebirth_event_rewards WHERE catid = %u AND rewardType = %d OR catid = %u AND rewardType = 0", uiAction-100, rewardType, uiAction-100);

                    if (result)
                    {
                        do
                        {
                           Field* field = result->Fetch();
                           int id = field[0].GetInt32();
                           std::string name = field[1].GetCString();
                           int cost = field[6].GetInt32();

                           char str_info[200];
                           sprintf(str_info,"%s (%d Punkte)",name.c_str(), cost);
                           sLog->outError(str_info);
                           pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, str_info, GOSSIP_SENDER_MAIN, id+1000);
                           
                        } while (result->NextRow());
                        pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, ">> Kategorien <<", GOSSIP_SENDER_MAIN, 4);
                        pPlayer->PlayerTalkClass->SendGossipMenu(907, pCreature->GetGUID());
                    }
                }


                /*
                    Ab hier werden die Belohnungen vergeben
                    ToDo: Eine schönere Umsetzung finden
                */
                if (uiAction >= 1000 && uiAction < 10000)
                {

                    QueryResult resulta;
                    QueryResult result = WorldDatabase.PQuery("SELECT type, param1, param2, param3, cost, condition_type, cond_value1, cond_value2, cond_value3, negation FROM rebirth_event_rewards WHERE id = %u AND catid != ''", uiAction-1000);
                    if (isVote)
                        resulta = LoginDatabase.PQuery("SELECT vote_punkte FROM account WHERE id = %u", pPlayer->GetSession()->GetAccountId());
                    else
                        resulta = LoginDatabase.PQuery("SELECT event_punkte FROM account WHERE id = %u", pPlayer->GetSession()->GetAccountId());

                    int pRP = 0;
                    if (resulta)
                    {

                        Field* field = resulta->Fetch();
                        int pRP = field[0].GetInt32();
                    
                        if (result)
                        {

                            Field* field = result->Fetch();
                            int type = field[0].GetInt32();
                            int param1 = field[1].GetInt32();
                            int param2 = field[2].GetInt32();
                            int param3 = field[3].GetInt32();
                            int cost = field[4].GetInt32();
                            int condition = field[5].GetInt32();
                            int cond_value1 = field[6].GetInt32();
                            int cond_value2 = field[7].GetInt32();
                            int cond_value3 = field[8].GetInt32();
                            int negation = field[9].GetInt32();
                            
                            switch (type)
                            {

                               case REWARD_TYPE_ITEM:
                               {
                                   if (cost <= pRP)
                                   {
                                       Item* item = pPlayer->GetItemByEntry(param1);

                                       if (pPlayer->HasItemCount(param1, 1, true))
                                       {
                                           if (item->GetTemplate()->MaxCount <= pPlayer->GetItemCount(param1, true, 0))
                                           {
                                               SendMessageToPlayer(pPlayer, pCreature, "Du hast bereits die maximale Anzahl dieses Gegenstands erreicht. Du kannst keine weiteren aufnehmen!");
                                               pPlayer->PlayerTalkClass->ClearMenus();
                                               OnGossipHello(pPlayer, pCreature);
                                               return true;
                                           }
                                       }

                                       if (CheckCondition(condition, cond_value1, cond_value2, cond_value3, negation, pPlayer))
                                       {
                                           pPlayer->AddItem(param1, param2);
                                           SendMessageToPlayer(pPlayer, pCreature, "Du hast eine Belohnung erhalten!");
                                           if (isVote)
                                               LoginDatabase.PExecute("UPDATE account SET vote_punkte = vote_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           else
                                               LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                       }
                                       else
                                           SendMessageToPlayer(pPlayer, pCreature, "Du erfuellst die Voraussetzungen nicht um diese Belohnung kaufen zu koennen!");

                                   }

                                   else
                                       SendMessageToPlayer(pPlayer, pCreature, "Du hast nicht genug Punkte um diese Belohnung zu kaufen!");

                                   break;
                               }

                               case REWARD_TYPE_HONOR:
                               {
                                   if (cost <= pRP)
                                   {
                                       if (pPlayer->GetHonorPoints() + param1 <= 75000 && CheckCondition(condition, cond_value1, cond_value2, cond_value3, negation, pPlayer))
                                       {
                                           pPlayer->ModifyHonorPoints(param1);
                                           if (isVote)
                                               LoginDatabase.PExecute("UPDATE account SET vote_punkte = vote_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           else
                                               LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           SendMessageToPlayer(pPlayer, pCreature, "Du hast eine Belohnung erhalten!");
                                       }
                                       else
                                           SendMessageToPlayer(pPlayer, pCreature, "Du erfuellst die Voraussetzungen nicht um diese Belohnung kaufen zu koennen!");
                                   }

                                   else
                                       SendMessageToPlayer(pPlayer, pCreature, "Du hast nicht genug Punkte um diese Belohnung zu kaufen!");

                                   break;
                               }

                               case REWARD_TYPE_TITLE:
                               {
                                   if (cost <= pRP)
                                   {
                                       CharTitlesEntry const* title;
                                       title = sCharTitlesStore.LookupEntry(param1);

                                       if (!pPlayer->HasTitle(title) && CheckCondition(condition, cond_value1, cond_value2, cond_value3, negation, pPlayer))
                                       {
                                           pPlayer->SetTitle(title);
                                           if (isVote)
                                               LoginDatabase.PExecute("UPDATE account SET vote_punkte = vote_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           else
                                               LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           SendMessageToPlayer(pPlayer, pCreature, "Du hast eine Belohnung erhalten!");
                                       }
                                       else
                                           SendMessageToPlayer(pPlayer, pCreature, "Du erfuellst die Voraussetzungen nicht um diese Belohnung kaufen zu koennen!");
                                   }

                                   else
                                       SendMessageToPlayer(pPlayer, pCreature, "Du hast nicht genug Punkte um diese Belohnung zu kaufen!");

                                   break;
                               }

                               case REWARD_TYPE_XP: 
                               {
                                   if (cost <= pRP)
                                   {
                                       if (pPlayer->getLevel() < 80 && CheckCondition(condition, cond_value1, cond_value2, cond_value3, negation, pPlayer))
                                       {
                                           pPlayer->GiveXP(param1,pPlayer,1.0f);
                                           if (isVote)
                                               LoginDatabase.PExecute("UPDATE account SET vote_punkte = vote_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           else
                                               LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           SendMessageToPlayer(pPlayer, pCreature, "Du hast eine Belohnung erhalten!");
                                       }

                                       else
                                           SendMessageToPlayer(pPlayer, pCreature, "Du erfuellst die Voraussetzungen nicht um diese Belohnung kaufen zu koennen!");
                                   }

                                   else
                                       SendMessageToPlayer(pPlayer, pCreature, "Du hast nicht genug Punkte um diese Belohnung zu kaufen!");
                                   break;
                               }

                               case REWARD_TYPE_SPELL:
                               {
                                   if (cost <= pRP)
                                   {
                                       if (!pPlayer->HasSpell(param1) && CheckCondition(condition, cond_value1, cond_value2, cond_value3, negation, pPlayer))
                                       {
                                           pPlayer->learnSpell(param1,false);
                                           if (isVote)
                                               LoginDatabase.PExecute("UPDATE account SET vote_punkte = vote_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           else
                                               LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           SendMessageToPlayer(pPlayer, pCreature, "Du hast eine Belohnung erhalten!");
                                       }

                                       else
                                           SendMessageToPlayer(pPlayer, pCreature, "Du erfuellst die Voraussetzungen nicht um diese Belohnung kaufen zu koennen!");
                                   }

                                   else
                                       SendMessageToPlayer(pPlayer, pCreature, "Du hast nicht genug Punkte um diese Belohnung zu kaufen!");
                               }

                               case REWARD_TYPE_BUFF:
                               {
                                   if (cost <= pRP)
                                   {
                                       if (CheckCondition(condition, cond_value1, cond_value2, cond_value3, negation, pPlayer))
                                       {
                                           pPlayer->AddAura(param1,pPlayer);

                                           if (isVote)
                                               LoginDatabase.PExecute("UPDATE account SET vote_punkte = vote_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());
                                           else
                                               LoginDatabase.PExecute("UPDATE account SET event_punkte = event_punkte - %d WHERE id = %u", cost, pPlayer->GetSession()->GetAccountId());

                                           SendMessageToPlayer(pPlayer, pCreature, "Du hast eine Belohnung erhalten!");
                                       }

                                       else
                                           SendMessageToPlayer(pPlayer, pCreature, "Du erfuellst die Voraussetzungen nicht um diese Belohnung kaufen zu koennen!");
                                   }

                                   else
                                       SendMessageToPlayer(pPlayer, pCreature, "Du hast nicht genug Punkte um diese Belohnung zu kaufen!");
                               }
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
