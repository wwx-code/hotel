/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.40 : Database - hotel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hotel`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `nickName` varchar(25) DEFAULT NULL COMMENT '昵称',
  `phoneNum` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `member` */

insert  into `member`(`id`,`name`,`nickName`,`phoneNum`,`email`) values (1,'张三','小三','1388888888','zhangsan@QQ.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderid` int(11) NOT NULL,
  `travellerid` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`orderid`,`travellerid`) USING BTREE,
  CONSTRAINT `order1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderid`,`travellerid`) values (1,'1'),(1,'2'),(2,'1'),(3,'1'),(4,'1');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(32) DEFAULT NULL,
  `memberId` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_o_p` (`productId`) USING BTREE,
  KEY `fk_o_m` (`memberId`) USING BTREE,
  CONSTRAINT `fk_o_m` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`),
  CONSTRAINT `fk_o_p` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`peopleCount`,`orderDesc`,`payType`,`orderStatus`,`productId`,`memberId`) values (1,'12345','2018-02-03 00:00:00',2,'北京两日游',0,1,1,1),(2,'12346','2020-04-15 11:15:17',2,'大连三日游',0,1,2,1),(3,'12347','2020-08-12 10:55:10',2,'云南双飞六日游',1,0,3,1),(4,'12348','2020-08-12 10:55:10',2,'海南海岛游',1,0,4,1),(5,'12349','2020-08-12 10:55:10',2,'四川生态游',1,1,4,1),(6,'12350','2020-08-15 10:57:38',2,'山西文化游',0,1,5,1),(7,'12351','2018-02-03 00:00:00',2,'大同两日游',0,0,5,1),(8,'12352','2020-04-15 11:15:17',2,'魔都三日游',0,1,6,1),(9,'12353','2020-08-12 10:55:10',2,'云贵六日游',1,1,8,1),(10,'12354','2020-08-12 10:55:10',2,'湖南三日游',1,1,7,1),(11,'12355','2020-08-12 10:55:10',2,'山东五日游',1,1,9,1),(12,'12356','2020-08-15 10:57:38',2,'长安文化游',0,1,4,1);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23529 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `permission` */

insert  into `permission`(`id`,`permissionName`,`url`) values (107,'角色管理','/role/findAll.do'),(1943,'资源权限管理','/permission/findAll.do'),(23527,'超级管理员','/user/findAll.do');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` datetime DEFAULT NULL,
  `productPrice` double(11,0) DEFAULT NULL,
  `productDesc` varchar(250) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`DepartureTime`,`productPrice`,`productDesc`,`productStatus`) values (1,'001','云南一日游','云南','2020-04-07 11:00:00',2100,'云南欢迎你',0),(2,'002','昆明三日游','昆明','2020-06-06 12:00:00',1800,'昆明欢迎你',1),(3,'003','上海一日游','上海','2020-05-08 08:00:00',3800,'魔都欢迎你',1),(4,'004','北京三日游','北京','2020-05-09 11:00:00',5800,'北京我来了',1),(5,'005','深圳七日游','昆明','2020-04-07 11:30:00',18000,'深圳欢迎你',1),(6,'006','昭通一日游','昭通','2020-05-08 03:00:00',1200,'昭通大山包',0),(7,'007','丽江一日游','昆明','2020-06-04 11:00:00',1500,'丽江古镇',0),(8,'aaa','aaaaa','aaaaa','2020-04-07 11:00:00',18000,'aaaa',1),(9,'33333','333333','333','2020-08-07 11:00:00',3333,'3333',0),(12,'009','111','111','2020-08-07 11:00:00',111,'1111',0);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) DEFAULT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `role` */

insert  into `role`(`id`,`roleName`,`roleDesc`) values (1,'ADMIN','系统管理员'),(2,'USER','用户');

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`) USING BTREE,
  KEY `r_id` (`roleId`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `role_permission` */

insert  into `role_permission`(`permissionId`,`roleId`) values (107,1),(1943,1),(23527,1),(107,2),(1943,2);

/*Table structure for table `syslog` */

DROP TABLE IF EXISTS `syslog`;

CREATE TABLE `syslog` (
  `id` int(70) NOT NULL AUTO_INCREMENT,
  `visitTime` datetime DEFAULT NULL COMMENT '访问时间',
  `username` varchar(50) DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(40) DEFAULT NULL COMMENT '访问ip',
  `url` varchar(40) DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int(11) DEFAULT NULL COMMENT '执行时长',
  `method` varchar(255) DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `syslog` */

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `sex` varchar(8) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL COMMENT '证件类型 0身份证 1护照 2军官证',
  `credentialsNum` varchar(50) DEFAULT NULL COMMENT '证件号码',
  `travellerType` int(11) DEFAULT NULL COMMENT '旅客类型(人群) 0 成人 1 儿童',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`name`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values (1,'赵龙','男','13888888888',0,'123456789009876543',0),(2,'张三','男','13999999999',0,'123456789009876543',0);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20616 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `users` */

insert  into `users`(`id`,`email`,`username`,`password`,`phoneNum`,`status`) values (1,'a@qq.com','admin','123456','13888888888',1),(2,'adfa','tom','123456','546514684',1),(3,'1847481@QQ.com','wBekvam','123456','15752250992',1);

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`) USING BTREE,
  KEY `roleId` (`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `users_role` */

insert  into `users_role`(`userId`,`roleId`) values (1,1),(1,2),(2,2),(3,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
