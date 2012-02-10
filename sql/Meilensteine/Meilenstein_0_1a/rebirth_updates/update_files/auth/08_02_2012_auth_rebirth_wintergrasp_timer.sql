DROP TABLE IF EXISTS `rebirth_wintergrasp_timer`;
CREATE TABLE `rebirth_wintergrasp_timer` (
  `id` int(11) NOT NULL,
  `timer` int(11) NOT NULL DEFAULT '0',
  `team` int(11) NOT NULL DEFAULT '0',
  `inWar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
