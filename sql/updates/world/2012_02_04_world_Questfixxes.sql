-- Finding the Keymaster by nelegalno

UPDATE `quest_template` SET `SpecialFlags` = 0, `RequiredSpellCast1` = 0 WHERE `ID` = 10256;
DELETE FROM `event_scripts` WHERE id=12857;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(12857,0,10,19938,3000000,0,2248.43,2227.97,138.56,2.48121),
(12857,1,8,19938,1,0,0,0,0,0);

-- Deeprun Rat SAI
SET @ENTRY := 13016;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `quest_template` SET `ReqSpellCast1`=0 WHERE `entry`=6661;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,21050,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Deeprun Rat - On Spellhit - Follow Player"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,36,13017,0,0,0,0,0,1,0,0,0,0,0,0,0,"Deeprun Rat - On Spellhit - Update Template"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,33,13017,0,0,0,0,0,7,0,0,0,0,0,0,0,"Deeprun Rat - On Spellhit - Quest Credit"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Deeprun Rat - On Spellhit - Set Phase 1");

-- Meeting at the Blackwing Coven quest fix by tharaca

-- Variables
SET @QUEST := 10722;
SET @ENTRY := 22019;
SET @SPELL1:= 37704; -- Whirlwind
SET @SPELL2:= 8599; -- Enrage

-- Update Kolphis Darkscale, enable SmartAI and add gossipflag
UPDATE `creature_template` SET `AIName`='SmartAI',`gossip_menu_id`=8436,`npcflag`=npcflag|1 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,8439,1,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kolphis Darkscale - script - give Quest credit to player'),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Kolphis Darkscale - script - Close gossip'),
(@ENTRY,0,2,0,0,0,50,0,3000,3000,8000,8000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0,'Kolphis Darkscale - Combat - Whirlwind'),
(@ENTRY,0,3,0,2,0,100,1,0,25,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kolphis Darkscale - On Health level - Emote when below 25% HP'),
(@ENTRY,0,4,0,2,0,100,1,0,25,0,0,11,@SPELL2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Kolphis Darkscale - On Health level - Cast Enrage when below 25% HP');

-- add missing text to Kolphis Darkscale from sniff
DELETE FROM `npc_text` WHERE `ID`=10540;
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`,`text0_1`,`WDBVerified`) VALUES
(10540,1,"Begone, overseer!  We've already spoken.$B$BStop dragging your feet and execute your orders at Ruuan Weald!",'',1);

-- Kolphis Darkscale emote
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s becomes enraged!',16,0,100,0,0,0,'Kolphis Darkscale');

-- Gossip menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=8436 AND `text_id`=10539;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8436,10539);
DELETE FROM `gossip_menu` WHERE `entry`=8436 AND `text_id`=10540;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8436,10540);
DELETE FROM `gossip_menu` WHERE `entry`=8435 AND `text_id`=10541;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8435,10541);
DELETE FROM `gossip_menu` WHERE `entry`=8437 AND `text_id`=10542;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8437,10542);
DELETE FROM `gossip_menu` WHERE `entry`=8438 AND `text_id`=10543;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8438,10543);
DELETE FROM `gossip_menu` WHERE `entry`=8439 AND `text_id`=10544;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8439,10544);
DELETE FROM `gossip_menu` WHERE `entry`=8440 AND `text_id`=10545;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8440,10545);

-- Creature Gossip_menu_option insert from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8435,8436,8437,8438,8439) AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(8436,1,0,"I'm fine, thank you. You asked for me?",1,1,8435,0,0,0,''),
(8435,1,0,"Oh, it's not my fault, I can assure you.",1,1,8437,0,0,0,''),
(8437,1,0,"Um, no... No, I don't want that at all.",1,1,8438,0,0,0,''),
(8438,1,0,'Impressive. When do we attack?',1,1,8439,0,0,0,''),
(8439,1,0,'Absolutely!',1,1,0,0,0,0,'');

-- Add gossip_menu condition  
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=8436;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(15,8436,1,0,9,10722,0,0,0,'Show gossip option 1 if player has quest 10722'),
(14,8436,10540,0,28,10722,0,0,0,"Show text 8436/10540 if player has quest 10722 completed already");