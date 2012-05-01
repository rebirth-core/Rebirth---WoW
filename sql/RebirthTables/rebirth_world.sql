DROP TABLE IF EXISTS `rebirth_reward_categorie`;
CREATE TABLE `rebirth_reward_categorie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `rebirth_reward_scripts`;
CREATE TABLE `rebirth_reward_scripts` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `param1` int(11) NOT NULL DEFAULT '0',
  `param2` int(11) NOT NULL DEFAULT '0',
  `param3` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `rebirth_rewards`;
CREATE TABLE `rebirth_rewards` (
  `id` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `param1` int(11) NOT NULL,
  `param2` int(11) NOT NULL,
  `param3` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `condition_type` int(11) NOT NULL DEFAULT '0',
  `cond_value1` int(11) NOT NULL DEFAULT '0',
  `cond_value2` int(11) NOT NULL DEFAULT '0',
  `cond_value3` int(11) NOT NULL DEFAULT '0',
  `negation` int(11) NOT NULL DEFAULT '0',
  `script_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
