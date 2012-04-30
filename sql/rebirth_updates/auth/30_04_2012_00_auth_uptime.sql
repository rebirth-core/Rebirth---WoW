ALTER TABLE `uptime`
ADD COLUMN `startstring`  varchar(70) NOT NULL DEFAULT 0 AFTER `revision`;
