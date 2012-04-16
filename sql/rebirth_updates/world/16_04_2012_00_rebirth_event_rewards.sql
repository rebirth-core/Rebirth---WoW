ALTER TABLE `rebirth_event_rewards`
ADD COLUMN `condition`  int(11) NOT NULL DEFAULT 0 AFTER `cost`,
ADD COLUMN `cond_value1`  int(11) NOT NULL DEFAULT 0 AFTER `condition`,
ADD COLUMN `cond_value2`  int(11) NOT NULL DEFAULT 0 AFTER `cond_value1`,
ADD COLUMN `cond_value3`  int(11) NOT NULL DEFAULT 0 AFTER `cond_value2`,
ADD COLUMN `negation`  int(11) NOT NULL DEFAULT 0 AFTER `cond_value3`;
