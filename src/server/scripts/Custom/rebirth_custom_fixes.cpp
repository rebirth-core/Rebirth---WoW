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

enum AttractedReefBullData
{
    NPC_FEMALE_REEF_COW = 24797,
    SPELL_ANUNIAQS_NET = 21014,
    SPELL_TASTY_REEF_FISH = 44454,
    SPELL_LOVE_COSMETIC = 52148,
    ITEM_TASTY_REEF_FISH = 34127,
    QUEST_THE_WAY_TO_HIS_HEART = 11472
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


class npc_attracted_reef_bull : public CreatureScript
{
    public:

        npc_attracted_reef_bull() : CreatureScript("npc_attracted_reef_bull") {}

        struct npc_attracted_reef_bullAI : public ScriptedAI
        {
            npc_attracted_reef_bullAI(Creature* creature) : ScriptedAI(creature) {}

            uint64 playerGUID;
            uint8 point;

            void Reset()
            {
                playerGUID = 0;
                point = 0;
            }

            void UpdateAI(const uint32 diff) {}

            void SpellHit(Unit* caster, const SpellInfo* spell)
            {
                if (!caster->ToPlayer())
                    return;

                if (spell->Id == SPELL_TASTY_REEF_FISH)
                {
                    if (playerGUID == 0)
                        playerGUID = caster->GetGUID();

                    me->GetMotionMaster()->MovePoint(point, caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());
                    ++point;
                }

                if (Creature* female = me->FindNearestCreature(NPC_FEMALE_REEF_COW, 5.0f, true))
                {
                    if (Player* player = me->GetPlayer(*me, playerGUID))
                    {
                        DoCast(me, SPELL_LOVE_COSMETIC);
                        female->AI()->DoCast(female, SPELL_LOVE_COSMETIC);
                        player->GroupEventHappens(QUEST_THE_WAY_TO_HIS_HEART, me);
                        me->DespawnOrUnsummon(5000);
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_attracted_reef_bullAI(creature);
        }
};

class spell_anuniaqs_net : public SpellScriptLoader
{
public:
    spell_anuniaqs_net() : SpellScriptLoader("spell_anuniaqs_net") {}

    class spell_anuniaqs_net_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_anuniaqs_net_SpellScript);

        bool Validate(SpellInfo const* /*spellInfo*/)
        {
            if (!sSpellMgr->GetSpellInfo(SPELL_ANUNIAQS_NET))
                return false;
            return true;
        }

        void HandleDummy(SpellEffIndex /*effIndex*/)
        {
            if (Unit* caster = GetCaster())
                if (caster->ToPlayer())
                    caster->ToPlayer()->AddItem(ITEM_TASTY_REEF_FISH, urand(1,5));
        }

        void Register()
        {
            OnEffectHit += SpellEffectFn(spell_anuniaqs_net_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const
    {
        return new spell_anuniaqs_net_SpellScript();
    }
};
void AddSC_rebirth_fixes()
{
	new argent_quest_achm();
    new npc_datura_blutrose();
    new npc_attracted_reef_bull();
    new spell_anuniaqs_net();
}
