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
			QueryResult result = WorldDatabase.PQuery("SELECT achievement_id FROM rebirth_achievment_hook WHERE param1 = %u OR param2 = %u OR param3 = %u",cEntry, cEntry, cEntry);
			if (result)
			{
				Field* field = result->Fetch();
                uint32 achievement_id = field[0].GetUInt32();
				return achievement_id;
			}
			else
                return 0;
		}

		uint32 FindAchievementType(uint32 achievement)
		{
			QueryResult result = WorldDatabase.PQuery("SELECT type FROM rebirth_achievment_hook WHERE achievement_id = %u",achievement);
			if (result)
			{
				Field *field = result->Fetch();
				uint32 type = field[0].GetUInt32();
				return type;
			}
			return -1;
		}

		bool CreatureKillTimedAchievement(uint32 achievement, Creature* killed, Player* killer)
		{
			QueryResult result = CharacterDatabase.PQuery("SELECT param1, param2, param3, param4, param5 FROM rebirth_characters_achievement_progress WHERE achievement = %u AND guid = %u", achievement, killer->GetGUIDLow());
			QueryResult resulthook = WorldDatabase.PQuery("SELECT param1, param2, param3 FROM rebirth_achievment_hook WHERE achievement_id = %u",achievement);
			
			uint32 wparam1 = 0;
			uint32 wparam2 = 0;
			uint32 wparam3 = 0;

			uint32 param1 = 0;
			uint32 param2 = 0;
			uint32 param3 = 0;
			uint32 param4 = 0;
			uint32 param5 = 0;

			uint32 time = 0;
			sLog->outError("1");
			if (resulthook)
			{
				Field *fieldh = resulthook->Fetch();
				wparam1 = fieldh[0].GetUInt32();  //NPC ID
				wparam2 = fieldh[1].GetUInt32();  //Benötigte Kills
				wparam3 = fieldh[2].GetUInt32();  //Zeit in Sekunden die verlangt wird zum abschließen
				sLog->outError("%u", wparam3);
			}

			if (!result)
			{
				CharacterDatabase.PExecute("INSERT INTO rebirth_characters_achievement_progress (achievement, guid, param1, param4, param5) VALUES (%u,%u,%u,UNIX_TIMESTAMP(),UNIX_TIMESTAMP() + %u)", achievement, killer->GetGUIDLow(), wparam1, wparam3);
				QueryResult result = CharacterDatabase.PQuery("SELECT param1, param2, param3, param4, param5 FROM rebirth_characters_achievement_progress WHERE achievement = %u AND guid = %u", achievement, killer->GetGUIDLow());
				sLog->outError("3");
			}

			if (result)
			{
				CharacterDatabase.PExecute("UPDATE rebirth_characters_achievement_progress SET param2 = param2 + 1 WHERE achievement = %u AND guid = %u", achievement, killer->GetGUIDLow());
				result = CharacterDatabase.PQuery("SELECT param1, param2, param3, param4, param5, UNIX_TIMESTAMP() FROM rebirth_characters_achievement_progress WHERE achievement = %u AND guid = %u", achievement, killer->GetGUIDLow());
				Field *field = result->Fetch();
			    param1 = field[0].GetUInt32();  //NPC ID
				param2 = field[1].GetUInt32();  //Kill Count
				param3 = field[2].GetUInt32();  //Benötigte Kills
				param4 = field[3].GetUInt32();  //Timestamp wann der erste NPC getötet wurde
				param5 = field[4].GetUInt32();  //Timestamp bis wann der letzte NPC getötet werden muss
				time = field[5].GetUInt32(); //Aktuelle Zeit
				sLog->outError("%u  +  %u  >= %u",param4, wparam3, time);
				if (param2 >= wparam2 && param5 >= time)
					return true;
				else if(param5 <= time)
					CharacterDatabase.PExecute("DELETE FROM rebirth_characters_achievement_progress WHERE achievement = %u AND guid = %u", achievement, killer->GetGUIDLow());
			}

			return false;
		}
 
		void OnCreatureKill(Player* killer, Creature* killed)
		{
			uint32 achievement = FindAchievement(killed);
			uint32 type = 0;
			if (achievement != 0)
				type = FindAchievementType(achievement);
			sLog->outError("type = FindAchievementType(achievement);");
			AchievementEntry const* pAE = GetAchievementStore()->LookupEntry(achievement);

			if (type >= 0)
			{
				switch (type)
				{
                    case 0:
				        killer->CompletedAchievement(pAE);
						sLog->outError("case 0:");
						break;

					case 1:
						sLog->outError("case 1:");
						if (CreatureKillTimedAchievement(achievement, killed, killer))
				            killer->CompletedAchievement(pAE);
						break;
				}
			}
		}
};

void AddSC_erfolg_hook()
{
    new erfolg_hook();
}
