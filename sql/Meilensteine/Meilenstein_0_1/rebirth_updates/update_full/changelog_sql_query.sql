/* Fixe Loot in SS/HDR/Grube Bosse droppen nun nur noch 1 Emblem*/
--Bronjaham
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36497 AND `item`=47241 LIMIT 1;
--Verschlinger der seelen:
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36502 AND `item`=47241 LIMIT 1;

--GRUBE:
--Schmiedemeister Garfrost:
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36494 AND `item`=47241 LIMIT 1;
--Ick:
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36476 AND `item`=47241 LIMIT 1;
--Tyrannus:
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=36658 AND `item`=47241 LIMIT 1;

--HDR:
--Falric:
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=38112 AND `item`=47241 LIMIT 1;
--Marwyn:
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=38113 AND `item`=47241 LIMIT 1;


-- Fixe Quest [Dirty Fix] Überwältigende Niederlage im Ring, der letzte NPC droppt nun das Quest Item
INSERT INTO `creature_loot_template` 
(`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`)
VALUES 
(23931, 33545, 100, 1, 0, 1, 1);


/* Fixe Quest [Dirtyfix] Unter dem Vogelvieh gibt es keine Ehre : Habe hier mal ein dirty fix, da der Server bei der Quest (anscheint crasht)
 Eier müssten noch gespawnt werden! */

-- Bereitgestelltes Quest Item raus genommen
UPDATE `quest_template` SET `SourceItemId`=0, `SourceItemCount`=0, `RequiredItemId2`=0,`RequiredItemCount2`=0 WHERE `Id`=11470 LIMIT 1;
-- Erstelle ein npc als ei das droppt nun das erforderte Quest Item*/
INSERT INTO `creature_template` (`entry`, `name`, `minlevel`, `maxlevel`, `faction_A`, `faction_H`, `scale`, `lootid`)VALUES(200100, 20245, 'Ei eines Fjordhabichts', 1, 1, 16, 16, 0.6, 200100)
-- Quest Item für den NPC*/
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


/* Fixe Quest:
Die Siegeswallgrube: Bärenringen!
Die Siegeswallgrube: Kampf gegen irren Furbolg 
Die Siegeswallgrube: Blut und Metall
Die Siegeswallgrube: Der Tod ist wahrscheinlich 
Die Siegeswallgrube: Entscheidungskampf
NPCs Spawnen nun unten in diesen Ring oder halt Arena 
NPCs sind nun Angreifbar */

UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry` IN (27715, 27717, 27718, 27727);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12431, 1, 10, 27727, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12430, 1, 10, 27718, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12429, 1, 10, 27717, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12428, 1, 10, 27716, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (12427, 1, 10, 27715, 300000, 0, 3249.92, -2334.79, 92.1761, 1.00458);