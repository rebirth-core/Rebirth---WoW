DROP TABLE IF EXISTS `rebirth_next_event`;
CREATE TABLE `rebirth_next_event` (
  `date` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `reqLevel` int(11) NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
