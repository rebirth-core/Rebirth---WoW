-- Tor für die Tausendwinter Festung
DELETE FROM gameobject WHERE id = 191810;
INSERT INTO `gameobject` 
(`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) 
VALUES 
(191810, 571, 1, 1, 5397.11, 2841.54, 425.901, 3.14159, 0, 0, 0, 1, 180, 0, 1);
