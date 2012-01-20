/*
* Npc Jeran Lockwood (33973)
*/
#define JERAN_DEFAULT_TEXTID 14453
#define JERAN_QUEST_TEXTID 14431
#define JERAN_RP_TEXTID 14434
#define GOSSIP_HELLO_JERAN_1 "Hallo du."
#define GOSSIP_HELLO_JERAN_2 "Hol dir ein Staender!."
#define SPELL_CREDIT_JERAN 64113

class npc_jeran_lockwood : public CreatureScript
{
public:
       npc_jeran_lockwood(): CreatureScript("npc_jeran_lockwood"){}

       bool OnGossipHello(Player* player, Creature* creature)
       {
               if(/*(player->GetQuestStatus(13828) == QUEST_STATUS_INCOMPLETE) || (player->GetQuestStatus(13829) == QUEST_STATUS_INCOMPLETE)*/true)
               {
                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_JERAN_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_JERAN_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
               player->SEND_GOSSIP_MENU(JERAN_QUEST_TEXTID, creature->GetGUID());
               }
               else
               {
                       player->SEND_GOSSIP_MENU(JERAN_DEFAULT_TEXTID, creature->GetGUID());
               }
               return true;
       }

       bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
       {
               switch(uiAction)
               {
                       case GOSSIP_ACTION_INFO_DEF+1:
                               player->CastSpell(player,SPELL_CREDIT_JERAN,true);
                               player->CLOSE_GOSSIP_MENU();
                               break;
                       case GOSSIP_ACTION_INFO_DEF+2:
                               player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_JERAN_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                               player->SEND_GOSSIP_MENU(JERAN_RP_TEXTID, creature->GetGUID());
                               break;
               }
               return true;
       }

};

void AddSC_npc_jeran_lockwood()
{
    new npc_jeran_lockwood();
}