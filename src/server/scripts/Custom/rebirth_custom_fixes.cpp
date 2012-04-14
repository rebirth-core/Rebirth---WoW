#include "ScriptPCH.h"
#include "Player.h"


enum eQuests
{
    QUEST_RECKEN_TROLL     = 13727,
    QUEST_RECKEN_TAURE     = 13728,
    QUEST_RECKEN_UNTOT     = 13729,
    QUEST_RECKEN_BELF      = 13731,
    QUEST_RECKEN_ORK       = 13726,
    QUEST_RECKEN_NELF      = 13725,
    QUEST_RECKEN_ZWERG     = 13713,
    QUEST_RECKEN_GNOM      = 13723,
    QUEST_RECKEN_DRAENEI   = 13724,
    QUEST_RECKEN_MENSCH    = 13699
};

enum eNPC
{
    NPC_DATURA_BLUTROSE = 28532
};

class npc_datura_blutrose : public CreatureScript
{
	public:
    	npc_datura_blutrose()
        	: CreatureScript("npc_datura_blutrose")
    	{
    	}

    	bool OnGossipHello(Player* pPlayer, Creature* pCreature)
    	{

            if(pPlayer->hasQuest(12637))
                   pPlayer->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Bitte untersucht diese Kette, Datura.", GOSSIP_SENDER_MAIN, 1);
            pPlayer->PlayerTalkClass->SendGossipMenu(1, pCreature->GetGUID());
            return true;
    	}

    	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 , uint32 uiAction)
    	{
        	pPlayer->PlayerTalkClass->ClearMenus();
       	 
            switch (uiAction)
            {
                case 1:
                    pPlayer->KilledMonsterCredit(NPC_DATURA_BLUTROSE,0);
                    break;
            }

            return false;
        }
};


class argent_quest_achm : public CreatureScript
{
	public:
    	argent_quest_achm()
        	: CreatureScript("argent_quest_achm")
    	{
    	}

        void DoCompleteAchievement(Player* player, int achievement)
        {
            AchievementEntry const* pAE = sAchievementStore.LookupEntry(achievement);
            player->CompletedAchievement(pAE);
            sLog->outError("player->CompletedAchievement(pAE);  ID %d",achievement);
        }

        bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32) 
        { 
            sLog->outError("%d",quest->GetQuestId());
            switch (quest->GetQuestId())
            {
                case QUEST_RECKEN_TROLL:
                    DoCompleteAchievement(player, 2784);
                    return true;
                    break;

                case QUEST_RECKEN_TAURE:
                    DoCompleteAchievement(player, 2786);
                    return true;
                    break;

                case QUEST_RECKEN_UNTOT:
                    DoCompleteAchievement(player, 2787);
                    return true;
                    break;

                case QUEST_RECKEN_BELF:
                    DoCompleteAchievement(player, 2785);
                    return true;
                    break;

                case QUEST_RECKEN_ORK:
                    DoCompleteAchievement(player, 2783);
                    return true;
                    break;

                case QUEST_RECKEN_NELF:
                    DoCompleteAchievement(player, 2777);
                    return true;
                    break;

                case QUEST_RECKEN_ZWERG:
                    DoCompleteAchievement(player, 2780);
                    return true;
                    break;

                case QUEST_RECKEN_GNOM:
                    DoCompleteAchievement(player, 2779);
                    return true;
                    break;

                case QUEST_RECKEN_DRAENEI:
                    DoCompleteAchievement(player, 2778);
                    return true;
                    break;

                case QUEST_RECKEN_MENSCH:
                    DoCompleteAchievement(player, 2781);
                    return true;
                    break;
            }
            return false; 
        }

};

void AddSC_rebirth_fixes()
{
	new argent_quest_achm();
    new npc_datura_blutrose();
}
