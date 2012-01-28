#include "ScriptPCH.h"
#include "Player.h"

class player_ranking : public PlayerScript
{
    public:
        player_ranking() : PlayerScript("player_ranking") { }
 
        void OnPVPKill(Player* killer, Player* killed)
        {
			QueryResult result_rank = CharacterDatabase.PQuery("SELECT points_this_week, current_rank, next_rank, titled FROM character_ranks WHERE player = %u", killer->GetGUIDLow());
			QueryResult result_faction = CharacterDatabase.PQuery("SELECT race FROM characters WHERE guid = %u", killer->GetGUIDLow());
			QueryResult result_reset = CharacterDatabase.PQuery("SELECT value, UNIX_TIMESTAMP() FROM worldstates WHERE entry = 41000");
			Field* fielda = result_faction->Fetch();
			uint32 player_race = fielda[0].GetUInt32();
			
			Field* fieldb = result_reset->Fetch();
			uint32 reset_time = fieldb[0].GetUInt32();
			uint32 current_time = fieldb[1].GetUInt32();
			
			uint32 faction = 0;
			
			if(reset_time <= current_time) 
			{
			 QueryResult result_ranking = CharacterDatabase.PQuery("SELECT player FROM character_ranks ORDER BY points_this_week DESC");
			 Field* field_ranking = result_ranking->Fetch();
			 uint32 rplayer;
			 uint32 rank = 1;
			 do
			 {
			  rplayer = field_ranking[0].GetUInt32(); 
			  CharacterDatabase.PExecute("UPDATE character_ranks SET ranked = 1, srank = %u WHERE player = '%u'",rank ,rplayer);
			  rank++;
			 }while(result_ranking->NextRow());
			 
			 CharacterDatabase.PExecute("UPDATE worldstates SET value = UNIX_TIMESTAMP()+604800 WHERE entry = 41000");
			 CharacterDatabase.PExecute("UPDATE character_ranks SET points_last_week = points_this_week");
			 CharacterDatabase.PExecute("UPDATE character_ranks SET points_this_week = 0");
			}
			
			if(player_race == 1 || player_race == 3 || player_race == 4 || player_race == 7 || player_race == 11)
			faction = 1;   //Allianz
			else
			faction = 2;   //Horde
			
			 if(result_rank && (killer->getLevel() - killed->getLevel()) >= 0 &&  (killer->getLevel() - killed->getLevel()) < 5)
              CharacterDatabase.PExecute("UPDATE character_ranks SET points_this_week=points_this_week+1 WHERE player = %u", killer->GetGUIDLow());
			 else if(result_rank && (killer->getLevel() - killed->getLevel()) < 0 &&  (killer->getLevel() - killed->getLevel()) >= -5)
              CharacterDatabase.PExecute("UPDATE character_ranks SET points_this_week=points_this_week+3 WHERE player = %u", killer->GetGUIDLow()); 
			 else if(result_rank && killer->getLevel() != killed->getLevel())
			  CharacterDatabase.PExecute("UPDATE character_ranks SET points_this_week=points_this_week-1 WHERE player = %u", killer->GetGUIDLow());
			 else
			  CharacterDatabase.PExecute("INSERT INTO character_ranks VALUES (%u, 0, 0, 0, 1,0,0)", killer->GetGUIDLow());	
			 
			  Field* field = result_rank->Fetch();
			  uint32 points = field[0].GetUInt32();
			  uint32 current_rank = field[1].GetUInt32();
			  uint32 titled = field[3].GetUInt32();
			  CharTitlesEntry const* titleEntry;
			  
			  
			  /*
					ALLIANZ TITEL ANFANG
			  */
			  
			  if(result_rank && current_rank < 5 && faction == 1 && points >= 5*titled)
			   {
	               switch(current_rank)
				   {
				     case 0:      //Gefreiter
					 titleEntry = sCharTitlesStore.LookupEntry(1);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 1:      //Fußknecht	
					 titleEntry = sCharTitlesStore.LookupEntry(2);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 2:      //Landsknecht
					 titleEntry = sCharTitlesStore.LookupEntry(3);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 3:      //Feldwebel
					 titleEntry = sCharTitlesStore.LookupEntry(4);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 4:      //Fähnrich
					 titleEntry = sCharTitlesStore.LookupEntry(5);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
				   }
			   }
			   
			   
			  if(result_rank && current_rank >= 5 && current_rank < 10 && faction == 1 && points >= 15*titled)
			   {
	               switch(current_rank)
				   {
				     case 5:      //Leutnant
					 titleEntry = sCharTitlesStore.LookupEntry(6);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 6:      //Hauptmann
					 titleEntry = sCharTitlesStore.LookupEntry(7);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 7:      //Kürassier
					 titleEntry = sCharTitlesStore.LookupEntry(8);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 8:      //Ritter der Allianz
					 titleEntry = sCharTitlesStore.LookupEntry(9);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 9:      //Feldkommandant
					 titleEntry = sCharTitlesStore.LookupEntry(10);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
				   }
			   }
			   
			   
			   
			  if(result_rank && current_rank >= 10 && current_rank < 14 && faction == 1 && points >= 30*titled)
			   {
	               switch(current_rank)
				   {
				     case 10:      //Rittmeister
					 titleEntry = sCharTitlesStore.LookupEntry(11);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 11:      //Marschall
					 titleEntry = sCharTitlesStore.LookupEntry(12);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 12:      //Feldmarschall
					 titleEntry = sCharTitlesStore.LookupEntry(13);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 13:      //Großmarschall
					 titleEntry = sCharTitlesStore.LookupEntry(14);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
				   }
			   }


			  /*
					ALLIANZ TITEL ENDE
			  */
			  




			  /*
					HORDE TITEL ANFANG
			  */
			  
			  if(result_rank && current_rank < 5 && faction == 2 && points >= 5*titled)
			   {
	               switch(current_rank)
				   {
				     case 0:      //Späher
					 titleEntry = sCharTitlesStore.LookupEntry(15);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 1:      //Grunzer	
					 titleEntry = sCharTitlesStore.LookupEntry(16);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 2:      //Waffenträger
					 titleEntry = sCharTitlesStore.LookupEntry(17);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 3:      //Schlachtrufer
					 titleEntry = sCharTitlesStore.LookupEntry(18);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 4:      //Rottenmeister
					 titleEntry = sCharTitlesStore.LookupEntry(19);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
				   }
			   }
			   
			   
			  if(result_rank && current_rank >= 5 && current_rank < 10 && faction == 2 && points >= 15*titled)
			   {
	               switch(current_rank)
				   {
				     case 5:      //Steingardist
					 titleEntry = sCharTitlesStore.LookupEntry(20);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 6:      //Blutgardist
					 titleEntry = sCharTitlesStore.LookupEntry(21);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 7:      //Zornbringer
					 titleEntry = sCharTitlesStore.LookupEntry(22);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 8:      //Klinge der Horde
					 titleEntry = sCharTitlesStore.LookupEntry(23);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 9:      //Feldherr
					 titleEntry = sCharTitlesStore.LookupEntry(24);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
				   }
			   }
			   
			   
			   
			  if(result_rank && current_rank >= 10 && current_rank < 14 && faction == 2 && points >= 30*titled)
			   {
	               switch(current_rank)
				   {
				     case 10:      //Sturmreiter
					 titleEntry = sCharTitlesStore.LookupEntry(25);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 11:      //Kriegsherr
					 titleEntry = sCharTitlesStore.LookupEntry(26);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 12:      //Kriegsfürst
					 titleEntry = sCharTitlesStore.LookupEntry(27);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
					 
					 case 13:      //Oberster Kriegsfürst
					 titleEntry = sCharTitlesStore.LookupEntry(28);
					 killer->SetTitle(titleEntry);
					 CharacterDatabase.PExecute("UPDATE character_ranks SET titled=titled+1, current_rank=current_rank+1 WHERE player = %u", killer->GetGUIDLow());
					 break;
				   }
			   }


			  /*
					HORDE TITEL ENDE
			  */
			  
			  
        }
};

void AddSC_player_ranking()
{
    new player_ranking();
}