DROP TABLE IF EXISTS `rebirth_command_log`;
CREATE TABLE `rebirth_command_log` (
  `command` text NOT NULL,
  `fromAccount` text NOT NULL,
  `toAccount` text NOT NULL,
  `param1` int(11) NOT NULL DEFAULT '0',
  `date` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `rebirth_next_event`;
CREATE TABLE `rebirth_next_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `reqLevel` int(11) NOT NULL DEFAULT '1',
  `x` float(11,0) NOT NULL DEFAULT '0',
  `y` float(11,0) NOT NULL DEFAULT '0',
  `z` float(11,0) NOT NULL DEFAULT '0',
  `map` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `rebirth_wintergrasp_timer`;
CREATE TABLE `rebirth_wintergrasp_timer` (
  `id` int(11) NOT NULL,
  `timer` int(11) NOT NULL DEFAULT '0',
  `team` int(11) NOT NULL DEFAULT '0',
  `inWar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `uptime`
ADD COLUMN `startstring`  varchar(70) NOT NULL DEFAULT 0 AFTER `revision`;

ALTER TABLE `account`
ADD COLUMN `rebirth_punkte`  int(11) NOT NULL DEFAULT 0 AFTER `expansion`;
