UPDATE `creature_loot_template` SET `mincountOrRef`=-10001 WHERE `mincountOrRef`=-24725;
UPDATE `gameobject_loot_template` SET `mincountOrRef`=-10001 WHERE `mincountOrRef`=-24725;
UPDATE `item_loot_template` SET `mincountOrRef`=-10001 WHERE `mincountOrRef`=-24725;

DELETE FROM `reference_loot_template` WHERE `entry`=24725;
-- Among the Champions and The Grand Melee updates
UPDATE `creature_template` SET `ScriptName`='npc_valiant', `dmg_multiplier`=2 WHERE `entry`IN (33285,33306,33384,33383,33382,33739,33749,33745,33744,33748,33740,33743,33747,33738,33746,33561,33558,33559,33562);
SET @Bag := 20469;
SET @RefA := 10022;
SET @RefB := 10023;
SET @RefC := 10024;
SET @RefD := 10025;

-- Add missing recipes to "Decoded True Believer Clippings" (i20469)
DELETE FROM `item_loot_template` WHERE `entry` = 20469;
INSERT INTO `item_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@Bag,1,100,1,0,-@RefD,2), -- Decoded Twilight Texts
-- scrolls via reference
(@Bag,2,100,1,0,-10001,1), -- one from level V scrolls
(@Bag,3,4,1,0,-@RefA,1), -- one from Crest of Beckoning
(@Bag,4,4,1,0,-@RefB,1), -- one from Sigil of Beckoning
(@Bag,5,4,1,0,-@RefC,1), -- one from Scepter of Beckoning
-- special pattern drops:
(@Bag,20546,3,1,0,1,1), -- Runed Stygian Leggings
(@Bag,20547,3,1,0,1,1), -- Runed Stygian Boots
(@Bag,20548,3,1,0,1,1), -- Runed Stygian Belt
(@Bag,20553,3,1,0,1,1), -- Darkrune Gauntlets
(@Bag,20554,3,1,0,1,1), -- Darkrune Breastplate
(@Bag,20555,3,1,0,1,1); -- Darkrune Helm
-- References:
DELETE FROM `reference_loot_template` WHERE `entry` IN (@RefA,@RefB,@RefC,@RefD);
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@RefA,20518,0,1,1,1,1), -- Scroll: Crest of Beckoning
(@RefA,20526,0,1,1,1,1), -- Scroll: Crest of Beckoning
(@RefA,20527,0,1,1,1,1), -- Scroll: Crest of Beckoning
(@RefA,20528,0,1,1,1,1), -- Scroll: Crest of Beckoning
(@RefB,20531,0,1,1,1,1), -- Scroll: Sigil of Beckoning
(@RefB,20532,0,1,1,1,1), -- Scroll: Sigil of Beckoning
(@RefB,20533,0,1,1,1,1), -- Scroll: Sigil of Beckoning
(@RefB,20535,0,1,1,1,1), -- Scroll: Sigil of Beckoning
(@RefC,20540,0,1,1,1,1), -- Scroll: Scepter of Beckoning
(@RefC,20542,0,1,1,1,1), -- Scroll: Scepter of Beckoning
(@RefC,20543,0,1,1,1,1), -- Scroll: Scepter of Beckoning
(@RefC,20544,0,1,1,1,1), -- Scroll: Scepter of Beckoning
-- Decoded Twilight Texts:
(@RefD,20676,0,1,1,1,3), 
(@RefD,20541,0,1,1,1,3), 
(@RefD,20545,0,1,1,1,3), 
(@RefD,20679,0,1,1,1,3), 
(@RefD,20677,0,1,1,1,3), 
(@RefD,20678,0,1,1,1,3),
(@RefD,20552,0,1,1,1,3); -- sp_dev_reguid procedure 

SET @ENTRY := 197;
SET @QUEST := 54;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,@QUEST,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Marshal McBride - On Quest Accept - Say Line 0");
-- Text
DELETE FROM `db_script_string` WHERE `entry`=2000000059;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"You are dismissed, $N.",12,0,100,113,0,0,"Marshal McBride");
-- [Q] [A/H] The Completed Orb of Noh'Orahil
-- Menara Voidrender SAI
SET @ENTRY := 6266;
SET @QUEST := 4975;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,@QUEST,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Menara Voidrender - On Quest Accept - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,10000,10000,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0,0,0,0,"Menara Voidrender - On Script - Quest Credit"); -- After ten seconds
-- [Q] [A/H] Proving Allegiance
-- Also moved the emote to creature_text
-- Gunther Arcanus SAI
SET @ENTRY := 1497;
SET @QUEST := 409;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,@QUEST,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gunther Arcanus - On Quest Accept - Say Line 0");
-- Text
DELETE FROM `db_script_string` WHERE `entry`=2000000085;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Take a Candle of Beckoning from this crate, $N.",12,0,100,25,0,0,"Gunther Arcanus");
-- [Q] [A/H] Hope Within the Emerald Nightmare
-- This NPC already had SAI so we're only adding additional lines
-- Keeper Remulos SAI
SET @ENTRY := 11832;
SET @QUEST := 13074;
SET @SPELL_FITFUL_DREAM := 57413;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,19,0,100,0,@QUEST,0,0,0,11,@SPELL_FITFUL_DREAM,0,0,0,0,0,7,0,0,0,0,0,0,0,"Keeper Remulos - On Quest Accept - Cast Fitful Dream");
-- [Q] [A] A Humble Task
-- Greatmother Hawkwind SAI
SET @ENTRY := 2991;
SET @QUEST := 753;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,@QUEST,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Greatmother Hawkwind - On Script - Emote Line 0");
-- Texts
DELETE FROM `db_script_string` WHERE `entry`=2000000077;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s gestures to the pitcher of water sitting on the edge of the well.",16,0,100,0,0,0,"Greatmother Hawkwind");
-- [Q] [A/H] The Boon of A'dal
-- A'dal SAI
SET @ENTRY := 18481;
SET @QUEST := 13082;
SET @SPELL_BLESSING := 35076;
SET @SPELL_TP_DALARAN := 53141;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,0,0,11,@SPELL_BLESSING,0,0,0,0,0,1,0,0,0,0,0,0,0,"A'dal - Out of Combat - Cast Blessing of A'dal"), -- From EAI
(@ENTRY,0,1,0,19,0,100,0,@QUEST,0,0,0,11,@SPELL_TP_DALARAN,0,0,0,0,0,7,0,0,0,0,0,0,0,"A'dal - On Quest Accept - Cast Teleport Dalaran");
-- [Q] [A] The Missing Diplomat
-- Dashel Stonefist SAI
SET @ENTRY := 4961;
SET @QUEST := 1447;
SET @SPELL_PUMMEL := 12555;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0,`EmoteOnComplete`=11 WHERE `id`=@QUEST; -- ONESHOT_LAUGH
UPDATE `quest_template` SET `EmoteOnComplete`=14 WHERE `id`=1246; -- Previous version should make him rude against player
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY*100,@ENTRY*100+1) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,13,0,100,0,6000,21000,0,0,11,@SPELL_PUMMEL,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - Player Casting - Cast Pummel"),
(@ENTRY,0,1,0,19,0,100,0,@QUEST,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On Quest Accept - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Say Line 0"),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,2,168,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Set Faction Hostile"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Attack Player"),
(@ENTRY*100,9,3,0,0,0,100,0,2000,2000,0,0,12,4969,1,300000,0,0,0,8,0,0,0,-8678.246094,440.952606,99.620926,4.364815,"Dashel Stonefist - On Script - Summon Old Town Thug"),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,12,4969,1,300000,0,0,0,8,0,0,0,-8682.465820,441.471161,99.531319,4.871392,"Dashel Stonefist - On Script - Summon Old Town Thug"),
(@ENTRY,0,2,0,2,0,100,0,0,15,0,0,80,@ENTRY*100+1,0,2,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On 15% HP - Run Script"),
(@ENTRY*100+1,9,0,0,0,0,100,0,0,0,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Quest Credit"), -- We are putting this before evade else we lose our target
(@ENTRY*100+1,9,1,0,0,0,100,0,0,0,0,0,20,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Stop Attacking"),
(@ENTRY*100+1,9,2,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Evade"),
(@ENTRY*100+1,9,3,0,0,0,100,0,0,0,0,0,2,84,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Set Faction Back"),
(@ENTRY*100+1,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Say Line 1"),
(@ENTRY*100+1,9,5,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dashel Stonefist - On Script - Say Line 2");
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Now you're going to get it good!",12,0,100,0,0,0,"Dashel Stonefist"),
(@ENTRY,1,0,"Okay, okay! Enough fighting. No one else needs to get hurt.",12,0,100,0,0,0,"Dashel Stonefist"),
(@ENTRY,2,0,"It's okay, boys. Back off. You've done enough. I'll meet up with you later.",12,0,100,0,0,0,"Dashel Stonefist");
-- [Q] [A/H] In Service Of The Lich King
-- The Lich King SAI
SET @ENTRY := 25462;
SET @QUEST := 12593;
SET @SPELL_EXLOSION := 58024;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,@QUEST,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"The Lich King - On Quest Accept - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,3000,3000,0,0,11,@SPELL_EXLOSION,0,0,0,0,0,7,0,0,0,0,0,0,0,"The Lich King - On Script - Cast 'Icecrown Airship - A - Attack - 02b Cannon Explosion, Shield'"); -- After three seconds
-- [Q] [A] The Legend of Stalvan
-- Sealed Crate SAI
SET @ENTRY := 1561;
SET @QUEST := 74;
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,19,0,100,0,@QUEST,0,0,0,12,2044,1,30000,0,0,0,8,0,0,0,-10953.3,988.509,98.984,5.349,"Sealed Crate - On Quest Accept - Summon Forlorn Spirit"); -- What's wrong with those stupid co-ords? ..
DELETE FROM `spell_script_names` WHERE `spell_id` IN (69672,69673);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
(69672,'spell_gen_sunreaver_disguise'),
(69673,'spell_gen_silver_covenant_disguise');

-- Update spells used on script. Now they are always casting the female spell,
-- since the spell script is fixed we should cast now the correct spell.
UPDATE `smart_scripts` SET `action_param1`=69672 WHERE `entryorguid`=36669 AND `action_type`=11 AND `action_param1`=70973;
UPDATE `smart_scripts` SET `action_param1`=69673 WHERE `entryorguid`=36670 AND `action_type`=11 AND `action_param1`=70971;
-- Set correct gossip menus ids for renewing the disguise
UPDATE `smart_scripts` SET `event_param1`=10858 WHERE `entryorguid`=36669 AND `event_param1`=10857;
UPDATE `smart_scripts` SET `event_param1`=10857 WHERE `entryorguid`=36670 AND `event_param1`=10858;

-- Gossip options were crossed. They should offer to cast the oposing faction disguise,instead of his own faction disguise.
UPDATE `gossip_menu_option` SET `option_text`="Would you renew my Covenant disguise?" WHERE `menu_id`=10857 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`="Would you renew my Sunreaver disguise?" WHERE `menu_id`=10858 AND `id`=1;

-- Correct quest ids on conditios for showing the renew disguise option.
-- Also add a check for male disguise aura.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (10857,10858) AND `SourceEntry`=1;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,10858,1,0,11,70973,0,0,0,'',NULL),
(15,10858,1,0,11,70974,0,0,0,'',NULL),
(15,10858,1,0,9,20439,0,0,0,'',NULL),
(15,10857,1,0,11,70971,0,0,0,'',NULL),
(15,10857,1,0,11,70972,0,0,0,'',NULL),
(15,10857,1,0,9,24451,0,0,0,'',NULL);
-- Condition update to flags
DELETE FROM `conditions` WHERE `ConditionTypeOrReference`=5;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(19,0,13846,0,5,1106,127,0,0,'','Quest Contributin'' To The Cause - Requires Argent Crusade hated thru revered'),
(20,0,13846,0,5,1106,127,0,0,'','Quest Contributin'' To The Cause - Requires Argent Crusade hated thru revered'),
(14,21258,7594,0,5,270,120,0,0,'','Only show text_id 7594 if player is neutral thru revered with Zandalar Tribe (270)'),
(14,21258,7595,0,5,270,128,0,0,'','Only show text_id 7595 if player is exalted with Zandalar Tribe (270)'),
(15,21258,0,0,5,270,128,0,0,'','Only show gossip option if player is exalted with Zandalar Tribe (270)'),
(15,21259,0,0,5,270,128,0,0,'','Only show gossip option if player is exalted with Zandalar Tribe (270)'),
(15,21260,0,0,5,270,128,0,0,'','Only show gossip option if player is exalted with Zandalar Tribe (270)'),
(1,23342,32726,0,5,1015,240,0,0,'','Murkblood Escape Plans - when Netherwing friendly thru exalted'),
(1,23286,32726,0,5,1015,240,0,0,'','Murkblood Escape Plans - when Netherwing friendly thru exalted');
-- Non sword wielders quests
UPDATE `quest_template` SET `RequiredClasses`=`RequiredClasses`
|16 -- Priest
|64 -- Shaman
|1024 -- Druid
WHERE `Id` IN (24795,24798,24798);

-- Sword wielders quests
UPDATE `quest_template` SET `RequiredClasses`=`RequiredClasses`
|1 -- Warrior
|2 -- Paladin
|4 -- Hunter
|8 -- Rouge
|32 -- Death Kinght
|128 -- Mage
|256 -- Warlock
WHERE `Id` IN (24796,24800,24801);
-- [Q] Mounting Hodir's Helm
-- Hodir's Helm KC Bunny SAI
SET @ENTRY := 30210;
SET @SPELL_READ_PRONOUNCEMENT := 56278;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_READ_PRONOUNCEMENT,0,0,0,33,@ENTRY,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hodir's Helm KC Bunny - On Spellhit - Quest Credit"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Hodir's Helm KC Bunny - On Spellhit - Say Line 0"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,50,192080,30000,0,0,0,0,8,0,0,0,7390.143066,-2725.382080,874.256104,2.973291,"Hodir's Helm KC Bunny - On Spellhit - Summon Hodir's Helm");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Sons of Hodir! I humbly present to you... The Helm of Hodir!",42,0,100,0,0,0,"Hodir's Helm KC Bunny");
-- Update from sniff
UPDATE `gameobject_template` SET `flags`=`flags`|36 WHERE `entry`=192080;
-- Conditions for Read Pronouncement
DELETE FROM `conditions` WHERE `SourceEntry`=@SPELL_READ_PRONOUNCEMENT AND `ConditionValue2`=@ENTRY;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,0,@SPELL_READ_PRONOUNCEMENT,18,1,@ENTRY,"Read Pronouncement targets Hodir's Helm KC Bunny");
-- Spawn a helm bunny
SET @GUID := 40266; -- gap
DELETE FROM `creature` WHERE `id`=@ENTRY;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID,@ENTRY,571,1,1,0,0,7390.14,-2725.38,874.256,2.90103,300,0,0,42,0,0,0,0,0);
UPDATE `quest_template` SET `SpecialFlags`=0 WHERE `id`=9545;
-- [Q] [A] The Escape
-- William Pestle SAI
SET @ENTRY := 253;
SET @QUEST := 114;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,@QUEST,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"William Pestle - On Quest Accept - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"William Pestle - On Script - Say Line 0"),
(@ENTRY*100,9,1,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"William Pestle - On Script - Say Line 1");
-- Text
DELETE FROM `db_script_string` WHERE `entry` IN (2000000080,2000000081);
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"This shouldn't take long...",12,0,100,432,0,0,"William Pestle"),
(@ENTRY,1,0,"The invisibility liquer is ready for you, $N.",12,0,100,0,0,0,"William Pestle");
-- [Q] [A/H] This Is Going to Be Hard
-- Lotwil Veriatus SAI
SET @ENTRY := 2921;
SET @QUEST := 778;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,@QUEST,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Lotwil Veriatus - On Quest Accept - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,4000,4000,0,0,11,5001,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lotwil Veriatus - On Script - Cast Lotwil's Summoning"),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,0,0,12,2919,1,240000,0,0,0,8,0,0,0,-6666.27,-2728.12,243.136,6.28,"Lotwil Veriatus - On Script - Summon Fam'retor Guardian"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,11,5002,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lotwil Veriatus - On Script - Cast Lotwil's Summon Complete");
-- [Q] [A] The Dormant Shade
-- Lillith's Dinner Table SAI
SET @ENTRY := 1557;
SET @QUEST := 410;
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_end_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,20,0,100,0,@QUEST,0,0,0,12,1946,1,180000,0,0,0,8,0,0,0,2468.28,15.26,23.89,0.37,"Lillith's Dinner Table - On Quest Complete - Summon Lillith Nefara");
-- [Q] [A/H] Ledger from Tanaris
-- Wooden Outhouse SAI
SET @ENTRY := 173265;
SET @QUEST := 4450;
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,19,0,100,0,@QUEST,0,0,0,70,0,0,0,0,0,0,14,47578,173266,0,0,0,0,0,"Wooden Outhouse - On Quest Accept - Respawn Goodsteel Ledger (GO)");
-- [Q] [A/H] Making Sense of It
-- J.D. Collie SAI
SET @ENTRY := 9117;
SET @QUEST := 4321;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `StartScript`=0,`CompleteScript`=0 WHERE `id`=@QUEST;
DELETE FROM `quest_start_scripts` WHERE `id`=@QUEST;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,@QUEST,0,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"J.D. Collie - On Quest Accept - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,6000,6000,0,0,5,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"J.D. Collie - On Script - Emote ONESHOT_QUESTION"),
(@ENTRY*100,9,1,0,0,0,100,0,4000,4000,0,0,5,22,0,0,0,0,0,1,0,0,0,0,0,0,0,"J.D. Collie - On Script - Emote ONESHOT_SHOUT"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"J.D. Collie - On Script - Say Line 0"),
(@ENTRY*100,9,3,0,0,0,100,0,10000,10000,0,0,15,@QUEST,0,0,0,0,7,0,0,0,0,0,0,0,0,"J.D. Collie - On Script - Quest Credit");
-- Text
DELETE FROM `db_script_string` WHERE `entry`=2000000030;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"This makes sense!",12,0,100,0,0,0,"J.D. Collie");
-- [QUEST] A Rough Ride (12536)
-- NPC entry 28298 (Captive Crocolisk)
SET @ENTRY := 28298;
SET @GOSSIP := 9674;
SET @TEXT_ID := 13120;
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP,`npcflag`=npcflag|1,`VehicleId`=0 WHERE `entry`=@ENTRY;
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP;
INSERT INTO `gossip_menu` (`entry`,`text_id`)
VALUES (@GOSSIP,@TEXT_ID);
-- Added condition so player can only select it once he has the quest
SET @GOSSIP_ENTRY := 9674;
SET @QUEST := 12536;
DELETE FROM `conditions` WHERE `SourceGroup`=@GOSSIP_ENTRY AND `SourceTypeOrReferenceId`=15;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP_ENTRY,0,0,9,@QUEST,0,0,0,0, 'Only show gossip 9674 when quest 12536 is added');
-- Add missing gossip
SET @GOSSIP := 9674;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9674 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES 
(@GOSSIP,0,0,"You look safe enough... let's do this.",1,1,0,0,0,0, '');
-- [SAI] On gossip select - mount and waypoint
SET @ENTRY := 28298;
SET @GOSSIP := 9674;
SET @SPELL := 51258;
SET @ENTRY_MOUNT := 28308;
SET @MODELID_MOUNT := 25107;
SET @QUEST := 12536;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@ENTRY,@ENTRY_MOUNT);
UPDATE `creature_template` SET `VehicleId`=115 WHERE `entry`=@ENTRY_MOUNT;
UPDATE `creature_template` SET `InhabitType`=3 WHERE `entry`=@ENTRY_MOUNT;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|512|256 WHERE `entry`=@ENTRY_MOUNT;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY_MOUNT) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY_MOUNT*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,11,@SPELL,0,0,0,0,0,7,0,0,0,0,0,0,0, 'On gossip select - cast spell 51258 - Captive Crocolisk'),
(@ENTRY_MOUNT,0,1,0,54,0,100,0,0,0,0,0,80,@ENTRY_MOUNT*100,0,2,0,0,0,1,0,0,0,0,0,0,0, 'On summon - run script - Captive Crocolisk'),
(@ENTRY_MOUNT*100,9,1,0,0,0,100,0,0,0,0,0,53,1,@ENTRY_MOUNT,0,@QUEST,0,1,1,0,0,0,0,0,0,0, 'Start wp - Captive Crocolisk'),
(@ENTRY_MOUNT,0,2,3,58,0,100,0,47,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'on wp end - despawn - Captive Crocolisk'),
(@ENTRY_MOUNT,0,3,0,61,0,100,0,@ENTRY_MOUNT,0,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0,0,0,0, 'on despawn - call area explored of event happens');
-- Waypoints
DELETE FROM `waypoints` WHERE `entry`=@ENTRY_MOUNT;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY_MOUNT,1,5268.226,4425.439,-95.55899, 'Captive Crocolisk'),
(@ENTRY_MOUNT,2,5249.557,4405.892,-96.04365, 'Captive Crocolisk'),
(@ENTRY_MOUNT,3,5266.678,4365.464,-98.19455, 'Captive Crocolisk'),
(@ENTRY_MOUNT,4,5289.138,4366.553,-102.234, 'Captive Crocolisk'),
(@ENTRY_MOUNT,5,5330.018,4363.27,-121.0311, 'Captive Crocolisk'),
(@ENTRY_MOUNT,6,5349.229,4341.059,-134.0126, 'Captive Crocolisk'),
(@ENTRY_MOUNT,7,5268.226,4425.439,-95.55899, 'Captive Crocolisk'),
(@ENTRY_MOUNT,8,5249.557,4405.892,-96.04365, 'Captive Crocolisk'),
(@ENTRY_MOUNT,9,5266.678,4365.464,-98.19455, 'Captive Crocolisk'),
(@ENTRY_MOUNT,10,5289.138,4366.553,-102.234, 'Captive Crocolisk'),
(@ENTRY_MOUNT,11,5330.018,4363.27,-121.0311, 'Captive Crocolisk'),
(@ENTRY_MOUNT,12,5349.229,4341.059,-134.0126, 'Captive Crocolisk'),
(@ENTRY_MOUNT,13,5365.038,4333.716,-141.5817, 'Captive Crocolisk'),
(@ENTRY_MOUNT,14,5405.443,4307.841,-142.03, 'Captive Crocolisk'),
(@ENTRY_MOUNT,15,5434.999,4305.659,-136.4706, 'Captive Crocolisk'),
(@ENTRY_MOUNT,16,5464.708,4302.066,-133.1981, 'Captive Crocolisk'),
(@ENTRY_MOUNT,17,5490.555,4294.395,-127.5203, 'Captive Crocolisk'),
(@ENTRY_MOUNT,18,5503.808,4269.717,-110.3168, 'Captive Crocolisk'),
(@ENTRY_MOUNT,19,5518.324,4255.308,-103.0638, 'Captive Crocolisk'),
(@ENTRY_MOUNT,20,5540.53,4259.77,-102.3979, 'Captive Crocolisk'),
(@ENTRY_MOUNT,21,5564.194,4263.45,-102.7574, 'Captive Crocolisk'),
(@ENTRY_MOUNT,22,5585.45,4261.137,-99.54807, 'Captive Crocolisk'),
(@ENTRY_MOUNT,23,5609.614,4259.657,-98.87333, 'Captive Crocolisk'),
(@ENTRY_MOUNT,24,5633.434,4259.228,-98.53442, 'Captive Crocolisk'),
(@ENTRY_MOUNT,25,5681.639,4266.31,-99.26748, 'Captive Crocolisk'),
(@ENTRY_MOUNT,26,5708.126,4273.348,-102.9183, 'Captive Crocolisk'),
(@ENTRY_MOUNT,27,5748.732,4284.135,-112.0557, 'Captive Crocolisk'),
(@ENTRY_MOUNT,28,5839.82,4368.61,-112.0805, 'Captive Crocolisk'),
(@ENTRY_MOUNT,29,5865.922,4371.208,-105.5544, 'Captive Crocolisk'),
(@ENTRY_MOUNT,30,5897.276,4408.44,-95.25065, 'Captive Crocolisk'),
(@ENTRY_MOUNT,31,5925.311,4440.624,-94.77592, 'Captive Crocolisk'),
(@ENTRY_MOUNT,32,5953.005,4476.29,-94.3763, 'Captive Crocolisk'),
(@ENTRY_MOUNT,33,5964.229,4503.729,-92.81553, 'Captive Crocolisk'),
(@ENTRY_MOUNT,34,5960.583,4546.558,-95.65462, 'Captive Crocolisk'),
(@ENTRY_MOUNT,35,5965.167,4579.141,-97.39779, 'Captive Crocolisk'),
(@ENTRY_MOUNT,36,5969.295,4613.739,-98.05751, 'Captive Crocolisk'),
(@ENTRY_MOUNT,37,5975.809,4659.289,-99.27143, 'Captive Crocolisk'),
(@ENTRY_MOUNT,38,5992.961,4699.554,-99.30317, 'Captive Crocolisk'),
(@ENTRY_MOUNT,39,6015.139,4743.752,-97.52377, 'Captive Crocolisk'),
(@ENTRY_MOUNT,40,6035.183,4788.787,-94.66938, 'Captive Crocolisk'),
(@ENTRY_MOUNT,41,6064.951,4827.502,-94.54885, 'Captive Crocolisk'),
(@ENTRY_MOUNT,42,6065.57,4870.553,-94.47726, 'Captive Crocolisk'),
(@ENTRY_MOUNT,43,6096.612,4885.741,-94.44479, 'Captive Crocolisk'),
(@ENTRY_MOUNT,44,6120.387,4902.048,-95.06882, 'Captive Crocolisk'),
(@ENTRY_MOUNT,45,6139.616,4913.349,-94.8635, 'Captive Crocolisk'),
(@ENTRY_MOUNT,46,6139.616,4913.349,-94.93861, 'Captive Crocolisk'),
(@ENTRY_MOUNT,47,6139.616,4913.349,-94.93861, 'Captive Crocolisk');
-- Spawn Zepik
SET @GUID := 40267;
DELETE FROM `creature` WHERE `id`=28216;
INSERT INTO `creature` VALUES
(@GUID,28216,571,1,1,0,0,6147.37,4917.29,-94.094,3.42155,300,0,0,42,0,0,0,0,0);
-- Spawns from sniff
SET @GUID := 40279; -- set value 
DELETE FROM `creature` WHERE `id`=27791;
INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES 
(@GUID+0,27791,571,1,1,0,0,3653.64233,-1204.21200,102.420319,4.04458666,120,0,0),
(@GUID+1,27791,571,1,1,0,0,3673.77515,-1213.68188,102.420319,4.08126450,120,0,0),
(@GUID+2,27791,571,1,1,0,0,3674.53735,-1175.28369,102.420288,1.78801400,120,0,0),
(@GUID+3,27791,571,1,1,0,0,3684.37158,-1180.27942,102.420288,1.22173047,120,0,0);
-- 7th Legion Rifleman SAI (replaces EAI)
SET @ENTRY   := 27791; -- NPC entry
SET @SPELL1  := 62312; -- Cast Net
SET @SPELL2  := 50092; -- Cast Shoot
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0,"7th Legion Rifleman - On Aggro - Cast Net"),
(@ENTRY,0,1,0,0,0,100,0,500,3500,5000,6000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0,"7th Legion Rifleman - In Combat - Cast Shoot"),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"7th Legion Rifleman - At 15% HP - Flee");
-- Remove old one that still required reputation even after you bought it
DELETE FROM `npc_vendor` WHERE `entry`=32538 and`item`=50367 and`ExtendedCost`=0;

-- Commit for new one
DELETE FROM `npc_vendor` WHERE `entry`=32538 and`item`=44149 and`ExtendedCost`=0;
INSERT INTO `npc_vendor` (`entry`,`slot`,`item`,`maxcount`,`incrtime`,`ExtendedCost`) VALUES (32538,0,44149,0,0,0);
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (1237,1240,1241);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(1237, 0, 0, 0, ''), -- Achievement: Let's Get This Done
(1240, 0, 0, 0, ''), -- Achievement: Flurry
(1241, 0, 0, 0, ''); -- Achievement: The Alterac Blitz
UPDATE `command` SET `name`='reload waypoint_data',`help`='Syntax: .reload waypoint_data will reload waypoint_data table.' WHERE `name`='reload wp_data';
-- Munci SAI
SET @ENTRY := 18788;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,0,0,0,0,0,12,9527,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Munci - On Aggro - Summon Enraged Hippogryphs"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,12,9527,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Munci - On Aggro - Summon Enraged Hippogryphs"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Munci - On Aggro - Say Line 0");
-- Text for Munci
DELETE FROM `creature_ai_texts` WHERE `entry`=-549;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Guards!",14,7,100,0,0,0,"Munci");

-- Amish Wildhammer SAI
SET @ENTRY := 18931;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,0,0,0,0,0,12,9526,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Amish Wildhammer - On Aggro - Summon Enraged Gryphons"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,12,9526,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Amish Wildhammer - On Aggro - Summon Enraged Gryphons"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Amish Wildhammer - On Aggro - Say Line 0");
-- Text for Amish Wildhammer
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Guards!",14,7,100,0,0,0,"Amish Wildhammer");

-- Lemla Hopewing SAI
SET @ENTRY := 19181;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,0,0,0,0,0,12,9526,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Lemla Hopewing - On Aggro - Summon Enraged Gryphons"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,12,9526,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Lemla Hopewing - On Aggro - Summon Enraged Gryphons"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lemla Hopewing - On Aggro - Say Line 0");
-- Text for Lemla Hopewing
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Guards!",14,7,100,0,0,0,"Lemla Hopewing");

-- Auhula SAI
SET @ENTRY := 22936;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,0,0,0,0,0,12,9527,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Auhula - On Aggro - Summon Enraged Hippogryphs"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,12,9527,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Auhula - On Aggro - Summon Enraged Hippogryphs"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Auhula - On Aggro - Say Line 0");
-- Text for Auhula
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Guards!",14,7,100,0,0,0,"Auhula");

-- Hyeyoung Parka SAI
SET @ENTRY := 29762;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,0,0,0,0,0,12,9297,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Hyeyoung Parka - On Aggro - Summon Enraged Wyverns"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,12,9297,1,30000,0,0,0,1,0,0,0,0,0,0,0,"Hyeyoung Parka - On Aggro - Summon Enraged Wyverns"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hyeyoung Parka - On Aggro - Say Line 0");
-- Text for Hyeyoung Parka
DELETE FROM `creature_ai_texts` WHERE `entry`=-548;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Guards!",14,1,100,0,0,0,"Hyeyoung Parka");
UPDATE `conditions` SET `SourceGroup`=23324 WHERE `SourceTypeOrReferenceId`=1 AND `SourceGroup`=23342;
-- cleanups
DELETE FROM `creature_addon` WHERE `guid` in (133434,133435);
DELETE FROM `game_event_seasonal_questrelation` WHERE `questId` IN (9319,9322,9323,9324,9325,9326,9330,9331,9332,9339,9365,9367,9368,9386,9388,9389,11657,11691,11731,11882,11883,11886,11891,11915,11917,11921,11922,11923,11924,11925,11926,11933,11935,11947,11948,11952,11953,11954,11955,11964,11966,11970,11971,11972,12012) AND `eventEntry`=1;
DELETE FROM `game_event_seasonal_questrelation` WHERE `questId` IN (8619,8635,8636,8642,8643,8644,8645,8646,8647,8648,8649,8650,8651,8652,8653,8654,8670,8671,8672,8673,8674,8675,8676,8677,8678,8679,8680,8681,8682,8683,8684,8685,8686,8688,8713,8714,8715,8716,8717,8718,8719,8720,8721,8722,8723,8724,8725,8726,8727,8862,8863,8864,8865,8866,8867,8870,8871,8872,8873,8874,8875,8876,8877,8878,8879,8880,8881,8882,8883,13012,13013,13014,13015,13016,13017,13018,13019,13020,13021,13022,13023,13024,13025,13026,13027,13028,13029,13030,13031,13032,13033,13065,13066,13067) AND `eventEntry`=7;
DELETE FROM `game_event_seasonal_questrelation` WHERE `questId` IN (14488,24597,24609,24656,24657,24745,24848,24849,24666,24792,24804,24611,24536,24612,24635,24636,24655,24610,24629,24614,24576,24613,24615,24638,24645,24647,24648,24649,24650,24651,24652,24658,24659,24660,24662,24663,24664,24665,24793,24805,24850,24851,24541,14483,24661) AND `eventEntry`=8;
DELETE FROM `game_event_seasonal_questrelation` WHERE `questId` IN (13479,13480,13483,13484,13502,13503) AND `eventEntry`=9;
DELETE FROM `game_event_seasonal_questrelation` WHERE `questId` IN (11120,11431,11442,11409,11318,11117,11400,11419,11118,11122,11293,11294,11321,11407,11408,11412,11413,11441,11446,11454,11486,11487,12020,12022,12318,12193,12062,12491,11447,12191,12492,12194,12192,12278,12306,12420,12421,13932,13649,13931,11127,11320,11347,11437,11438,11444,11445) AND `eventEntry`=24;

INSERT INTO `game_event_seasonal_questrelation` (`questId`,`eventEntry`) VALUES
(8619,7),
(8635,7),
(8636,7),
(8642,7),
(8643,7),
(8644,7),
(8645,7),
(8646,7),
(8647,7),
(8648,7),
(8649,7),
(8650,7),
(8651,7),
(8652,7),
(8653,7),
(8654,7),
(8670,7),
(8671,7),
(8672,7),
(8673,7),
(8674,7),
(8675,7),
(8676,7),
(8677,7),
(8678,7),
(8679,7),
(8680,7),
(8681,7),
(8682,7),
(8683,7),
(8684,7),
(8685,7),
(8686,7),
(8688,7),
(8713,7),
(8714,7),
(8715,7),
(8716,7),
(8717,7),
(8718,7),
(8719,7),
(8720,7),
(8721,7),
(8722,7),
(8723,7),
(8724,7),
(8725,7),
(8726,7),
(8727,7),
(8862,7),
(8863,7),
(8864,7),
(8865,7),
(8866,7),
(8867,7),
(8870,7),
(8871,7),
(8872,7),
(8873,7),
(8874,7),
(8875,7),
(8876,7),
(8877,7),
(8878,7),
(8879,7),
(8880,7),
(8881,7),
(8882,7),
(8883,7),
(13012,7),
(13013,7),
(13014,7),
(13015,7),
(13016,7),
(13017,7),
(13018,7),
(13019,7),
(13020,7),
(13021,7),
(13022,7),
(13023,7),
(13024,7),
(13025,7),
(13026,7),
(13027,7),
(13028,7),
(13029,7),
(13030,7),
(13031,7),
(13032,7),
(13033,7),
(13065,7),
(13066,7),
(13067,7),
(11120,24),
(11431,24),
(11442,24),
(11409,24),
(11318,24),
(11117,24),
(11400,24),
(11419,24),
(11118,24),
(11122,24),
(11293,24),
(11294,24),
(11321,24),
(11407,24),
(11408,24),
(11412,24),
(11413,24),
(11441,24),
(11446,24),
(11454,24),
(11486,24),
(11487,24),
(12020,24),
(12022,24),
(12318,24),
(12193,24),
(12062,24),
(12491,24),
(11447,24),
(12191,24),
(12492,24),
(12194,24),
(12192,24),
(12278,24),
(12306,24),
(12420,24),
(12421,24),
(13932,24),
(13649,24),
(13931,24),
(11127,24),
(11320,24),
(11347,24),
(11437,24),
(11438,24),
(11444,24),
(11445,24),
(9319,1),
(9322,1),
(9323,1),
(9324,1),
(9325,1),
(9326,1),
(9330,1),
(9331,1),
(9332,1),
(9339,1),
(9365,1),
(9367,1),
(9368,1),
(9386,1),
(9388,1),
(9389,1),
(11657,1),
(11691,1),
(11731,1),
(11882,1),
(11883,1),
(11886,1),
(11891,1),
(11915,1),
(11917,1),
(11921,1),
(11922,1),
(11923,1),
(11924,1),
(11925,1),
(11926,1),
(11933,1),
(11935,1),
(11947,1),
(11948,1),
(11952,1),
(11953,1),
(11954,1),
(11955,1),
(11964,1),
(11966,1),
(11970,1),
(11971,1),
(11972,1),
(12012,1),
(13479,9),
(13480,9),
(13483,9),
(13484,9),
(13502,9),
(13503,9),
(14488,8),
(24597,8),
(24609,8),
(24656,8),
(24657,8),
(24745,8),
(24848,8),
(24849,8),
(24666,8),
(24792,8),
(24804,8),
(24611,8),
(24536,8),
(24612,8),
(24635,8),
(24636,8),
(24655,8),
(24610,8),
(24629,8),
(24614,8),
(24576,8),
(24613,8),
(24615,8),
(24638,8),
(24645,8),
(24647,8),
(24648,8),
(24649,8),
(24650,8),
(24651,8),
(24652,8),
(24658,8),
(24659,8),
(24660,8),
(24662,8),
(24663,8),
(24664,8),
(24665,8),
(24793,8),
(24805,8),
(24850,8),
(24851,8),
(24541,8),
(14483,8),
(24661,8);
-- Windle Sparkshine SAI
SET @ENTRY := 29261;
SET @SPELL_LIGHT_LAMP := 60535;
UPDATE `gameobject` SET `state`=1 WHERE `id` IN (191444,192086,192085,192084,192087,192089,192088,192067,191445,192850,192853,192854,192852,192083,191440,192070,192069,192117,192116,192119,191665);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,68,0,100,0,25,0,0,0,53,0,@ENTRY,0,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - Game Event 25 Start - Start WP"),
(@ENTRY,0,1,0,40,0,100,0,1,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 1 - Run Script"),
(@ENTRY,0,2,0,40,0,100,0,5,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 5 - Run Script"),
(@ENTRY,0,3,0,40,0,100,0,8,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 8 - Run Script"),
(@ENTRY,0,4,0,40,0,100,0,12,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 12 - Run Script"),
(@ENTRY,0,5,0,40,0,100,0,16,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 16 - Run Script"),
(@ENTRY,0,6,0,40,0,100,0,20,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 20 - Run Script"),
(@ENTRY,0,7,0,40,0,100,0,24,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 24 - Run Script"),
(@ENTRY,0,8,0,40,0,100,0,29,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 29 - Run Script"),
(@ENTRY,0,9,0,40,0,100,0,33,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 33 - Run Script"),
(@ENTRY,0,10,0,40,0,100,0,36,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 36 - Run Script"),
(@ENTRY,0,11,0,40,0,100,0,38,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 38 - Run Script"),
(@ENTRY,0,12,0,40,0,100,0,45,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 45 - Run Script"),
(@ENTRY,0,13,0,40,0,100,0,48,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 48 - Run Script"),
(@ENTRY,0,14,0,40,0,100,0,53,@ENTRY,0,0,80,@ENTRY*100,0,2,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - At WP 53 - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,54,3500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - On Script - Pause WP"),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,0,0,11,@SPELL_LIGHT_LAMP,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windle Sparkshine - On Script - Cast Light Lamp"),
(@ENTRY,0,15,0,40,0,100,0,1,@ENTRY,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.654867,"Windle Sparkshine - At WP 56 - Set Orientation");

-- Waypoints
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5747.069,685.3748,643.8239,'Windle Sparkshine'), -- Lamp 1
(@ENTRY,2,5749.971,682.7211,643.4057,'Windle Sparkshine'),
(@ENTRY,3,5760.647,698.313,642.3947,'Windle Sparkshine'),
(@ENTRY,4,5770.979,712.3667,641.5851,'Windle Sparkshine'),
(@ENTRY,5,5771.641,718.9518,641.9728,'Windle Sparkshine'), -- Lamp 2
(@ENTRY,6,5793.795,719.567,640.5906,'Windle Sparkshine'),
(@ENTRY,7,5806.629,718.5358,640.7841,'Windle Sparkshine'),
(@ENTRY,8,5807.11,723.0623,641.0547,'Windle Sparkshine'), -- Lamp 3
(@ENTRY,9,5812.014,718.6132,640.9974,'Windle Sparkshine'),
(@ENTRY,10,5825.027,714.0911,640.9233,'Windle Sparkshine'),
(@ENTRY,11,5836.411,706.2252,641.2604,'Windle Sparkshine'),
(@ENTRY,12,5838.926,710.4177,641.3674,'Windle Sparkshine'), -- Lamp 4
(@ENTRY,13,5836.411,706.2252,641.2604,'Windle Sparkshine'),
(@ENTRY,14,5850.628,692.9323,642.3394,'Windle Sparkshine'),
(@ENTRY,15,5871.261,679.3507,643.1625,'Windle Sparkshine'),
(@ENTRY,16,5889.708,676.6304,643.6068,'Windle Sparkshine'), -- Lamp 5
(@ENTRY,17,5885.975,668.9486,643.8263,'Windle Sparkshine'),
(@ENTRY,18,5894.604,656.5289,644.8455,'Windle Sparkshine'),
(@ENTRY,19,5893.215,644.1390,645.6358,'Windle Sparkshine'),
(@ENTRY,20,5891.531,635.5212,647.5772,'Windle Sparkshine'), -- Lamp 6
(@ENTRY,21,5885.393,639.2025,646.5132,'Windle Sparkshine'),
(@ENTRY,22,5878.637,630.1852,647.6648,'Windle Sparkshine'),
(@ENTRY,23,5865.146,615.7023,650.0197,'Windle Sparkshine'),
(@ENTRY,24,5867.964,613.0705,650.4550,'Windle Sparkshine'), -- Lamp 7
(@ENTRY,25,5865.146,615.7023,650.0197,'Windle Sparkshine'),
(@ENTRY,26,5854.076,607.8509,650.7210,'Windle Sparkshine'),
(@ENTRY,27,5840.764,590.5446,650.6240,'Windle Sparkshine'),
(@ENTRY,28,5837.371,583.0912,650.7756,'Windle Sparkshine'),
(@ENTRY,29,5840.763,580.3890,651.8137,'Windle Sparkshine'), -- Lamp 8
(@ENTRY,30,5837.371,583.0912,650.7756,'Windle Sparkshine'),
(@ENTRY,31,5822.904,570.0418,650.1446,'Windle Sparkshine'),
(@ENTRY,32,5805.871,564.1931,650.1898,'Windle Sparkshine'),
(@ENTRY,33,5796.087,561.1876,650.6658,'Windle Sparkshine'), -- Lamp 9
(@ENTRY,34,5796.753,566.2323,650.1285,'Windle Sparkshine'),
(@ENTRY,35,5772.444,583.8340,649.8836,'Windle Sparkshine'),
(@ENTRY,36,5767.615,579.1342,650.2487,'Windle Sparkshine'), -- Lamp 10
(@ENTRY,37,5761.446,588.7081,649.6515,'Windle Sparkshine'),
(@ENTRY,38,5750.556,591.0724,649.8145,'Windle Sparkshine'), -- Lamp 11
(@ENTRY,39,5749.783,599.296,649.0384,'Windle Sparkshine'),
(@ENTRY,40,5737.969,611.5457,647.9193,'Windle Sparkshine'),
(@ENTRY,41,5726.467,621.8894,646.9294,'Windle Sparkshine'),
(@ENTRY,42,5714.581,625.4625,646.4603,'Windle Sparkshine'),
(@ENTRY,43,5702.122,627.8116,646.3648,'Windle Sparkshine'),
(@ENTRY,44,5693.323,629.3795,646.5901,'Windle Sparkshine'),
(@ENTRY,45,5687.516,629.6511,647.1143,'Windle Sparkshine'), -- Lamp 12
(@ENTRY,46,5692.803,651.879,646.5027,'Windle Sparkshine'),
(@ENTRY,47,5696.018,667.5477,645.7817,'Windle Sparkshine'),
(@ENTRY,48,5695.917,678.2612,646.0887,'Windle Sparkshine'), -- Lamp 13
(@ENTRY,49,5700.438,674.0465,645.4587,'Windle Sparkshine'),
(@ENTRY,50,5714.589,662.3508,645.9952,'Windle Sparkshine'),
(@ENTRY,51,5723.479,658.3279,646.0461,'Windle Sparkshine'),
(@ENTRY,52,5728.87,666.1133,645.8447,'Windle Sparkshine'),
(@ENTRY,53,5726.601,666.7487,645.8505,'Windle Sparkshine'), -- Lamp 14
(@ENTRY,54,5736.254,665.7919,644.9579,'Windle Sparkshine'),
(@ENTRY,55,5744.996,676.1825,644.0975,'Windle Sparkshine'),
(@ENTRY,56,5744.94,681.546,644.136,'Windle Sparkshine'); -- Homeposition

-- Conditions for spell 'Light Lamp'
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL_LIGHT_LAMP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,@SPELL_LIGHT_LAMP,0,18,0,191444,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192086,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192085,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192084,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192087,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192089,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192088,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192067,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,191445,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192850,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192853,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192854,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192852,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192083,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,191440,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192070,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192069,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192117,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192116,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,192119,0,0,'',NULL),
(13,0,@SPELL_LIGHT_LAMP,0,18,0,191665,0,0,'',NULL);
UPDATE `creature_template` SET `ScriptName`='npc_frost_tomb' WHERE `entry`=23965;
UPDATE `creature_template` SET `ScriptName`='npc_vrykul_skeleton' WHERE `entry`=23970;
DELETE FROM `disables` WHERE `entry`=7231 AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7231;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `ScriptName`) VALUES 
(7231,11,'achievement_on_the_rocks');
DELETE FROM `script_texts` WHERE `entry` IN (-1574000,-1574001,-1574002,-1574003,-1574004);

DELETE FROM `creature_text` WHERE `entry`=23953;
INSERT INTO `creature_text` (`entry`, `groupid`, `text`, `sound`, `emote`, `type`) VALUES 
(23953,1,'Your blood is mine!',13221,7,14),
(23953,2,'Aranal, ledel! Their fate shall be yours!',13224,0,14),
(23953,3,'Not so fast.',13222,0,14),
(23953,4,'%s casts Frost Tomb on $n.',0,0,41),
(23953,5,'I join... the night.',13225,0,14);
DELETE FROM `spell_script_names` WHERE `spell_id`=48400;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(48400,'spell_frost_tomb');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7231 AND `type`=12;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7231,12,1,0,'');
UPDATE `creature_text` SET `comment`='Prince Keleseth - SAY_DEATH' WHERE `groupid`=5 AND `entry`=23953;
UPDATE `creature_text` SET `comment`='Prince Keleseth - SAY_FROST_TOMB_EMOTE' WHERE `groupid`=4 AND `entry`=23953;
UPDATE `creature_text` SET `comment`='Prince Keleseth - SAY_FROST_TOMB' WHERE `groupid`=3 AND `entry`=23953;
UPDATE `creature_text` SET `comment`='Prince Keleseth - SAY_SUMMON_SKELETONS' WHERE `groupid`=2 AND `entry`=23953;
UPDATE `creature_text` SET `comment`='Prince Keleseth - SAY_START_COMBAT' WHERE `groupid`=1 AND `entry`=23953;
-- Make Dame Evniki Kapsalis show vendor gossip option only to players with Crusader title
UPDATE `creature_template` SET `AIName` = 'SmartAI',`ScriptName` = '' WHERE `entry` = 34885;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10598;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`COMMENT`) VALUES
(15,10598,0,0,17,2816,0,0,0,'',"Evniki Kapsalis should only sell to Crusaders"),
(15,10598,0,1,17,2817,0,0,0,'',"Evniki Kapsalis should only sell to Crusaders");

SET @SPELL_CHAIN          = 68341;
SET @NPC_FJOLA_LIGHTBANE  = 36065;
SET @NPC_EYDIS_DARKBANE   = 36066;
SET @NPC_PRIESTESS_ALORAH = 36101;
SET @NPC_PRIEST_GRIMMIN   = 36102;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN(@NPC_PRIESTESS_ALORAH,@NPC_PRIEST_GRIMMIN);
DELETE FROM `smart_scripts` WHERE (`entryorguid` IN(@NPC_PRIESTESS_ALORAH,@NPC_PRIEST_GRIMMIN) AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@NPC_PRIESTESS_ALORAH,0,0,0,1,0,100,1,100,100,0,0,11,@SPELL_CHAIN,0,0,0,0,0,19,@NPC_EYDIS_DARKBANE,0,0,0,0,0,0,'Priestess Alorah - Cast chain on Eydis Darkbane'),
(@NPC_PRIEST_GRIMMIN,0,0,0,1,0,100,1,100,100,0,0,11,@SPELL_CHAIN,0,0,0,0,0,19,@NPC_FJOLA_LIGHTBANE,0,0,0,0,0,0,'Priestess Grimmin - Cast chain on Fjola Lightbane');
-- Scriptname for Refocus spell
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_item_refocus';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(24531,'spell_item_refocus');
-- Quest Elven Legends (7481, 7482)
-- Skeletal Remains of Kariel Winthalus SAI
SET @ENTRY  := 179544; -- GO entry
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI',`ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,62,0,100,0,5743,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - On Gossip option select - run script'),
(@ENTRY,1,1,0,62,0,100,0,5743,1,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - On Gossip option select - run script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - Script - Close Gossip'),
(@ENTRY*100,9,1,0,0,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - Script - Store target'),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,100,1,0,0,0,0,0,11,14368,30,0,0,0,0,0, 'Skeletal Remains of Kariel Winthalus - Script - Send target'),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,11,14368,30,0,0,0,0,0,'Skeletal Remains of Kariel Winthalus - Script - Set data 0 1 for entry 14368'),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Skeletal Remains of Kariel Winthalus - Script - Deactivate self'),
(@ENTRY*100,9,5,0,0,0,100,0,28000,28000,28000,28000,32,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Skeletal Remains of Kariel Winthalus - Script - Activate self');
-- Lorekeeper Lydros SAI
SET @ENTRY := 14368; -- NPC entry
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@ENTRY*100;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,0,1,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Lorekeeper Lydros - On dataset - run script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - set data 0 0'),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,1000,1000,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,'Lorekeeper Lydros - Script - turn to player'),
(@ENTRY*100,9,2,0,0,0,100,0,1000,1000,1000,1000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - Say 0'),
(@ENTRY*100,9,3,0,0,0,100,0,4000,4000,4000,4000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - Say 1'),
(@ENTRY*100,9,4,0,0,0,100,0,8000,8000,8000,8000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - Say 2'),
(@ENTRY*100,9,5,0,0,0,100,0,11000,11000,11000,11000,15,7481,0,0,0,0,0,12,1,0,0,0,0,0,0,'Lorekeeper Lydros - Script - quest credit'),
(@ENTRY*100,9,6,0,0,0,100,0,0,0,0,0,15,7482,0,0,0,0,0,12,1,0,0,0,0,0,0,'Lorekeeper Lydros - Script - quest credit'),
(@ENTRY*100,9,7,0,0,0,100,0,2000,2000,2000,2000,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lorekeeper Lydros - Script - reset orientation');
-- NPC talk text insert
DELETE FROM `creature_text` WHERE `entry`=14368;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(14368,0,0, 'I very much doubt that he will have anything to say, stranger...',12,0,100,1,0,0, 'Lorekeeper Lydros'),
(14368,1,0, 'I personally did not mind him. It was the Prince who took exception to a high elf in his domain. Alas, I am not one to question the Prince. In his defense, he did not incinerate Master Winthalus immediately.',12,0,100,1,0,0, 'Lorekeeper Lydros'),
(14368,2,0, 'We most definitely do not need anymore attention drawn to us, stranger. Return to those that sent you in search of the lost master and tell them that nothing could be found. When this is done - and I will know when it is so - return and I shall reveal the secrets of the deceased.',12,0,100,1,0,0, 'Lorekeeper Lydros');
-- Gossip Fix from nelegalno
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5743;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(5743,0,0,"Mourn the great loss.",1,1,0,0,0,0,NULL), -- A gossip
(5743,1,0,"Mourn the great loss.",1,1,0,0,0,0,NULL); -- H gossip
DELETE FROM `conditions` WHERE (`SourceTypeOrReferenceId`=15 AND `SourceGroup`=5743);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,5743,0,0,9,7482,0,0,0,'',"Display gossip option when on Elven Legends A quest"),
(15,5743,1,0,9,7481,0,0,0,'',"Display gossip option when on Elven Legends H quest");
-- DB/Faction change: Add some missing items
DELETE FROM `player_factionchange_items` WHERE `alliance_id` IN (47711) AND horde_id IN (47870);
INSERT INTO `player_factionchange_items` (`race_A`,`alliance_id`,`commentA`,`race_H`,`horde_id`,`commentH`) VALUES 
(0,47711, 'Girdle of the Nether Champion',0,47870, 'Belt of the Nether Championt');
-- Class Condition update to use flags
UPDATE `conditions` SET `ConditionValue1`=8 WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=21194 AND `ConditionTypeOrReference`=15;
UPDATE `conditions` SET `ConditionValue1`=128 WHERE `SourceTypeOrReferenceId` IN (14,15) AND`SourceGroup`=4486 AND `ConditionTypeOrReference`=15;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=20 AND `SourceEntry` IN (13104,13105) AND `ConditionTypeOrReference`=15;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(20,0,13104,1,15,1503,0,0,0,'','Show quest 13104 if player is not a Death Knight'),
(20,0,13105,1,15,32,0,0,0,'','Show quest 13105 if player is a Death Knight');
-- Race Condition update to use flags
UPDATE `conditions` SET `ConditionValue1`=128 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=24101 AND `ConditionTypeOrReference`=16;
UPDATE `conditions` SET `ConditionValue1`=32 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=24102 AND `ConditionTypeOrReference`=16;
UPDATE `conditions` SET `ConditionValue1`=16 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=24103 AND `ConditionTypeOrReference`=16;
UPDATE `conditions` SET `ConditionValue1`=64 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=24106 AND `ConditionTypeOrReference`=16;
UPDATE `conditions` SET `ConditionValue1`=4 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=24107 AND `ConditionTypeOrReference`=16;
UPDATE `conditions` SET `ConditionValue1`=8 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=24108 AND `ConditionTypeOrReference`=16;
UPDATE `conditions` SET `ConditionValue1`=512 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=69530 AND `ConditionTypeOrReference`=16;
UPDATE `conditions` SET `ConditionValue1`=1024 WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=69533 AND `ConditionTypeOrReference`=16;
ALTER TABLE `conditions` ADD COLUMN `SourceId` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER SourceEntry;
-- Gushing Wound Removal spell
DELETE FROM `spell_dbc` WHERE `id`=30023;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(30023,0,0,256,0,0,0,0,0,0,0,0,0,0,1,0,0,101,0,0,0,0,26,1,0,-1,0,0,164,164,164,0,0,0,0,0,0,0,0,0,0,0,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,35321,38363,39215,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,"Gushing Wound Removal");
DELETE FROM `spell_bonus_data` WHERE `entry` = 63544;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
(63544, -1, -1, 0, 0, 'Priest - Empowered Renew');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 57908 AND `spell_effect` = 57915;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(57908,57915,0,'q13129 - Give quest item');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (26374);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
(26374,'spell_gen_elune_candle');

-- Set Gigant Spotlight as not selectable
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=15902;

DELETE FROM `creature_template_addon` WHERE (`entry`IN(15902,15466));
INSERT INTO `creature_template_addon`(`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(15466,0,0,0,0,0,17327), -- Add spirit particles to Omen minions
(15902,0,0,0,0,0,50236); -- Add Spotlight aura to Gigant Spotlight (ummoned by 26392 on Omen's death)

UPDATE `creature_template` SET `ScriptName`='npc_giant_spotlight' WHERE `entry`=15902;
UPDATE `creature_template` SET `RegenHealth`=0,`ScriptName`='npc_omen' WHERE `entry`=15467;
UPDATE `creature_template` SET `ScriptName`='npc_firework',`AIName`='',`faction_A`=35,`faction_H`=35,`unit_flags`=33555200 WHERE `entry` IN (15879,15880,15881,15882,15883,15884,15885,15886,15887,15888,15889,15890,15872,15873,15874,15875,15876,15877,15911,15912,15913,15914,15915,15916,15918);
-- Cleanup EventAI and SmartAI
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (15879,15880,15881,15882,15883,15884,15885,15886,15887,15888,15889,15890,15872,15873,15874,15875,15876,15877,15911,15912,15913,15914,15915,15916,15918);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (15879,15880,15881,15882,15883,15884,15885,15886,15887,15888,15889,15890,15872,15873,15874,15875,15876,15877,15911,15912,15913,15914,15915,15916,15918);

-- Update al targeting stuff for Fireworks and Rocket clusters
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (26294,26295,26333,26334,26336,26337,26338,26488,26490,26517,26521,26344,26347,26345,26348,26349,26351,26352,26354,26355,26356);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
-- Targeting Firework Launcher
(13,0,26294,0,18,0,180771,0,0,'',"Small White Rocket target Firework Launcher"),
(13,0,26294,0,18,0,180850,0,0,'',"Small White Rocket target Firework Launcher"),
(13,0,26294,0,18,0,180868,0,0,'',"Small White Rocket target Firework Launcher"),
(13,0,26295,0,18,0,180771,0,0,'',"Small Yellow Rocket target Firework Launcher"),
(13,0,26295,0,18,0,180850,0,0,'',"Small Yellow Rocket target Firework Launcher"),
(13,0,26295,0,18,0,180868,0,0,'',"Small Yellow Rocket target Firework Launcher"),
(13,0,26333,0,18,0,180771,0,0,'',"Large Blue Rocket target Firework Launcher"),
(13,0,26333,0,18,0,180850,0,0,'',"Large Blue Rocket target Firework Launcher"),
(13,0,26333,0,18,0,180868,0,0,'',"Large Blue Rocket target Firework Launcher"),
(13,0,26334,0,18,0,180771,0,0,'',"Large Green Rocket target Firework Launcher"),
(13,0,26334,0,18,0,180850,0,0,'',"Large Green Rocket target Firework Launcher"),
(13,0,26334,0,18,0,180868,0,0,'',"Large Green Rocket target Firework Launcher"),
(13,0,26336,0,18,0,180771,0,0,'',"Large Red Rocket target Firework Launcher"),
(13,0,26336,0,18,0,180850,0,0,'',"Large Red Rocket target Firework Launcher"),
(13,0,26336,0,18,0,180868,0,0,'',"Large Red Rocket target Firework Launcher"),
(13,0,26337,0,18,0,180771,0,0,'',"Large White Rocket target Firework Launcher"),
(13,0,26337,0,18,0,180850,0,0,'',"Large White Rocket target Firework Launcher"),
(13,0,26337,0,18,0,180868,0,0,'',"Large White Rocket target Firework Launcher"),
(13,0,26338,0,18,0,180771,0,0,'',"Large Yellow Rocket target Firework Launcher"),
(13,0,26338,0,18,0,180850,0,0,'',"Large Yellow Rocket target Firework Launcher"),
(13,0,26338,0,18,0,180868,0,0,'',"Large Yellow Rocket target Firework Launcher"),
-- Targeting Cluster Launcher
(13,0,26488,0,18,0,180772,0,0,'',"Large Blue Rocket Cluster target Cluster Launcher"),
(13,0,26488,0,18,0,180859,0,0,'',"Large Blue Rocket Cluster target Cluster Launcher"),
(13,0,26488,0,18,0,180869,0,0,'',"Large Blue Rocket Cluster target Cluster Launcher"),
(13,0,26488,0,18,0,180874,0,0,'',"Large Blue Rocket Cluster target Cluster Launcher"),
(13,0,26490,0,18,0,180772,0,0,'',"Large Green Rocket Cluster target Cluster Launcher"),
(13,0,26490,0,18,0,180859,0,0,'',"Large Green Rocket Cluster target Cluster Launcher"),
(13,0,26490,0,18,0,180869,0,0,'',"Large Green Rocket Cluster target Cluster Launcher"),
(13,0,26490,0,18,0,180874,0,0,'',"Large Green Rocket Cluster target Cluster Launcher"),
(13,0,26517,0,18,0,180772,0,0,'',"Large Red Rocket Cluster target Cluster Launcher"),
(13,0,26517,0,18,0,180859,0,0,'',"Large Red Rocket Cluster target Cluster Launcher"),
(13,0,26517,0,18,0,180869,0,0,'',"Large Red Rocket Cluster target Cluster Launcher"),
(13,0,26517,0,18,0,180874,0,0,'',"Large Red Rocket Cluster target Cluster Launcher"),
(13,0,26521,0,18,0,180772,0,0,'',"Lucky Lunar rocket Cluster target Cluster Launcher"),
(13,0,26521,0,18,0,180859,0,0,'',"Lucky Lunar rocket Cluster target Cluster Launcher"),
(13,0,26521,0,18,0,180869,0,0,'',"Lucky Lunar rocket Cluster target Cluster Launcher"),
(13,0,26521,0,18,0,180874,0,0,'',"Lucky Lunar rocket Cluster target Cluster Launcher"),
-- Targeting Firework Launcher (Again)
(13,0,26347,0,18,0,180771,0,0,'',"Rocket, RED target Firework Launcher"),
(13,0,26347,0,18,0,180850,0,0,'',"Rocket, RED target Firework Launcher"),
(13,0,26347,0,18,0,180868,0,0,'',"Rocket, RED target Firework Launcher"),
(13,0,26344,0,18,0,180771,0,0,'',"Rocket, BLUE target Firework Launcher"),
(13,0,26344,0,18,0,180850,0,0,'',"Rocket, BLUE target Firework Launcher"),
(13,0,26344,0,18,0,180868,0,0,'',"Rocket, BLUE target Firework Launcher"),
(13,0,26345,0,18,0,180771,0,0,'',"Rocket, GREEEN target Firework Launcher"),
(13,0,26345,0,18,0,180850,0,0,'',"Rocket, GREEEN target Firework Launcher"),
(13,0,26345,0,18,0,180868,0,0,'',"Rocket, GREEEN target Firework Launcher"),
(13,0,26348,0,18,0,180771,0,0,'',"Rocket, WHITE target Firework Launcher"),
(13,0,26348,0,18,0,180850,0,0,'',"Rocket, WHITE target Firework Launcher"),
(13,0,26348,0,18,0,180868,0,0,'',"Rocket, WHITE target Firework Launcher"),
(13,0,26349,0,18,0,180771,0,0,'',"Rocket, YELLOW target Firework Launcher"),
(13,0,26349,0,18,0,180850,0,0,'',"Rocket, YELLOW target Firework Launcher"),
(13,0,26349,0,18,0,180868,0,0,'',"Rocket, YELLOW target Firework Launcher"),
(13,0,26351,0,18,0,180771,0,0,'',"Rocket, BLUE BIG target Firework Launcher"),
(13,0,26351,0,18,0,180850,0,0,'',"Rocket, BLUE BIG target Firework Launcher"),
(13,0,26351,0,18,0,180868,0,0,'',"Rocket, BLUE BIG target Firework Launcher"),
(13,0,26352,0,18,0,180771,0,0,'',"Rocket, GREEN BIG target Firework Launcher"),
(13,0,26352,0,18,0,180850,0,0,'',"Rocket, GREEN BIG target Firework Launcher"),
(13,0,26352,0,18,0,180868,0,0,'',"Rocket, GREEN BIG target Firework Launcher"),
(13,0,26354,0,18,0,180771,0,0,'',"Rocket, RED BIG target Firework Launcher"),
(13,0,26354,0,18,0,180850,0,0,'',"Rocket, RED BIG target Firework Launcher"),
(13,0,26354,0,18,0,180868,0,0,'',"Rocket, RED BIG target Firework Launcher"),
(13,0,26355,0,18,0,180771,0,0,'',"Rocket, WHITE BIG target Firework Launcher"),
(13,0,26355,0,18,0,180850,0,0,'',"Rocket, WHITE BIG target Firework Launcher"),
(13,0,26355,0,18,0,180868,0,0,'',"Rocket, WHITE BIG target Firework Launcher"),
(13,0,26356,0,18,0,180771,0,0,'',"Rocket, YELLOW BIG target Firework Launcher"),
(13,0,26356,0,18,0,180850,0,0,'',"Rocket, YELLOW BIG target Firework Launcher"),
(13,0,26356,0,18,0,180868,0,0,'',"Rocket, YELLOW BIG target Firework Launcher");

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=15466;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=15466 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(15466,0,0,0,8,0,100,0,26636,0,8000,9000,11,25495,0,0,0,0,0,1,0,0,0,0,0,0,0,"Minion of Omen - Cast Firework Dazzled when hitted by Elune's Candle firework");

-- Cast quest credit spell when getting Elune's Blessing buff
DELETE FROM `spell_scripts` WHERE `id`=26393;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(26393,1,0,15,26394,2,0,0,0,0,0);
-- remove aura_required for clickspells on tournament mounts and add more cases (Thanks to @Tassader)
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (33842,33796,33798,33791,33792,33799,33843,33800,33795,33790,33793,33794);
INSERT INTO `npc_spellclick_spells`(`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(33842,63791,13668,0,13687,1,0,0,0),-- Aspirant
(33799,62783,13691,0,0,1,0,0,0),-- A Valiant Of Orgrimmar
(33799,62783,13707,0,0,1,0,0,0),-- Valiant Of Orgrimmar
(33796,62784,13693,0,0,1,0,0,0),-- A Valiant Of Sen'jin
(33796,62784,13708,0,0,1,0,0,0),-- Valiant Of Sen'jin
(33792,62785,13694,0,0,1,0,0,0),-- A Valiant Of Thunder Bluff
(33792,62785,13709,0,0,1,0,0,0),-- Valiant Of Thunder Bluff
(33791,62786,13696,0,0,1,0,0,0),-- A Valiant Of Silvermoon
(33791,62786,13711,0,0,1,0,0,0),-- Valiant Of Silvermoon
(33798,62787,13695,0,0,1,0,0,0),-- A Valiant Of Undercity
(33798,62787,13710,0,0,1,0,0,0), -- Valiant Of Undercity
(33843,63792,13667,0,13686,1,0,0,0),-- Aspirant
(33800,62774,13593,0,0,1,0,0,0),-- A Valiant Of Stormwind
(33800,62774,13684,0,0,1,0,0,0),-- Valiant Of Stormwind
(33795,62779,13685,0,0,1,0,0,0),-- A Valiant Of Ironforge
(33795,62779,13703,0,0,1,0,0,0),-- Valiant Of Ironforge
(33793,62780,13688,0,0,1,0,0,0),-- A Valiant Of Gnomregan
(33793,62780,13704,0,0,1,0,0,0),-- Valiant Of Gnomregan
(33790,62781,13690,0,0,1,0,0,0),-- A Valiant Of Exodar
(33790,62781,13705,0,0,1,0,0,0),-- Valiant Of Exodar
(33794,62782,13689,0,0,1,0,0,0),-- A Valiant Of Darnassus
(33794,62782,13706,0,0,1,0,0,0); -- Valiant Of Darnassus
UPDATE `npc_spellclick_spells` SET `aura_required`=0 WHERE `aura_required`=62853;

-- Break-Shield spells
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62575,62626,64342,64507,64590,64595,64686,65147,66480,68504);
-- Charge spells
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62874,62960,63661,62563,63003,63010,64591,66481,68282,68284,68321,68498,68501);
-- Defend spells
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62552,62719,66482);
-- Pennant and summon spells
DELETE FROM `spell_script_names` WHERE `spell_id` IN (62863,63034,62774,62779,62780,62781,62782,62783,62784,62785,62786,62787,63663,63791,63792,62595,62596,62594,63394,63395,63396,63397,63398,63401,63402,63403,63404,63405,63406,63421,63422,63423,63425,63426,63427,63428,63429,63430,63431,63432,63433,63434,63435,63436,63606,63500,63501,63607,63608,63609);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
(62575,'spell_gen_break_shield'),
(62626,'spell_gen_break_shield'),
(64342,'spell_gen_break_shield'),
(64507,'spell_gen_break_shield'),
(64590,'spell_gen_break_shield'),
(64595,'spell_gen_break_shield'),
(64686,'spell_gen_break_shield'),
(65147,'spell_gen_break_shield'),
(66480,'spell_gen_break_shield'),
(68504,'spell_gen_break_shield'),
(62874,'spell_gen_mounted_charge'),
(62960,'spell_gen_mounted_charge'),
(63661,'spell_gen_mounted_charge'),
(62563,'spell_gen_mounted_charge'),
(63003,'spell_gen_mounted_charge'),
(63010,'spell_gen_mounted_charge'),
(64591,'spell_gen_mounted_charge'),
(66481,'spell_gen_mounted_charge'),
(68282,'spell_gen_mounted_charge'),
(68284,'spell_gen_mounted_charge'),
(68321,'spell_gen_mounted_charge'),
(68498,'spell_gen_mounted_charge'),
(68501,'spell_gen_mounted_charge'),
(62552,'spell_gen_defend'),
(62719,'spell_gen_defend'),
(66482,'spell_gen_defend'),
(62863 ,'spell_gen_tournament_duel'),
(63034,'spell_gen_on_tournament_mount'),
(62595,'spell_gen_tournament_pennant'),
(62596,'spell_gen_tournament_pennant'),
(62594,'spell_gen_tournament_pennant'),
(63394,'spell_gen_tournament_pennant'),
(63395,'spell_gen_tournament_pennant'),
(63396,'spell_gen_tournament_pennant'),
(63397,'spell_gen_tournament_pennant'),
(63398,'spell_gen_tournament_pennant'),
(63401,'spell_gen_tournament_pennant'),
(63402,'spell_gen_tournament_pennant'),
(63403,'spell_gen_tournament_pennant'),
(63404,'spell_gen_tournament_pennant'),
(63405,'spell_gen_tournament_pennant'),
(63406,'spell_gen_tournament_pennant'),
(63421,'spell_gen_tournament_pennant'),
(63422,'spell_gen_tournament_pennant'),
(63423,'spell_gen_tournament_pennant'),
(63425,'spell_gen_tournament_pennant'),
(63426,'spell_gen_tournament_pennant'),
(63427,'spell_gen_tournament_pennant'),
(63428,'spell_gen_tournament_pennant'),
(63429,'spell_gen_tournament_pennant'),
(63430,'spell_gen_tournament_pennant'),
(63431,'spell_gen_tournament_pennant'),
(63432,'spell_gen_tournament_pennant'),
(63433,'spell_gen_tournament_pennant'),
(63434,'spell_gen_tournament_pennant'),
(63435,'spell_gen_tournament_pennant'),
(63436,'spell_gen_tournament_pennant'),
(63606,'spell_gen_tournament_pennant'),
(63500,'spell_gen_tournament_pennant'),
(63501,'spell_gen_tournament_pennant'),
(63607,'spell_gen_tournament_pennant'),
(63608,'spell_gen_tournament_pennant'),
(63609,'spell_gen_tournament_pennant'),
(62774,'spell_gen_summon_tournament_mount'),
(62779,'spell_gen_summon_tournament_mount'),
(62780,'spell_gen_summon_tournament_mount'),
(62781,'spell_gen_summon_tournament_mount'),
(62782,'spell_gen_summon_tournament_mount'),
(62783,'spell_gen_summon_tournament_mount'),
(62784,'spell_gen_summon_tournament_mount'),
(62785,'spell_gen_summon_tournament_mount'),
(62786,'spell_gen_summon_tournament_mount'),
(62787,'spell_gen_summon_tournament_mount'),
(63663,'spell_gen_summon_tournament_mount'),
(63791,'spell_gen_summon_tournament_mount'),
(63792,'spell_gen_summon_tournament_mount');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9798 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(9798,11,0,0, 'achievement_tilted');
ALTER TABLE `conditions` CHANGE `SourceId` `SourceId` INT(10) NOT NULL DEFAULT '0';
ALTER TABLE `conditions` DROP PRIMARY KEY,
    ADD PRIMARY KEY (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=72618;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,72618,0,0,18,1,0,0,0, '', 'Mutated Plague Clear - target players');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_putricide_clear_mutated_plague';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(72618,'spell_putricide_clear_mutated_plague');
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=15571 AND `item`=21137;
-- Set 25 Heroic loot to 68%
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=68 WHERE `entry`=38586 AND `item`= 50274;
SET @ITEM :=50274;
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (28074,28088,28082,28096) AND `item`=@ITEM;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(28074,@ITEM,-38,1,0,1,1), -- Deathbringer Cache 25 Normal
(28088,@ITEM,-68,1,0,1,1), -- Deathbringer Cache 25 Heroic
(28082,@ITEM,-38,1,0,1,1), -- Cache of the Dreamwalker 25 Normal
(28096,@ITEM,-68,1,0,1,1); -- Cache of the Dreamwalker 25 Heroic
-- only drop if someone is on the quest (negative ChanceOrQuestChance) 
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -(ABS(`ChanceOrQuestChance`)) WHERE `item`=50274;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`= -(ABS(`ChanceOrQuestChance`)) WHERE `item`=50274;

-- Dreamwalker and Council should drop 3 items
UPDATE `gameobject_loot_template` SET `maxcount`=3 WHERE `entry`IN (28052,28082,28064,28096) AND `item`=1;
UPDATE `creature_loot_template` SET `maxcount`=3 WHERE `entry` IN (37970,38401,38784,38785) AND `item`=1;
SET @ThoriumGems = 12900;
DELETE FROM `reference_loot_template` WHERE `entry` IN (@ThoriumGems,12901,12902,12903,12904,12905,12906,12907,12908);
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- ThoriumGems
(@ThoriumGems,12363,40,1,1,1,1), -- Arcane Crystal
(@ThoriumGems, 7910,12,1,1,1,1), -- Star Ruby
(@ThoriumGems,12800,12,1,1,1,1), -- Azerothian Diamond
(@ThoriumGems,12361,12,1,1,1,1), -- Blue Sapphire
(@ThoriumGems,12364,12,1,1,1,1), -- Huge Emerald
(@ThoriumGems,12799,12,1,1,1,1); -- Large Opal

SET @Copper := 1502;
SET @Tin := 1503;
SET @Silver := 1504;
SET @Iron := 1505;
SET @Gold :=1506;
SET @Mithril :=1742;
SET @Truesilver := 5045;
SET @SmallThorium := 9597;
SET @RichThorium := 12883;

DELETE FROM `gameobject_loot_template` WHERE `entry` IN (@Copper,@Tin,@Silver,@Iron,@Gold,@Mithril,@Truesilver,@SmallThorium,@RichThorium,17938,13960,17241);
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
-- Copper Vein
(@Copper,2770,100,1,0,1,9), -- Copper Ore
(@Copper,2835, 25,1,0,1,11), -- Rough Stone
(@Copper,774 ,5,1,1,1,1), -- Malachite
(@Copper,1210,5,1,1,1,1), -- Shadowgem
(@Copper,818 ,5,1,1,1,1), -- Tigerseye
(@Copper,22634,-100,1,0,1,2), -- Underlight Ore (only on quest)
-- Tin Vein
(@Tin,2771,100,1,0,1,9), -- Tin Ore
(@Tin,2836,25,1,0,1,13), -- Coarse Stone
(@Tin,1206,5,1,1,1,1), -- Moss Agate
(@Tin,1705,5,1,1,1,1), -- Lesser Moonstone
(@Tin,1210,5,1,1,1,1), -- Shadowgem
(@Tin,1529,5,1,1,1,1), -- Jade
(@Tin,2798,-100,1,0,1,2), -- Rethban Ore (only on quest)
(@Tin,22634,-100,1,0,1,2), -- Underlight Ore (only on quest)
-- Silver Vein
(@Silver,2775,100,1,0,2,8), -- Silver Ore
(@Silver,1206,5,1,1,1,1), -- Moss Agate
(@Silver,1705,5,1,1,1,1), -- Lesser Moonstone
(@Silver,1210,5,1,1,1,1), -- Shadowgem
-- Iron Deposit
(@Iron,2772,100,1,0,2,9), -- Iron Ore
(@Iron,2838,100,1,0,2,10), -- Heavy Stone
(@Iron,1529,5,1,1,1,1), -- Jade
(@Iron,3864,5,1,1,1,1), -- Citrine
(@Iron,1705,5,1,1,1,1), -- Lesser Moonstone
(@Iron,7909,5,1,1,1,1), -- Aquamarine
-- Gold Vein
(@Gold,2776,100,1,0,2,8), -- Gold Ore
(@Gold,3864,5,1,1,1,1), -- Citrine
(@Gold,1705,5,1,1,1,1), -- Lesser Moonstone
(@Gold,7909,5,1,1,1,1), -- Aquamarine
-- Mithril Deposit
(@Mithril,3858,100,1,0,1,9), -- Mithril Ore
(@Mithril,7912,80,1,0,1,13), -- Solid Stone
(@Mithril,7909,5,1,1,1,1), -- Aquamarine
(@Mithril,3864,5,1,1,1,1), -- Citrine
(@Mithril,7910,5,1,1,1,1), -- Star Ruby
(@Mithril,9262,5,1,1,1,1), -- Black Vitriol
-- Truesilver Deposit
(@Truesilver,7911,100,1,0,2,8), -- Truesilver Ore
(@Truesilver,7909,5,1,1,1,1), -- Aquamarine
(@Truesilver,3864,5,1,1,1,1), -- Citrine
(@Truesilver,7910,5,1,1,1,1), -- Star Ruby
-- Small Thorium Vein
(@SmallThorium,10620,100,1,0,1,8), -- Thorium Ore
(@SmallThorium,12365,100,1,0,1,10), -- Dense Stone
(@SmallThorium,1,15,1,0,-@ThoriumGems,1), -- One From Gems
-- Rich Thorium Vein
(@RichThorium,10620,100,1,0,3,10), -- Thorium Ore
(@RichThorium,12365,100,1,0,4,12), -- Dense Stone
(@RichThorium,1,25,1,0,-@ThoriumGems,1), -- One From Gems
-- Special Cases:
-- Truesilver Vein+Tainted Vitriol
(17938,7911,100,1,0,2,8), -- Truesilver Ore
(17938,7909,5,1,1,1,1), -- Aquamarine
(17938,3864,5,1,1,1,1), -- Citrine
(17938,7910,5,1,1,1,1), -- Star Ruby
(17938,11513,50,1,0,1,1), -- Tainted Vitriol
-- Small Thorium Vein+Tainted Vitriol
(13960,10620,100,1,0,1,8), -- Thorium Ore
(13960,12365,100,1,0,1,10), -- Dense Stone
(13960,1,15,1,0,-@ThoriumGems,1), -- One From Gems
(13960,11513,50,1,0,1,1), -- Tainted Vitriol
-- Hakkari Thorium Vein
(17241,10620,100,1,0,1,8), -- Thorium Ore
(17241,12365,100,1,0,1,10), -- Dense Stone
(17241,1,15,1,0,-@ThoriumGems,1), -- One From Gems
(17241,19774,40,1,0,5,10); -- Souldarite

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=9798 AND `type`=6;

DELETE FROM `spell_script_names` WHERE `spell_id`=63399;
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
(63399,'spell_gen_tournament_pennant');