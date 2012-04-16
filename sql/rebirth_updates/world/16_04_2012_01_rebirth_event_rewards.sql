ALTER TABLE `rebirth_event_rewards`
ADD COLUMN `rewardType`  int(11) NOT NULL DEFAULT 0 AFTER `negation`;
