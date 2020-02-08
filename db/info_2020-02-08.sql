# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.28)
# Database: info
# Generation Time: 2020-02-08 03:08:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table clue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clue`;

CREATE TABLE `clue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `utm` varchar(255) DEFAULT NULL COMMENT '来源',
  `user_id` int(11) DEFAULT NULL COMMENT '销售人员',
  `state` int(11) DEFAULT NULL COMMENT '状态【1:没有意向,2:意向一般,3:意向强烈，4:完成销售,5:取消销售',
  `remark` text COMMENT '备注',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` int(11) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `clue` WRITE;
/*!40000 ALTER TABLE `clue` DISABLE KEYS */;

INSERT INTO `clue` (`id`, `name`, `phone`, `utm`, `user_id`, `state`, `remark`, `created_time`, `is_deleted`)
VALUES
	(3,'王源','13000000000','',29,3,'','2019-11-07 09:42:11',NULL),
	(4,'王俊凯','13000000001','',29,2,'','2019-11-07 09:42:42',NULL),
	(6,'赵润男','13500000003','',34,1,'','2019-11-08 14:27:40',NULL);

/*!40000 ALTER TABLE `clue` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table clue_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `clue_log`;

CREATE TABLE `clue_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) DEFAULT NULL COMMENT '线索id',
  `content` text COMMENT '内容',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` int(11) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `clue_log` WRITE;
/*!40000 ALTER TABLE `clue_log` DISABLE KEYS */;

INSERT INTO `clue_log` (`id`, `clue_id`, `content`, `created_time`, `is_delete`)
VALUES
	(45,4,'王俊凯线索1','2019-11-08 20:15:51',NULL),
	(46,3,'王源线索1','2019-11-08 20:16:01',NULL),
	(47,6,'赵润男线索1','2019-11-08 20:16:15',NULL),
	(48,3,'王源线索3','2019-11-12 10:33:04',NULL),
	(49,3,'王源线索2','2019-11-12 10:34:08',NULL),
	(50,3,'王源线索4','2019-11-12 10:34:35',NULL);

/*!40000 ALTER TABLE `clue_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `role` int(11) DEFAULT NULL COMMENT '角色',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `is_deleted` int(11) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `name`, `phone`, `password`, `role`, `created_time`, `is_deleted`)
VALUES
	(28,'易洋千玺','13500000001','111111',1,'2019-11-05 17:13:55',NULL),
	(29,'刘北山','13500000002','222222',2,'2019-11-05 17:31:33',NULL),
	(34,'小北','13500000003','333333',2,'2019-11-05 21:32:30',NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
