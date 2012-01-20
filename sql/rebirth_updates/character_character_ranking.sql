DROP TABLE IF EXISTS `character_ranks`;
CREATE TABLE `character_ranks` (
  `player` int(11) NOT NULL,
  `points_this_week` int(11) NOT NULL DEFAULT '0',
  `points_last_week` int(11) NOT NULL DEFAULT '0',
  `current_rank` int(11) NOT NULL DEFAULT '0',
  `next_rank` int(11) NOT NULL DEFAULT '1',
  `ranked` int(11) NOT NULL DEFAULT '0',
  `srank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`player`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
