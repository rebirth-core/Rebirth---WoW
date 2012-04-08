ALTER TABLE account ADD COLUMN `event_punkte` int(11) unsigned NOT NULL default '0' AFTER `locale`;ALTER TABLE `rebirth_next_event`
ADD COLUMN `id`  int(11) NOT NULL AUTO_INCREMENT FIRST ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`);
DROP TABLE IF EXISTS `rebirth_command_log`;
CREATE TABLE `rebirth_command_log` (
`command`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`fromAccount`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`toAccount`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`param1`  int(11) NOT NULL DEFAULT 0 ,
`date`  bigint(20) NOT NULL );DROP TABLE IF EXISTS `rebirth_next_event`;
CREATE TABLE `rebirth_next_event` (
  `date` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `reqLevel` int(11) NOT NULL DEFAULT '1',
  `x` float(11,0) NOT NULL DEFAULT '0',
  `y` float(11,0) NOT NULL DEFAULT '0',
  `z` float(11,0) NOT NULL DEFAULT '0',
  `map` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
