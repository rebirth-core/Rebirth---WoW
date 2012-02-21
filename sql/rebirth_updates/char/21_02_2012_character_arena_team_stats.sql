DROP TABLE IF EXISTS `arena_team_stats`;
CREATE TABLE `arena_team_stats` (
  `arenateamid` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `games` int(11) NOT NULL,
  `wins` int(11) NOT NULL,
  `played` int(11) NOT NULL,
  `wins2` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`arenateamid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
