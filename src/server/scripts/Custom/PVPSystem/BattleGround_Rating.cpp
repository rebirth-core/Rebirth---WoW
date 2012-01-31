#include "ScriptPCH.h"

class player_ranking : public PlayerScript
{
    public:
        player_ranking() : PlayerScript("BattleGround_Rating_") { }
 
        void OnPVPKill(Player* killer, Player* killed)
        {
		}
};

void AddSC_player_ranking()
{
    new player_ranking();
}