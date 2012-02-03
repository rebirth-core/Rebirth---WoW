UPDATE `creature_template` SET `unit_flags`='0' WHERE entry IN (35490, 35451);

-- Fixe Ramponierter Schwertgriff (Allianz) --

DELETE FROM `creature_loot_template` WHERE entry IN (31260, 36842, 36840, 36893, 38173, 38172, 36830, 36499, 38177, 36564, 37713, 36892, 38176, 36478, 36516, 36788, 36886, 36620, 36879, 36522, 38175, 37712, 36891, 37711, 36666);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES 
('31260', '50379','0.11', '1', '1', '1', '1'),
('36842', '50379','0.09', '1', '1', '1', '1'),
('36840', '50379','0.09', '1', '1', '1', '1'),
('36893', '50379','0.08', '1', '1', '1', '1'),
('38173', '50379','0.07', '1', '1', '1', '1'),
('38172', '50379','0.07', '1', '1', '1', '1'),
('36830', '50379','0.07', '1', '1', '1', '1'),
('36499', '50379','0.06', '1', '1', '1', '1'),
('38177', '50379','0.06', '1', '1', '1', '1'),
('36564', '50379','0.05', '1', '1', '1', '1'),
('37713', '50379','0.05', '1', '1', '1', '1'),
('36892', '50379','0.05', '1', '1', '1', '1'),
('38176', '50379','0.05', '1', '1', '1', '1'),
('36478', '50379','0.04', '1', '1', '1', '1'),
('36516', '50379','0.04', '1', '1', '1', '1'),
('36788', '50379','0.04', '1', '1', '1', '1'),
('36886', '50379','0.02', '1', '1', '1', '1'),
('36620', '50379','0.02', '1', '1', '1', '1'),
('36879', '50379','0.02', '1', '1', '1', '1'),
('36522', '50379','0.02', '1', '1', '1', '1'),
('36175', '50379','0.02', '1', '1', '1', '1'),
('37712', '50379','0.02', '1', '1', '1', '1'),
('36891', '50379','0.01', '1', '1', '1', '1'),
('37711', '50379','0.01', '1', '1', '1', '1'),
('36666', '50379','0.01', '1', '1', '1', '1');


-- Fixe Ramponierter Schwertgriff (Horde) --

DELETE FROM `creature_loot_template` WHERE entry IN (36723, 38176, 36666, 36788, 36842, 38173, 36620, 38172, 37712, 36893, 37711, 36564, 36840, 36478, 38177, 38175, 36892, 36522, 36896, 36499, 37713, 36516, 36879, 36830, 36891, 36886, 31260);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES 
('36723', '50380','0.17', '1', '1', '1', '1'),
('38176', '50380','0.16', '1', '1', '1', '1'),
('36666', '50380','0.16', '1', '1', '1', '1'),
('36788', '50380','0.14', '1', '1', '1', '1'),
('36842', '50380','0.14', '1', '1', '1', '1'),
('38173', '50380','0.14', '1', '1', '1', '1'),
('36620', '50380','0.11', '1', '1', '1', '1'),
('38172', '50380','0.11', '1', '1', '1', '1'),
('37712', '50380','0.09', '1', '1', '1', '1'),
('36893', '50380','0.08', '1', '1', '1', '1'),
('37711', '50380','0.07', '1', '1', '1', '1'),
('36564', '50380','0.07', '1', '1', '1', '1'),
('36840', '50380','0.06', '1', '1', '1', '1'),
('36478', '50380','0.06', '1', '1', '1', '1'),
('38175', '50380','0.06', '1', '1', '1', '1'),
('36892', '50380','0.06', '1', '1', '1', '1'),
('36522', '50380','0.06', '1', '1', '1', '1'),
('36896', '50380','0.06', '1', '1', '1', '1'),
('36499', '50380','0.06', '1', '1', '1', '1'),
('37713', '50380','0.05', '1', '1', '1', '1'),
('36516', '50380','0.05', '1', '1', '1', '1'),
('36879', '50380','0.05', '1', '1', '1', '1'),
('36830', '50380','0.04', '1', '1', '1', '1'),
('36891', '50380','0.04', '1', '1', '1', '1'),
('36886', '50380','0.04', '1', '1', '1', '1'),
('31260', '50380','0.02', '1', '1', '1', '1');

DELETE FROM skinning_loot_template WHERE entry IN (70200,70201,70202, 70203, 70204,70205,70206,70207,70208,70209,70210,70211,34797);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) 
VALUES 
(70200, 33568, 10, 1, 1, 1, 4),
(70201, 33568, 20, 1, 1, 1, 4),
(70202, 33568, 0, 1, 1, 1, 4),
(70203, 33568, 0, 1, 1, 1, 7),
(70204, 33568, 15, 1, 1, 1, 4),
(70205, 33568, 0, 1, 1, 1, 3),
(70206, 33568, 35, 1, 1, 1, 7),
(70207, 33568, 0, 1, 1, 1, 7),
(70208, 33568, 35, 1, 1, 1, 4),
(70209, 33568, 0, 1, 1, 1, 7),
(70210, 33568, 0, 1, 1, 1, 3),
(70211, 33568, 0, 1, 1, 1, 7),
(34797, 33568, 100, 1, 0, 12, 16);

REPLACE INTO `spell_threat` (`entry`, `flatMod`, `apPctMod`)
VALUES 
('48819', '890', '0.05'),  -- Weihe
('53595', '610', '0.05'),  -- Hammer der Rechtschaffenen
('63222', '870', '0.05'),  -- Schild der Rechtschaffenen
('48827', '990', '0.05'),  -- Schild des Rächers
('48801', '510', '0.05'),  -- Exorzismus
('62124', '510', '0.05');  -- Hand der Abrechnung

SET NAMES 'utf8';

DELETE FROM `trinity_string` WHERE entry IN (756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,780,781,782,783);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('756', 'Battle begins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ??????????'),
('757', '%s has successfully defended the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ??????? ?????????(?) ???????????!'),
('758', '%s has taken over the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ??????????(?) ???????????'),
('759', 'The %s siege workshop has been damaged by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('760', 'The %s siege workshop has been destroyed by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('761', 'The %s tower has been damaged!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ?????? ???????????'),
('762', 'The %s tower has been destroyed!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ?????? ????????????!'),
('763', 'Wintergrasp fortress is under attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('764', 'Wintergrasp is now under the control of the %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('765', 'Wintergrasp timer set to %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('766', 'Wintergrasp battle started.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('767', 'Wintergrasp battle finished.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('769', 'Wintergrasp outdoorPvP is disabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('770', 'Wintergrasp outdoorPvP is enabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('771', 'You have reached Rank 1: Corporal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ????????? ? ???? 1: ????????'),
('772', 'You have reached Rank 2: First Lieutenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ????????? ? ???? 2: ????????????'),
('780', 'Before the Battle of  Wintergrasp left 30 minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ??????? ??  ??????? ??????????? ????? ?????????? 30 ??????!'),
('781', 'Before the Battle of  Wintergrasp left 10 minutes! Portal from Dalaran will work at begin of the battle.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ??????? ??  ??????? ??????????? ????? ?????????? 10 ??????! ????????? ? ?????????? ???????? ???????? ?? ??????? ????.'),
('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ?? ??????? ??????????? ????? ?????????????. ??? ?????????? ????????????. ???????????? ???????????? ????????????  ?????????.'),
('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ?? ??????? ??????????? ????? ?????????????. ??? ?????????? ?????????????. ???????????? ??????????? ????????????.');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('wg', '3', 'Syntax: .wg $subcommand.'),
('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.'),
('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.'),
('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.'),
('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).'),
('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.'),
('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');

/* WG scriptname */
DELETE FROM `outdoorpvp_template` WHERE TypeId=7;
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `comment`) VALUES 
('7', 'outdoorpvp_wg', 'Wintergrasp');

/* Teleport WG SPELLs*/
DELETE FROM `spell_target_position` WHERE id IN ('59096', '58632', '58633');
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
('59096', '571', '5325.06', '2843.36', '409.285', '3.20278'),
('58632', '571', '5097.79', '2180.29', '365.61', '2.41'),
('58633', '571', '5026.80', '3676.69', '362.58', '3.94');

/* Defender's Portal Activate Proper Spell */
DELETE FROM `spell_linked_spell` WHERE spell_trigger=54640;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
('54640','54643','0','Defender\'s Portal Activate Proper Spell');

/* Protect players from catching by Druid Cyclone at graveyard which removes immunity after disappear */
DELETE FROM `spell_linked_spell` WHERE spell_trigger=58729;
INSERT INTO `spell_linked_spell` VALUES (58729, -33786, 2, 'Spiritual Immunity: Protect From Cyclone (now Immune always)');

/*Spirit healer add spiritguide flag FIX for ressurection*/
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry IN (31841,31842);

/* Creature template */
UPDATE creature_template SET faction_A = '1802', faction_H = '1802' WHERE entry IN (30499,28312,28319);
UPDATE creature_template SET faction_A = '1801', faction_H = '1801' WHERE entry IN (30400,32629,32627);

/* Demolisher Engineer script */
UPDATE `creature_template` SET `ScriptName` = 'npc_demolisher_engineerer' WHERE `entry` IN (30400,30499);

/* Wintergrasp Battle-Mage */
DELETE FROM `creature` WHERE `id` IN (32170, 32169);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(NULL, 32170, 571, 1, 65535, 27801, 0, 5917.69, 584.167, 660.49, 5.17983, 300, 0, 0, 504000, 440700, 0, 0, 0, 0),
(NULL, 32170, 571, 1, 65535, 0, 2796, 5939.59, 556.516, 640.001, 2.70112, 300, 0, 0, 504000, 440700, 0, 0, 0, 0),
(NULL, 32169, 571, 1, 65535, 0, 0, 5698.38, 777.562, 647.852, 5.56938, 900, 0, 0, 504000, 440700, 0, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName`='npc_wg_ally_battle_mage' WHERE `entry`=32169;
UPDATE `creature_template` SET `ScriptName`='npc_wg_horde_battle_mage' WHERE `entry`=32170;

/* Portal Dalaran->WG */
DELETE FROM `gameobject` WHERE `id`=193772;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(NULL, 193772, 571, 1, 64, 5924.11, 573.387, 661.087, 4.43208, 0, 0, 0.798953, -0.601393, 300, 0, 1),
(NULL, 193772, 571, 1, 65535, 5686.57, 772.921, 647.754, 5.62225, 0, 0, 0.324484, -0.945891, 600, 0, 1),
(NULL, 193772, 571, 1, 65535, 5930.82, 548.961, 640.632, 1.88506, 0, 0, 0.809047, 0.587744, 300, 0, 1);

/* Vehicle Teleporter */
UPDATE `gameobject_template` SET `type` = 6, `faction` = 0, `data2` = 10, `data3` = 54643, `ScriptName` = 'go_wg_veh_teleporter' WHERE `entry` = 192951;

/* Workshop */
UPDATE `gameobject_template` SET `faction` = 35 WHERE `entry` IN (192028,192029,192030,192031,192032,192033);

/* Towers */
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 6553632 WHERE `entry` IN (190356,190357,190358);

/* Titan Relic remove */
DELETE FROM `gameobject` WHERE `id`=192829;

/* Temp removed gameobject stopping you getting to the relic
* 194323 - [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
* 194162 - [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]*/
DELETE FROM gameobject WHERE id IN ('194323', '194162');

/* spell target for build vehicles */
DELETE FROM `conditions` WHERE ConditionValue2=27852;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 49899, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56575, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56661, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56663, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56665, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56667, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 56669, 0, 18, 1, 27852, 0, 0, '', NULL),
(13, 0, 61408, 0, 18, 1, 27852, 0, 0, '', NULL);

/*WG Spell area Data For wg antifly */
DELETE FROM `spell_area` WHERE spell IN (58730, 57940, 58045);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(58730, 4197, 0, 0, 0, 0, 0, 2, 1),
(58730, 4584, 0, 0, 0, 0, 0, 2, 1),
(58730, 4581, 0, 0, 0, 0, 0, 2, 1),
(58730, 4585, 0, 0, 0, 0, 0, 2, 1),
(58730, 4612, 0, 0, 0, 0, 0, 2, 1),
(58730, 4582, 0, 0, 0, 0, 0, 2, 1),
(58730, 4611, 0, 0, 0, 0, 0, 2, 1),
(58730, 4578, 0, 0, 0, 0, 0, 2, 1),
(58730, 4576, 0, 0, 0, 0, 0, 2, 1),
(58730, 4538, 0, 0, 0, 0, 0, 2, 1),
(57940, 65, 0, 0, 0, 0, 0, 2, 1),
(57940, 66, 0, 0, 0, 0, 0, 2, 1),
(57940, 67, 0, 0, 0, 0, 0, 2, 1),
(57940, 206, 0, 0, 0, 0, 0, 2, 1),
(57940, 210, 0, 0, 0, 0, 0, 2, 1),
(57940, 394, 0, 0, 0, 0, 0, 2, 1),
(57940, 395, 0, 0, 0, 0, 0, 2, 1),
(57940, 1196, 0, 0, 0, 0, 0, 2, 1),
(57940, 2817, 0, 0, 0, 0, 0, 2, 1),
(57940, 3456, 0, 0, 0, 0, 0, 2, 1),
(57940, 3477, 0, 0, 0, 0, 0, 2, 1),
(57940, 3537, 0, 0, 0, 0, 0, 2, 1),
(57940, 3711, 0, 0, 0, 0, 0, 2, 1),
(57940, 4100, 0, 0, 0, 0, 0, 2, 1),
(57940, 4196, 0, 0, 0, 0, 0, 2, 1),
(57940, 4228, 0, 0, 0, 0, 0, 2, 1),
(57940, 4264, 0, 0, 0, 0, 0, 2, 1),
(57940, 4265, 0, 0, 0, 0, 0, 2, 1),
(57940, 4272, 0, 0, 0, 0, 0, 2, 1),
(57940, 4273, 0, 0, 0, 0, 0, 2, 1),
(57940, 4395, 0, 0, 0, 0, 0, 2, 1),
(57940, 4415, 0, 0, 0, 0, 0, 2, 1),
(57940, 4416, 0, 0, 0, 0, 0, 2, 1),
(57940, 4493, 0, 0, 0, 0, 0, 2, 1),
(57940, 4494, 0, 0, 0, 0, 0, 2, 1),
(57940, 4603, 0, 0, 0, 0, 0, 2, 1),
(58045, 4197, 0, 0, 0, 0, 0, 2, 1);

DELETE FROM gameobject WHERE 
      id IN (192317,192335,192313,192316,192332,192331,192330,192329,192487,192310,192314,192308,192309,192324,192326,192312,192325,192304,187433,193984,193983,192377,192321,192318,192322,192320,192269,192273,192274,192277,192278,192280,192283,192284,192285,192289,192290,192336,192338,192339,192349,192350,192351,192352,192353,192354,192355,192356,192357,192358,192359,192360,192361,192362,192363,192364,192366,192367,192368,192369,192370,192371,192372,192373,192374,192375,192378,192379,192406,192407,192414,192416,192417,192418,192429,192433,192434,192435,192458,192459,192460,192461,192488,192501,192254,192255,192688,192686,180398,193764,193762,192319,192287,192323,192305,192286,192334,192307,192306,192328,192252,192253,192292,192299,192327,192267,192449,192450) 
         AND map=571;
INSERT INTO `gameobject` VALUES (NULL, 192317, 571, 1, 385, 5363.39, 2781.28, 435.634, 1.58825, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192335, 571, 1, 385, 5363.72, 2763.25, 445.023, -1.54462, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192313, 571, 1, 1, 5392.65, 3037.11, 433.713, -1.52716, 0, 0, -0.691512, 0.722365, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192316, 571, 1, 385, 5322.01, 2781.13, 435.673, 1.57952, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192332, 571, 1, 1, 5289.46, 2704.68, 435.875, -0.017451, 0, 0, -0.00872539, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192331, 571, 1, 1, 5350.95, 2640.36, 435.408, 1.5708, 0, 0, 0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192330, 571, 1, 1, 5392.27, 2639.74, 435.331, 1.50971, 0, 0, 0.685183, 0.728371, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192329, 571, 1, 1, 5350.88, 2622.72, 444.686, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5278.38, 2613.83, 432.721, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5260.82, 2631.8, 433.324, 3.05433, 0, 0, 0.999048, 0.0436174, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192310, 571, 1, 1, 5271.8, 2704.87, 445.183, -3.13286, 0, 0, -0.99999, 0.00436634, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192314, 571, 1, 1, 5236.27, 2739.46, 444.992, -1.59698, 0, 0, -0.716303, 0.697789, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5163.78, 2729.68, 432.009, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192308, 571, 1, 1, 5237.07, 2757.03, 435.796, 1.51844, 0, 0, 0.688356, 0.725373, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192309, 571, 1, 1, 5235.34, 2924.34, 435.04, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5262.54, 3047.95, 430.979, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 1, 5163.13, 2952.59, 433.503, 1.53589, 0, 0, 0.694658, 0.71934, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192324, 571, 1, 1, 5235.19, 2942, 443.948, 1.58825, 0, 0, 0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192326, 571, 1, 1, 5272.73, 2976.55, 443.81, 3.12412, 0, 0, 0.999962, 0.00873622, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192312, 571, 1, 1, 5352.37, 3037.09, 435.252, -1.5708, 0, 0, -0.707108, 0.707106, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192325, 571, 1, 1, 5290.35, 2976.56, 435.221, 0.017452, 0, 0, 0.00872589, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192304, 571, 1, 385, 5397.76, 2873.08, 455.321, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 187433, 571, 1, 1, 2832.84, 6184.45, 84.6827, -2.58308, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 187433, 571, 1, 1, 2835.96, 6180.37, 84.6827, 1.50098, 0, 0, 0, 0, 180, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 187433, 571, 1, 1, 2830.12, 6188.96, 84.6827, -0.855211, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 187433, 571, 1, 1, 2831.88, 6188.72, 84.6827, -1.65806, 0, 0, 0, 0, 300, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 193984, 571, 1, 1, 7647.47, 2055.55, 599.399, -0.279252, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193984, 571, 1, 1, 7647.42, 2065.23, 599.308, 0.279252, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193984, 571, 1, 1, 7609.86, 2055.53, 599.494, -2.86234, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193984, 571, 1, 1, 7610.18, 2065.31, 599.426, 2.87979, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193983, 571, 1, 1, 7906.95, 2053.04, 599.626, -0.296705, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193983, 571, 1, 1, 7907.01, 2063.02, 599.587, 0.261798, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193983, 571, 1, 1, 7870.43, 2053.35, 599.669, -2.87979, 0, 0, 0, 0, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193983, 571, 1, 1, 7870.36, 2063.25, 599.628, 2.86234, 0, 0, 0, 0, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192377, 571, 1, 1, 5414.19, 3069.8, 415.187, 1.64061, 0, 0, 0, 0, 5, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 192321, 571, 1, 385, 5288.85, 2861.82, 435.591, 0.026179, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192318, 571, 1, 385, 5322.25, 2898.95, 435.643, -1.57952, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192322, 571, 1, 385, 5322.89, 2917.14, 445.154, 1.56207, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192320, 571, 1, 385, 5289.05, 2820.23, 435.674, 0, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192269, 571, 1, 1, 4526.46, 2810.18, 391.2, -2.99322, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192273, 571, 1, 1, 4417.94, 2324.81, 371.577, 3.08051, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192274, 571, 1, 1, 4424.15, 3286.54, 371.546, 3.12412, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192277, 571, 1, 1, 4572.93, 3475.52, 363.009, 1.42244, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192278, 571, 1, 1, 4433.9, 3534.14, 360.275, -1.85005, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192280, 571, 1, 1, 4857.97, 3335.44, 368.881, -2.94959, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192283, 571, 1, 1, 5006.34, 3280.4, 371.163, 2.22529, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192284, 571, 1, 65, 5372.48, 2862.5, 409.049, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192285, 571, 1, 65, 5371.49, 2820.8, 409.177, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192289, 571, 1, 1, 4778.19, 2438.06, 345.644, -2.94088, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 1, 5024.57, 2532.75, 344.023, -1.93732, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192336, 571, 1, 1, 5154.49, 2862.15, 445.012, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192338, 571, 1, 65, 5397.76, 2873.08, 455.461, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192339, 571, 1, 65, 5397.39, 2809.33, 455.344, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192349, 571, 1, 1, 5155.31, 2820.74, 444.979, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192350, 571, 1, 1, 5270.69, 2861.78, 445.058, -3.11539, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192351, 571, 1, 1, 5271.28, 2820.16, 445.201, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192352, 571, 1, 1, 5173.02, 2820.93, 435.72, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192353, 571, 1, 1, 5172.11, 2862.57, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192354, 571, 1, 1, 5288.41, 2861.79, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192355, 571, 1, 1, 5288.92, 2820.22, 435.721, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192356, 571, 1, 1, 5237.07, 2757.03, 435.796, 1.51844, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192357, 571, 1, 1, 5235.34, 2924.34, 435.04, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192358, 571, 1, 65, 5322.23, 2899.43, 435.808, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192359, 571, 1, 65, 5364.35, 2899.4, 435.839, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192360, 571, 1, 65, 5352.37, 3037.09, 435.252, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192361, 571, 1, 65, 5392.65, 3037.11, 433.713, -1.52716, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192362, 571, 1, 65, 5322.12, 2763.61, 444.974, -1.55334, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192363, 571, 1, 65, 5363.61, 2763.39, 445.024, -1.54462, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192364, 571, 1, 1, 5350.88, 2622.72, 444.686, -1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192366, 571, 1, 1, 5236.27, 2739.46, 444.992, -1.59698, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192367, 571, 1, 1, 5271.8, 2704.87, 445.183, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192368, 571, 1, 65, 5289.46, 2704.68, 435.875, -0.017451, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192369, 571, 1, 1, 5350.95, 2640.36, 435.408, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192370, 571, 1, 1, 5392.27, 2639.74, 435.331, 1.50971, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192371, 571, 1, 65, 5364.29, 2916.94, 445.331, 1.57952, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192372, 571, 1, 65, 5322.86, 2916.95, 445.154, 1.56207, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192373, 571, 1, 1, 5290.35, 2976.56, 435.221, 0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192374, 571, 1, 1, 5272.94, 2976.55, 444.492, 3.12412, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192375, 571, 1, 1, 5235.19, 2941.9, 444.278, 1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192378, 571, 1, 65, 5322.02, 2781.13, 435.811, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192379, 571, 1, 65, 5363.42, 2781.03, 435.763, 1.5708, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192406, 571, 1, 1, 4438.3, 3361.08, 371.568, -0.017451, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192407, 571, 1, 1, 4448.17, 3235.63, 370.412, -1.56207, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192414, 571, 1, 1, 4387.62, 2719.57, 389.935, -1.54462, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192416, 571, 1, 1, 4408.57, 2422.61, 377.179, 1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192417, 571, 1, 1, 4416.59, 2414.08, 377.196, 0, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 4417.25, 2301.14, 377.214, 0.026179, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192429, 571, 1, 1, 4464.12, 2855.45, 406.111, 0.829032, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192433, 571, 1, 1, 4401.63, 3377.46, 363.365, 1.55334, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192434, 571, 1, 1, 5041.61, 3294.4, 382.15, -1.63188, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192435, 571, 1, 1, 4855.63, 3297.62, 376.739, -3.13286, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192458, 571, 1, 1, 4811.4, 2441.9, 358.207, -2.0333, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192459, 571, 1, 1, 4805.67, 2407.48, 358.191, 1.78023, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192460, 571, 1, 1, 5004.35, 2486.36, 358.449, 2.17294, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4983.28, 2503.09, 358.177, -0.427603, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5160.34, 2798.61, 430.769, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5158.81, 2883.13, 431.618, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5278.38, 2613.83, 433.409, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5260.82, 2631.8, 433.324, 3.05433, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5163.13, 2952.59, 433.503, 1.53589, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5145.11, 2935, 433.386, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5262.54, 3047.95, 432.055, 3.10665, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5146.04, 2747.21, 433.584, 3.07177, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 1, 5163.78, 2729.68, 433.394, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4398.82, 2804.7, 429.792, -1.58825, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4416, 2822.67, 429.851, -0.017452, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4559.11, 3606.22, 419.999, -1.48353, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4539.42, 3622.49, 420.034, -3.07177, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4555.26, 3641.65, 419.974, 1.67551, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4574.87, 3625.91, 420.079, 0.087266, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4466.79, 1960.42, 459.144, 1.15192, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4475.35, 1937.03, 459.07, -0.436332, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4451.76, 1928.1, 459.076, -2.00713, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192501, 571, 1, 1, 4442.99, 1951.9, 459.093, 2.74016, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192254, 571, 1, 1, 5154.46, 2828.94, 409.189, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192255, 571, 1, 1, 5154.52, 2853.31, 409.183, 3.14159, 0, 0, 0, 1, 180, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192688, 571, 1, 1, 5916.1, 566.209, 639.625, -2.72271, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 192686, 571, 1, 1, 5664.81, 791.002, 653.698, -0.663223, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 180398, 571, 1, 1, 5665.02, 790.2, 653.698, -0.610864, 0, 0, 0, 1, 180, 100, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 256, 4855.63, 3297.62, 376.281, -3.13286, 0, 0, -0.99999, 0.00436634, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4526.46, 2810.18, 391.2, -2.99322, 0, 0, -0.997249, 0.0741182, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 256, 4517.75, 2717.23, 387.812, -1.53589, 0, 0, -0.694658, 0.71934, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4475.35, 1937.03, 459.07, -0.436332, 0, 0, -0.216439, 0.976296, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4451.76, 1928.1, 459.076, -2.00713, 0, 0, -0.843392, 0.537299, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4442.99, 1951.9, 459.093, 2.74016, 0, 0, 0.979924, 0.199371, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4466.8, 1960.44, 459.841, 1.15192, 0, 0, 0.54464, 0.83867, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 256, 5041.61, 3294.4, 382.15, -1.63188, 0, 0, -0.72837, 0.685184, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192278, 571, 1, 256, 5006.34, 3280.4, 371.163, 2.22529, 0, 0, 0.896872, 0.442291, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192278, 571, 1, 256, 4857.97, 3335.44, 368.881, -2.94959, 0, 0, -0.995395, 0.0958539, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4433.9, 3534.14, 360.275, -1.85005, 0, 0, -0.798636, 0.601815, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4572.93, 3475.52, 363.009, 1.42244, 0, 0, 0.652758, 0.757566, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4555.26, 3641.65, 419.974, 1.67551, 0, 0, 0.743143, 0.669133, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4574.87, 3625.91, 420.079, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4559.11, 3606.22, 419.999, -1.48353, 0, 0, -0.67559, 0.737277, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4539.42, 3622.49, 420.034, -3.07177, 0, 0, -0.999391, 0.0349043, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4401.63, 3377.46, 363.365, 1.55334, 0, 0, 0.700908, 0.713252, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4448.17, 3235.63, 370.412, -1.56207, 0, 0, -0.704015, 0.710185, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192488, 571, 1, 256, 4438.3, 3361.08, 371.299, -0.017451, 0, 0, -0.00872539, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 256, 4424.15, 3286.54, 371.546, 3.12412, 0, 0, 0.999962, 0.00873622, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4416.03, 2822.68, 430.475, -0.017452, 0, 0, -0.00872589, 0.999962, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4464.12, 2855.45, 406.111, 0.829032, 0, 0, 0.402747, 0.915311, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4398.82, 2804.7, 429.792, -1.58825, 0, 0, -0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4408.57, 2422.61, 377.179, 1.58825, 0, 0, 0.713251, 0.700909, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4416.59, 2414.08, 377.13, 0, 0, 0, 0, 1, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192461, 571, 1, 1, 4417.25, 2301.14, 377.214, 0.026179, 0, 0, 0.0130891, 0.999914, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 4805.67, 2407.48, 358.191, 1.78023, 0, 0, 0.777144, 0.629323, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 4811.4, 2441.9, 358.207, -2.0333, 0, 0, -0.85035, 0.526218, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192273, 571, 1, 1, 4778.19, 2438.06, 345.644, -2.94088, 0, 0, -0.994969, 0.100188, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192273, 571, 1, 1, 5024.57, 2532.75, 344.023, -1.93732, 0, 0, -0.824127, 0.566404, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 5004.35, 2486.36, 358.449, 2.17294, 0, 0, 0.884989, 0.465612, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192418, 571, 1, 1, 4983.28, 2503.09, 358.177, -0.427603, 0, 0, -0.212176, 0.977231, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 192290, 571, 1, 1, 4417.94, 2324.81, 371.577, 3.08051, 0, 0, 0.999534, 0.0305366, 300, 0, 1);
INSERT INTO `gameobject` VALUES (NULL, 193764, 571, 1, 1, 7625.87, 2060.05, 604.27, 0.07854, 0, 0, 0.99999, 0.004363, 180, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 193762, 571, 1, 1, 7625.66, 2060.04, 604.195, -3.05428, 0, 0, 0.99999, 0.004363, 180, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192319, 571, 1, 385, 5364.3, 2899.22, 435.691, -1.55334, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192287, 571, 1, 385, 5372.42, 2862.48, 409.366, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192323, 571, 1, 385, 5364.28, 2917.26, 445.332, 1.58825, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192305, 571, 1, 385, 5397.31, 2809.26, 455.102, 3.13286, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192286, 571, 1, 385, 5371.45, 2820.79, 409.427, 3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192334, 571, 1, 385, 5322.17, 2763.2, 444.974, -1.56207, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192307, 571, 1, 385, 5271.16, 2820.11, 445.109, -3.13286, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192306, 571, 1, 385, 5270.56, 2861.68, 444.917, -3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 385, 5160.28, 2798.6, 430.604, -3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 385, 5146.04, 2747.3, 433.527, 3.12412, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192328, 571, 1, 385, 5173.13, 2820.96, 435.658, 0.026179, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192252, 571, 1, 385, 5154.37, 2853.23, 409.183, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192253, 571, 1, 385, 5154.42, 2828.93, 409.189, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192292, 571, 1, 385, 5154.35, 2862.08, 445.01, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192299, 571, 1, 385, 5155.22, 2820.63, 444.979, -3.11539, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192327, 571, 1, 385, 5172.34, 2862.57, 435.658, 0, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 385, 5158.71, 2882.9, 431.274, 3.14159, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192487, 571, 1, 385, 5145.11, 2934.95, 433.255, -3.10665, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192267, 571, 1, 385, 4452.76, 2639.14, 358.444, 1.67552, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192449, 571, 1, 385, 4517.75, 2717.23, 387.812, -1.53589, 0, 0, 0, 1, 300, 255, 1);
INSERT INTO `gameobject` VALUES (NULL, 192450, 571, 1, 385, 4387.59, 2719.9, 390.201, -1.51843, 0, 0, 0, 1, 300, 255, 1);

SET @ENTRY := 30210;
SET @SPELL_READ_PRONOUNCEMENT := 56278;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL_READ_PRONOUNCEMENT,0,0,0,33,@ENTRY,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hodir's Helm KC Bunny - On Spellhit - Quest Credit"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Hodir's Helm KC Bunny - On Spellhit - Say Line 0"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,50,192080,30000,0,0,0,0,8,0,0,0,7390.143066,-2725.382080,874.256104,2.973291,"Hodir's Helm KC Bunny - On Spellhit - Summon Hodir's Helm");

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Sons of Hodir! I humbly present to you... The Helm of Hodir!",42,0,100,0,0,0,"Hodir's Helm KC Bunny");

UPDATE `gameobject_template` SET `flags`=`flags`|36 WHERE `entry`=192080;

DELETE FROM `conditions` WHERE `SourceEntry`=@SPELL_READ_PRONOUNCEMENT AND `ConditionValue2`=@ENTRY;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`Comment`) VALUES
(13,0,@SPELL_READ_PRONOUNCEMENT,18,1,@ENTRY,"Read Pronouncement targets Hodir's Helm KC Bunny");

DELETE FROM `creature` WHERE `id`=@ENTRY;
INSERT INTO `creature` (`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@ENTRY,571,1,1,0,0,7390.14,-2725.38,874.256,2.90103,300,0,0,42,0,0,0,0,0);

-- Fixe Portal nach Dalaran (Eiskronzitadelle)
DELETE FROM spell_target_position WHERE id = 71512;
INSERT INTO `spell_target_position` 
(`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) 
VALUES 
(71512, 571, 5807.810059, 588.227783, 660.939087, 1.650267);

UPDATE creature_template SET AIName='SmartAI' WHERE entry=24786;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=24786 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(24786, 0, 0, 1, 8, 0, 100, 0, 44454, 0, 0, 0, 11, 44456, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ''),
(24786, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '');

UPDATE creature_template SET ScriptName='npc_attracted_reef_bull' WHERE entry=24804;

DELETE FROM spell_script_names WHERE spell_id=21014;
INSERT INTO spell_script_names VALUES (21014, 'spell_anuniaqs_net');

UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13668;
UPDATE `quest_template` SET `PrevQuestId`=13668, `NextQuestId`=13678, `ExclusiveGroup`=-13829, `NextQuestIdChain`=0 WHERE `Id` IN (13829, 13839, 13838);

UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestIdChain`=0 WHERE `Id`=13673;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestIdChain`=0 WHERE `Id`=13675;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestIdChain`=0 WHERE `Id`=13674;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13676;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13677;

UPDATE `quest_template` SET `PrevQuestId`=13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13680;

UPDATE `quest_template` SET `PrevQuestId`=13680 WHERE `Id` IN (13691, 13693, 13694, 13695, 13696);
UPDATE `quest_template` SET `RequiredRaces`=2, `NextQuestId`=13697, `NextQuestIdChain`=13697, `ExclusiveGroup`=13691 WHERE `Id`=13691;
UPDATE `quest_template` SET `RequiredRaces`=128, `NextQuestId`=13719, `NextQuestIdChain`=13719, `ExclusiveGroup`=13693 WHERE `Id`=13693;
UPDATE `quest_template` SET `RequiredRaces`=32, `NextQuestId`=13720, `NextQuestIdChain`=13720, `ExclusiveGroup`=13694 WHERE `Id`=13694;
UPDATE `quest_template` SET `RequiredRaces`=16, `NextQuestId`=13721, `NextQuestIdChain`=13721, `ExclusiveGroup`=13695 WHERE `Id`=13695;
UPDATE `quest_template` SET `RequiredRaces`=512, `NextQuestId`=13722, `NextQuestIdChain`=13722, `ExclusiveGroup`=13696 WHERE `Id`=13696;

UPDATE `quest_template` SET `PrevQuestId`=13701 WHERE `Id` IN (13707, 13708, 13709, 13710, 13711); -- TOScript en el core (revisar 13687)
UPDATE `quest_template` SET `NextQuestId`=13697, `NextQuestIdChain`=13697, `ExclusiveGroup`=13691 WHERE `Id`=13707;
UPDATE `quest_template` SET `NextQuestId`=13719, `NextQuestIdChain`=13719, `ExclusiveGroup`=13693 WHERE `Id`=13708;
UPDATE `quest_template` SET `NextQuestId`=13720, `NextQuestIdChain`=13720, `ExclusiveGroup`=13694 WHERE `Id`=13709;
UPDATE `quest_template` SET `NextQuestId`=13721, `NextQuestIdChain`=13721, `ExclusiveGroup`=13695 WHERE `Id`=13710;
UPDATE `quest_template` SET `NextQuestId`=13722, `NextQuestIdChain`=13722, `ExclusiveGroup`=13696 WHERE `Id`=13711;
UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `Id` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13680 WHERE `Id`=13678;
UPDATE `quest_template` SET `NextQuestId`=13726, `NextQuestIdChain`=13726 WHERE `Id`=13697;
UPDATE `quest_template` SET `NextQuestId`=13727, `NextQuestIdChain`=13727  WHERE `Id`=13719;
UPDATE `quest_template` SET `NextQuestId`=13728, `NextQuestIdChain`=13728  WHERE `Id`=13720;
UPDATE `quest_template` SET `NextQuestId`=13729, `NextQuestIdChain`=13729  WHERE `Id`=13721;
UPDATE `quest_template` SET `NextQuestId`=13731, `NextQuestIdChain`=13731  WHERE `Id`=13722;

UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=13762, `NextQuestIdChain`=0 WHERE `Id` IN (13762, 13763, 13764);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=13768, `NextQuestIdChain`=0 WHERE `Id` IN (13768, 13769, 13770);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=13773, `NextQuestIdChain`=0 WHERE `Id` IN (13773, 13774, 13775);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=13778, `NextQuestIdChain`=0 WHERE `Id` IN (13778, 13779, 13780);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=13783, `NextQuestIdChain`=0 WHERE `Id` IN (13783, 13784, 13785);

UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13765, 13767, 13856);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13771, 13772, 13857);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13776, 13777, 13858);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13781, 13782, 13860);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13786, 13787, 13859);

UPDATE `quest_template` SET `PrevQuestId`=13697, `NextQuestId`=13736, `ExclusiveGroup`=0, `NextQuestIdChain`=13736 WHERE `Id`=13726;
UPDATE `quest_template` SET `PrevQuestId`=13719, `NextQuestId`=13737, `ExclusiveGroup`=0, `NextQuestIdChain`=13737 WHERE `Id`=13727;
UPDATE `quest_template` SET `PrevQuestId`=13720, `NextQuestId`=13738, `ExclusiveGroup`=0, `NextQuestIdChain`=13738 WHERE `Id`=13728;
UPDATE `quest_template` SET `PrevQuestId`=13721, `NextQuestId`=13739, `ExclusiveGroup`=0, `NextQuestIdChain`=13739 WHERE `Id`=13729;
UPDATE `quest_template` SET `PrevQuestId`=13722, `NextQuestId`=13740, `ExclusiveGroup`=0, `NextQuestIdChain`=13740 WHERE `Id`=13731;

UPDATE `quest_template` SET `PrevQuestId`=13726, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13736;
UPDATE `quest_template` SET `PrevQuestId`=13727, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13737;
UPDATE `quest_template` SET `PrevQuestId`=13728, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13738;
UPDATE `quest_template` SET `PrevQuestId`=13729, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13739;
UPDATE `quest_template` SET `PrevQuestId`=13740, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13740;

UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `Id` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `Id` IN (13726, 13727, 13728, 13729, 13731);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `Id` IN (13736, 13737, 13738, 13739, 13740);


UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13667;
UPDATE `quest_template` SET `PrevQuestId`=13667, `NextQuestId`=13672, `ExclusiveGroup`=-13828, `NextQuestIdChain`=0 WHERE `Id` IN (13828, 13837, 13835);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13679 WHERE `Id`=13672;

UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestIdChain`=0 WHERE `Id`=13666;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestIdChain`=0 WHERE `Id`=13670;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestIdChain`=0 WHERE `Id`=13669;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13671;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13625;

UPDATE `quest_template` SET `PrevQuestId`=13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13679;

UPDATE `quest_template` SET `PrevQuestId`=13679 WHERE `Id` IN (13684, 13685, 13689, 13688, 13690);
UPDATE `quest_template` SET `RequiredRaces`=1, `NextQuestId`=13718, `NextQuestIdChain`=13718, `ExclusiveGroup`=13684 WHERE `Id`=13684;
UPDATE `quest_template` SET `RequiredRaces`=4, `NextQuestId`=13714, `NextQuestIdChain`=13714, `ExclusiveGroup`=13685 WHERE `Id`=13685;
UPDATE `quest_template` SET `RequiredRaces`=8, `NextQuestId`=13717, `NextQuestIdChain`=13717, `ExclusiveGroup`=13689 WHERE `Id`=13689;
UPDATE `quest_template` SET `RequiredRaces`=64, `NextQuestId`=13715, `NextQuestIdChain`=13715, `ExclusiveGroup`=13688 WHERE `Id`=13688;
UPDATE `quest_template` SET `RequiredRaces`=1024, `NextQuestId`=13716, `NextQuestIdChain`=13716, `ExclusiveGroup`=13690 WHERE `Id`=13690;

UPDATE `quest_template` SET `PrevQuestId`=13700 WHERE `Id` IN (13593, 13703, 13706, 13704, 13705); -- TOScript into the core (check of 13686)
UPDATE `quest_template` SET `NextQuestId`=13718, `NextQuestIdChain`=13718, `ExclusiveGroup`=13718 WHERE `Id`=13593;
UPDATE `quest_template` SET `NextQuestId`=13714, `NextQuestIdChain`=13714, `ExclusiveGroup`=13714 WHERE `Id`=13703;
UPDATE `quest_template` SET `NextQuestId`=13717, `NextQuestIdChain`=13717, `ExclusiveGroup`=13717 WHERE `Id`=13706;
UPDATE `quest_template` SET `NextQuestId`=13715, `NextQuestIdChain`=13715, `ExclusiveGroup`=13715 WHERE `Id`=13704;
UPDATE `quest_template` SET `NextQuestId`=13716, `NextQuestIdChain`=13716, `ExclusiveGroup`=13716 WHERE `Id`=13705;
UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `Id` IN (13718, 13714, 13717, 13715, 13716);
UPDATE `quest_template` SET `NextQuestId`=13699, `NextQuestIdChain`=13699 WHERE `Id`=13718;
UPDATE `quest_template` SET `NextQuestId`=13713, `NextQuestIdChain`=13713  WHERE `Id`=13714;
UPDATE `quest_template` SET `NextQuestId`=13725, `NextQuestIdChain`=13725  WHERE `Id`=13717;
UPDATE `quest_template` SET `NextQuestId`=13723, `NextQuestIdChain`=13723  WHERE `Id`=13715;
UPDATE `quest_template` SET `NextQuestId`=13724, `NextQuestIdChain`=13724  WHERE `Id`=13716;

UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=13603, `NextQuestIdChain`=0 WHERE `Id` IN (13603, 13600, 13616);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=13741, `NextQuestIdChain`=0 WHERE `Id` IN (13741, 13742, 13743);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=13757, `NextQuestIdChain`=0 WHERE `Id` IN (13757, 13758, 13759);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=13746, `NextQuestIdChain`=0 WHERE `Id` IN (13746, 13747, 13748);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=13752, `NextQuestIdChain`=0 WHERE `Id` IN (13752, 13753, 13754);

UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13592, 13665, 13847);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13744, 13745, 13851);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13760, 13761, 13855);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13749, 13750, 13852);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13755, 13756, 13854);

UPDATE `quest_template` SET `PrevQuestId`=13718, `NextQuestId`=13702, `ExclusiveGroup`=0, `NextQuestIdChain`=13702 WHERE `Id`=13699;
UPDATE `quest_template` SET `PrevQuestId`=13714, `NextQuestId`=13732, `ExclusiveGroup`=0, `NextQuestIdChain`=13732 WHERE `Id`=13713;
UPDATE `quest_template` SET `PrevQuestId`=13717, `NextQuestId`=13735, `ExclusiveGroup`=0, `NextQuestIdChain`=13735 WHERE `Id`=13725;
UPDATE `quest_template` SET `PrevQuestId`=13715, `NextQuestId`=13733, `ExclusiveGroup`=0, `NextQuestIdChain`=13733 WHERE `Id`=13723;
UPDATE `quest_template` SET `PrevQuestId`=13716, `NextQuestId`=13734, `ExclusiveGroup`=0, `NextQuestIdChain`=13734 WHERE `Id`=13724;

UPDATE `quest_template` SET `PrevQuestId`=13699, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13702;
UPDATE `quest_template` SET `PrevQuestId`=13713, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13732;
UPDATE `quest_template` SET `PrevQuestId`=13725, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13735;
UPDATE `quest_template` SET `PrevQuestId`=13723, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13733;
UPDATE `quest_template` SET `PrevQuestId`=13734, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13734;

UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `Id` IN (13718, 13714, 13717, 13715, 13716);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `Id` IN (13699, 13713, 13725, 13723, 13724);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `Id` IN (13702, 13732, 13735, 13733, 13734);

UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=13641, `ExclusiveGroup`=13633, `NextQuestIdChain`=13641 WHERE `Id` IN (13633, 13634);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13643 WHERE `Id`=13641;
UPDATE `quest_template` SET `PrevQuestId`=13641, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13654 WHERE `Id`=13643;
UPDATE `quest_template` SET `PrevQuestId`=13643, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13663 WHERE `Id`=13654;
UPDATE `quest_template` SET `PrevQuestId`=13654, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13664 WHERE `Id`=13663;
UPDATE `quest_template` SET `PrevQuestId`=13663, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=14016 WHERE `Id`=13664;
UPDATE `quest_template` SET `PrevQuestId`=13664, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=14017 WHERE `Id`=14016;
UPDATE `quest_template` SET `PrevQuestId`=14016, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=14017;

UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13794; -- Eadric the Pure 
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13795; -- The Scourgebane

UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13790; -- Alliance Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13793; -- Alliance DK Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13811; -- Horde Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13814; -- Horde DK Among The Champions

UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13861; -- Alliance Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13864; -- Alliance DK Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13862; -- Horde Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13863; -- Horde DK Battle Before The Citadel

UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13789; -- Alliance Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13791; -- Alliance DK Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13810; -- Horde Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13813; -- Horde DK Taking Battle To The Enemy

UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13682; -- Alliance Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13788; -- Alliance DK Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13809; -- Horde Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13812; -- Horde DK Threat From Above

UPDATE `quest_template` SET `ExclusiveGroup`=14102, `NextQuestId`=0, `NextQuestIdChain`=0 WHERE `Id` IN (14102, 14101, 14104, 14105);

UPDATE `quest_template` SET `ExclusiveGroup`=14107, `NextQuestId`=0, `NextQuestIdChain`=0 WHERE `Id` IN (14107, 14108, 14095);

UPDATE `quest_template` SET `PrevQuestId`=13700, `RequiredMinRepFaction`=1094, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestIdChain`=0 WHERE `Id` IN (14112, 14076, 14090, 14096, 14152, 14080, 14077, 14074); -- Alliance
UPDATE `quest_template` SET `PrevQuestId`=13701, `RequiredMinRepFaction`=1124, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestIdChain`=0 WHERE `Id` IN (14145, 14092, 14141, 14142, 14136, 14140, 14144, 14143); -- Horde

UPDATE `quest_template` SET `ExclusiveGroup`=14112 WHERE `Id` IN (14112, 14145, 14076, 14092, 14090, 14141); -- A1, H1, A2, H2, A3, H3

UPDATE `quest_template` SET `ExclusiveGroup`=14152 WHERE `Id` IN (14152, 14136, 14080, 14140, 14077, 14144, 14074, 14143); -- A1, H1, A2, H2, A3, H3, A4, H4
UPDATE `quest_template` SET `NextQuestId`=13846, `ExclusiveGroup`=13700 WHERE `Id` IN (13700, 13701); -- Alliance, Horde
UPDATE `quest_template` SET `RequiredMaxRepFaction`=1106, `RequiredMaxRepValue`=42000 WHERE `Id`=13846;
DELETE FROM `creature_questrelation` WHERE `quest` IN (13820, 13681, 13627);

DELETE FROM `creature_template` WHERE (`entry`=50004);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES 
(50004, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'High Overlord Saurfang', '', '', 0, 80, 80, 3, 1802, 1802, 0, 0, 0, 1, 1, 252, 357, 0, 304, '7.5', 2000, 0, 1, 33554432, 8, 0, 0, 0, 0, 0, 215, 320, 44, 7, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1000, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 12340);

DELETE FROM `creature_template` WHERE (`entry`=50006);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
(50006, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'Muradin Bronzebeard', '', '', 10875, 83, 83, 2, 1802, 1802, 1, 1, '1.14286', 1, 1, 468, 702, 0, 175, '47.2', 2000, 2000, 1, 33554432, 8, 0, 0, 0, 0, 0, 374, 562, 140, 7, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15284, 70309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 175, 1, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, 0, '', 12340);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (50004, 50006);

UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` IN (36939, 38156, 38637, 38638);

UPDATE `creature_template` SET `faction_A` = 1801, `faction_H` = 1801, `baseattacktime` = 2000, `rangeattacktime` = 2000, `unit_flags` = 32832, `spell1` = 71339, `spell2` = 70161, `spell3` = 72539, `mechanic_immune_mask` = 73745 WHERE `entry` IN (36968, 38403, 38675, 38676);
UPDATE `creature_template` SET `faction_A` = 1802, `faction_H` = 1802, `baseattacktime` = 2000, `rangeattacktime` = 2000, `unit_flags` = 32832, `spell1` = 71335, `spell2` = 70162, `spell3` = 72566, `mechanic_immune_mask` = 73745 WHERE `entry` IN (36969, 38408, 38689, 38690);

-- Spawn fix for TDB GUIDs
DELETE FROM `creature` WHERE `id`=37003;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(200988, 37003, 631, 15, 1, 0, 0, -562.385, 2217.58, 199.969, 3.46228, 86400, 0, 0, 398434, 41690, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id`=37026;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(201020, 37026, 631, 15, 1, 0, 0, -571.091, 2219.71, 199.969, 5.06842, 86400, 0, 0, 269600, 91600, 0, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName` = 'npc_muradin_gunship' WHERE `entry` = 36948;
UPDATE `creature_template` SET `ScriptName` = 'npc_saurfang_gunship' WHERE `entry` = 36939;
UPDATE `creature_template` SET `ScriptName` = 'npc_zafod_boombox' WHERE `entry` = 37184;
UPDATE `creature_template` SET `ScriptName` = 'npc_korkron_defender' WHERE `entry` = 37032;
UPDATE `creature_template` SET `ScriptName` = 'npc_korkron_primalist' WHERE `entry` = 37030;
UPDATE `creature_template` SET `ScriptName` = 'npc_skybreaker_vindicator' WHERE `entry` = 37003;
UPDATE `creature_template` SET `ScriptName` = 'npc_skybreaker_protector' WHERE `entry` = 36998;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_spire_frostwyrm' WHERE `entry` = 37230;
UPDATE `creature_template` SET `ScriptName` = 'npc_korkron_axethrower_rifleman' WHERE `entry` = 36968;
UPDATE `creature_template` SET `ScriptName` = 'npc_korkron_axethrower_rifleman' WHERE `entry` = 36969;
UPDATE `creature_template` SET `ScriptName` = 'npc_mortar_soldier_or_rocketeer', AIName = '' WHERE `entry` = 36982;
UPDATE `creature_template` SET `ScriptName` = 'npc_mortar_soldier_or_rocketeer', AIName = '' WHERE `entry` = 36978;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_mage' WHERE `entry` = 37117;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_mage' WHERE `entry` = 37116;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_trigger' WHERE `entry` = 37547;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_portal' WHERE `entry` = 37227;
UPDATE `creature_template` SET `ScriptName` = 'npc_marine_or_reaver' WHERE `entry` = 36957;
UPDATE `creature_template` SET `ScriptName` = 'npc_marine_or_reaver' WHERE `entry` = 36950;
UPDATE `creature_template` SET `ScriptName` = 'npc_sergeant' WHERE `entry` = 36960;
UPDATE `creature_template` SET `ScriptName` = 'npc_sergeant' WHERE `entry` = 36961;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_skybreaker' WHERE `entry` = 37540;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_orgrimmar' WHERE `entry` = 37215;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_cannon' WHERE `entry` = 36838;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_cannon' WHERE `entry` = 36839;

UPDATE `gameobject_template` SET `ScriptName` = 'transport_gunship' WHERE `entry` IN (201580, 201812);


DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5630, 5628);
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5628,'at_icc_land_frostwyrm'),
(5630,'at_icc_land_frostwyrm');

-- SpellScripts
DELETE FROM `spell_script_names` WHERE `spell_id` IN (70713, 68645, 69471, 69488, 69402, 70175, 71335, 71339);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('70713', 'spell_icc_remove_rocket_pack'),
('68645', 'spell_rocket_pack'),
('69471', 'spell_gb_heat_drain'),
('69488', 'spell_gb_overheat_drain'),
('69402', 'spell_gb_incinerating_blast'),
('70175', 'spell_gb_incinerating_blast'),
('71335', 'spell_gb_burning_pitch'),
('71339', 'spell_gb_burning_pitch');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (69400, 70173, 69402, 70175, 70374, 70383, 72959);
SET @ENTRYA := 37540;
SET @ENTRYH := 37215;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`) VALUES
('13', '69400', '18', '1', @ENTRYA),
('13', '70173', '18', '1', @ENTRYH),
('13', '69402', '18', '1', @ENTRYA),
('13', '70175', '18', '1', @ENTRYH),
('13', '70374', '18', '1', @ENTRYA),
('13', '70383', '18', '1', @ENTRYH),
('13', '72959', '18', '1', 0);

DELETE FROM transports WHERE entry IN (201580, 201581, 201811, 201812);
DELETE FROM creature WHERE id IN (37230, 36838, 36839, 36948, 36939);
DELETE FROM `creature_template_addon` WHERE (`entry`=37547);
UPDATE `creature_template` SET `flags_extra` = 130 WHERE `entry` = 37547;

UPDATE `creature_template` SET `exp` = 2, `VehicleId` = 554, `RegenHealth` = 0, `npcflag` = 16777216, `spell1` = 69399, `spell2` = 69401 WHERE entry = 36839;
UPDATE `creature_template` SET `exp` = 2, `VehicleId` = 554, `RegenHealth` = 0, `npcflag` = 16777216, `spell1` = 70172, `spell2` = 70174 WHERE entry = 36838;
REPLACE INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `cast_flags`) VALUES
('36838', '46598', '0', '1'),
('36839', '46598', '0', '1');

DELETE FROM `creature_template_addon` WHERE `entry` IN (36838, 36839);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(36838, 0, 0, 0, 1, 0, 69470),
(36839, 0, 0, 0, 1, 0, 69470);

UPDATE `creature_template` SET `difficulty_entry_1` = '38129',`difficulty_entry_2` = '38701', `difficulty_entry_3` = '38702' WHERE `entry` =37215;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `minlevel` = 83, `maxlevel` = 83, `unit_flags` = 4, `flags_extra` = 2, `modelid1` = 1126, `modelid2` = 11686 WHERE `entry` IN (37215, 38129, 38701, 38702, 37540, 38128, 38699, 38700);

-- Add spell conditions for 69705 (Below Zero)
SET @SPELL := 69705;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=@SPELL;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,@SPELL,0,18,1,36838,0,0,'','Gunship Battle - Spell 69705 (Below Zero) target creature 36838'),
(13,0,@SPELL,0,18,1,36839,0,0,'','Gunship Battle - Spell 69705 (Below Zero) target creature 36839');


-- Linked spells
-- TODO Need more love
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 71193 AND `spell_effect` = -71188;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 71195 AND `spell_effect` = -71193;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 68645 AND `spell_effect` = 69193;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 73077 AND `spell_effect` = 69188;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 73077 AND `spell_effect` = 68721;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 69193 AND `spell_effect` = 69192;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(71193, -71188, 0, 'Gunship Battle - Veteran removes Experimented'),
(71195, -71193, 0, 'Gunship Battle - Elite removes Veteran'),
(73077, 69188, 2, 'Gunship Battle - Fix visual for Rocket Pack'),
(68645, 69193, 0, 'Gunship Battle - Fix visual for Rocket Pack'),
(69193, 69192, 0, 'Gunship Battle - Cast Rocket Burst when landing with Rocket Pack');

-- Battle Standards Spells
UPDATE `creature_template` SET `unit_flags` = 33554564, `flags_extra` = 2 WHERE `entry` IN (37044, 37041);
UPDATE `creature_template` SET `faction_A` = 1801, `faction_H` = 1801 WHERE `entry` = 37044;
UPDATE `creature_template` SET `faction_A` = 1802, `faction_H` = 1802 WHERE `entry` = 37041;
DELETE FROM `creature_template_addon` WHERE `entry` IN (37044, 37041);
SET @KORKRON := 37044; -- Kor'kron Battle Standard
SET @SKYBREAKER := 37041; -- Skybreaker Battle Standard
SET @HSPELL := 69809;
SET @ASPELL := 69808;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@KORKRON, @SKYBREAKER);
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@KORKRON, @SKYBREAKER);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@KORKRON ,0,0,0,25,0,100,1,0,0,0,0,11,@HSPELL,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Kor''kron Battle Standard - On spawn & reset - Cast spell 69809'),
(@SKYBREAKER,0,0,0,25,0,100,1,0,0,0,0,11,@ASPELL,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Skybreaker Battle Standard - On spawn & reset - Cast spell 69808');


REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(50004, 1, 0, 'Reavers, Sergeants, attack!.', 14, 0, 0, 0, 0, 17081, ''),
(50004, 0, 0, 'This is not your battle, dwarf. Back down or we will be forced to destroy your ship.', 14, 0, 0, 0, 0, 17093, ''),
(50006, 1, 0, 'Marines! Sergeants! Attack!', 14, 0, 0, 0, 0, 16956, ''),
(50006, 0, 0, 'Move yer jalopy or well blow it out of the sky, orc! The Hordes got no business here!', 14, 0, 0, 0, 0, 16969, '');

-- Texts
SET @MURADIN := 36948;
SET @OVERLORD := 36939;
SET @PRIMALIST := 37030;
SET @INVOKER := 37033;
SET @DEFENDER := 37032;
SET @VINDICATOR := 37003;
SET @SORCERER := 37026;
SET @PROTECTOR := 36998;
SET @FROSTWYRM := 37230;
SET @SOUNDID :=0;
DELETE FROM `creature_text` WHERE `entry` IN (36948, 36939, 37030, 37033, 37032, 37003, 37026, 36998, 37230);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@MURADIN,  0, 0, 'Fire up the engines! We got a meetin'' with destiny, lads!', 14, 0, 100, 0, 0, 16962, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_0'),
(@MURADIN,  1, 0, 'Hold on to yer hats!', 14, 0, 100, 0, 0, 16963, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_1'),
(@MURADIN,  2, 0, 'What in the world is that? Grab me spyglass, crewman!', 14, 0, 100, 0, 0, 16964, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_2'),
(@MURADIN,  3, 0, 'By me own beard! HORDE SAILIN'' IN FAST ''N HOT!', 14, 0, 100, 0, 0, 16965, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_3'),
(@MURADIN,  4, 0, 'EVASIVE ACTION! MAN THE GUNS!', 14, 0, 100, 0, 0, 16966, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_4'),
(@MURADIN,  5, 0, 'Cowardly dogs! Ye blindsided us!', 14, 0, 100, 0, 0, 16967, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_5'),
(@MURADIN,  6, 0, 'Not me battle? I dunnae who ye? think ye are, mister, but I got a score to settle with Arthas and yer not gettin'' in me way! FIRE ALL GUNS! FIRE! FIRE!', 14, 0, 100, 0, 0, 16968, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_7'),
(@MURADIN,  7, 0, 'Move yer jalopy or we''ll blow it out of the sky, orc! The Horde''s got no business here!', 14, 0, 100, 0, 0, 16969, 'Muradin Bronzebeard - SAY_INTRO_HORDE_3'),
(@MURADIN,  8, 0, 'What''s this then?! Ye won''t be takin'' this son o'' Ironforge''s vessel without a fight!.', 14, 0, 100, 0, 0, 16958, 'Muradin Bronzebeard - SAY_BOARDING_SKYBREAKER_1'),
(@MURADIN,  9, 0, 'Marines, Sergeants, attack!', 14, 0, 100, 0, 0, 16956, 'Muradin Bronzebeard - SAY_BOARDING_ORGRIMS_HAMMER_0'),
(@MURADIN, 10, 0, 'Riflemen, shoot faster!', 14, 0, 100, 0, 0, 16954, 'Muradin Bronzebeard - SAY_NEW_RIFLEMEN_SPAWNED'),
(@MURADIN, 11, 0, 'Mortar team, reload!', 14, 0, 100, 0, 0, 16955, 'Muradin Bronzebeard - SAY_NEW_MORTAR_TEAM_SPAWNED'),
(@MURADIN, 12, 0, 'We''re taking hull damage, get a sorcerer out here to shut down those cannons!', 14, 0, 100, 0, 0, 16957, 'Muradin Bronzebeard - SAY_NEW_MAGE_SPAWNED'),
(@MURADIN, 13, 0, 'Don''t say I didn''t warn ya, scoundrels! Onward, brothers and sisters!', 14, 0, 100, 0, 0, 16959, 'Muradin Bronzebeard - SAY_ALLIANCE_VICTORY'),
(@MURADIN, 14, 0, 'Captain Bartlett, get us out of here! We''re taken too much damage to stay afloat!', 14, 0, 100, 0, 0, 16960, 'Muradin Bronzebeard - SAY_ALLIANCE_DEFEAT'),
(@OVERLORD, 0, 0, 'Rise up, sons and daughters of the Horde! Today we battle a hated enemy of the Horde! LOK''TAR OGAR!', 14, 0, 100, 0, 0, 17087, 'High Overlord Saurfang - SAY_INTRO_HORDE_0'),
(@OVERLORD, 1, 0, 'Kor''kron, take us out!', 14, 0, 100, 0, 0, 17088, 'High Overlord Saurfang - SAY_INTRO_HORDE_1_1'),
(@OVERLORD, 2, 0, 'What is that?! Something approaching in the distance!', 14, 0, 100, 0, 0, 17089, 'High Overlord Saurfang - SAY_INTRO_HORDE_1'),
(@OVERLORD, 3, 0, 'ALLIANCE GUNSHIP! ALL HANDS ON DECK!', 14, 0, 100, 0, 0, 17090, 'High Overlord Saurfang - SAY_INTRO_HORDE_2'),
(@OVERLORD, 4, 0, 'You will know our business soon! KOR''KRON, ANNIHILATE THEM!', 14, 0, 100, 0, 0, 17092, 'High Overlord Saurfang - SAY_INTRO_HORDE_4'),
(@OVERLORD, 5, 0, 'Reavers, Sergeants, attack!', 14, 0, 100, 0, 0, 17081, 'High Overlord Saurfang - SAY_BOARDING_SKYBREAKER_0'),
(@OVERLORD, 6, 0, 'You DARE board my ship? Your death will come swiftly.', 14, 0, 100, 0, 0, 17083, 'High Overlord Saurfang - SAY_BOARDING_ORGRIMS_HAMMER_1'),
(@OVERLORD, 7, 0, 'Axethrowers, hurl faster!', 14, 0, 100, 0, 0, 17079, 'High Overlord Saurfang - SAY_NEW_AXETHROWER_SPAWNED'),
(@OVERLORD, 8, 0, 'Rocketeers, reload!', 14, 0, 100, 0, 0, 17080, 'High Overlord Saurfang - SAY_NEW_ROCKETEERS_SPAWNED'),
(@OVERLORD, 9, 0, 'We''re taking hull damage, get a battle-mage out here to shut down those cannons!', 14, 0, 100, 0, 0, 17082, 'High Overlord Saurfang - SAY_NEW_BATTLE_MAGE_SPAWNED'),
(@OVERLORD, 10, 0, 'The Alliance falter. Onward to the Lich King!', 14, 0, 100, 0, 0, 17084, 'High Overlord Saurfang - SAY_HORDE_VICTORY'),
(@OVERLORD, 11, 0, 'Damage control! Put those fires out! You haven''t seen the last of the Horde!', 14, 0, 100, 0, 0, 17085, 'High Overlord Saurfang - SAY_HORDE_DEFEAT'),
(@OVERLORD, 12, 0, 'This is not your battle, dwarf. Back down or we will be forced to destroy your ship.', 14, 0, 100, 0, 0, 17093, 'High Overlord Saurfang - SAY_INTRO_ALLIANCE_6'),
(@PRIMALIST,0, 0, 'Thank the spirits for you, brothers and sisters. The Skybreaker has already left. Quickly now, to Orgrim''s Hammer! If you leave soon, you may be able to catch them.', 12, 0, 100, 0, 0, @SOUNDID, 'Kor''kron Primalist - SAY_FIRST_SQUAD_RESCUED_HORDE_0'),
(@INVOKER,  0, 0, 'This should be helpin''ya!', 12, 0, 100, 0, 0, @SOUNDID, 'Kor''kron Invoker - SAY_FIRST_SQUAD_RESCUED_HORDE_1'),
(@INVOKER,  1, 0, '%s summons a Kor''kron Battle Standard.', 16, 0, 100, 0, 0, @SOUNDID, 'Kor''kron Invoker - SAY_SUMMON_BATTLE_STANDARD'),
(@DEFENDER, 0, 0, 'Aka''Magosh, brave warriors. The alliance is in great number here.', 12, 0, 100, 0, 0, @SOUNDID, 'Kor''kron Defender - SAY_SECOND_SQUAD_RESCUED_HORDE_0'),
(@DEFENDER, 1, 0, 'Captain Saurfang will be pleased to see you aboard Orgrim''s Hammer. Make haste, we will secure the area until you are ready for take-off.', 12, 0, 100, 0, 0, @SOUNDID, 'Kor''kron Defender - SAY_SECOND_SQUAD_RESCUED_HORDE_1'),
(@DEFENDER, 2, 0, 'A screeching cry pierces the air above!',41, 0, 100, 0, 0, @SOUNDID, 'Frostwyrm - SAY_FROSTWYRM_SUMMON_0'),
(@VINDICATOR, 0, 0, 'Thank goodness you arrived when you did, heroes. Orgrim''s Hammer has already left. Quickly now, to The Skybreaker! If you leave soon, you may be able to catch them.', 12, 0, 100, 0, 0, @SOUNDID, 'Skybreaker Vindicator - SAY_FIRST_SQUAD_RESCUED_ALLIANCE_0'),
(@SORCERER, 0, 0, 'This ought to help!', 12, 0, 100, 0, 0, @SOUNDID, 'Skybreaker Sorcerer - SAY_FIRST_SQUAD_RESCUED_ALLIANCE_1'),
(@SORCERER, 1, 0, '%s summons a Skybreaker Battle Standard.', 16, 0, 100, 0, 0, @SOUNDID, 'Skybreaker Sorcerer - SAY_SUMMON_BATTLE_STANDARD'),
(@PROTECTOR,0, 0, 'You have my thanks. We were outnumbered until you arrived.', 12, 0, 100, 0, 0, @SOUNDID, 'Skybreaker Protector - SAY_SECOND_SQUAD_RESCUED_ALLIANCE_0'),
(@PROTECTOR,1, 0, 'Captain Muradin is waiting aboard The Skybreaker. We''ll secure the area until you are ready for take off.', 12, 0, 100, 0, 0, @SOUNDID, 'Skybreaker Protector - SAY_SECOND_SQUAD_RESCUED_ALLIANCE_1'),
(@PROTECTOR,2, 0, 'Skybreaker infantry, hold position!', 12, 0, 100, 0, 0, @SOUNDID, 'Skybreaker Protector - SAY_SECOND_SQUAD_RESCUED_ALLIANCE_2'),
(@PROTECTOR,3, 0, 'A screeching cry pierces the air above!',41, 0, 100, 0, 0, @SOUNDID, 'Frostwyrm - SAY_FROSTWYRM_SUMMON_0'),
(@FROSTWYRM,0, 0, 'A Spire Frostwyrm lands just before Orgrim''s Hammer.', 16, 0, 100, 0, 0, @SOUNDID, 'Frostwyrm - SAY_FROSTWYRM_LAND_H_1'),
(@FROSTWYRM,1, 0, 'A Spire Frostwyrm lands just before The Skybreaker. ', 16, 0, 100, 0, 0, @SOUNDID, 'Frostwyrm - SAY_FROSTWYRM_LAND_A_2');

-- Chests loot
DELETE FROM `gameobject_loot_template` WHERE (`entry`=201872);
INSERT INTO `gameobject_loot_template` VALUES 
(201872, 49426, 100, 1, 0, 2, 2),
(201872, 50340, 0, 1, 1, 1, 1),
(201872, 50787, 0, 1, 1, 1, 1),
(201872, 50788, 0, 1, 1, 1, 1),
(201872, 50789, 0, 1, 2, 1, 1),
(201872, 50790, 0, 1, 2, 1, 1),
(201872, 50791, 0, 1, 1, 1, 1),
(201872, 50792, 0, 1, 2, 1, 1),
(201872, 50793, 0, 1, 1, 1, 1),
(201872, 50794, 0, 1, 1, 1, 1),
(201872, 50795, 0, 1, 2, 1, 1),
(201872, 50796, 0, 1, 2, 1, 1),
(201872, 50797, 0, 1, 2, 1, 1);

DELETE FROM `gameobject_loot_template` WHERE (`entry`=201873);
INSERT INTO `gameobject_loot_template` VALUES 
(201873, 49426, 100, 1, 0, 2, 2),
(201873, 49908, 10, 1, 0, 1, 1),
(201873, 49998, 0, 1, 1, 1, 1),
(201873, 49999, 0, 1, 2, 1, 1),
(201873, 50000, 0, 1, 2, 1, 1),
(201873, 50001, 0, 1, 3, 1, 1),
(201873, 50002, 0, 1, 2, 1, 1),
(201873, 50003, 0, 1, 3, 1, 1),
(201873, 50005, 0, 1, 1, 1, 1),
(201873, 50006, 0, 1, 3, 1, 1),
(201873, 50008, 0, 1, 1, 1, 1),
(201873, 50009, 0, 1, 3, 1, 1),
(201873, 50010, 0, 1, 2, 1, 1),
(201873, 50011, 0, 1, 1, 1, 1),
(201873, 50274, 37.5, 1, 0, 1, 1),
(201873, 50352, 0, 1, 1, 1, 1),
(201873, 50359, 0, 1, 2, 1, 1),
(201873, 50411, 0, 1, 3, 1, 1);

DELETE FROM `gameobject_loot_template` WHERE (`entry`=201874);
INSERT INTO `gameobject_loot_template` VALUES 
(201874, 49426, 100, 1, 0, 2, 2),
(201874, 49908, 10, 1, 0, 1, 1),
(201874, 50345, 0, 1, 2, 1, 1),
(201874, 51906, 0, 1, 1, 1, 1),
(201874, 51907, 0, 1, 1, 1, 1),
(201874, 51908, 0, 1, 1, 1, 1),
(201874, 51909, 0, 1, 2, 1, 1),
(201874, 51910, 0, 1, 2, 1, 1),
(201874, 51911, 0, 1, 2, 1, 1),
(201874, 51912, 0, 1, 2, 1, 1),
(201874, 51913, 0, 1, 1, 1, 1),
(201874, 51914, 0, 1, 2, 1, 1),
(201874, 51915, 0, 1, 1, 1, 1),
(201874, 51916, 0, 1, 1, 1, 1);

DELETE FROM `gameobject_loot_template` WHERE (`entry`=201875);
INSERT INTO `gameobject_loot_template` VALUES 
(201875, 49426, 100, 1, 0, 2, 2),
(201875, 49908, 10, 1, 0, 1, 1),
(201875, 50274, 75, 1, 0, 1, 1),
(201875, 50349, 0, 1, 2, 1, 1),
(201875, 50366, 0, 1, 1, 1, 1),
(201875, 50653, 0, 1, 3, 1, 1),
(201875, 50654, 0, 1, 3, 1, 1),
(201875, 50655, 0, 1, 3, 1, 1),
(201875, 50656, 0, 1, 2, 1, 1),
(201875, 50657, 0, 1, 3, 1, 1),
(201875, 50658, 0, 1, 1, 1, 1),
(201875, 50659, 0, 1, 2, 1, 1),
(201875, 50660, 0, 1, 1, 1, 1),
(201875, 50661, 0, 1, 1, 1, 1),
(201875, 50663, 0, 1, 2, 1, 1),
(201875, 50664, 0, 1, 2, 1, 1),
(201875, 50665, 0, 1, 1, 1, 1),
(201875, 50667, 0, 1, 3, 1, 1);

UPDATE `gameobject_template` SET `data1` = 201872 WHERE `entry` = 201872;
UPDATE `gameobject_template` SET `data1` = 201873 WHERE `entry` = 201873;
UPDATE `gameobject_template` SET `data1` = 201874 WHERE `entry` = 201874;
UPDATE `gameobject_template` SET `data1` = 201875 WHERE `entry` = 201875;
UPDATE `gameobject_template` SET `data1` = 201872 WHERE `entry` = 202177;
UPDATE `gameobject_template` SET `data1` = 201873 WHERE `entry` = 202178;
UPDATE `gameobject_template` SET `data1` = 201874 WHERE `entry` = 202179;
UPDATE `gameobject_template` SET `data1` = 201875 WHERE `entry` = 202180;

UPDATE item_template SET ScriptName = 'item_icc_rocket_pack' WHERE entry = 49278;


SET @ENTRY := 28298;
SET @GOSSIP := 9674;
SET @TEXT_ID := 13120;
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP,`npcflag`=npcflag|1,`VehicleId`=0 WHERE `entry`=@ENTRY;
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP;
INSERT INTO `gossip_menu` (`entry`,`text_id`)
VALUES (@GOSSIP,@TEXT_ID);

SET @GOSSIP_ENTRY := 9674;
SET @QUEST := 12536;
DELETE FROM `conditions` WHERE `SourceGroup`=@GOSSIP_ENTRY AND `SourceTypeOrReferenceId`=15;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES (15,@GOSSIP_ENTRY,0,0,9,@QUEST,0,0,0,0, 'Only show gossip 9674 when quest 12536 is added');

SET @GOSSIP := 9674;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9674 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)
VALUES 
(@GOSSIP,0,0,"You look safe enough... let's do this.",1,1,0,0,0,0, '');

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
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
(@ENTRY,0,0,0,62,0,100,0,@GOSSIP,0,0,0,11,@SPELL,0,0,0,0,0,7,0,0,0,0,0,0,0, 'On gossip select - cast spell 51258 - Captive Crocolisk'),
(@ENTRY_MOUNT,0,1,0,54,0,100,0,0,0,0,0,80,@ENTRY_MOUNT*100,0,2,0,0,0,1,0,0,0,0,0,0,0, 'On summon - run script - Captive Crocolisk'),
(@ENTRY_MOUNT*100,9,1,0,0,0,100,0,0,0,0,0,53,1,@ENTRY_MOUNT,0,@QUEST,0,1,1,0,0,0,0,0,0,0, 'Start wp - Captive Crocolisk'),
(@ENTRY_MOUNT,0,2,3,58,0,100,0,47,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'on wp end - despawn - Captive Crocolisk'),
(@ENTRY_MOUNT,0,3,0,61,0,100,0,@ENTRY_MOUNT,0,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0,0,0,0, 'on despawn - call area explored of event happens');

DELETE FROM `waypoints` WHERE `entry`=@ENTRY_MOUNT;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`)
VALUES
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

SET @GUID := 40267;
DELETE FROM `creature` WHERE `id`=28216;
INSERT INTO `creature` VALUES
(@GUID,28216,571,1,1,0,0,6147.37,4917.29,-94.094,3.42155,300,0,0,42,0,0,0,0,0);

DELETE FROM spell_target_position WHERE id = 71436;
INSERT INTO `spell_target_position` 
(`id`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) 
VALUES 
('71436', '-14458.62', '491', '15.2', '0.7');

UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 28017;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 28017;
INSERT INTO `creature_ai_scripts` 
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) 
VALUES
(2801701, 28017, 4, 0, 100, 0, 0, 0, 0, 0, 11, 50453, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '');

UPDATE `creature_template` 
SET 
`unit_flags`='0' 
WHERE 
(`entry`='11382');

DELETE FROM `spell_dbc` WHERE `id`=30023;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(30023,0,0,256,0,0,0,0,0,0,0,0,0,0,1,0,0,101,0,0,0,0,26,1,0,-1,0,0,3,0,0,1,0,0,0,0,0,0,0,0,0,0,0,18,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,"Gushing Wound Removal");

-- Player Vehicles
UPDATE `creature_template` SET `faction_A`=35, `faction_H`=35 WHERE `entry` IN (35644,36558);
UPDATE `creature_template` SET `unit_flags`=256 WHERE `entry`=36558;
UPDATE `creature_template` SET `spell1`=68505, `spell2`=62575, `spell3`=68282, `spell4`=66482 WHERE `entry`=36558;
UPDATE `creature_template` SET `VehicleId`=486 WHERE `entry`=35644;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry` IN (36558, 35644);
UPDATE `creature_template` SET `baseattacktime`=0 WHERE `entry` IN (36558, 35644);
UPDATE `creature_template_addon` SET `auras`='67865' WHERE `entry` IN (35644,36558);

-- Equipment
UPDATE `creature_template` SET `equipment_id`=2049 WHERE `entry` IN (35314,35326,35327,35325,35323,35331,35330,35329,35328,35332);
UPDATE `creature_template` SET `equipment_id`=2025 WHERE `entry` IN (35571,36090);
UPDATE `creature_template` SET `equipment_id`=2021 WHERE `entry` IN (35569,36085);
UPDATE `creature_template` SET `equipment_id`=2018 WHERE `entry` IN (35572,36089);
UPDATE `creature_template` SET `equipment_id`=2020 WHERE `entry` IN (35617,36084);
UPDATE `creature_template` SET `equipment_id`=2019 WHERE `entry` IN (35570,36091);
UPDATE `creature_template` SET `equipment_id`=2096 WHERE `entry` IN (34701,36803);
UPDATE `creature_template` SET `equipment_id`=2093 WHERE `entry` IN (34703,36087);
UPDATE `creature_template` SET `equipment_id`=2095 WHERE `entry` IN (34657,36086);
UPDATE `creature_template` SET `equipment_id`=2092 WHERE `entry` IN (34705,36088);
UPDATE `creature_template` SET `equipment_id`=834 WHERE `entry` IN (35119,35518);
UPDATE `creature_template` SET `equipment_id`=235 WHERE `entry` IN (34928,35517);
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry` IN (35451,35490);

-- Spawn Black Knight
DELETE FROM `vehicle_template_accessory` WHERE `entry`=35491;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`) VALUES
(35491,35451,0,0, 'Trial of the Champion - Black Knight on his Gryphon');

-- Mounts
DELETE FROM `creature_template_addon` WHERE `entry` IN (35314,35323,35325,35326,35327,35328,35329,35330,35331,35332);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(35314,0,29260,0,1,0,NULL), -- Orgrimmar Champion
(35323,0,29261,0,1,0,NULL), -- Sen'jin Champion
(35325,0,29259,0,1,0,NULL), -- Thunder Bluff Champion
(35326,0,29262,0,1,0,NULL), -- Silvermoon Champion
(35327,0,29257,0,1,0,NULL), -- Undercity Champion
(35328,0,28912,0,1,0,NULL), -- Stormwind Champion
(35329,0,29258,0,1,0,NULL), -- Ironforge Champion
(35330,0,29255,0,1,0,NULL), -- Exodar Champion
(35331,0,28571,0,1,0,NULL), -- Gnomeregan Champion
(35332,0,29256,0,1,0,NULL); -- Darnassus Champion

DELETE FROM `creature_template_addon` WHERE `entry` IN (34657,34701,34702,34703,34705,35569,35570,35571,35572,35617);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(34657,0,9991,0,1,0,NULL), -- Jaelyne Evensong
(34701,0,29255,0,1,0,NULL), -- Colosos
(34702,0,28571,0,1,0,NULL), -- Ambrose Boltspark
(34703,0,2787,0,1,0,NULL), -- Lana Stouthammer
(34705,0,29284,0,1,0,NULL), -- Marshal Jacob Alerius
(35569,0,28607,0,1,0,NULL), -- Eressea Dawnsinger
(35570,0,29261,0,1,0,NULL), -- Zul'tore
(35571,0,29880,0,1,0,NULL), -- Runok Wildmane
(35572,0,29879,0,1,0,NULL), -- Mokra the Skullcrusher
(35617,0,10718,0,1,0,NULL); -- Deathstalker Visceri

-- Memories
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `rank`=1, `minlevel`=82, `maxlevel`=82, `exp`=2 WHERE `name` LIKE 'Memory of %';
UPDATE `creature_template` SET `ScriptName`='npc_memory' WHERE `name` LIKE 'Memory of %' AND `name` NOT LIKE '%(1)%';

-- Champions
UPDATE `creature_template` SET `type_flags`=`type_flags`|0x800, `ScriptName`='boss_grand_champion_toc5' WHERE `entry` IN (34657,34701,34702,34703,34705,35569,35570,35571,35572,35617);
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16, `AIName`='', `ScriptName`='npc_faction_champion_toc5' WHERE `entry` IN (35314,35326,35327,35325,35323,35331,35330,35329,35328,35332);

-- Spell Scripts
DELETE FROM `spell_script_names` WHERE `spell_id`=67830;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(67830, 'spell_ride_vehicle_toc5');

-- Spawn Black Knight
DELETE FROM `vehicle_template_accessory` WHERE `entry`=35491;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
(35491,35451,0,0, 'Trial of the Champion - Black Knight on his Gryphon',6,900000);

UPDATE `creature_template` SET `npcflag`=`npcflag`|0x01000000 WHERE `entry`=35491;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=35491;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `quest_start_active`, `quest_end`, `cast_flags`, `aura_required`, `aura_forbidden`, `user_type`) VALUES
(35491,46598,0,0,0,1,0,0,0);

UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80, `exp`=2, `faction_A`=16, `faction_H`=16, `speed_walk`=0.8, `speed_run`=0.992063, `scale`=1.4, `mindmg`=422, `maxdmg`=586, `attackpower`=642, `baseattacktime`=2000, `dynamicflags`=8, `minrangedmg`=345, `maxrangedmg`=509, `rangedattackpower`=103 WHERE `entry` IN (35545,35564,35590,35717,35568,35546);
UPDATE `creature_template` SET `difficulty_entry_1`=35717, `ScriptName`='npc_risen_ghoul' WHERE `entry`=35590;
UPDATE `creature_template` SET `difficulty_entry_1`=35546 WHERE `entry`=35545;
UPDATE `creature_template` SET `difficulty_entry_1`=35568 WHERE `entry`=35564;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62552,62719,66482);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
(62552,'spell_gen_defend'),
(62719,'spell_gen_defend'),
(66482,'spell_gen_defend');


DELETE FROM `spell_script_names` WHERE `spell_id` IN (62874,62960,63661,62563,63003,63010,64591,66481,68282,68284,68321,68498,68501);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
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
(68501,'spell_gen_mounted_charge');


DELETE FROM `spell_script_names` WHERE `spell_id` IN (62575,62626,64342,64507,64590,64595,64686,65147,66480,68504);
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
(68504,'spell_gen_break_shield');

-- Spawns für die Wintergrasp Kanonen
DELETE FROM creature WHERE id = 28366 AND map = 571;
INSERT INTO `creature` 
(`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) 
VALUES 
(28366, 571, 1, 1, 0, 0, 5391.02, 2615.26, 421.126, 4.58167, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5350.61, 2616.01, 421.243, 4.63272, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5278.01, 2606.09, 439.755, 4.8055, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5252.99, 2632.07, 439.756, 3.11297, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5265.53, 2704.51, 421.7, 3.02972, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5236.15, 2732.52, 421.65, 4.58874, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5163.71, 2721.32, 439.844, 4.80864, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5138.75, 2747.36, 439.844, 3.08862, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5149.07, 2820.43, 421.622, 3.18287, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5147.73, 2861.85, 421.63, 3.13575, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5136.86, 2935.16, 439.847, 3.19465, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5163.22, 2960.99, 439.847, 1.59244, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5235.15, 2949.42, 420.881, 1.58851, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5265.15, 2976.65, 421.068, 3.20251, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5255.14, 3047.85, 438.499, 3.13182, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5280.84, 3073.2, 438.501, 1.47856, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5352.16, 3060.92, 421.102, 1.61914, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5390.93, 3061.19, 419.616, 1.67412, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5322.86, 2922.64, 421.646, 1.51312, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5363.87, 2924.05, 421.708, 1.5249, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5264.48, 2861.41, 421.587, 3.20566, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5265.41, 2819.84, 421.657, 3.25278, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5322.03, 2757.36, 421.645, 4.77645, 300, 0, 0, 50000, 0, 0, 0, 0, 0),
(28366, 571, 1, 1, 0, 0, 5363.71, 2757.07, 421.629, 4.69399, 300, 0, 0, 50000, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `speed_walk`=0 ,`speed_run`=0 WHERE `entry` IN (36839,36838);
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=37184;

-- Tor für die Tausendwinter Festung
DELETE FROM gameobject WHERE id = 191810;
INSERT INTO `gameobject` 
(`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) 
VALUES 
(191810, 571, 1, 1, 5397.11, 2841.54, 425.901, 3.14159, 0, 0, 0, 1, 180, 0, 1);

-- These Quests are missing in Rebirth DB (Source TDB)
REPLACE INTO `creature_questrelation` (`id`, `quest`) VALUES 
(376, 8254),
(988, 8419),
(1748, 6182),
(1748, 7782),
(2142, 171),
(2155, 489),
(2425, 1048),
(2425, 5725),
(2425, 6145),
(2425, 6521),
(3031, 8410),
(3032, 1523),
(3032, 8410),
(3034, 9063),
(3045, 8254),
(3046, 8254),
(3048, 2861),
(3049, 1959),
(3049, 8250),
(3060, 5927),
(3061, 6066),
(3144, 787),
(3154, 6068),
(3324, 8419),
(3325, 8419),
(3344, 8410),
(3403, 8410),
(3406, 8151),
(3596, 6072),
(4090, 8254),
(4091, 8254),
(4205, 6073),
(4205, 8151),
(4215, 8233),
(4564, 8419),
(4565, 8419),
(4606, 8254),
(4608, 8254),
(5117, 6075),
(5117, 6721),
(5141, 8254),
(5142, 8254),
(5145, 8250),
(5166, 8233),
(5171, 8419),
(5173, 8419),
(5489, 8254),
(5491, 4485),
(5495, 8419),
(5496, 8419),
(5498, 8250),
(5504, 9063),
(5516, 8151),
(5815, 7562),
(5883, 8250),
(6014, 8254),
(6382, 7562),
(7009, 2358),
(8001, 8001),
(8142, 9063),
(8738, 3646),
(9465, 9063),
(11401, 8254),
(12807, 7562),
(13151, 6847),
(13151, 6848),
(14322, 5528),
(15069, 8183),
(15383, 8492),
(15383, 8493),
(15431, 8494),
(15431, 8495),
(15432, 8499),
(15432, 8500),
(15434, 8503),
(15434, 8504),
(15437, 8505),
(15437, 8506),
(15445, 8509),
(15445, 8510),
(15446, 8511),
(15446, 8512),
(15448, 8513),
(15448, 8514),
(15450, 8515),
(15450, 8516),
(15451, 8517),
(15451, 8518),
(15452, 8520),
(15452, 8521),
(15453, 8522),
(15453, 8523),
(15455, 8524),
(15455, 8525),
(15456, 8526),
(15456, 8527),
(15457, 8528),
(15457, 8529),
(15459, 8532),
(15459, 8533),
(15460, 8542),
(15460, 8543),
(15469, 8545),
(15469, 8546),
(15477, 8549),
(15477, 8550),
(15508, 8580),
(15508, 8581),
(15512, 8582),
(15512, 8583),
(15515, 8588),
(15515, 8589),
(15522, 8590),
(15522, 8591),
(15525, 8600),
(15525, 8601),
(15528, 8604),
(15528, 8605),
(15529, 8607),
(15529, 8608),
(15532, 8609),
(15532, 8610),
(15533, 8611),
(15533, 8612),
(15534, 8613),
(15534, 8614),
(15535, 8615),
(15702, 8792),
(15703, 8793),
(15704, 8794),
(15707, 8795),
(15709, 8797),
(15761, 8818),
(15761, 8826),
(15761, 8844),
(15761, 8845),
(15762, 8813),
(15762, 8821),
(15762, 8836),
(15762, 8837),
(15763, 8814),
(15763, 8822),
(15763, 8838),
(15763, 8839),
(15764, 8812),
(15764, 8820),
(15764, 8834),
(15764, 8835),
(15765, 8815),
(15765, 8823),
(15765, 8832),
(15765, 8833),
(15767, 8817),
(15767, 8825),
(15767, 8842),
(15767, 8843),
(15768, 8816),
(15768, 8824),
(15768, 8840),
(15768, 8841),
(16361, 9085),
(16361, 9153),
(16478, 9260),
(16494, 9265),
(16531, 9292),
(16531, 9310),
(16576, 10388),
(16648, 8419),
(16649, 7562),
(16658, 8254),
(16659, 8254),
(16673, 8151),
(16673, 9617),
(16681, 9601),
(16685, 8233),
(16738, 8151),
(16756, 8254),
(17511, 8254),
(17513, 1939),
(17513, 8250),
(17519, 8410),
(17520, 8410),
(18020, 10066),
(18020, 10067),
(18024, 10066),
(18024, 10067),
(18927, 14022),
(19169, 12752),
(19169, 12782),
(19169, 12783),
(19169, 12784),
(19169, 12811),
(19169, 14036),
(19175, 12752),
(19175, 12782),
(19175, 12783),
(19175, 12784),
(19175, 12811),
(19176, 12752),
(19176, 12782),
(19176, 12783),
(19176, 12784),
(19176, 12811),
(19177, 12752),
(19177, 12782),
(19177, 12783),
(19177, 12784),
(19177, 12811),
(21155, 10500),
(21156, 10501),
(23271, 11038),
(23486, 11117),
(23486, 11118),
(23534, 8419),
(23535, 7562),
(23872, 11486),
(23872, 11487),
(24657, 11120),
(24710, 11442),
(24711, 11447),
(25223, 9722),
(25223, 9723),
(25223, 9725),
(25223, 9735),
(25223, 9736),
(25223, 9737),
(25784, 11682),
(25812, 11884),
(26719, 12062),
(26914, 13268),
(26964, 13269),
(26969, 13270),
(27001, 13265),
(27584, 12318),
(28318, 12785),
(28318, 12786),
(28318, 12787),
(28318, 12788),
(28318, 12812),
(28699, 13272),
(29006, 12726),
(29006, 12735),
(29006, 12736),
(29006, 12737),
(29043, 12732),
(29043, 12734),
(29043, 12741),
(29043, 12758),
(29087, 12771),
(29087, 12773),
(29087, 12774),
(29087, 12776),
(29087, 12809),
(29146, 12703),
(29146, 12759),
(29146, 12760),
(29149, 12705),
(29149, 12761),
(29149, 12762),
(29441, 12816),
(29442, 12817),
(29560, 12852),
(30382, 12973),
(30405, 12881),
(31036, 13177),
(31036, 13179),
(31051, 13153),
(31051, 13198),
(31052, 13154),
(31052, 13196),
(31053, 13194),
(31053, 13201),
(31054, 13156),
(31054, 13195),
(31091, 13178),
(31091, 13180),
(31101, 13192),
(31101, 13202),
(31102, 13193),
(31102, 13199),
(31106, 13191),
(31106, 13200),
(31107, 13185),
(31107, 13223),
(31108, 236),
(31108, 13197),
(31109, 13186),
(31109, 13222),
(31151, 13183),
(31151, 13539),
(31153, 13181),
(31153, 13538),
(34882, 14101),
(34882, 14102),
(34882, 14104),
(34882, 14105),
(34912, 14076),
(34912, 14090),
(34912, 14112),
(34914, 14092),
(34914, 14141),
(34914, 14145),
(35094, 14107),
(35094, 14108);


REPLACE INTO `creature_involvedrelation` (`id`, `quest`) VALUES 
(1749, 396),
(2425, 1048),
(2425, 1978),
(2425, 5725),
(2425, 6521),
(2425, 6522),
(5149, 1794),
(7009, 2358),
(8001, 8001),
(8738, 3646),
(13151, 6847),
(13151, 6848),
(15909, 8876),
(15909, 8877),
(15909, 8878),
(15909, 8879),
(15909, 8880),
(15909, 8881),
(15909, 8882),
(21638, 10842),
(23872, 11454),
(23872, 12062),
(25812, 11884),
(26719, 12318),
(26914, 13268),
(26964, 13269),
(26969, 13270),
(27001, 13265),
(27858, 12474),
(28121, 12689),
(28699, 13272);

SET NAMES 'utf8';

DELETE FROM `trinity_string` WHERE entry IN (756,757,758,759,760,761,762,763,764,765,766,767,768,769,770,771,772,780,781);
REPLACE INTO `trinity_string` VALUES ('756', 'Battle begins!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ????????');
REPLACE INTO `trinity_string` VALUES ('757', '%s has successfully defended the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ??????? ???????(?) ????????!');
REPLACE INTO `trinity_string` VALUES ('758', '%s has taken over the fortress!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ????????(?) ????????');
REPLACE INTO `trinity_string` VALUES ('759', 'The %s siege workshop has been damaged by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('760', 'The %s siege workshop has been destroyed by the %s!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('761', 'The %s tower has been damaged!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ????? ??????????');
REPLACE INTO `trinity_string` VALUES ('762', 'The %s tower has been destroyed!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s ????? ??????????!');
REPLACE INTO `trinity_string` VALUES ('763', 'Wintergrasp fortress is under attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('764', 'Wintergrasp is now under the control of the %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('765', 'Wintergrasp timer set to %s.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('766', 'Wintergrasp battle started.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('767', 'Wintergrasp battle finished.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('768', 'Wintergrasp info: %s controlled. Timer: %s. Wartime: %s. Number of Players: (Horde: %u, Alliance: %u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('769', 'Wintergrasp outdoorPvP is disabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('770', 'Wintergrasp outdoorPvP is enabled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `trinity_string` VALUES ('771', 'You have reached Rank 1: Corporal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ???????? ????? 1: ??????');
REPLACE INTO `trinity_string` VALUES ('772', 'You have reached Rank 2: First Lieutenant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ???????? ????? 2: ?????????');
REPLACE INTO `trinity_string` VALUES ('780', 'Before the Battle of  Wintergrasp left 30 minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ????? ??  ????? ??????? ???? ???????? 30 ?????!');
REPLACE INTO `trinity_string` VALUES ('781', 'Before the Battle of  Wintergrasp left 10 minutes!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ????? ??  ????? ??????? ???? ???????? 10 ?????!');
REPLACE INTO `trinity_string` VALUES ('782', 'The battle for Wintergrasp  has stopped! Not enough defenders. Wintergrasp Fortress remains  Attackers.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?? ????? ??????? ???? ???????????. ?? ??????? ??????????. ???????? ????????? ?????????  ???????.');
REPLACE INTO `trinity_string` VALUES ('783', 'The battle for Wintergrasp  has stopped! Not enough attackers. Wintergrasp Fortress remains  Defenders.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?? ????? ??????? ???? ???????????. ?? ??????? ??????????. ???????? ???????? ??????????.');

DELETE FROM `command` WHERE name IN ('wg','wg enable','wg start','wg status','wg stop','wg switch','wg timer');
REPLACE INTO `command` VALUES ('wg', '3', 'Syntax: .wg $subcommand.');
REPLACE INTO `command` VALUES ('wg enable', '3', 'Syntax: .wg enable [on/off] Enable/Disable Wintergrasp outdoorPvP.');
REPLACE INTO `command` VALUES ('wg start', '3', 'Syntax: .wg start\r\nForce Wintergrasp battle start.');
REPLACE INTO `command` VALUES ('wg status', '3', 'Syntax: .wg status\r\nWintergrasp info, defender, timer, wartime.');
REPLACE INTO `command` VALUES ('wg stop', '3', 'Syntax: .wg stop\r\nForce Wintergrasp battle stop (No rewards).');
REPLACE INTO `command` VALUES ('wg switch', '3', 'Syntax: .wg switch\r\nSwitchs Wintergrasp defender team.');
REPLACE INTO `command` VALUES ('wg timer', '3', 'Syntax: .wg timer $minutes\r\nChange the current timer. Min value = 1, Max value 60 (Wartime), 1440 (Not Wartime)');


/* Temp removed gameobject stopping you getting to the relic
* 60070 - [Wintergrasp Keep Collision Wall X:5396.209961 Y:2840.010010 Z:432.268005 MapId:571
* 60476 - [Doodad_WG_Keep_Door01_collision01 X:5397.109863 Y:2841.540039 Z:425.901001 MapId:571]*/
DELETE FROM gameobject WHERE id IN ('194323', '194162');

/* Titan Relic remove */
DELETE FROM `gameobject` WHERE `id`=192829;

/* Towers */
UPDATE `gameobject_template` SET `faction` = 0, `flags` = 6553632 WHERE `entry` IN (190356,190357,190358);

/* Teleport WG SPELLs*/
REPLACE INTO `spell_target_position` VALUES ('59096', '571', '5325.06', '2843.36', '409.285', '3.20278');
REPLACE INTO `spell_target_position` VALUES ('58632', '571', '5097.79', '2180.29', '365.61', '2.41');
REPLACE INTO `spell_target_position` VALUES ('58633', '571', '5026.80', '3676.69', '362.58', '3.94');

/* Defender's Portal Activate Proper Spell */
REPLACE INTO `spell_linked_spell` VALUES ('54640','54643','0','Defender\'s Portal Activate Proper Spell');

/*For wg antifly */
REPLACE INTO `spell_area` VALUES ('58730', '4197', '0', '0', '0', '0', '0', '2', '1');

/*Spirit healer FIX */
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry   IN (31841,31842);

/* Creature template */
UPDATE creature_template SET faction_A = '1802', faction_H = '1802' WHERE entry IN (30499,28312,28319);
UPDATE creature_template SET faction_A = '1801', faction_H = '1801' WHERE entry IN (30400,32629,32627);
UPDATE creature_template SET npcflag=npcflag|32768 WHERE entry   IN (31841,31842);

/* WG scriptname */
REPLACE INTO `outdoorpvp_template` VALUES ('7', 'outdoorpvp_wg', 'Wintergrasp');
UPDATE `creature_template` SET `ScriptName` = 'npc_demolisher_engineerer' WHERE `entry` IN (30400,30499);

/* spell target for build vehicles */
REPLACE INTO `conditions` VALUES ('13', '0', '56663', '0', '18', '1', '27852', '0', '0', '', null);
REPLACE INTO `conditions` VALUES ('13', '0', '56575', '0', '18', '1', '27852', '0', '0', '', null);
REPLACE INTO `conditions` VALUES ('13', '0', '61408', '0', '18', '1', '27852', '0', '0', '', null);
REPLACE INTO `conditions` VALUES ('13', '0', '56661', '0', '18', '1', '27852', '0', '0', '', null);

/* Workshop */
UPDATE `gameobject_template` SET `faction` = 35 WHERE `entry` IN (192028,192029,192030,192031,192032,192033);

/*WG Spell area Data */
REPLACE INTO `spell_area` VALUES (58730,4584,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (58730,4581,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (58730,4585,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (58730,4612,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (58730,4582,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (58730,4611,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (58730,4578,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (58730,4576,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (58730,4538,0,0,0,0,0,2,1);
REPLACE INTO `spell_area` VALUES (57940, 65, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 66, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 67, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 206, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 210, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 394, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 395, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 1196, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 2817, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 3456, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 3477, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 3537, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 3711, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4100, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4196, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4228, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4264, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4265, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4272, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4273, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4395, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4415, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4416, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4493, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4494, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (57940, 4603, 0, 0, 0, 0, 0, 2, 1);
REPLACE INTO `spell_area` VALUES (58045, 4197, 0, 0, 0, 0, 0, 2, 1);

/*Temp spawn fix*/
UPDATE `creature` SET `id` = 30739 WHERE `guid` in (51157, 51450, 52496, 51046, 51056, 51606, 56547, 56548, 51027, 51015, 51557, 52497, 56554, 56552, 56550, 56553, 56551, 56555);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` in (30488, 30489);
UPDATE `creature` SET `phaseMask` = 512 WHERE `guid` in (121120, 116248);
/*Set raid quests*/
UPDATE `quest_template` SET `Type` = 62 WHERE `Id` IN (13177, 13178, 13179, 13180, 13185, 13186, 13222, 13223, 13538, 13539);

UPDATE `creature_template` SET `ScriptName` = 'npc_wg_dalaran_queue' WHERE `entry` IN (32169,32170,35599,35596,35600,35601,35598,35603,35602,35597,35612,35611);
DELETE FROM `script_texts` WHERE entry =-1850507;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`)VALUES
(0, -1850507, 'Enter to queue in Wintergrasp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ? ??????? ?? ????? ??????? ????', 0, 0, 0, 0, '');

/* Vehicle Teleporter */
UPDATE `gameobject_template` SET `type` = 6, `faction` = 0, `data2` = 10, `data3` = 54643, `ScriptName` = 'go_wg_veh_teleporter' WHERE `entry` = 192951;
/* Spirit Guide */
UPDATE `creature_template` SET `ScriptName` = 'npc_wg_spirit_guide' WHERE `entry` IN (31841,31842);
/* Teleport spell target positions */
DELETE FROM `spell_target_position` WHERE `id` IN (59762,59766,59767,59765);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (59762, 571, 5104.75, 2300.94, 368.56, 0.73); -- sunken ring teleport
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (59766, 571, 4336.46, 3235.35, 390.24, 0.19); -- westpark teleport 
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (59767, 571, 4318.44, 2408.04, 392.59, 6.12); -- eastpark teleport
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (59765, 571, 5031.83, 3710.75, 372.48, 3.99); -- horde landing teleport

DROP TABLE IF EXISTS `unstable_encounters`;
CREATE TABLE `unstable_encounters` (
  `boss_id` int(11) NOT NULL,
  `disabled` int(11) NOT NULL DEFAULT '1',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `unstable_encounters` VALUES ('1', '0', 'Gunship Battle');

UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36497 AND `item`=47241 LIMIT 1;
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36502 AND `item`=47241 LIMIT 1;
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36494 AND `item`=47241 LIMIT 1;
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36476 AND `item`=47241 LIMIT 1;
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36658 AND `item`=47241 LIMIT 1;
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=38112 AND `item`=47241 LIMIT 1;
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=38113 AND `item`=47241 LIMIT 1;


-- Fixe Quest [Dirty Fix] Überwältigende Niederlage im Ring, der letzte NPC droppt nun das Quest Item
DELETE FROM creature_loot_template WHERE entry = 23931 AND item = 33545; 
INSERT INTO `creature_loot_template` 
(`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES 
(23931, 33545, 100, 1, 0, 1, 1);


-- Bereitgestelltes Quest Item raus genommen
UPDATE `quest_template` SET `SourceItemId`=0, `SourceItemCount`=0, `RequiredItemId2`=0,`RequiredItemCount2`=0 WHERE `Id`=11470 LIMIT 1;
-- Erstelle ein npc als ei das droppt nun das erforderte Quest Item
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `minlevel`, `maxlevel`, `faction_A`, `faction_H`, `scale`, `lootid`) VALUES (200100, 20245, 'Ei eines Fjordhabichts', 1, 1, 16, 16, 0.6, 200100);
-- Quest Item für den NPC
INSERT INTO `creature_loot_template` (`entry`, `item`) VALUES (200100, 34123);


-- Fixe Quest Der Entscheidungsschlag Konnte man wohl nicht abgeben.
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `Id`=2585;


-- Fixe Quest Heb'Jin erledigen - Zul'Drak  HebJin spawnt nun bei der Trommel.
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES  (190695, 1, 10, 28636, 120000, 0, 5935.21, -3822.06, 366.388, 2.33277);
UPDATE `gameobject_template` SET `data2`=190695 WHERE `entry`=190695;


-- Fixe Quest Erhebt Euch, Obsidion! Obsidion (sollte nun angreifbar sein) Lathoric der Schwarze spawnt nun wenn man die Quest annimmt.
UPDATE creature_template SET `unit_flags`=0, `flags_extra`=0 WHERE entry = 8400;
UPDATE `quest_template` SET `StartScript`=3566 WHERE Id=3566;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES (3566, 1, 10, 8391, 120000, -6472.929688, -1257.288452, 180.436066, 1.799940);UPDATE creature_template SET `unit_flags`=0, `flags_extra`=0 WHERE entry = 8400;
UPDATE `quest_template` SET `StartScript`=3566 WHERE Id=3566;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `x`, `y`, `z`, `o`) VALUES (3566, 1, 10, 8391, 120000, -6472.929688, -1257.288452, 180.436066, 1.799940);


-- Fixe Quest Bezwingt den Sturm NPC sollte nun wieder angreifbar sein
UPDATE `creature_template` SET `unit_flags`=537133072 WHERE `entry`=26045;


UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (27715, 27717, 27718, 27727);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12431, 1, 10, 27727, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12430, 1, 10, 27718, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12429, 1, 10, 27717, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12428, 1, 10, 27716, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12427, 1, 10, 27715, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
