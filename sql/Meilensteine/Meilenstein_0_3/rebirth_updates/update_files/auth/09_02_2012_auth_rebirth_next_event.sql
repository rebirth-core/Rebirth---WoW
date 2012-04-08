DROP TABLE IF EXISTS `rebirth_next_event`;
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
