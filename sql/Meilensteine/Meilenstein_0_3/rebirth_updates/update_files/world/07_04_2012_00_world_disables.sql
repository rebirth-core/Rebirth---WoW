DELETE FROM disables WHERE sourceType = 0 AND entry = 36444 AND flags = 1;
INSERT INTO disables (sourceType, entry, flags, comment) 
VALUES 
(0, 36444, 1, 'Wasser aus Tausendwinter');
