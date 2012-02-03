#include "ScriptPCH.h"
#include "AchievementMgr.h"
#include "Player.h"

class erfolg_hook : public PlayerScript
{
    public:
        erfolg_hook() : PlayerScript("erfolg_hook") { }

		uint32 FindAchievement(Creature* killed)
		{
			uint32 cEntry = killed->GetEntry();
			QueryResult result = WorldDatabase.PQuery("SELECT achievement_id FROM rebirth_achievment_hook WHERE type = 0 AND param1 = %u OR param1 = %u OR param1 = %u OR param1 = %u OR param1 = %u OR param6 = %u",cEntry, cEntry, cEntry, cEntry, cEntry, cEntry);
			if (result)
			{
				Field* field = result->Fetch();
                uint32 achievement_id = field[0].GetUInt32();
				return achievement_id;
			}
			else
                return 0;
		}
 
		void OnCreatureKill(Player* killer, Creature* killed)
		{
			uint32 achievement = FindAchievement(killed);
			if (achievement != 0)
			{
				AchievementEntry const* pAE = GetAchievementStore()->LookupEntry(achievement);
				killer->CompletedAchievement(pAE);
			}
		}
};

void AddSC_erfolg_hook()
{
    new erfolg_hook();
}
