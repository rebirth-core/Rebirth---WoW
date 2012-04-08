DELETE FROM creature_template WHERE entry = 96700;
INSERT INTO `creature_template` 
(`entry`, `modelid1`, `name`, `subname`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `rank`, `mindmg`, `maxdmg`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `unit_class`, `ScriptName`) 
VALUES 
('96700', '10045', 'Rebirth', 'Event Master', '80', '80', '2', '35', '35', '1', '1', '1000', '2000', '192', '15', '2000', '1', 'event_npc');