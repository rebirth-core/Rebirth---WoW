/*
* Npc Rugan Steelbelly (33972)
*/
#define RUGAN_DEFAULT_TEXTID 14453
#define RUGAN_QUEST_TEXTID 14436
#define RUGAN_RP_TEXTID 14437
#define GOSSIP_HELLO_RUGAN_1 "Ich brauche einen Ratschlag."
#define GOSSIP_HELLO_RUGAN_2 "Danke"
#define SPELL_CREDIT_RUGAN 64114

class npc_rugan_steelbelly : public CreatureScript
{
public:
       npc_rugan_steelbelly(): CreatureScript("npc_rugan_steelbelly"){}

       bool OnGossipHello(Player* player, Creature* creature)
       {
               if((player->GetQuestStatus(13837) == QUEST_STATUS_INCOMPLETE) || (player->GetQuestStatus(13839) == QUEST_STATUS_INCOMPLETE))
               {
                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_RUGAN_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_RUGAN_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
               player->SEND_GOSSIP_MENU(RUGAN_QUEST_TEXTID, creature->GetGUID());
               }
               else
               {
                       player->SEND_GOSSIP_MENU(RUGAN_DEFAULT_TEXTID, creature->GetGUID());
               }
               return true;
       }

       bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
       {
               switch(uiAction)
               {
                       case GOSSIP_ACTION_INFO_DEF+1:
                               player->CastSpell(player,SPELL_CREDIT_RUGAN,true);
                               player->CLOSE_GOSSIP_MENU();
                               break;
                       case GOSSIP_ACTION_INFO_DEF+2:
                               player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_RUGAN_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                               player->SEND_GOSSIP_MENU(RUGAN_RP_TEXTID, creature->GetGUID());
                               break;
               }
               return true;
       }

};

void AddSC_npc_rugan_steelbelly()
{
new npc_rugan_steelbelly();
}