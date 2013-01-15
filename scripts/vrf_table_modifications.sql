CREATE TABLE IF NOT EXISTS `VRF` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8

INSERT INTO `VRF` (`id`, `name`, `comment`) VALUES
(1, 'Default', NULL),

ALTER TABLE  `IPv4Network` ADD  `vrf_id` INT( 10 ) UNSIGNED NOT NULL DEFAULT  '1';
ALTER TABLE  `IPv4Network` DROP INDEX  `base-len` ,
ADD UNIQUE  `base-len` (  `ip` ,  `mask` ,  `vrf_id` )

ALTER TABLE  `IPv4Address` ADD  `vrf_id` INT( 10 ) UNSIGNED NOT NULL DEFAULT  '1';
ALTER TABLE  `IPv4Address` DROP PRIMARY KEY ,
ADD PRIMARY KEY (  `ip` ,  `vrf_id` )

ALTER TABLE  `IPv4Allocation` ADD  `vrf_id` INT( 10 ) UNSIGNED NOT NULL DEFAULT  '1';
ALTER TABLE  `IPv4Allocation` DROP PRIMARY KEY ,
ADD PRIMARY KEY (  `object_id` ,  `ip` ,  `vrf_id` );
ALTER TABLE  `IPv4Allocation` DROP INDEX  `ip` ,
ADD INDEX  `ip` (  `ip` ,  `vrf_id` );


ALTER TABLE  `IPv4Log` ADD  `vrf_id` INT( 10 ) UNSIGNED NOT NULL DEFAULT  '1';
ALTER TABLE  `IPv4Log` DROP INDEX  `ip-date` ,
ADD INDEX  `ip-date` (  `ip` ,  `date` ,  `vrf_id` )

