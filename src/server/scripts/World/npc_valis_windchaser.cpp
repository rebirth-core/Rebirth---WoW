/*
* Npc Valis Windchaser
*/
#define VALIS_DEFAULT_TEXTID 14453
#define VALIS_QUEST_TEXTID 14438
#define VALIS_RP_TEXTID 14439
#define GOSSIP_HELLO_VALIS_1 "Hol dir ein Argentumtunier Mount und eine Lanze."
#define GOSSIP_HELLO_VALIS_2 "Ich brauche auch ein Ratschlag."
#define SPELL_CREDIT_VALIS 64115
class npc_valis_windchaser : public CreatureScript
{
public:
       npc_valis_windchaser(): CreatureScript("npc_valis_windchaser"){}

       bool OnGossipHello(Player* player, Creature* creature)
       {
               //Si il a la quete
               if((player->GetQuestStatus(13835) == QUEST_STATUS_INCOMPLETE) ||
                       (player->GetQuestStatus(13838) == QUEST_STATUS_INCOMPLETE))
               {
                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_VALIS_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_VALIS_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);
               player->SEND_GOSSIP_MENU(VALIS_QUEST_TEXTID, creature->GetGUID());
               }
               //Sinon Texte par défaut
               else
                       player->SEND_GOSSIP_MENU(VALIS_DEFAULT_TEXTID, creature->GetGUID());
               return true;
       }

       bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
       {
               switch (uiAction)
               {
                       case GOSSIP_ACTION_INFO_DEF+1:
                               player->CastSpell(player,SPELL_CREDIT_VALIS,true);//Cast du sort de credit quest (valide l'objectif)
                               player->CLOSE_GOSSIP_MENU();//Ferme la fenetre du gossip coté client
                       break;
                       case GOSSIP_ACTION_INFO_DEF+2:
                               //Raconte un blabla
                               player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_VALIS_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
                       player->SEND_GOSSIP_MENU(VALIS_RP_TEXTID, creature->GetGUID());
                       break;
               }
               return true;
       }

};

void AddSC_npc_valis_windchaser()
{
new npc_valis_windchaser();
}