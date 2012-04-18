ALTER TABLE `account`
ADD COLUMN `vote_punkte`  int(11) NOT NULL DEFAULT 0 AFTER `event_punkte`;
