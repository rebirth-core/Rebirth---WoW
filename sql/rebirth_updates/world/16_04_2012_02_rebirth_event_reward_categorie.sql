ALTER TABLE `rebirth_event_reward_categorie`
ADD COLUMN `eventsystem`  int(11) NOT NULL DEFAULT 0 AFTER `name`,
ADD COLUMN `votesystem`  int(11) NOT NULL DEFAULT 0 AFTER `eventsystem`;
