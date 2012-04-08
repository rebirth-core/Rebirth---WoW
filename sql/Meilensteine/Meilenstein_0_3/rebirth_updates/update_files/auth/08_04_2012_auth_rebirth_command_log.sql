DROP TABLE IF EXISTS `rebirth_command_log`;
CREATE TABLE `rebirth_command_log` (
`command`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`fromAccount`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`toAccount`  text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL ,
`param1`  int(11) NOT NULL DEFAULT 0 ,
`date`  bigint(20) NOT NULL );