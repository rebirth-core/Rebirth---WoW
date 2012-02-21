#include "ScriptPCH.h"
#include "Player.h"
#include "WorldSession.h"
#include "OutdoorPvPWG.h"

class rebirth_wg_timer : public WorldScript
{
    public:
        rebirth_wg_timer() : WorldScript("player_ranking") { }

	//void OnUpdate(uint32) 
	//{
	//	OutdoorPvPWG* wg;
	//	sWorld->GetWintergrapsTimer();
	//	wg->UpdateClock();
	//	uint32 timer = uint32(wg->GetTimer());
	//	sLog->outError("Wintergrasp Timer: %u",timer);
	//}
};

void AddSC_wg_timer()
{
    new rebirth_wg_timer();
}
 