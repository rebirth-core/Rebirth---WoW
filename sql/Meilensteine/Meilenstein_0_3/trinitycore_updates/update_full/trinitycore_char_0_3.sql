DROP TABLE IF EXISTS `warden_action`;
CREATE TABLE `warden_action` (
  `wardenId` smallint(5) unsigned NOT NULL,
  `action` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`wardenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `lag_reports` ADD `latency` int(10) unsigned NOT NULL DEFAULT '0';
ALTER TABLE `lag_reports` ADD `createTime` int(10) unsigned NOT NULL DEFAULT '0';
