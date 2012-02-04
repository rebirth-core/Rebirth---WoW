DELETE FROM `spell_script_names` WHERE `spell_id` IN (67590,67602,67603,67604,65684,67176,67177,67178,65686,67222,67223,67224);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(67590, 'spell_powering_up'),
(67602, 'spell_powering_up'),
(67603, 'spell_powering_up'),
(67604, 'spell_powering_up'),
(65684, 'spell_valkyr_essences'),
(67176, 'spell_valkyr_essences'),
(67177, 'spell_valkyr_essences'),
(67178, 'spell_valkyr_essences'),
(67222, 'spell_valkyr_essences'),
(65686, 'spell_valkyr_essences'),
(67223, 'spell_valkyr_essences'),
(67224, 'spell_valkyr_essences');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `ConditionTypeOrReference` = 18 AND `SourceEntry` IN (65875,67303,67304,67305,65876,67306,67307,67308) ;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 0, 65875, 0, 18, 1, 34497, 2, 0, '', 'Twins Pact - Dark'),
(13, 0, 67303, 0, 18, 1, 34497, 2, 0, '', 'Twins Pact - Dark'),
(13, 0, 67304, 0, 18, 1, 34497, 2, 0, '', 'Twins Pact - Dark'),
(13, 0, 67305, 0, 18, 1, 34497, 2, 0, '', 'Twins Pact - Dark'),
(13, 0, 65876, 0, 18, 1, 34496, 2, 0, '', 'Twins Pact - Light'),
(13, 0, 67306, 0, 18, 1, 34496, 2, 0, '', 'Twins Pact - Light'),
(13, 0, 67307, 0, 18, 1, 34496, 2, 0, '', 'Twins Pact - Light'),
(13, 0, 67308, 0, 18, 1, 34496, 2, 0, '', 'Twins Pact - Light');