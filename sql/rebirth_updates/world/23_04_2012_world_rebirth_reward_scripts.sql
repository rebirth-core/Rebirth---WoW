ALTER TABLE `rebirth_rewards`
ADD COLUMN `script_id`  int(11) NOT NULL DEFAULT 0 AFTER `negation`;

DROP TABLE IF EXISTS rebirth_reward_scripts;
CREATE TABLE `rebirth_reward_scripts` (
`id`  int(11) NOT NULL ,
`type`  int(11) NOT NULL DEFAULT 0 ,
`param1`  int(11) NOT NULL DEFAULT 0 ,
`param2`  int(11) NOT NULL DEFAULT 0 ,
`param3`  int(11) NOT NULL DEFAULT 0 );
