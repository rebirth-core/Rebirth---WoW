DROP TABLE IF EXISTS `unstable_encounters`;
CREATE TABLE `unstable_encounters` (
  `boss_id` int(11) NOT NULL,
  `disabled` int(11) NOT NULL DEFAULT '1',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `unstable_encounters` VALUES ('1', '0', 'Gunship Battle');
