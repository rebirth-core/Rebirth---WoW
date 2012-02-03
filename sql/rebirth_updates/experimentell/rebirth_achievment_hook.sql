DROP TABLE IF EXISTS `rebirth_achievment_hook`;
CREATE TABLE `rebirth_achievment_hook` (
  `achievement_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `param1` int(11) NOT NULL DEFAULT '0',
  `param2` int(11) NOT NULL DEFAULT '0',
  `param3` int(11) NOT NULL DEFAULT '0',
  `param4` int(11) NOT NULL DEFAULT '0',
  `param5` int(11) NOT NULL DEFAULT '0',
  `param6` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`achievement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
