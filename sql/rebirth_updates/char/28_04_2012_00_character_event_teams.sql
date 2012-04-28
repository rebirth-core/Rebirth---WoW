DROP TABLE IF EXISTS `event_teams`;
CREATE TABLE `event_teams` (
  `player` int(10) NOT NULL,
  `team` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
