/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : db_pos

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-05-25 03:51:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,"0"为下架，"1"为上架，"2"为删除废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '李宁', null, '2017-03-19 12:59:07', '0');
INSERT INTO `brand` VALUES ('2', 'ANTA', null, '2017-03-19 13:00:02', '0');
INSERT INTO `brand` VALUES ('3', 'test', 'adad11', '2017-03-27 22:23:54', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '类别名称，非空',
  `pId` bigint(20) DEFAULT NULL COMMENT '父类别，参照本表的id',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,"0"为下架，"1"为上架，"2"为删除废弃',
  PRIMARY KEY (`id`),
  KEY `FK_parentId` (`pId`),
  CONSTRAINT `FK_parentId` FOREIGN KEY (`pId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('14', '服装', null, '测试', '2017-03-27 22:17:15', '0');
INSERT INTO `category` VALUES ('15', '上衣', '14', '测试', '2017-03-24 10:26:57', '0');
INSERT INTO `category` VALUES ('17', '皮衣', '15', '测试', '2017-03-18 22:01:48', '0');
INSERT INTO `category` VALUES ('28', 'T恤', '15', '11221', '2017-04-09 21:26:40', '0');
INSERT INTO `category` VALUES ('29', '鞋子', null, null, '2017-04-09 11:29:23', '0');
INSERT INTO `category` VALUES ('31', '12', null, null, '2017-04-11 22:04:18', '0');
INSERT INTO `category` VALUES ('32', '343', null, null, '2017-04-11 22:12:06', '0');

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,"0"为下架，"1"为上架，"2"为删除废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES ('1', '黄色', '萨达是', '2017-03-27 22:35:58', '0');
INSERT INTO `color` VALUES ('2', '蓝色', '阿达是', '2017-03-27 22:38:09', '0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `categoryId` bigint(20) NOT NULL COMMENT '款式id，参照style表',
  `colorId` bigint(20) NOT NULL COMMENT '颜色id，参照color表',
  `brandId` bigint(20) NOT NULL,
  `sizeId` bigint(20) NOT NULL,
  `barcode` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '条形码，非空',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `style` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '款式',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '售价',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,"0"为下架，"1"为上架，"2"为删除废弃',
  PRIMARY KEY (`id`),
  KEY `FK_goods_color` (`colorId`),
  KEY `FK_goods_categoryId` (`categoryId`),
  KEY `FK_goods_brandId` (`brandId`),
  KEY `FK_goods_sizeId` (`sizeId`),
  KEY `barcode` (`barcode`),
  CONSTRAINT `FK_goods_brandId` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_goods_categoryId` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_goods_color` FOREIGN KEY (`colorId`) REFERENCES `color` (`id`),
  CONSTRAINT `FK_goods_sizeId` FOREIGN KEY (`sizeId`) REFERENCES `size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '28', '2', '3', '1', '20170411211559', '测试2', '士大夫是', '99.00', null, '2017-04-11 22:01:28', '0');
INSERT INTO `goods` VALUES ('2', '28', '2', '3', '4', '20170325015835', '测试1', '阿三大婶a', '261.00', '1111\najfdasf', '2017-04-11 22:00:40', '0');
INSERT INTO `goods` VALUES ('3', '28', '1', '1', '5', '20170411220201', '2016夏季新款运动衫', 'null', '88.00', 'safds', '2017-04-11 22:02:01', '0');
INSERT INTO `goods` VALUES ('4', '28', '1', '1', '1', '20170411221135', '2017半袖新款夏装', 'null', '230.00', null, '2017-04-11 22:11:35', '0');
INSERT INTO `goods` VALUES ('5', '17', '1', '1', '1', '20170411221145', '2016爆款', 'null', '250.00', null, '2017-04-11 22:11:45', '0');
INSERT INTO `goods` VALUES ('6', '28', '2', '1', '1', '20170411221930', '2017夏季新款Polo衫', 'null', '140.00', null, '2017-04-11 22:19:30', '0');
INSERT INTO `goods` VALUES ('7', '28', '1', '1', '1', '20170411222447', '2017夏季短袖', 'null', '200.00', null, '2017-04-11 22:24:47', '0');
INSERT INTO `goods` VALUES ('8', '17', '1', '1', '1', '20170521165247', '更新测试', '', '100.00', null, '2017-05-21 16:52:47', '0');

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `goodsId` bigint(20) NOT NULL COMMENT '商品id，参照goods表',
  `warehouseId` bigint(20) NOT NULL COMMENT '仓库id，参照warehouse表',
  `quantity` int(11) NOT NULL COMMENT '库存数量',
  `amount` decimal(10,0) NOT NULL COMMENT '批发价',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_inventory_goodsId` (`goodsId`),
  KEY `FK_inventory_warehouseId` (`warehouseId`),
  CONSTRAINT `FK_inventory_goodsId` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_inventory_warehouseId` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('1', '2', '1', '171', '20000', '商品一', '2017-05-24 20:45:57');
INSERT INTO `inventory` VALUES ('2', '2', '1', '300', '20000', '商品一', '2017-05-24 20:45:57');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `shopId` bigint(20) NOT NULL COMMENT '店铺id，参照shop表',
  `operatorId` bigint(20) NOT NULL COMMENT '操作员id，参照user表',
  `customerNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '会员编号，0000默认为散客',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `sex` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `telephone` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机',
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'email',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '住址',
  `birthday` datetime NOT NULL COMMENT '生日',
  `password` char(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `grade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '等级',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`,`telephone`),
  KEY `FK_member_shopId` (`shopId`),
  KEY `FK_member_operatorId` (`operatorId`),
  KEY `customerNo` (`customerNo`),
  CONSTRAINT `FK_member_shopId` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`),
  CONSTRAINT `FK_members_operatorId` FOREIGN KEY (`operatorId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '1', '1', '0000', '散客', '男', '0000', null, null, '2017-04-22 22:55:12', null, null, null, '2017-04-22 22:55:23');
INSERT INTO `member` VALUES ('2', '1', '1', '0001', '会员1', '男', '12345678910', 'abc@qq.com', null, '2017-04-22 22:55:12', '123456', null, null, '2017-04-22 22:55:23');
INSERT INTO `member` VALUES ('3', '1', '2', '0002', '会员2', '女', '18819261098', '123@qq.com', null, '2017-04-22 22:55:12', '123456', null, null, '2017-04-22 22:55:23');
INSERT INTO `member` VALUES ('4', '1', '2', '0003', 'Joden', '男', '18819260978', 'abcd@qq.com', null, '2017-04-22 22:55:12', '123456', null, null, '2017-04-22 22:55:23');
INSERT INTO `member` VALUES ('5', '1', '1', '0004', '王建棠', '男', '18819261031', '1234@qq.com', null, '2017-05-25 01:47:59', '123456', null, null, '2017-05-25 01:48:45');
INSERT INTO `member` VALUES ('5', '1', '1', '0005', '丁浩', '男', '18819261032', '1234@qq.com', null, '2017-05-25 01:47:59', '123456', null, null, '2017-05-25 01:48:45');
INSERT INTO `member` VALUES ('5', '1', '1', '0005', '张露', '女', '18819261033', '1234@qq.com', null, '2017-05-25 01:47:59', '123456', null, null, '2017-05-25 01:48:45');

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `paymentNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '支付编号',
  `saleOrderNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号，参照sale_order表',
  `amount` decimal(10,2) NOT NULL COMMENT '支付金额',
  `payType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付方式，0代表现金支付',
  `payTransactionNo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支付交易号，现金支付为空',
  `payDateTime` datetime NOT NULL COMMENT '支付时间',
  `operatorId` bigint(20) NOT NULL COMMENT '操作员id，参照user表',
  `shopId` bigint(20) NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`),
  KEY `FK_p_saleOrderNo` (`saleOrderNo`),
  KEY `FK_p_operatorId` (`operatorId`),
  KEY `FK_p_shopId` (`shopId`),
  CONSTRAINT `FK_p_operatorId` FOREIGN KEY (`operatorId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_p_saleOrderNo` FOREIGN KEY (`saleOrderNo`) REFERENCES `sale_order` (`saleOrderNo`),
  CONSTRAINT `FK_p_shopId` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', 'P-2016-12-31-1789197016', 'SO-2016-12-31-0001', '396.00', '0', null, '2016-12-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('2', 'P-2017-01-01--638346755', 'SO-2017-01-01-0001', '1044.00', '0', null, '2017-01-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('3', 'P-2017-01-02-663974377', 'SO-2017-01-02-0001', '352.00', '0', null, '2017-01-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('4', 'P-2017-01-03-73553933', 'SO-2017-01-03-0001', '920.00', '0', null, '2017-01-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('5', 'P-2017-01-04--931658294', 'SO-2017-01-04-0001', '1000.00', '0', null, '2017-01-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('6', 'P-2017-01-05-613319952', 'SO-2017-01-05-0001', '560.00', '0', null, '2017-01-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('7', 'P-2017-01-06-100520240', 'SO-2017-01-06-0001', '800.00', '0', null, '2017-01-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('8', 'P-2017-01-07--729068538', 'SO-2017-01-07-0001', '400.00', '0', null, '2017-01-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('9', 'P-2017-01-08--1332829218', 'SO-2017-01-08-0001', '396.00', '0', null, '2017-01-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('10', 'P-2017-01-09--2001764902', 'SO-2017-01-09-0001', '1044.00', '0', null, '2017-01-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('11', 'P-2017-01-10--1596691372', 'SO-2017-01-10-0001', '352.00', '0', null, '2017-01-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('12', 'P-2017-01-11-1008023119', 'SO-2017-01-11-0001', '920.00', '0', null, '2017-01-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('13', 'P-2017-01-12--355958036', 'SO-2017-01-12-0001', '1000.00', '0', null, '2017-01-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('14', 'P-2017-01-13-845674441', 'SO-2017-01-13-0001', '560.00', '0', null, '2017-01-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('15', 'P-2017-01-14-540348418', 'SO-2017-01-14-0001', '800.00', '0', null, '2017-01-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('16', 'P-2017-01-15--39611712', 'SO-2017-01-15-0001', '400.00', '0', null, '2017-01-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('17', 'P-2017-01-16--2100127700', 'SO-2017-01-16-0001', '396.00', '0', null, '2017-01-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('18', 'P-2017-01-17-1920157168', 'SO-2017-01-17-0001', '1044.00', '0', null, '2017-01-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('19', 'P-2017-01-18-1038707283', 'SO-2017-01-18-0001', '352.00', '0', null, '2017-01-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('20', 'P-2017-01-19--2137385006', 'SO-2017-01-19-0001', '920.00', '0', null, '2017-01-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('21', 'P-2017-01-20--300508657', 'SO-2017-01-20-0001', '1000.00', '0', null, '2017-01-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('22', 'P-2017-01-21-1943434596', 'SO-2017-01-21-0001', '560.00', '0', null, '2017-01-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('23', 'P-2017-01-22-1698461923', 'SO-2017-01-22-0001', '800.00', '0', null, '2017-01-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('24', 'P-2017-01-23-636465641', 'SO-2017-01-23-0001', '400.00', '0', null, '2017-01-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('25', 'P-2017-01-24--878361012', 'SO-2017-01-24-0001', '396.00', '0', null, '2017-01-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('26', 'P-2017-01-25--204269754', 'SO-2017-01-25-0001', '1044.00', '0', null, '2017-01-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('27', 'P-2017-01-26-1615293198', 'SO-2017-01-26-0001', '352.00', '0', null, '2017-01-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('28', 'P-2017-01-31-2055067552', 'SO-2017-01-31-0001', '920.00', '0', null, '2017-01-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('29', 'P-2017-02-01--898493234', 'SO-2017-02-01-0001', '1000.00', '0', null, '2017-02-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('30', 'P-2017-02-02-641853543', 'SO-2017-02-02-0001', '560.00', '0', null, '2017-02-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('31', 'P-2017-02-03-84962575', 'SO-2017-02-03-0001', '800.00', '0', null, '2017-02-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('32', 'P-2017-02-04-409577929', 'SO-2017-02-04-0001', '400.00', '0', null, '2017-02-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('33', 'P-2017-02-05-1227448840', 'SO-2017-02-05-0001', '396.00', '0', null, '2017-02-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('34', 'P-2017-02-06--2125011067', 'SO-2017-02-06-0001', '1044.00', '0', null, '2017-02-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('35', 'P-2017-02-07--675629878', 'SO-2017-02-07-0001', '352.00', '0', null, '2017-02-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('36', 'P-2017-02-08-532901887', 'SO-2017-02-08-0001', '920.00', '0', null, '2017-02-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('37', 'P-2017-02-09-157900846', 'SO-2017-02-09-0001', '1000.00', '0', null, '2017-02-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('38', 'P-2017-02-10-389589073', 'SO-2017-02-10-0001', '560.00', '0', null, '2017-02-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('39', 'P-2017-02-11--1590037931', 'SO-2017-02-11-0001', '800.00', '0', null, '2017-02-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('40', 'P-2017-02-12-723552484', 'SO-2017-02-12-0001', '400.00', '0', null, '2017-02-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('41', 'P-2017-02-13-534077062', 'SO-2017-02-13-0001', '396.00', '0', null, '2017-02-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('42', 'P-2017-02-14--1432673997', 'SO-2017-02-14-0001', '1044.00', '0', null, '2017-02-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('43', 'P-2017-02-15-1345806177', 'SO-2017-02-15-0001', '352.00', '0', null, '2017-02-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('44', 'P-2017-02-16-406984327', 'SO-2017-02-16-0001', '920.00', '0', null, '2017-02-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('45', 'P-2017-02-17-865270942', 'SO-2017-02-17-0001', '1000.00', '0', null, '2017-02-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('46', 'P-2017-02-18--643158378', 'SO-2017-02-18-0001', '560.00', '0', null, '2017-02-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('47', 'P-2017-02-19-270387111', 'SO-2017-02-19-0001', '800.00', '0', null, '2017-02-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('48', 'P-2017-02-20-1110827799', 'SO-2017-02-20-0001', '400.00', '0', null, '2017-02-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('49', 'P-2017-02-21-79013896', 'SO-2017-02-21-0001', '396.00', '0', null, '2017-02-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('50', 'P-2017-02-22--1311405106', 'SO-2017-02-22-0001', '1044.00', '0', null, '2017-02-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('51', 'P-2017-02-23--576461717', 'SO-2017-02-23-0001', '352.00', '0', null, '2017-02-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('52', 'P-2017-02-24-1667064854', 'SO-2017-02-24-0001', '920.00', '0', null, '2017-02-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('53', 'P-2017-02-25--1149444375', 'SO-2017-02-25-0001', '1000.00', '0', null, '2017-02-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('54', 'P-2017-02-26-942544441', 'SO-2017-02-26-0001', '560.00', '0', null, '2017-02-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('55', 'P-2017-02-28--1311090438', 'SO-2017-02-28-0001', '800.00', '0', null, '2017-02-28 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('56', 'P-2017-03-01--653567815', 'SO-2017-03-01-0001', '400.00', '0', null, '2017-03-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('57', 'P-2017-03-02-1725485330', 'SO-2017-03-02-0001', '396.00', '0', null, '2017-03-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('58', 'P-2017-03-03-962028542', 'SO-2017-03-03-0001', '1044.00', '0', null, '2017-03-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('59', 'P-2017-03-04-1782083860', 'SO-2017-03-04-0001', '352.00', '0', null, '2017-03-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('60', 'P-2017-03-05--2128513236', 'SO-2017-03-05-0001', '920.00', '0', null, '2017-03-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('61', 'P-2017-03-06--419322686', 'SO-2017-03-06-0001', '1000.00', '0', null, '2017-03-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('62', 'P-2017-03-07--1511789665', 'SO-2017-03-07-0001', '560.00', '0', null, '2017-03-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('63', 'P-2017-03-08--4096732', 'SO-2017-03-08-0001', '800.00', '0', null, '2017-03-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('64', 'P-2017-03-09--1519156345', 'SO-2017-03-09-0001', '400.00', '0', null, '2017-03-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('65', 'P-2017-03-10-1868216933', 'SO-2017-03-10-0001', '396.00', '0', null, '2017-03-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('66', 'P-2017-03-11-460098250', 'SO-2017-03-11-0001', '1044.00', '0', null, '2017-03-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('67', 'P-2017-03-12-544935011', 'SO-2017-03-12-0001', '352.00', '0', null, '2017-03-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('68', 'P-2017-03-13--581136804', 'SO-2017-03-13-0001', '920.00', '0', null, '2017-03-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('69', 'P-2017-03-14-1668701066', 'SO-2017-03-14-0001', '1000.00', '0', null, '2017-03-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('70', 'P-2017-03-15--579750885', 'SO-2017-03-15-0001', '560.00', '0', null, '2017-03-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('71', 'P-2017-03-16-1741511052', 'SO-2017-03-16-0001', '800.00', '0', null, '2017-03-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('72', 'P-2017-03-17--1342915650', 'SO-2017-03-17-0001', '400.00', '0', null, '2017-03-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('73', 'P-2017-03-18-2048348353', 'SO-2017-03-18-0001', '396.00', '0', null, '2017-03-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('74', 'P-2017-03-19-538538263', 'SO-2017-03-19-0001', '1044.00', '0', null, '2017-03-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('75', 'P-2017-03-20-522606027', 'SO-2017-03-20-0001', '352.00', '0', null, '2017-03-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('76', 'P-2017-03-21-1412844935', 'SO-2017-03-21-0001', '920.00', '0', null, '2017-03-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('77', 'P-2017-03-22-1842092860', 'SO-2017-03-22-0001', '1000.00', '0', null, '2017-03-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('78', 'P-2017-03-23-1087972178', 'SO-2017-03-23-0001', '560.00', '0', null, '2017-03-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('79', 'P-2017-03-24-475931369', 'SO-2017-03-24-0001', '800.00', '0', null, '2017-03-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('80', 'P-2017-03-25--1958483737', 'SO-2017-03-25-0001', '400.00', '0', null, '2017-03-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('81', 'P-2017-03-26--1277421320', 'SO-2017-03-26-0001', '396.00', '0', null, '2017-03-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('82', 'P-2017-03-31-2137675973', 'SO-2017-03-31-0001', '1044.00', '0', null, '2017-03-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('83', 'P-2017-04-01--1196254820', 'SO-2017-04-01-0001', '352.00', '0', null, '2017-04-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('84', 'P-2017-04-02--1084370871', 'SO-2017-04-02-0001', '920.00', '0', null, '2017-04-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('85', 'P-2017-04-03-646959796', 'SO-2017-04-03-0001', '1000.00', '0', null, '2017-04-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('86', 'P-2017-04-04-187997910', 'SO-2017-04-04-0001', '560.00', '0', null, '2017-04-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('87', 'P-2017-04-05--794913948', 'SO-2017-04-05-0001', '800.00', '0', null, '2017-04-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('88', 'P-2017-04-06--390848040', 'SO-2017-04-06-0001', '400.00', '0', null, '2017-04-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('89', 'P-2017-04-07--1960191037', 'SO-2017-04-07-0001', '396.00', '0', null, '2017-04-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('90', 'P-2017-04-08-516842821', 'SO-2017-04-08-0001', '1044.00', '0', null, '2017-04-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('91', 'P-2017-04-09-1663481251', 'SO-2017-04-09-0001', '352.00', '0', null, '2017-04-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('92', 'P-2017-04-10-1797486234', 'SO-2017-04-10-0001', '920.00', '0', null, '2017-04-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('93', 'P-2017-04-11-948480962', 'SO-2017-04-11-0001', '1000.00', '0', null, '2017-04-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('94', 'P-2017-04-12-606310905', 'SO-2017-04-12-0001', '560.00', '0', null, '2017-04-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('95', 'P-2017-04-13--315351977', 'SO-2017-04-13-0001', '800.00', '0', null, '2017-04-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('96', 'P-2017-04-14--344835448', 'SO-2017-04-14-0001', '400.00', '0', null, '2017-04-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('97', 'P-2017-04-15--1836602074', 'SO-2017-04-15-0001', '396.00', '0', null, '2017-04-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('98', 'P-2017-04-16--178024502', 'SO-2017-04-16-0001', '1044.00', '0', null, '2017-04-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('99', 'P-2017-04-17--1841643029', 'SO-2017-04-17-0001', '352.00', '0', null, '2017-04-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('100', 'P-2017-04-18-1559086873', 'SO-2017-04-18-0001', '920.00', '0', null, '2017-04-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('101', 'P-2017-04-19--1745428688', 'SO-2017-04-19-0001', '1000.00', '0', null, '2017-04-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('102', 'P-2017-04-20-1473740787', 'SO-2017-04-20-0001', '560.00', '0', null, '2017-04-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('103', 'P-2017-04-21-1249743266', 'SO-2017-04-21-0001', '800.00', '0', null, '2017-04-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('104', 'P-2017-04-22--705988662', 'SO-2017-04-22-0001', '400.00', '0', null, '2017-04-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('105', 'P-2017-04-23--1608273513', 'SO-2017-04-23-0001', '396.00', '0', null, '2017-04-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('106', 'P-2017-04-24-741845004', 'SO-2017-04-24-0001', '1044.00', '0', null, '2017-04-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('107', 'P-2017-04-25-1177316430', 'SO-2017-04-25-0001', '352.00', '0', null, '2017-04-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('108', 'P-2017-04-26--755619760', 'SO-2017-04-26-0001', '920.00', '0', null, '2017-04-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('109', 'P-2017-04-30--1023423996', 'SO-2017-04-30-0001', '1000.00', '0', null, '2017-04-30 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('110', 'P-2017-05-01-1293974871', 'SO-2017-05-01-0001', '560.00', '0', null, '2017-05-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('111', 'P-2017-05-02--399291885', 'SO-2017-05-02-0001', '800.00', '0', null, '2017-05-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('112', 'P-2017-05-03-2006835355', 'SO-2017-05-03-0001', '400.00', '0', null, '2017-05-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('113', 'P-2017-05-04-1366659502', 'SO-2017-05-04-0001', '396.00', '0', null, '2017-05-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('114', 'P-2017-05-05--1049199495', 'SO-2017-05-05-0001', '1044.00', '0', null, '2017-05-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('115', 'P-2017-05-06-462903453', 'SO-2017-05-06-0001', '352.00', '0', null, '2017-05-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('116', 'P-2017-05-07--636997892', 'SO-2017-05-07-0001', '920.00', '0', null, '2017-05-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('117', 'P-2017-05-08-342959073', 'SO-2017-05-08-0001', '1000.00', '0', null, '2017-05-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('118', 'P-2017-05-09-1383774562', 'SO-2017-05-09-0001', '560.00', '0', null, '2017-05-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('119', 'P-2017-05-10-145934743', 'SO-2017-05-10-0001', '800.00', '0', null, '2017-05-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('120', 'P-2017-05-11--1607953914', 'SO-2017-05-11-0001', '400.00', '0', null, '2017-05-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('121', 'P-2017-05-12--262468158', 'SO-2017-05-12-0001', '396.00', '0', null, '2017-05-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('122', 'P-2017-05-13--958669679', 'SO-2017-05-13-0001', '1044.00', '0', null, '2017-05-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('123', 'P-2017-05-14--1100294682', 'SO-2017-05-14-0001', '352.00', '0', null, '2017-05-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('124', 'P-2017-05-15-166782478', 'SO-2017-05-15-0001', '920.00', '0', null, '2017-05-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('125', 'P-2017-05-16--596806666', 'SO-2017-05-16-0001', '1000.00', '0', null, '2017-05-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('126', 'P-2017-05-17-1534252773', 'SO-2017-05-17-0001', '560.00', '0', null, '2017-05-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('127', 'P-2017-05-18-446526268', 'SO-2017-05-18-0001', '800.00', '0', null, '2017-05-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('128', 'P-2017-05-19-2007475810', 'SO-2017-05-19-0001', '400.00', '0', null, '2017-05-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('129', 'P-2017-05-20-454657268', 'SO-2017-05-20-0001', '396.00', '0', null, '2017-05-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('130', 'P-2017-05-21--301647837', 'SO-2017-05-21-0001', '1044.00', '0', null, '2017-05-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('131', 'P-2017-05-22-279564170', 'SO-2017-05-22-0001', '352.00', '0', null, '2017-05-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('132', 'P-2017-05-23-1576271428', 'SO-2017-05-23-0001', '920.00', '0', null, '2017-05-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('133', 'P-2017-05-24--754070483', 'SO-2017-05-24-0001', '1000.00', '0', null, '2017-05-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('134', 'P-2017-05-25-1138205941', 'SO-2017-05-25-0001', '560.00', '0', null, '2017-05-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('135', 'P-2017-05-26-388907393', 'SO-2017-05-26-0001', '800.00', '0', null, '2017-05-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('136', 'P-2017-05-31--227737097', 'SO-2017-05-31-0001', '400.00', '0', null, '2017-05-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('137', 'P-2017-06-01--25474670', 'SO-2017-06-01-0001', '396.00', '0', null, '2017-06-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('138', 'P-2017-06-02-564046115', 'SO-2017-06-02-0001', '1044.00', '0', null, '2017-06-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('139', 'P-2017-06-03-1589958756', 'SO-2017-06-03-0001', '352.00', '0', null, '2017-06-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('140', 'P-2017-06-04-377607166', 'SO-2017-06-04-0001', '920.00', '0', null, '2017-06-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('141', 'P-2017-06-05-447629848', 'SO-2017-06-05-0001', '1000.00', '0', null, '2017-06-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('142', 'P-2017-06-06--1179169059', 'SO-2017-06-06-0001', '560.00', '0', null, '2017-06-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('143', 'P-2017-06-07-526848242', 'SO-2017-06-07-0001', '800.00', '0', null, '2017-06-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('144', 'P-2017-06-08--1442286720', 'SO-2017-06-08-0001', '400.00', '0', null, '2017-06-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('145', 'P-2017-06-09-1278738301', 'SO-2017-06-09-0001', '396.00', '0', null, '2017-06-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('146', 'P-2017-06-10--1594165744', 'SO-2017-06-10-0001', '1044.00', '0', null, '2017-06-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('147', 'P-2017-06-11--618156771', 'SO-2017-06-11-0001', '352.00', '0', null, '2017-06-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('148', 'P-2017-06-12--1800392039', 'SO-2017-06-12-0001', '920.00', '0', null, '2017-06-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('149', 'P-2017-06-13--1348594572', 'SO-2017-06-13-0001', '1000.00', '0', null, '2017-06-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('150', 'P-2017-06-14--1247406026', 'SO-2017-06-14-0001', '560.00', '0', null, '2017-06-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('151', 'P-2017-06-15--363607215', 'SO-2017-06-15-0001', '800.00', '0', null, '2017-06-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('152', 'P-2017-06-16--1203895517', 'SO-2017-06-16-0001', '400.00', '0', null, '2017-06-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('153', 'P-2017-06-17-481291727', 'SO-2017-06-17-0001', '396.00', '0', null, '2017-06-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('154', 'P-2017-06-18-1719959398', 'SO-2017-06-18-0001', '1044.00', '0', null, '2017-06-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('155', 'P-2017-06-19-63799389', 'SO-2017-06-19-0001', '352.00', '0', null, '2017-06-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('156', 'P-2017-06-20--1145122139', 'SO-2017-06-20-0001', '920.00', '0', null, '2017-06-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('157', 'P-2017-06-21--715715101', 'SO-2017-06-21-0001', '1000.00', '0', null, '2017-06-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('158', 'P-2017-06-22--2008459587', 'SO-2017-06-22-0001', '560.00', '0', null, '2017-06-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('159', 'P-2017-06-23--22558869', 'SO-2017-06-23-0001', '800.00', '0', null, '2017-06-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('160', 'P-2017-06-24--1311794423', 'SO-2017-06-24-0001', '400.00', '0', null, '2017-06-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('161', 'P-2017-06-25-1963957667', 'SO-2017-06-25-0001', '396.00', '0', null, '2017-06-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('162', 'P-2017-06-26--1549080526', 'SO-2017-06-26-0001', '1044.00', '0', null, '2017-06-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('163', 'P-2017-06-30-1673151216', 'SO-2017-06-30-0001', '352.00', '0', null, '2017-06-30 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('164', 'P-2017-07-01-1865521156', 'SO-2017-07-01-0001', '920.00', '0', null, '2017-07-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('165', 'P-2017-07-02--732575180', 'SO-2017-07-02-0001', '1000.00', '0', null, '2017-07-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('166', 'P-2017-07-03-1089900317', 'SO-2017-07-03-0001', '560.00', '0', null, '2017-07-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('167', 'P-2017-07-04--265942622', 'SO-2017-07-04-0001', '800.00', '0', null, '2017-07-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('168', 'P-2017-07-05-2106774307', 'SO-2017-07-05-0001', '400.00', '0', null, '2017-07-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('169', 'P-2017-07-06--1673336406', 'SO-2017-07-06-0001', '396.00', '0', null, '2017-07-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('170', 'P-2017-07-07--1317596022', 'SO-2017-07-07-0001', '1044.00', '0', null, '2017-07-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('171', 'P-2017-07-08-1001745896', 'SO-2017-07-08-0001', '352.00', '0', null, '2017-07-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('172', 'P-2017-07-09-145348751', 'SO-2017-07-09-0001', '920.00', '0', null, '2017-07-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('173', 'P-2017-07-10--1524489778', 'SO-2017-07-10-0001', '1000.00', '0', null, '2017-07-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('174', 'P-2017-07-11--2103327378', 'SO-2017-07-11-0001', '560.00', '0', null, '2017-07-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('175', 'P-2017-07-12-1820828718', 'SO-2017-07-12-0001', '800.00', '0', null, '2017-07-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('176', 'P-2017-07-13--448244776', 'SO-2017-07-13-0001', '400.00', '0', null, '2017-07-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('177', 'P-2017-07-14-2090270083', 'SO-2017-07-14-0001', '396.00', '0', null, '2017-07-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('178', 'P-2017-07-15--994915363', 'SO-2017-07-15-0001', '1044.00', '0', null, '2017-07-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('179', 'P-2017-07-16--1971510348', 'SO-2017-07-16-0001', '352.00', '0', null, '2017-07-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('180', 'P-2017-07-17-2102692376', 'SO-2017-07-17-0001', '920.00', '0', null, '2017-07-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('181', 'P-2017-07-18-324312829', 'SO-2017-07-18-0001', '1000.00', '0', null, '2017-07-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('182', 'P-2017-07-19--1321807523', 'SO-2017-07-19-0001', '560.00', '0', null, '2017-07-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('183', 'P-2017-07-20--1199673866', 'SO-2017-07-20-0001', '800.00', '0', null, '2017-07-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('184', 'P-2017-07-21-520511752', 'SO-2017-07-21-0001', '400.00', '0', null, '2017-07-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('185', 'P-2017-07-22--887159086', 'SO-2017-07-22-0001', '396.00', '0', null, '2017-07-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('186', 'P-2017-07-23--1300888585', 'SO-2017-07-23-0001', '1044.00', '0', null, '2017-07-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('187', 'P-2017-07-24--1241178118', 'SO-2017-07-24-0001', '352.00', '0', null, '2017-07-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('188', 'P-2017-07-25-1640720713', 'SO-2017-07-25-0001', '920.00', '0', null, '2017-07-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('189', 'P-2017-07-26--31962497', 'SO-2017-07-26-0001', '1000.00', '0', null, '2017-07-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('190', 'P-2017-07-31--1523467520', 'SO-2017-07-31-0001', '560.00', '0', null, '2017-07-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('191', 'P-2017-08-01--366788692', 'SO-2017-08-01-0001', '800.00', '0', null, '2017-08-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('192', 'P-2017-08-02--718875527', 'SO-2017-08-02-0001', '400.00', '0', null, '2017-08-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('193', 'P-2017-08-03-1649050946', 'SO-2017-08-03-0001', '396.00', '0', null, '2017-08-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('194', 'P-2017-08-04-30696574', 'SO-2017-08-04-0001', '1044.00', '0', null, '2017-08-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('195', 'P-2017-08-05-1357505835', 'SO-2017-08-05-0001', '352.00', '0', null, '2017-08-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('196', 'P-2017-08-06--251297953', 'SO-2017-08-06-0001', '920.00', '0', null, '2017-08-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('197', 'P-2017-08-07--1379600700', 'SO-2017-08-07-0001', '1000.00', '0', null, '2017-08-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('198', 'P-2017-08-08--814583769', 'SO-2017-08-08-0001', '560.00', '0', null, '2017-08-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('199', 'P-2017-08-09-983449229', 'SO-2017-08-09-0001', '800.00', '0', null, '2017-08-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('200', 'P-2017-08-10-1906095346', 'SO-2017-08-10-0001', '400.00', '0', null, '2017-08-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('201', 'P-2017-08-11-730372472', 'SO-2017-08-11-0001', '396.00', '0', null, '2017-08-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('202', 'P-2017-08-12--800573200', 'SO-2017-08-12-0001', '1044.00', '0', null, '2017-08-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('203', 'P-2017-08-13--1141499559', 'SO-2017-08-13-0001', '352.00', '0', null, '2017-08-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('204', 'P-2017-08-14-636825455', 'SO-2017-08-14-0001', '920.00', '0', null, '2017-08-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('205', 'P-2017-08-15--993832776', 'SO-2017-08-15-0001', '1000.00', '0', null, '2017-08-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('206', 'P-2017-08-16-2064888429', 'SO-2017-08-16-0001', '560.00', '0', null, '2017-08-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('207', 'P-2017-08-17-695195427', 'SO-2017-08-17-0001', '800.00', '0', null, '2017-08-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('208', 'P-2017-08-18--237836439', 'SO-2017-08-18-0001', '400.00', '0', null, '2017-08-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('209', 'P-2017-08-19-1234933117', 'SO-2017-08-19-0001', '396.00', '0', null, '2017-08-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('210', 'P-2017-08-20--477932470', 'SO-2017-08-20-0001', '1044.00', '0', null, '2017-08-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('211', 'P-2017-08-21-917844845', 'SO-2017-08-21-0001', '352.00', '0', null, '2017-08-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('212', 'P-2017-08-22-939975341', 'SO-2017-08-22-0001', '920.00', '0', null, '2017-08-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('213', 'P-2017-08-23-706558913', 'SO-2017-08-23-0001', '1000.00', '0', null, '2017-08-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('214', 'P-2017-08-24-637355652', 'SO-2017-08-24-0001', '560.00', '0', null, '2017-08-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('215', 'P-2017-08-25--1563144445', 'SO-2017-08-25-0001', '800.00', '0', null, '2017-08-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('216', 'P-2017-08-26--485281764', 'SO-2017-08-26-0001', '400.00', '0', null, '2017-08-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('217', 'P-2017-08-31-2121694508', 'SO-2017-08-31-0001', '396.00', '0', null, '2017-08-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('218', 'P-2017-09-01--2023358312', 'SO-2017-09-01-0001', '1044.00', '0', null, '2017-09-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('219', 'P-2017-09-02-1955702513', 'SO-2017-09-02-0001', '352.00', '0', null, '2017-09-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('220', 'P-2017-09-03--1007554818', 'SO-2017-09-03-0001', '920.00', '0', null, '2017-09-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('221', 'P-2017-09-04--377355106', 'SO-2017-09-04-0001', '1000.00', '0', null, '2017-09-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('222', 'P-2017-09-05-1288764981', 'SO-2017-09-05-0001', '560.00', '0', null, '2017-09-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('223', 'P-2017-09-06-1603725014', 'SO-2017-09-06-0001', '800.00', '0', null, '2017-09-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('224', 'P-2017-09-07--1403528207', 'SO-2017-09-07-0001', '400.00', '0', null, '2017-09-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('225', 'P-2017-09-08-1532727663', 'SO-2017-09-08-0001', '396.00', '0', null, '2017-09-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('226', 'P-2017-09-09--222844905', 'SO-2017-09-09-0001', '1044.00', '0', null, '2017-09-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('227', 'P-2017-09-10-2084073690', 'SO-2017-09-10-0001', '352.00', '0', null, '2017-09-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('228', 'P-2017-09-11--1298786957', 'SO-2017-09-11-0001', '920.00', '0', null, '2017-09-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('229', 'P-2017-09-12--1494036001', 'SO-2017-09-12-0001', '1000.00', '0', null, '2017-09-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('230', 'P-2017-09-13--1613334263', 'SO-2017-09-13-0001', '560.00', '0', null, '2017-09-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('231', 'P-2017-09-14-196303457', 'SO-2017-09-14-0001', '800.00', '0', null, '2017-09-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('232', 'P-2017-09-15--1333386278', 'SO-2017-09-15-0001', '400.00', '0', null, '2017-09-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('233', 'P-2017-09-16--89811603', 'SO-2017-09-16-0001', '396.00', '0', null, '2017-09-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('234', 'P-2017-09-17-1106786346', 'SO-2017-09-17-0001', '1044.00', '0', null, '2017-09-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('235', 'P-2017-09-18-1260433207', 'SO-2017-09-18-0001', '352.00', '0', null, '2017-09-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('236', 'P-2017-09-19-620405149', 'SO-2017-09-19-0001', '920.00', '0', null, '2017-09-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('237', 'P-2017-09-20-911382658', 'SO-2017-09-20-0001', '1000.00', '0', null, '2017-09-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('238', 'P-2017-09-21--1129070129', 'SO-2017-09-21-0001', '560.00', '0', null, '2017-09-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('239', 'P-2017-09-22--1427543245', 'SO-2017-09-22-0001', '800.00', '0', null, '2017-09-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('240', 'P-2017-09-23--2100653829', 'SO-2017-09-23-0001', '400.00', '0', null, '2017-09-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('241', 'P-2017-09-24-140527988', 'SO-2017-09-24-0001', '396.00', '0', null, '2017-09-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('242', 'P-2017-09-25--2119826742', 'SO-2017-09-25-0001', '1044.00', '0', null, '2017-09-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('243', 'P-2017-09-26-144184628', 'SO-2017-09-26-0001', '352.00', '0', null, '2017-09-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('244', 'P-2017-09-30-1017283886', 'SO-2017-09-30-0001', '920.00', '0', null, '2017-09-30 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('245', 'P-2017-10-01-783853169', 'SO-2017-10-01-0001', '1000.00', '0', null, '2017-10-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('246', 'P-2017-10-02--1652945977', 'SO-2017-10-02-0001', '560.00', '0', null, '2017-10-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('247', 'P-2017-10-03--390947566', 'SO-2017-10-03-0001', '800.00', '0', null, '2017-10-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('248', 'P-2017-10-04-259774772', 'SO-2017-10-04-0001', '400.00', '0', null, '2017-10-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('249', 'P-2017-10-05--1984372867', 'SO-2017-10-05-0001', '396.00', '0', null, '2017-10-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('250', 'P-2017-10-06-1018463858', 'SO-2017-10-06-0001', '1044.00', '0', null, '2017-10-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('251', 'P-2017-10-07--1695096219', 'SO-2017-10-07-0001', '352.00', '0', null, '2017-10-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('252', 'P-2017-10-08--1861394369', 'SO-2017-10-08-0001', '920.00', '0', null, '2017-10-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('253', 'P-2017-10-09--95463611', 'SO-2017-10-09-0001', '1000.00', '0', null, '2017-10-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('254', 'P-2017-10-10--1770058417', 'SO-2017-10-10-0001', '560.00', '0', null, '2017-10-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('255', 'P-2017-10-11--109587922', 'SO-2017-10-11-0001', '800.00', '0', null, '2017-10-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('256', 'P-2017-10-12--377076351', 'SO-2017-10-12-0001', '400.00', '0', null, '2017-10-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('257', 'P-2017-10-13-858375395', 'SO-2017-10-13-0001', '396.00', '0', null, '2017-10-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('258', 'P-2017-10-14-1114126332', 'SO-2017-10-14-0001', '1044.00', '0', null, '2017-10-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('259', 'P-2017-10-15--878971590', 'SO-2017-10-15-0001', '352.00', '0', null, '2017-10-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('260', 'P-2017-10-16-506999846', 'SO-2017-10-16-0001', '920.00', '0', null, '2017-10-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('261', 'P-2017-10-17--1715392073', 'SO-2017-10-17-0001', '1000.00', '0', null, '2017-10-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('262', 'P-2017-10-18-1288711930', 'SO-2017-10-18-0001', '560.00', '0', null, '2017-10-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('263', 'P-2017-10-19-2050625662', 'SO-2017-10-19-0001', '800.00', '0', null, '2017-10-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('264', 'P-2017-10-20--483380501', 'SO-2017-10-20-0001', '400.00', '0', null, '2017-10-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('265', 'P-2017-10-21--1081139780', 'SO-2017-10-21-0001', '396.00', '0', null, '2017-10-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('266', 'P-2017-10-22-1220485542', 'SO-2017-10-22-0001', '1044.00', '0', null, '2017-10-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('267', 'P-2017-10-23--484748265', 'SO-2017-10-23-0001', '352.00', '0', null, '2017-10-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('268', 'P-2017-10-24--1703291124', 'SO-2017-10-24-0001', '920.00', '0', null, '2017-10-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('269', 'P-2017-10-25-1881982153', 'SO-2017-10-25-0001', '1000.00', '0', null, '2017-10-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('270', 'P-2017-10-26-63115729', 'SO-2017-10-26-0001', '560.00', '0', null, '2017-10-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('271', 'P-2017-10-31-244760218', 'SO-2017-10-31-0001', '800.00', '0', null, '2017-10-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('272', 'P-2017-11-01-174474566', 'SO-2017-11-01-0001', '400.00', '0', null, '2017-11-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('273', 'P-2017-11-02-1661317232', 'SO-2017-11-02-0001', '396.00', '0', null, '2017-11-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('274', 'P-2017-11-03--1848246877', 'SO-2017-11-03-0001', '1044.00', '0', null, '2017-11-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('275', 'P-2017-11-04--1473825208', 'SO-2017-11-04-0001', '352.00', '0', null, '2017-11-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('276', 'P-2017-11-05--80803111', 'SO-2017-11-05-0001', '920.00', '0', null, '2017-11-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('277', 'P-2017-11-06--1131562581', 'SO-2017-11-06-0001', '1000.00', '0', null, '2017-11-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('278', 'P-2017-11-07--994360805', 'SO-2017-11-07-0001', '560.00', '0', null, '2017-11-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('279', 'P-2017-11-08--76464880', 'SO-2017-11-08-0001', '800.00', '0', null, '2017-11-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('280', 'P-2017-11-09-1116580557', 'SO-2017-11-09-0001', '400.00', '0', null, '2017-11-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('281', 'P-2017-11-10--38809973', 'SO-2017-11-10-0001', '396.00', '0', null, '2017-11-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('282', 'P-2017-11-11--1387315578', 'SO-2017-11-11-0001', '1044.00', '0', null, '2017-11-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('283', 'P-2017-11-12--822879501', 'SO-2017-11-12-0001', '352.00', '0', null, '2017-11-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('284', 'P-2017-11-13--1308579999', 'SO-2017-11-13-0001', '920.00', '0', null, '2017-11-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('285', 'P-2017-11-14-480339190', 'SO-2017-11-14-0001', '1000.00', '0', null, '2017-11-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('286', 'P-2017-11-15--1409329549', 'SO-2017-11-15-0001', '560.00', '0', null, '2017-11-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('287', 'P-2017-11-16-253074339', 'SO-2017-11-16-0001', '800.00', '0', null, '2017-11-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('288', 'P-2017-11-17-2010479076', 'SO-2017-11-17-0001', '400.00', '0', null, '2017-11-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('289', 'P-2017-11-18--322769229', 'SO-2017-11-18-0001', '396.00', '0', null, '2017-11-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('290', 'P-2017-11-19--1612102174', 'SO-2017-11-19-0001', '1044.00', '0', null, '2017-11-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('291', 'P-2017-11-20--2100621425', 'SO-2017-11-20-0001', '352.00', '0', null, '2017-11-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('292', 'P-2017-11-21--267935169', 'SO-2017-11-21-0001', '920.00', '0', null, '2017-11-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('293', 'P-2017-11-22--1695787657', 'SO-2017-11-22-0001', '1000.00', '0', null, '2017-11-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('294', 'P-2017-11-23-1371214158', 'SO-2017-11-23-0001', '560.00', '0', null, '2017-11-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('295', 'P-2017-11-24--356479427', 'SO-2017-11-24-0001', '800.00', '0', null, '2017-11-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('296', 'P-2017-11-25-1026781129', 'SO-2017-11-25-0001', '400.00', '0', null, '2017-11-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('297', 'P-2017-11-26-460211966', 'SO-2017-11-26-0001', '396.00', '0', null, '2017-11-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('298', 'P-2017-11-30-1006189263', 'SO-2017-11-30-0001', '1044.00', '0', null, '2017-11-30 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('299', 'P-2017-12-01-807535717', 'SO-2017-12-01-0001', '352.00', '0', null, '2017-12-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('300', 'P-2017-12-02--1054662676', 'SO-2017-12-02-0001', '920.00', '0', null, '2017-12-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('301', 'P-2017-12-03-1053561821', 'SO-2017-12-03-0001', '1000.00', '0', null, '2017-12-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('302', 'P-2017-12-04-274657377', 'SO-2017-12-04-0001', '560.00', '0', null, '2017-12-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('303', 'P-2017-12-05-497108670', 'SO-2017-12-05-0001', '800.00', '0', null, '2017-12-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('304', 'P-2017-12-06--1646537190', 'SO-2017-12-06-0001', '400.00', '0', null, '2017-12-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('305', 'P-2017-12-07--1199095536', 'SO-2017-12-07-0001', '396.00', '0', null, '2017-12-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('306', 'P-2017-12-08--470873882', 'SO-2017-12-08-0001', '1044.00', '0', null, '2017-12-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('307', 'P-2017-12-09--1954088458', 'SO-2017-12-09-0001', '352.00', '0', null, '2017-12-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('308', 'P-2017-12-10--391987386', 'SO-2017-12-10-0001', '920.00', '0', null, '2017-12-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('309', 'P-2017-12-11-1591473149', 'SO-2017-12-11-0001', '1000.00', '0', null, '2017-12-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('310', 'P-2017-12-12-37818937', 'SO-2017-12-12-0001', '560.00', '0', null, '2017-12-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('311', 'P-2017-12-13-595402013', 'SO-2017-12-13-0001', '800.00', '0', null, '2017-12-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('312', 'P-2017-12-14--1483948154', 'SO-2017-12-14-0001', '400.00', '0', null, '2017-12-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('313', 'P-2017-12-15--590848117', 'SO-2017-12-15-0001', '396.00', '0', null, '2017-12-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('314', 'P-2017-12-16-1204561980', 'SO-2017-12-16-0001', '1044.00', '0', null, '2017-12-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('315', 'P-2017-12-17--1360014599', 'SO-2017-12-17-0001', '352.00', '0', null, '2017-12-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('316', 'P-2017-12-18-1155125051', 'SO-2017-12-18-0001', '920.00', '0', null, '2017-12-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('317', 'P-2017-12-19-253613862', 'SO-2017-12-19-0001', '1000.00', '0', null, '2017-12-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('318', 'P-2017-12-20-1021375537', 'SO-2017-12-20-0001', '560.00', '0', null, '2017-12-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('319', 'P-2017-12-21-1028228816', 'SO-2017-12-21-0001', '800.00', '0', null, '2017-12-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('320', 'P-2017-12-22--1088360756', 'SO-2017-12-22-0001', '400.00', '0', null, '2017-12-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('321', 'P-2017-12-23--810634940', 'SO-2017-12-23-0001', '396.00', '0', null, '2017-12-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('322', 'P-2017-12-24-968187198', 'SO-2017-12-24-0001', '1044.00', '0', null, '2017-12-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('323', 'P-2017-12-25-1717942115', 'SO-2017-12-25-0001', '352.00', '0', null, '2017-12-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('324', 'P-2017-12-26-1507286864', 'SO-2017-12-26-0001', '920.00', '0', null, '2017-12-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('325', 'P-2015-12-31--1066673178', 'SO-2015-12-31-0001', '1000.00', '0', null, '2015-12-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('326', 'P-2016-01-01--135318996', 'SO-2016-01-01-0001', '560.00', '0', null, '2016-01-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('327', 'P-2016-01-02--1164072953', 'SO-2016-01-02-0001', '800.00', '0', null, '2016-01-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('328', 'P-2016-01-03--2030112352', 'SO-2016-01-03-0001', '400.00', '0', null, '2016-01-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('329', 'P-2016-01-04-1807750918', 'SO-2016-01-04-0001', '396.00', '0', null, '2016-01-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('330', 'P-2016-01-05--1173885032', 'SO-2016-01-05-0001', '1044.00', '0', null, '2016-01-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('331', 'P-2016-01-06--991955161', 'SO-2016-01-06-0001', '352.00', '0', null, '2016-01-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('332', 'P-2016-01-07--1851899720', 'SO-2016-01-07-0001', '920.00', '0', null, '2016-01-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('333', 'P-2016-01-08-486732818', 'SO-2016-01-08-0001', '1000.00', '0', null, '2016-01-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('334', 'P-2016-01-09-1721622203', 'SO-2016-01-09-0001', '560.00', '0', null, '2016-01-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('335', 'P-2016-01-10--1968512185', 'SO-2016-01-10-0001', '800.00', '0', null, '2016-01-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('336', 'P-2016-01-11--1443926185', 'SO-2016-01-11-0001', '400.00', '0', null, '2016-01-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('337', 'P-2016-01-12--368038629', 'SO-2016-01-12-0001', '396.00', '0', null, '2016-01-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('338', 'P-2016-01-13-2108494712', 'SO-2016-01-13-0001', '1044.00', '0', null, '2016-01-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('339', 'P-2016-01-14--1910939348', 'SO-2016-01-14-0001', '352.00', '0', null, '2016-01-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('340', 'P-2016-01-15--2139231402', 'SO-2016-01-15-0001', '920.00', '0', null, '2016-01-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('341', 'P-2016-01-16-1897354351', 'SO-2016-01-16-0001', '1000.00', '0', null, '2016-01-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('342', 'P-2016-01-17-851412798', 'SO-2016-01-17-0001', '560.00', '0', null, '2016-01-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('343', 'P-2016-01-18-1547633651', 'SO-2016-01-18-0001', '800.00', '0', null, '2016-01-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('344', 'P-2016-01-19-1793767375', 'SO-2016-01-19-0001', '400.00', '0', null, '2016-01-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('345', 'P-2016-01-20-1913718104', 'SO-2016-01-20-0001', '396.00', '0', null, '2016-01-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('346', 'P-2016-01-21--465916823', 'SO-2016-01-21-0001', '1044.00', '0', null, '2016-01-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('347', 'P-2016-01-22-1817027488', 'SO-2016-01-22-0001', '352.00', '0', null, '2016-01-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('348', 'P-2016-01-23--1893219412', 'SO-2016-01-23-0001', '920.00', '0', null, '2016-01-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('349', 'P-2016-01-24--1514093142', 'SO-2016-01-24-0001', '1000.00', '0', null, '2016-01-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('350', 'P-2016-01-25--1244968973', 'SO-2016-01-25-0001', '560.00', '0', null, '2016-01-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('351', 'P-2016-01-26--1600539517', 'SO-2016-01-26-0001', '800.00', '0', null, '2016-01-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('352', 'P-2016-01-31-1100938954', 'SO-2016-01-31-0001', '400.00', '0', null, '2016-01-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('353', 'P-2016-02-01--1717275214', 'SO-2016-02-01-0001', '396.00', '0', null, '2016-02-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('354', 'P-2016-02-02-144521082', 'SO-2016-02-02-0001', '1044.00', '0', null, '2016-02-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('355', 'P-2016-02-03--148792103', 'SO-2016-02-03-0001', '352.00', '0', null, '2016-02-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('356', 'P-2016-02-04--1151663372', 'SO-2016-02-04-0001', '920.00', '0', null, '2016-02-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('357', 'P-2016-02-05-641937666', 'SO-2016-02-05-0001', '1000.00', '0', null, '2016-02-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('358', 'P-2016-02-06-354471199', 'SO-2016-02-06-0001', '560.00', '0', null, '2016-02-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('359', 'P-2016-02-07--1297955346', 'SO-2016-02-07-0001', '800.00', '0', null, '2016-02-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('360', 'P-2016-02-08--1855497988', 'SO-2016-02-08-0001', '400.00', '0', null, '2016-02-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('361', 'P-2016-02-09--955820305', 'SO-2016-02-09-0001', '396.00', '0', null, '2016-02-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('362', 'P-2016-02-10-1887909633', 'SO-2016-02-10-0001', '1044.00', '0', null, '2016-02-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('363', 'P-2016-02-11--160651037', 'SO-2016-02-11-0001', '352.00', '0', null, '2016-02-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('364', 'P-2016-02-12--949785077', 'SO-2016-02-12-0001', '920.00', '0', null, '2016-02-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('365', 'P-2016-02-13-2112644804', 'SO-2016-02-13-0001', '1000.00', '0', null, '2016-02-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('366', 'P-2016-02-14--1381414056', 'SO-2016-02-14-0001', '560.00', '0', null, '2016-02-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('367', 'P-2016-02-15--1328875346', 'SO-2016-02-15-0001', '800.00', '0', null, '2016-02-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('368', 'P-2016-02-16--1911874628', 'SO-2016-02-16-0001', '400.00', '0', null, '2016-02-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('369', 'P-2016-02-17-959962114', 'SO-2016-02-17-0001', '396.00', '0', null, '2016-02-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('370', 'P-2016-02-18-2126470691', 'SO-2016-02-18-0001', '1044.00', '0', null, '2016-02-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('371', 'P-2016-02-19-1237811339', 'SO-2016-02-19-0001', '352.00', '0', null, '2016-02-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('372', 'P-2016-02-20--1643854976', 'SO-2016-02-20-0001', '920.00', '0', null, '2016-02-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('373', 'P-2016-02-21--572528603', 'SO-2016-02-21-0001', '1000.00', '0', null, '2016-02-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('374', 'P-2016-02-22-176413229', 'SO-2016-02-22-0001', '560.00', '0', null, '2016-02-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('375', 'P-2016-02-23-1011036898', 'SO-2016-02-23-0001', '800.00', '0', null, '2016-02-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('376', 'P-2016-02-24--1282417191', 'SO-2016-02-24-0001', '400.00', '0', null, '2016-02-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('377', 'P-2016-02-25--1749275693', 'SO-2016-02-25-0001', '396.00', '0', null, '2016-02-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('378', 'P-2016-02-26-1196711514', 'SO-2016-02-26-0001', '1044.00', '0', null, '2016-02-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('379', 'P-2016-02-29-1721913325', 'SO-2016-02-29-0001', '352.00', '0', null, '2016-02-29 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('380', 'P-2016-03-01-1633933147', 'SO-2016-03-01-0001', '920.00', '0', null, '2016-03-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('381', 'P-2016-03-02--2030821706', 'SO-2016-03-02-0001', '1000.00', '0', null, '2016-03-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('382', 'P-2016-03-03-1518098175', 'SO-2016-03-03-0001', '560.00', '0', null, '2016-03-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('383', 'P-2016-03-04-585692074', 'SO-2016-03-04-0001', '800.00', '0', null, '2016-03-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('384', 'P-2016-03-05--1920875330', 'SO-2016-03-05-0001', '400.00', '0', null, '2016-03-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('385', 'P-2016-03-06-1483577050', 'SO-2016-03-06-0001', '396.00', '0', null, '2016-03-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('386', 'P-2016-03-07-34425024', 'SO-2016-03-07-0001', '1044.00', '0', null, '2016-03-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('387', 'P-2016-03-08--1754513145', 'SO-2016-03-08-0001', '352.00', '0', null, '2016-03-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('388', 'P-2016-03-09-2141896795', 'SO-2016-03-09-0001', '920.00', '0', null, '2016-03-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('389', 'P-2016-03-10-289273605', 'SO-2016-03-10-0001', '1000.00', '0', null, '2016-03-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('390', 'P-2016-03-11--23024991', 'SO-2016-03-11-0001', '560.00', '0', null, '2016-03-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('391', 'P-2016-03-12--93006695', 'SO-2016-03-12-0001', '800.00', '0', null, '2016-03-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('392', 'P-2016-03-13-46900589', 'SO-2016-03-13-0001', '400.00', '0', null, '2016-03-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('393', 'P-2016-03-14-152771627', 'SO-2016-03-14-0001', '396.00', '0', null, '2016-03-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('394', 'P-2016-03-15--41651726', 'SO-2016-03-15-0001', '1044.00', '0', null, '2016-03-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('395', 'P-2016-03-16--1473161809', 'SO-2016-03-16-0001', '352.00', '0', null, '2016-03-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('396', 'P-2016-03-17--1007153808', 'SO-2016-03-17-0001', '920.00', '0', null, '2016-03-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('397', 'P-2016-03-18-1675665060', 'SO-2016-03-18-0001', '1000.00', '0', null, '2016-03-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('398', 'P-2016-03-19--18062621', 'SO-2016-03-19-0001', '560.00', '0', null, '2016-03-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('399', 'P-2016-03-20--1127050947', 'SO-2016-03-20-0001', '800.00', '0', null, '2016-03-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('400', 'P-2016-03-21--1351245209', 'SO-2016-03-21-0001', '400.00', '0', null, '2016-03-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('401', 'P-2016-03-22--996755274', 'SO-2016-03-22-0001', '396.00', '0', null, '2016-03-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('402', 'P-2016-03-23-124764910', 'SO-2016-03-23-0001', '1044.00', '0', null, '2016-03-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('403', 'P-2016-03-24-341687499', 'SO-2016-03-24-0001', '352.00', '0', null, '2016-03-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('404', 'P-2016-03-25--1694812653', 'SO-2016-03-25-0001', '920.00', '0', null, '2016-03-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('405', 'P-2016-03-26--909108527', 'SO-2016-03-26-0001', '1000.00', '0', null, '2016-03-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('406', 'P-2016-03-31-1659715564', 'SO-2016-03-31-0001', '560.00', '0', null, '2016-03-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('407', 'P-2016-04-01--377735316', 'SO-2016-04-01-0001', '800.00', '0', null, '2016-04-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('408', 'P-2016-04-02--986851298', 'SO-2016-04-02-0001', '400.00', '0', null, '2016-04-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('409', 'P-2016-04-03-507552578', 'SO-2016-04-03-0001', '396.00', '0', null, '2016-04-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('410', 'P-2016-04-04-1436344419', 'SO-2016-04-04-0001', '1044.00', '0', null, '2016-04-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('411', 'P-2016-04-05-349863482', 'SO-2016-04-05-0001', '352.00', '0', null, '2016-04-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('412', 'P-2016-04-06-150718533', 'SO-2016-04-06-0001', '920.00', '0', null, '2016-04-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('413', 'P-2016-04-07--368616941', 'SO-2016-04-07-0001', '1000.00', '0', null, '2016-04-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('414', 'P-2016-04-08--1657629051', 'SO-2016-04-08-0001', '560.00', '0', null, '2016-04-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('415', 'P-2016-04-09-1807128696', 'SO-2016-04-09-0001', '800.00', '0', null, '2016-04-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('416', 'P-2016-04-10-221368050', 'SO-2016-04-10-0001', '400.00', '0', null, '2016-04-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('417', 'P-2016-04-11-718803926', 'SO-2016-04-11-0001', '396.00', '0', null, '2016-04-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('418', 'P-2016-04-12--1277734940', 'SO-2016-04-12-0001', '1044.00', '0', null, '2016-04-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('419', 'P-2016-04-13--868575051', 'SO-2016-04-13-0001', '352.00', '0', null, '2016-04-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('420', 'P-2016-04-14--1836983258', 'SO-2016-04-14-0001', '920.00', '0', null, '2016-04-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('421', 'P-2016-04-15--1487553542', 'SO-2016-04-15-0001', '1000.00', '0', null, '2016-04-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('422', 'P-2016-04-16--848480923', 'SO-2016-04-16-0001', '560.00', '0', null, '2016-04-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('423', 'P-2016-04-17--2005425534', 'SO-2016-04-17-0001', '800.00', '0', null, '2016-04-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('424', 'P-2016-04-18--596197137', 'SO-2016-04-18-0001', '400.00', '0', null, '2016-04-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('425', 'P-2016-04-19--1897093881', 'SO-2016-04-19-0001', '396.00', '0', null, '2016-04-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('426', 'P-2016-04-20-385836617', 'SO-2016-04-20-0001', '1044.00', '0', null, '2016-04-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('427', 'P-2016-04-21--1283512364', 'SO-2016-04-21-0001', '352.00', '0', null, '2016-04-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('428', 'P-2016-04-22-791825140', 'SO-2016-04-22-0001', '920.00', '0', null, '2016-04-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('429', 'P-2016-04-23-1069376128', 'SO-2016-04-23-0001', '1000.00', '0', null, '2016-04-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('430', 'P-2016-04-24-132479857', 'SO-2016-04-24-0001', '560.00', '0', null, '2016-04-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('431', 'P-2016-04-25-87149681', 'SO-2016-04-25-0001', '800.00', '0', null, '2016-04-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('432', 'P-2016-04-26--1434774078', 'SO-2016-04-26-0001', '400.00', '0', null, '2016-04-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('433', 'P-2016-04-30-684714453', 'SO-2016-04-30-0001', '396.00', '0', null, '2016-04-30 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('434', 'P-2016-05-01--1330339022', 'SO-2016-05-01-0001', '1044.00', '0', null, '2016-05-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('435', 'P-2016-05-02--102958366', 'SO-2016-05-02-0001', '352.00', '0', null, '2016-05-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('436', 'P-2016-05-03-2005960623', 'SO-2016-05-03-0001', '920.00', '0', null, '2016-05-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('437', 'P-2016-05-04--1675513244', 'SO-2016-05-04-0001', '1000.00', '0', null, '2016-05-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('438', 'P-2016-05-05--1476256956', 'SO-2016-05-05-0001', '560.00', '0', null, '2016-05-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('439', 'P-2016-05-06--1547753046', 'SO-2016-05-06-0001', '800.00', '0', null, '2016-05-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('440', 'P-2016-05-07--1616765973', 'SO-2016-05-07-0001', '400.00', '0', null, '2016-05-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('441', 'P-2016-05-08--465274903', 'SO-2016-05-08-0001', '396.00', '0', null, '2016-05-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('442', 'P-2016-05-09--2145416784', 'SO-2016-05-09-0001', '1044.00', '0', null, '2016-05-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('443', 'P-2016-05-10--1036549942', 'SO-2016-05-10-0001', '352.00', '0', null, '2016-05-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('444', 'P-2016-05-11--356285805', 'SO-2016-05-11-0001', '920.00', '0', null, '2016-05-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('445', 'P-2016-05-12--720866488', 'SO-2016-05-12-0001', '1000.00', '0', null, '2016-05-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('446', 'P-2016-05-13--273554055', 'SO-2016-05-13-0001', '560.00', '0', null, '2016-05-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('447', 'P-2016-05-14-896571705', 'SO-2016-05-14-0001', '800.00', '0', null, '2016-05-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('448', 'P-2016-05-15--2118657085', 'SO-2016-05-15-0001', '400.00', '0', null, '2016-05-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('449', 'P-2016-05-16--1330572453', 'SO-2016-05-16-0001', '396.00', '0', null, '2016-05-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('450', 'P-2016-05-17-269834635', 'SO-2016-05-17-0001', '1044.00', '0', null, '2016-05-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('451', 'P-2016-05-18-1319705208', 'SO-2016-05-18-0001', '352.00', '0', null, '2016-05-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('452', 'P-2016-05-19--2001706528', 'SO-2016-05-19-0001', '920.00', '0', null, '2016-05-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('453', 'P-2016-05-20--1206751931', 'SO-2016-05-20-0001', '1000.00', '0', null, '2016-05-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('454', 'P-2016-05-21--622719582', 'SO-2016-05-21-0001', '560.00', '0', null, '2016-05-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('455', 'P-2016-05-22--702929639', 'SO-2016-05-22-0001', '800.00', '0', null, '2016-05-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('456', 'P-2016-05-23-1663514095', 'SO-2016-05-23-0001', '400.00', '0', null, '2016-05-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('457', 'P-2016-05-24-2020653388', 'SO-2016-05-24-0001', '396.00', '0', null, '2016-05-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('458', 'P-2016-05-25-1742224591', 'SO-2016-05-25-0001', '1044.00', '0', null, '2016-05-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('459', 'P-2016-05-26-2013928432', 'SO-2016-05-26-0001', '352.00', '0', null, '2016-05-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('460', 'P-2016-05-31--573066422', 'SO-2016-05-31-0001', '920.00', '0', null, '2016-05-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('461', 'P-2016-06-01--1428144915', 'SO-2016-06-01-0001', '1000.00', '0', null, '2016-06-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('462', 'P-2016-06-02-1637958124', 'SO-2016-06-02-0001', '560.00', '0', null, '2016-06-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('463', 'P-2016-06-03-246978590', 'SO-2016-06-03-0001', '800.00', '0', null, '2016-06-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('464', 'P-2016-06-04--1705210254', 'SO-2016-06-04-0001', '400.00', '0', null, '2016-06-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('465', 'P-2016-06-05--1244137765', 'SO-2016-06-05-0001', '396.00', '0', null, '2016-06-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('466', 'P-2016-06-06-425430645', 'SO-2016-06-06-0001', '1044.00', '0', null, '2016-06-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('467', 'P-2016-06-07--1218420365', 'SO-2016-06-07-0001', '352.00', '0', null, '2016-06-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('468', 'P-2016-06-08--1061292733', 'SO-2016-06-08-0001', '920.00', '0', null, '2016-06-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('469', 'P-2016-06-09--6508835', 'SO-2016-06-09-0001', '1000.00', '0', null, '2016-06-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('470', 'P-2016-06-10-198252668', 'SO-2016-06-10-0001', '560.00', '0', null, '2016-06-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('471', 'P-2016-06-11-927085801', 'SO-2016-06-11-0001', '800.00', '0', null, '2016-06-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('472', 'P-2016-06-12--396479701', 'SO-2016-06-12-0001', '400.00', '0', null, '2016-06-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('473', 'P-2016-06-13-1377350237', 'SO-2016-06-13-0001', '396.00', '0', null, '2016-06-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('474', 'P-2016-06-14--852863212', 'SO-2016-06-14-0001', '1044.00', '0', null, '2016-06-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('475', 'P-2016-06-15-496220109', 'SO-2016-06-15-0001', '352.00', '0', null, '2016-06-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('476', 'P-2016-06-16-1284547411', 'SO-2016-06-16-0001', '920.00', '0', null, '2016-06-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('477', 'P-2016-06-17--1256217687', 'SO-2016-06-17-0001', '1000.00', '0', null, '2016-06-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('478', 'P-2016-06-18--1575056227', 'SO-2016-06-18-0001', '560.00', '0', null, '2016-06-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('479', 'P-2016-06-19--975045588', 'SO-2016-06-19-0001', '800.00', '0', null, '2016-06-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('480', 'P-2016-06-20-2041550227', 'SO-2016-06-20-0001', '400.00', '0', null, '2016-06-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('481', 'P-2016-06-21-1265179048', 'SO-2016-06-21-0001', '396.00', '0', null, '2016-06-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('482', 'P-2016-06-22-853266207', 'SO-2016-06-22-0001', '1044.00', '0', null, '2016-06-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('483', 'P-2016-06-23-872676693', 'SO-2016-06-23-0001', '352.00', '0', null, '2016-06-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('484', 'P-2016-06-24-1010855703', 'SO-2016-06-24-0001', '920.00', '0', null, '2016-06-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('485', 'P-2016-06-25--929685898', 'SO-2016-06-25-0001', '1000.00', '0', null, '2016-06-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('486', 'P-2016-06-26-1958729121', 'SO-2016-06-26-0001', '560.00', '0', null, '2016-06-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('487', 'P-2016-06-30-994576182', 'SO-2016-06-30-0001', '800.00', '0', null, '2016-06-30 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('488', 'P-2016-07-01-660618061', 'SO-2016-07-01-0001', '400.00', '0', null, '2016-07-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('489', 'P-2016-07-02--1917221045', 'SO-2016-07-02-0001', '396.00', '0', null, '2016-07-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('490', 'P-2016-07-03-1977439212', 'SO-2016-07-03-0001', '1044.00', '0', null, '2016-07-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('491', 'P-2016-07-04--1379322045', 'SO-2016-07-04-0001', '352.00', '0', null, '2016-07-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('492', 'P-2016-07-05--274570204', 'SO-2016-07-05-0001', '920.00', '0', null, '2016-07-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('493', 'P-2016-07-06-1297297922', 'SO-2016-07-06-0001', '1000.00', '0', null, '2016-07-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('494', 'P-2016-07-07--1905289326', 'SO-2016-07-07-0001', '560.00', '0', null, '2016-07-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('495', 'P-2016-07-08--884051214', 'SO-2016-07-08-0001', '800.00', '0', null, '2016-07-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('496', 'P-2016-07-09--1591925420', 'SO-2016-07-09-0001', '400.00', '0', null, '2016-07-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('497', 'P-2016-07-10--1206308596', 'SO-2016-07-10-0001', '396.00', '0', null, '2016-07-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('498', 'P-2016-07-11-1285988378', 'SO-2016-07-11-0001', '1044.00', '0', null, '2016-07-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('499', 'P-2016-07-12-614182393', 'SO-2016-07-12-0001', '352.00', '0', null, '2016-07-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('500', 'P-2016-07-13--1050557555', 'SO-2016-07-13-0001', '920.00', '0', null, '2016-07-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('501', 'P-2016-07-14--1355703102', 'SO-2016-07-14-0001', '1000.00', '0', null, '2016-07-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('502', 'P-2016-07-15--1066398055', 'SO-2016-07-15-0001', '560.00', '0', null, '2016-07-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('503', 'P-2016-07-16-1388286103', 'SO-2016-07-16-0001', '800.00', '0', null, '2016-07-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('504', 'P-2016-07-17--1768593208', 'SO-2016-07-17-0001', '400.00', '0', null, '2016-07-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('505', 'P-2016-07-18--2067141105', 'SO-2016-07-18-0001', '396.00', '0', null, '2016-07-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('506', 'P-2016-07-19-220601826', 'SO-2016-07-19-0001', '1044.00', '0', null, '2016-07-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('507', 'P-2016-07-20-2026802532', 'SO-2016-07-20-0001', '352.00', '0', null, '2016-07-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('508', 'P-2016-07-21--1555895762', 'SO-2016-07-21-0001', '920.00', '0', null, '2016-07-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('509', 'P-2016-07-22-528026797', 'SO-2016-07-22-0001', '1000.00', '0', null, '2016-07-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('510', 'P-2016-07-23-1231129490', 'SO-2016-07-23-0001', '560.00', '0', null, '2016-07-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('511', 'P-2016-07-24-920411128', 'SO-2016-07-24-0001', '800.00', '0', null, '2016-07-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('512', 'P-2016-07-25--911701703', 'SO-2016-07-25-0001', '400.00', '0', null, '2016-07-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('513', 'P-2016-07-26--824011006', 'SO-2016-07-26-0001', '396.00', '0', null, '2016-07-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('514', 'P-2016-07-31-327030902', 'SO-2016-07-31-0001', '1044.00', '0', null, '2016-07-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('515', 'P-2016-08-01--2044962983', 'SO-2016-08-01-0001', '352.00', '0', null, '2016-08-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('516', 'P-2016-08-02-1073083827', 'SO-2016-08-02-0001', '920.00', '0', null, '2016-08-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('517', 'P-2016-08-03--937815522', 'SO-2016-08-03-0001', '1000.00', '0', null, '2016-08-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('518', 'P-2016-08-04-46853042', 'SO-2016-08-04-0001', '560.00', '0', null, '2016-08-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('519', 'P-2016-08-05--1362412759', 'SO-2016-08-05-0001', '800.00', '0', null, '2016-08-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('520', 'P-2016-08-06-1605159881', 'SO-2016-08-06-0001', '400.00', '0', null, '2016-08-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('521', 'P-2016-08-07--1512153698', 'SO-2016-08-07-0001', '396.00', '0', null, '2016-08-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('522', 'P-2016-08-08--2020052203', 'SO-2016-08-08-0001', '1044.00', '0', null, '2016-08-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('523', 'P-2016-08-09-1928607200', 'SO-2016-08-09-0001', '352.00', '0', null, '2016-08-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('524', 'P-2016-08-10--2028072770', 'SO-2016-08-10-0001', '920.00', '0', null, '2016-08-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('525', 'P-2016-08-11-1131696838', 'SO-2016-08-11-0001', '1000.00', '0', null, '2016-08-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('526', 'P-2016-08-12--640584769', 'SO-2016-08-12-0001', '560.00', '0', null, '2016-08-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('527', 'P-2016-08-13-1793534479', 'SO-2016-08-13-0001', '800.00', '0', null, '2016-08-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('528', 'P-2016-08-14-338198976', 'SO-2016-08-14-0001', '400.00', '0', null, '2016-08-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('529', 'P-2016-08-15--564286563', 'SO-2016-08-15-0001', '396.00', '0', null, '2016-08-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('530', 'P-2016-08-16--2002330692', 'SO-2016-08-16-0001', '1044.00', '0', null, '2016-08-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('531', 'P-2016-08-17--1008981845', 'SO-2016-08-17-0001', '352.00', '0', null, '2016-08-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('532', 'P-2016-08-18-319314508', 'SO-2016-08-18-0001', '920.00', '0', null, '2016-08-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('533', 'P-2016-08-19-1236148432', 'SO-2016-08-19-0001', '1000.00', '0', null, '2016-08-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('534', 'P-2016-08-20-901066063', 'SO-2016-08-20-0001', '560.00', '0', null, '2016-08-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('535', 'P-2016-08-21-243341697', 'SO-2016-08-21-0001', '800.00', '0', null, '2016-08-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('536', 'P-2016-08-22--842623049', 'SO-2016-08-22-0001', '400.00', '0', null, '2016-08-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('537', 'P-2016-08-23-1577955356', 'SO-2016-08-23-0001', '396.00', '0', null, '2016-08-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('538', 'P-2016-08-24-197921937', 'SO-2016-08-24-0001', '1044.00', '0', null, '2016-08-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('539', 'P-2016-08-25--2099492946', 'SO-2016-08-25-0001', '352.00', '0', null, '2016-08-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('540', 'P-2016-08-26--1470978170', 'SO-2016-08-26-0001', '920.00', '0', null, '2016-08-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('541', 'P-2016-08-31--1549908795', 'SO-2016-08-31-0001', '1000.00', '0', null, '2016-08-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('542', 'P-2016-09-01--662904994', 'SO-2016-09-01-0001', '560.00', '0', null, '2016-09-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('543', 'P-2016-09-02-935790611', 'SO-2016-09-02-0001', '800.00', '0', null, '2016-09-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('544', 'P-2016-09-03-526225514', 'SO-2016-09-03-0001', '400.00', '0', null, '2016-09-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('545', 'P-2016-09-04-611632331', 'SO-2016-09-04-0001', '396.00', '0', null, '2016-09-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('546', 'P-2016-09-05-852859400', 'SO-2016-09-05-0001', '1044.00', '0', null, '2016-09-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('547', 'P-2016-09-06-1185539573', 'SO-2016-09-06-0001', '352.00', '0', null, '2016-09-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('548', 'P-2016-09-07--473393502', 'SO-2016-09-07-0001', '920.00', '0', null, '2016-09-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('549', 'P-2016-09-08-1679979214', 'SO-2016-09-08-0001', '1000.00', '0', null, '2016-09-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('550', 'P-2016-09-09--131932089', 'SO-2016-09-09-0001', '560.00', '0', null, '2016-09-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('551', 'P-2016-09-10--1739798221', 'SO-2016-09-10-0001', '800.00', '0', null, '2016-09-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('552', 'P-2016-09-11-1720307691', 'SO-2016-09-11-0001', '400.00', '0', null, '2016-09-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('553', 'P-2016-09-12--1672714219', 'SO-2016-09-12-0001', '396.00', '0', null, '2016-09-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('554', 'P-2016-09-13-754560054', 'SO-2016-09-13-0001', '1044.00', '0', null, '2016-09-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('555', 'P-2016-09-14-1706215747', 'SO-2016-09-14-0001', '352.00', '0', null, '2016-09-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('556', 'P-2016-09-15--841425329', 'SO-2016-09-15-0001', '920.00', '0', null, '2016-09-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('557', 'P-2016-09-16-1980782710', 'SO-2016-09-16-0001', '1000.00', '0', null, '2016-09-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('558', 'P-2016-09-17-1158832928', 'SO-2016-09-17-0001', '560.00', '0', null, '2016-09-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('559', 'P-2016-09-18--801072791', 'SO-2016-09-18-0001', '800.00', '0', null, '2016-09-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('560', 'P-2016-09-19--1124372306', 'SO-2016-09-19-0001', '400.00', '0', null, '2016-09-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('561', 'P-2016-09-20--780813552', 'SO-2016-09-20-0001', '396.00', '0', null, '2016-09-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('562', 'P-2016-09-21--1324074885', 'SO-2016-09-21-0001', '1044.00', '0', null, '2016-09-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('563', 'P-2016-09-22--1683975084', 'SO-2016-09-22-0001', '352.00', '0', null, '2016-09-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('564', 'P-2016-09-23--1785980564', 'SO-2016-09-23-0001', '920.00', '0', null, '2016-09-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('565', 'P-2016-09-24--1740200369', 'SO-2016-09-24-0001', '1000.00', '0', null, '2016-09-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('566', 'P-2016-09-25-1757721945', 'SO-2016-09-25-0001', '560.00', '0', null, '2016-09-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('567', 'P-2016-09-26-1848926880', 'SO-2016-09-26-0001', '800.00', '0', null, '2016-09-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('568', 'P-2016-09-30-1725614207', 'SO-2016-09-30-0001', '400.00', '0', null, '2016-09-30 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('569', 'P-2016-10-01--856115197', 'SO-2016-10-01-0001', '396.00', '0', null, '2016-10-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('570', 'P-2016-10-02--66043538', 'SO-2016-10-02-0001', '1044.00', '0', null, '2016-10-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('571', 'P-2016-10-03-809161213', 'SO-2016-10-03-0001', '352.00', '0', null, '2016-10-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('572', 'P-2016-10-04-415329765', 'SO-2016-10-04-0001', '920.00', '0', null, '2016-10-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('573', 'P-2016-10-05--1627381753', 'SO-2016-10-05-0001', '1000.00', '0', null, '2016-10-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('574', 'P-2016-10-06-207505330', 'SO-2016-10-06-0001', '560.00', '0', null, '2016-10-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('575', 'P-2016-10-07-317292529', 'SO-2016-10-07-0001', '800.00', '0', null, '2016-10-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('576', 'P-2016-10-08-1796286994', 'SO-2016-10-08-0001', '400.00', '0', null, '2016-10-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('577', 'P-2016-10-09-67815697', 'SO-2016-10-09-0001', '396.00', '0', null, '2016-10-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('578', 'P-2016-10-10-636986712', 'SO-2016-10-10-0001', '1044.00', '0', null, '2016-10-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('579', 'P-2016-10-11-1533735740', 'SO-2016-10-11-0001', '352.00', '0', null, '2016-10-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('580', 'P-2016-10-12-383004079', 'SO-2016-10-12-0001', '920.00', '0', null, '2016-10-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('581', 'P-2016-10-13-559767111', 'SO-2016-10-13-0001', '1000.00', '0', null, '2016-10-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('582', 'P-2016-10-14-1422142855', 'SO-2016-10-14-0001', '560.00', '0', null, '2016-10-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('583', 'P-2016-10-15-1573422989', 'SO-2016-10-15-0001', '800.00', '0', null, '2016-10-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('584', 'P-2016-10-16--1488888240', 'SO-2016-10-16-0001', '400.00', '0', null, '2016-10-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('585', 'P-2016-10-17--297089028', 'SO-2016-10-17-0001', '396.00', '0', null, '2016-10-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('586', 'P-2016-10-18--1476914919', 'SO-2016-10-18-0001', '1044.00', '0', null, '2016-10-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('587', 'P-2016-10-19--1313388606', 'SO-2016-10-19-0001', '352.00', '0', null, '2016-10-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('588', 'P-2016-10-20--1059646432', 'SO-2016-10-20-0001', '920.00', '0', null, '2016-10-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('589', 'P-2016-10-21-720327099', 'SO-2016-10-21-0001', '1000.00', '0', null, '2016-10-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('590', 'P-2016-10-22--726422326', 'SO-2016-10-22-0001', '560.00', '0', null, '2016-10-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('591', 'P-2016-10-23--1263799283', 'SO-2016-10-23-0001', '800.00', '0', null, '2016-10-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('592', 'P-2016-10-24--1934153043', 'SO-2016-10-24-0001', '400.00', '0', null, '2016-10-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('593', 'P-2016-10-25-2019576831', 'SO-2016-10-25-0001', '396.00', '0', null, '2016-10-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('594', 'P-2016-10-26--884361340', 'SO-2016-10-26-0001', '1044.00', '0', null, '2016-10-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('595', 'P-2016-10-31--29166465', 'SO-2016-10-31-0001', '352.00', '0', null, '2016-10-31 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('596', 'P-2016-11-01-509920681', 'SO-2016-11-01-0001', '920.00', '0', null, '2016-11-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('597', 'P-2016-11-02-1789362460', 'SO-2016-11-02-0001', '1000.00', '0', null, '2016-11-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('598', 'P-2016-11-03--2072736111', 'SO-2016-11-03-0001', '560.00', '0', null, '2016-11-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('599', 'P-2016-11-04-1278719918', 'SO-2016-11-04-0001', '800.00', '0', null, '2016-11-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('600', 'P-2016-11-05--1735973379', 'SO-2016-11-05-0001', '400.00', '0', null, '2016-11-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('601', 'P-2016-11-06--1948551091', 'SO-2016-11-06-0001', '396.00', '0', null, '2016-11-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('602', 'P-2016-11-07--1487196448', 'SO-2016-11-07-0001', '1044.00', '0', null, '2016-11-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('603', 'P-2016-11-08-1425760358', 'SO-2016-11-08-0001', '352.00', '0', null, '2016-11-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('604', 'P-2016-11-09--1594290600', 'SO-2016-11-09-0001', '920.00', '0', null, '2016-11-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('605', 'P-2016-11-10--1199046310', 'SO-2016-11-10-0001', '1000.00', '0', null, '2016-11-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('606', 'P-2016-11-11--620663243', 'SO-2016-11-11-0001', '560.00', '0', null, '2016-11-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('607', 'P-2016-11-12--2024185672', 'SO-2016-11-12-0001', '800.00', '0', null, '2016-11-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('608', 'P-2016-11-13-1855439608', 'SO-2016-11-13-0001', '400.00', '0', null, '2016-11-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('609', 'P-2016-11-14-933818004', 'SO-2016-11-14-0001', '396.00', '0', null, '2016-11-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('610', 'P-2016-11-15--3270651', 'SO-2016-11-15-0001', '1044.00', '0', null, '2016-11-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('611', 'P-2016-11-16-298714929', 'SO-2016-11-16-0001', '352.00', '0', null, '2016-11-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('612', 'P-2016-11-17-1310811207', 'SO-2016-11-17-0001', '920.00', '0', null, '2016-11-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('613', 'P-2016-11-18-1655708778', 'SO-2016-11-18-0001', '1000.00', '0', null, '2016-11-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('614', 'P-2016-11-19-1559356019', 'SO-2016-11-19-0001', '560.00', '0', null, '2016-11-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('615', 'P-2016-11-20-511133364', 'SO-2016-11-20-0001', '800.00', '0', null, '2016-11-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('616', 'P-2016-11-21-1382457343', 'SO-2016-11-21-0001', '400.00', '0', null, '2016-11-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('617', 'P-2016-11-22-1410642614', 'SO-2016-11-22-0001', '396.00', '0', null, '2016-11-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('618', 'P-2016-11-23-1999520006', 'SO-2016-11-23-0001', '1044.00', '0', null, '2016-11-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('619', 'P-2016-11-24-1755987338', 'SO-2016-11-24-0001', '352.00', '0', null, '2016-11-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('620', 'P-2016-11-25-1313178393', 'SO-2016-11-25-0001', '1150.00', '0', null, '2016-11-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('621', 'P-2016-11-26-1031886516', 'SO-2016-11-26-0001', '1250.00', '0', null, '2016-11-26 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('622', 'P-2016-11-30-838359418', 'SO-2016-11-30-0001', '700.00', '0', null, '2016-11-30 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('623', 'P-2016-12-01--960855980', 'SO-2016-12-01-0001', '1000.00', '0', null, '2016-12-01 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('624', 'P-2016-12-02-698660104', 'SO-2016-12-02-0001', '500.00', '0', null, '2016-12-02 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('625', 'P-2016-12-03--1544163313', 'SO-2016-12-03-0001', '495.00', '0', null, '2016-12-03 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('626', 'P-2016-12-04--1233197977', 'SO-2016-12-04-0001', '1305.00', '0', null, '2016-12-04 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('627', 'P-2016-12-05-1788542322', 'SO-2016-12-05-0001', '440.00', '0', null, '2016-12-05 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('628', 'P-2016-12-06--304396225', 'SO-2016-12-06-0001', '1150.00', '0', null, '2016-12-06 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('629', 'P-2016-12-07-1223077681', 'SO-2016-12-07-0001', '1250.00', '0', null, '2016-12-07 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('630', 'P-2016-12-08--616384739', 'SO-2016-12-08-0001', '700.00', '0', null, '2016-12-08 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('631', 'P-2016-12-09--255735488', 'SO-2016-12-09-0001', '1000.00', '0', null, '2016-12-09 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('632', 'P-2016-12-10-347058115', 'SO-2016-12-10-0001', '500.00', '0', null, '2016-12-10 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('633', 'P-2016-12-11--1805967239', 'SO-2016-12-11-0001', '495.00', '0', null, '2016-12-11 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('634', 'P-2016-12-12-1182714229', 'SO-2016-12-12-0001', '1305.00', '0', null, '2016-12-12 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('635', 'P-2016-12-13--1483500619', 'SO-2016-12-13-0001', '440.00', '0', null, '2016-12-13 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('636', 'P-2016-12-14-1022959372', 'SO-2016-12-14-0001', '1150.00', '0', null, '2016-12-14 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('637', 'P-2016-12-15--252143166', 'SO-2016-12-15-0001', '1250.00', '0', null, '2016-12-15 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('638', 'P-2016-12-16--1822346233', 'SO-2016-12-16-0001', '700.00', '0', null, '2016-12-16 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('639', 'P-2016-12-17--174902424', 'SO-2016-12-17-0001', '1000.00', '0', null, '2016-12-17 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('640', 'P-2016-12-18-345613211', 'SO-2016-12-18-0001', '500.00', '0', null, '2016-12-18 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('641', 'P-2016-12-19--436790748', 'SO-2016-12-19-0001', '495.00', '0', null, '2016-12-19 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('642', 'P-2016-12-20--1515610290', 'SO-2016-12-20-0001', '1305.00', '0', null, '2016-12-20 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('643', 'P-2016-12-21--660316937', 'SO-2016-12-21-0001', '440.00', '0', null, '2016-12-21 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('644', 'P-2016-12-22--1336184402', 'SO-2016-12-22-0001', '1150.00', '0', null, '2016-12-22 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('645', 'P-2016-12-23-769672805', 'SO-2016-12-23-0001', '1250.00', '0', null, '2016-12-23 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('646', 'P-2016-12-24--835507677', 'SO-2016-12-24-0001', '700.00', '0', null, '2016-12-24 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('647', 'P-2016-12-25-202168163', 'SO-2016-12-25-0001', '1000.00', '0', null, '2016-12-25 00:00:00', '2', '1');
INSERT INTO `payment` VALUES ('648', 'P-2016-12-26--2088583113', 'SO-2016-12-26-0001', '500.00', '0', null, '2016-12-26 00:00:00', '2', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `pId` bigint(20) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL COMMENT '权限名',
  `permissionSign` varchar(128) DEFAULT NULL COMMENT '权限标识,程序中判断使用,如"user:create"',
  `description` varchar(256) DEFAULT NULL COMMENT '权限描述,UI界面显示使用',
  PRIMARY KEY (`id`),
  KEY `FK_per_pId` (`pId`),
  CONSTRAINT `FK_per_pId` FOREIGN KEY (`pId`) REFERENCES `permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '13', '新增用户', 'user:create', null);
INSERT INTO `permission` VALUES ('2', '13', '删除用户', 'user:delete', null);
INSERT INTO `permission` VALUES ('3', '13', '更新用户信息', 'user:update', null);
INSERT INTO `permission` VALUES ('4', '14', '商品销售', 'goods:sale', null);
INSERT INTO `permission` VALUES ('5', '14', '商品退货', 'goods:reject', null);
INSERT INTO `permission` VALUES ('6', '14', '商品维护', 'goods:manage', null);
INSERT INTO `permission` VALUES ('7', '14', '类别维护', 'goods:category:manage', null);
INSERT INTO `permission` VALUES ('8', '14', '品牌维护', 'goods:brand:manage', null);
INSERT INTO `permission` VALUES ('9', '14', '颜色维护', 'goods:color:manage', null);
INSERT INTO `permission` VALUES ('10', '15', '库存查询', 'inventory:query', null);
INSERT INTO `permission` VALUES ('11', '15', '库存入库', 'inventory:in', null);
INSERT INTO `permission` VALUES ('12', '15', '库存出库', 'inventory:out', null);
INSERT INTO `permission` VALUES ('13', null, '用户管理', 'user', null);
INSERT INTO `permission` VALUES ('14', null, '商品管理', 'goods', null);
INSERT INTO `permission` VALUES ('15', null, '库存管理', 'inventory', null);
INSERT INTO `permission` VALUES ('16', null, '报表分析', 'dashboard:manager', null);
INSERT INTO `permission` VALUES ('17', null, '权限管理', 'per', null);
INSERT INTO `permission` VALUES ('18', '17', '添加角色', 'per:role:create', null);
INSERT INTO `permission` VALUES ('19', '17', '删除角色', 'per:role:delete', null);
INSERT INTO `permission` VALUES ('20', '17', '分配权限', 'per:permission:divide', null);
INSERT INTO `permission` VALUES ('21', '17', '分配角色', 'per:role:divide', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `roleName` varchar(32) DEFAULT NULL COMMENT '角色名',
  `roleSign` varchar(128) DEFAULT NULL COMMENT '角色标识,程序中判断使用,如"admin"',
  `description` varchar(256) DEFAULT NULL COMMENT '角色描述,UI界面显示使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', 'admin', '管理员');
INSERT INTO `role` VALUES ('2', 'cashier', 'cashier', '收银员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色id',
  `permissionId` bigint(20) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`),
  KEY `FK_rp_permissionId` (`permissionId`),
  KEY `FK_rp_roleId` (`roleId`),
  CONSTRAINT `FK_rp_permissionId` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_rp_roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8 COMMENT='角色与权限关联表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('333', '1', '1');
INSERT INTO `role_permission` VALUES ('334', '1', '2');
INSERT INTO `role_permission` VALUES ('335', '1', '3');
INSERT INTO `role_permission` VALUES ('336', '1', '4');
INSERT INTO `role_permission` VALUES ('337', '1', '5');
INSERT INTO `role_permission` VALUES ('338', '1', '6');
INSERT INTO `role_permission` VALUES ('339', '1', '7');
INSERT INTO `role_permission` VALUES ('340', '1', '8');
INSERT INTO `role_permission` VALUES ('341', '1', '9');
INSERT INTO `role_permission` VALUES ('342', '1', '10');
INSERT INTO `role_permission` VALUES ('343', '1', '11');
INSERT INTO `role_permission` VALUES ('344', '1', '12');
INSERT INTO `role_permission` VALUES ('345', '1', '16');
INSERT INTO `role_permission` VALUES ('346', '1', '18');
INSERT INTO `role_permission` VALUES ('347', '1', '19');
INSERT INTO `role_permission` VALUES ('348', '1', '20');
INSERT INTO `role_permission` VALUES ('349', '1', '21');
INSERT INTO `role_permission` VALUES ('366', '2', '3');
INSERT INTO `role_permission` VALUES ('367', '2', '4');
INSERT INTO `role_permission` VALUES ('368', '2', '7');
INSERT INTO `role_permission` VALUES ('369', '2', '9');
INSERT INTO `role_permission` VALUES ('370', '2', '16');

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `saleOrderNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `customerNo` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户编号',
  `saleDateTime` datetime NOT NULL COMMENT '下单时间',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `operatorId` bigint(20) NOT NULL,
  `shopId` bigint(20) NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`),
  KEY `FK_so_customerNo` (`customerNo`),
  KEY `FK_so_operatorId` (`operatorId`),
  KEY `saleOrderNo` (`saleOrderNo`),
  KEY `FK_so_shopId` (`shopId`),
  CONSTRAINT `FK_so_customerNo` FOREIGN KEY (`customerNo`) REFERENCES `member` (`customerNo`),
  CONSTRAINT `FK_so_operatorId` FOREIGN KEY (`operatorId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_so_shopId` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1317 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES ('669', 'SO-2016-12-31-0001', '0000', '2016-12-31 00:00:00', '464.00', '2', '1');
INSERT INTO `sale_order` VALUES ('670', 'SO-2017-01-01-0001', '0000', '2017-01-01 00:00:00', '707.00', '2', '1');
INSERT INTO `sale_order` VALUES ('671', 'SO-2017-01-02-0001', '0000', '2017-01-02 00:00:00', '948.00', '2', '1');
INSERT INTO `sale_order` VALUES ('672', 'SO-2017-01-03-0001', '0000', '2017-01-03 00:00:00', '755.00', '2', '1');
INSERT INTO `sale_order` VALUES ('673', 'SO-2017-01-04-0001', '0000', '2017-01-04 00:00:00', '17.00', '2', '1');
INSERT INTO `sale_order` VALUES ('674', 'SO-2017-01-05-0001', '0000', '2017-01-05 00:00:00', '551.00', '2', '1');
INSERT INTO `sale_order` VALUES ('675', 'SO-2017-01-06-0001', '0000', '2017-01-06 00:00:00', '370.00', '2', '1');
INSERT INTO `sale_order` VALUES ('676', 'SO-2017-01-07-0001', '0000', '2017-01-07 00:00:00', '614.00', '2', '1');
INSERT INTO `sale_order` VALUES ('677', 'SO-2017-01-08-0001', '0000', '2017-01-08 00:00:00', '392.00', '2', '1');
INSERT INTO `sale_order` VALUES ('678', 'SO-2017-01-09-0001', '0000', '2017-01-09 00:00:00', '420.00', '2', '1');
INSERT INTO `sale_order` VALUES ('679', 'SO-2017-01-10-0001', '0000', '2017-01-10 00:00:00', '420.00', '2', '1');
INSERT INTO `sale_order` VALUES ('680', 'SO-2017-01-11-0001', '0000', '2017-01-11 00:00:00', '68.00', '2', '1');
INSERT INTO `sale_order` VALUES ('681', 'SO-2017-01-12-0001', '0000', '2017-01-12 00:00:00', '826.00', '2', '1');
INSERT INTO `sale_order` VALUES ('682', 'SO-2017-01-13-0001', '0000', '2017-01-13 00:00:00', '896.00', '2', '1');
INSERT INTO `sale_order` VALUES ('683', 'SO-2017-01-14-0001', '0000', '2017-01-14 00:00:00', '914.00', '2', '1');
INSERT INTO `sale_order` VALUES ('684', 'SO-2017-01-15-0001', '0000', '2017-01-15 00:00:00', '408.00', '2', '1');
INSERT INTO `sale_order` VALUES ('685', 'SO-2017-01-16-0001', '0000', '2017-01-16 00:00:00', '601.00', '2', '1');
INSERT INTO `sale_order` VALUES ('686', 'SO-2017-01-17-0001', '0000', '2017-01-17 00:00:00', '859.00', '2', '1');
INSERT INTO `sale_order` VALUES ('687', 'SO-2017-01-18-0001', '0000', '2017-01-18 00:00:00', '200.00', '2', '1');
INSERT INTO `sale_order` VALUES ('688', 'SO-2017-01-19-0001', '0000', '2017-01-19 00:00:00', '700.00', '2', '1');
INSERT INTO `sale_order` VALUES ('689', 'SO-2017-01-20-0001', '0000', '2017-01-20 00:00:00', '724.00', '2', '1');
INSERT INTO `sale_order` VALUES ('690', 'SO-2017-01-21-0001', '0000', '2017-01-21 00:00:00', '975.00', '2', '1');
INSERT INTO `sale_order` VALUES ('691', 'SO-2017-01-22-0001', '0000', '2017-01-22 00:00:00', '150.00', '2', '1');
INSERT INTO `sale_order` VALUES ('692', 'SO-2017-01-23-0001', '0000', '2017-01-23 00:00:00', '887.00', '2', '1');
INSERT INTO `sale_order` VALUES ('693', 'SO-2017-01-24-0001', '0000', '2017-01-24 00:00:00', '148.00', '2', '1');
INSERT INTO `sale_order` VALUES ('694', 'SO-2017-01-25-0001', '0000', '2017-01-25 00:00:00', '217.00', '2', '1');
INSERT INTO `sale_order` VALUES ('695', 'SO-2017-01-26-0001', '0000', '2017-01-26 00:00:00', '333.00', '2', '1');
INSERT INTO `sale_order` VALUES ('696', 'SO-2017-01-31-0001', '0000', '2017-01-31 00:00:00', '973.00', '2', '1');
INSERT INTO `sale_order` VALUES ('697', 'SO-2017-02-01-0001', '0000', '2017-02-01 00:00:00', '56.00', '2', '1');
INSERT INTO `sale_order` VALUES ('698', 'SO-2017-02-02-0001', '0000', '2017-02-02 00:00:00', '555.00', '2', '1');
INSERT INTO `sale_order` VALUES ('699', 'SO-2017-02-03-0001', '0000', '2017-02-03 00:00:00', '871.00', '2', '1');
INSERT INTO `sale_order` VALUES ('700', 'SO-2017-02-04-0001', '0000', '2017-02-04 00:00:00', '374.00', '2', '1');
INSERT INTO `sale_order` VALUES ('701', 'SO-2017-02-05-0001', '0000', '2017-02-05 00:00:00', '718.00', '2', '1');
INSERT INTO `sale_order` VALUES ('702', 'SO-2017-02-06-0001', '0000', '2017-02-06 00:00:00', '217.00', '2', '1');
INSERT INTO `sale_order` VALUES ('703', 'SO-2017-02-07-0001', '0000', '2017-02-07 00:00:00', '673.00', '2', '1');
INSERT INTO `sale_order` VALUES ('704', 'SO-2017-02-08-0001', '0000', '2017-02-08 00:00:00', '729.00', '2', '1');
INSERT INTO `sale_order` VALUES ('705', 'SO-2017-02-09-0001', '0000', '2017-02-09 00:00:00', '166.00', '2', '1');
INSERT INTO `sale_order` VALUES ('706', 'SO-2017-02-10-0001', '0000', '2017-02-10 00:00:00', '352.00', '2', '1');
INSERT INTO `sale_order` VALUES ('707', 'SO-2017-02-11-0001', '0000', '2017-02-11 00:00:00', '301.00', '2', '1');
INSERT INTO `sale_order` VALUES ('708', 'SO-2017-02-12-0001', '0000', '2017-02-12 00:00:00', '217.00', '2', '1');
INSERT INTO `sale_order` VALUES ('709', 'SO-2017-02-13-0001', '0000', '2017-02-13 00:00:00', '477.00', '2', '1');
INSERT INTO `sale_order` VALUES ('710', 'SO-2017-02-14-0001', '0000', '2017-02-14 00:00:00', '230.00', '2', '1');
INSERT INTO `sale_order` VALUES ('711', 'SO-2017-02-15-0001', '0000', '2017-02-15 00:00:00', '482.00', '2', '1');
INSERT INTO `sale_order` VALUES ('712', 'SO-2017-02-16-0001', '0000', '2017-02-16 00:00:00', '692.00', '2', '1');
INSERT INTO `sale_order` VALUES ('713', 'SO-2017-02-17-0001', '0000', '2017-02-17 00:00:00', '769.00', '2', '1');
INSERT INTO `sale_order` VALUES ('714', 'SO-2017-02-18-0001', '0000', '2017-02-18 00:00:00', '600.00', '2', '1');
INSERT INTO `sale_order` VALUES ('715', 'SO-2017-02-19-0001', '0000', '2017-02-19 00:00:00', '395.00', '2', '1');
INSERT INTO `sale_order` VALUES ('716', 'SO-2017-02-20-0001', '0000', '2017-02-20 00:00:00', '761.00', '2', '1');
INSERT INTO `sale_order` VALUES ('717', 'SO-2017-02-21-0001', '0000', '2017-02-21 00:00:00', '89.00', '2', '1');
INSERT INTO `sale_order` VALUES ('718', 'SO-2017-02-22-0001', '0000', '2017-02-22 00:00:00', '209.00', '2', '1');
INSERT INTO `sale_order` VALUES ('719', 'SO-2017-02-23-0001', '0000', '2017-02-23 00:00:00', '189.00', '2', '1');
INSERT INTO `sale_order` VALUES ('720', 'SO-2017-02-24-0001', '0000', '2017-02-24 00:00:00', '249.00', '2', '1');
INSERT INTO `sale_order` VALUES ('721', 'SO-2017-02-25-0001', '0000', '2017-02-25 00:00:00', '276.00', '2', '1');
INSERT INTO `sale_order` VALUES ('722', 'SO-2017-02-26-0001', '0000', '2017-02-26 00:00:00', '29.00', '2', '1');
INSERT INTO `sale_order` VALUES ('723', 'SO-2017-02-28-0001', '0000', '2017-02-28 00:00:00', '857.00', '2', '1');
INSERT INTO `sale_order` VALUES ('724', 'SO-2017-03-01-0001', '0000', '2017-03-01 00:00:00', '388.00', '2', '1');
INSERT INTO `sale_order` VALUES ('725', 'SO-2017-03-02-0001', '0000', '2017-03-02 00:00:00', '515.00', '2', '1');
INSERT INTO `sale_order` VALUES ('726', 'SO-2017-03-03-0001', '0000', '2017-03-03 00:00:00', '179.00', '2', '1');
INSERT INTO `sale_order` VALUES ('727', 'SO-2017-03-04-0001', '0000', '2017-03-04 00:00:00', '493.00', '2', '1');
INSERT INTO `sale_order` VALUES ('728', 'SO-2017-03-05-0001', '0000', '2017-03-05 00:00:00', '459.00', '2', '1');
INSERT INTO `sale_order` VALUES ('729', 'SO-2017-03-06-0001', '0000', '2017-03-06 00:00:00', '763.00', '2', '1');
INSERT INTO `sale_order` VALUES ('730', 'SO-2017-03-07-0001', '0000', '2017-03-07 00:00:00', '129.00', '2', '1');
INSERT INTO `sale_order` VALUES ('731', 'SO-2017-03-08-0001', '0000', '2017-03-08 00:00:00', '177.00', '2', '1');
INSERT INTO `sale_order` VALUES ('732', 'SO-2017-03-09-0001', '0000', '2017-03-09 00:00:00', '518.00', '2', '1');
INSERT INTO `sale_order` VALUES ('733', 'SO-2017-03-10-0001', '0000', '2017-03-10 00:00:00', '415.00', '2', '1');
INSERT INTO `sale_order` VALUES ('734', 'SO-2017-03-11-0001', '0000', '2017-03-11 00:00:00', '305.00', '2', '1');
INSERT INTO `sale_order` VALUES ('735', 'SO-2017-03-12-0001', '0000', '2017-03-12 00:00:00', '210.00', '2', '1');
INSERT INTO `sale_order` VALUES ('736', 'SO-2017-03-13-0001', '0000', '2017-03-13 00:00:00', '362.00', '2', '1');
INSERT INTO `sale_order` VALUES ('737', 'SO-2017-03-14-0001', '0000', '2017-03-14 00:00:00', '598.00', '2', '1');
INSERT INTO `sale_order` VALUES ('738', 'SO-2017-03-15-0001', '0000', '2017-03-15 00:00:00', '829.00', '2', '1');
INSERT INTO `sale_order` VALUES ('739', 'SO-2017-03-16-0001', '0000', '2017-03-16 00:00:00', '198.00', '2', '1');
INSERT INTO `sale_order` VALUES ('740', 'SO-2017-03-17-0001', '0000', '2017-03-17 00:00:00', '798.00', '2', '1');
INSERT INTO `sale_order` VALUES ('741', 'SO-2017-03-18-0001', '0000', '2017-03-18 00:00:00', '282.00', '2', '1');
INSERT INTO `sale_order` VALUES ('742', 'SO-2017-03-19-0001', '0000', '2017-03-19 00:00:00', '779.00', '2', '1');
INSERT INTO `sale_order` VALUES ('743', 'SO-2017-03-20-0001', '0000', '2017-03-20 00:00:00', '514.00', '2', '1');
INSERT INTO `sale_order` VALUES ('744', 'SO-2017-03-21-0001', '0000', '2017-03-21 00:00:00', '901.00', '2', '1');
INSERT INTO `sale_order` VALUES ('745', 'SO-2017-03-22-0001', '0000', '2017-03-22 00:00:00', '907.00', '2', '1');
INSERT INTO `sale_order` VALUES ('746', 'SO-2017-03-23-0001', '0000', '2017-03-23 00:00:00', '973.00', '2', '1');
INSERT INTO `sale_order` VALUES ('747', 'SO-2017-03-24-0001', '0000', '2017-03-24 00:00:00', '19.00', '2', '1');
INSERT INTO `sale_order` VALUES ('748', 'SO-2017-03-25-0001', '0000', '2017-03-25 00:00:00', '902.00', '2', '1');
INSERT INTO `sale_order` VALUES ('749', 'SO-2017-03-26-0001', '0000', '2017-03-26 00:00:00', '629.00', '2', '1');
INSERT INTO `sale_order` VALUES ('750', 'SO-2017-03-31-0001', '0000', '2017-03-31 00:00:00', '40.00', '2', '1');
INSERT INTO `sale_order` VALUES ('751', 'SO-2017-04-01-0001', '0000', '2017-04-01 00:00:00', '508.00', '2', '1');
INSERT INTO `sale_order` VALUES ('752', 'SO-2017-04-02-0001', '0000', '2017-04-02 00:00:00', '24.00', '2', '1');
INSERT INTO `sale_order` VALUES ('753', 'SO-2017-04-03-0001', '0000', '2017-04-03 00:00:00', '380.00', '2', '1');
INSERT INTO `sale_order` VALUES ('754', 'SO-2017-04-04-0001', '0000', '2017-04-04 00:00:00', '214.00', '2', '1');
INSERT INTO `sale_order` VALUES ('755', 'SO-2017-04-05-0001', '0000', '2017-04-05 00:00:00', '262.00', '2', '1');
INSERT INTO `sale_order` VALUES ('756', 'SO-2017-04-06-0001', '0000', '2017-04-06 00:00:00', '637.00', '2', '1');
INSERT INTO `sale_order` VALUES ('757', 'SO-2017-04-07-0001', '0000', '2017-04-07 00:00:00', '839.00', '2', '1');
INSERT INTO `sale_order` VALUES ('758', 'SO-2017-04-08-0001', '0000', '2017-04-08 00:00:00', '70.00', '2', '1');
INSERT INTO `sale_order` VALUES ('759', 'SO-2017-04-09-0001', '0000', '2017-04-09 00:00:00', '253.00', '2', '1');
INSERT INTO `sale_order` VALUES ('760', 'SO-2017-04-10-0001', '0000', '2017-04-10 00:00:00', '782.00', '2', '1');
INSERT INTO `sale_order` VALUES ('761', 'SO-2017-04-11-0001', '0000', '2017-04-11 00:00:00', '134.00', '2', '1');
INSERT INTO `sale_order` VALUES ('762', 'SO-2017-04-12-0001', '0000', '2017-04-12 00:00:00', '219.00', '2', '1');
INSERT INTO `sale_order` VALUES ('763', 'SO-2017-04-13-0001', '0000', '2017-04-13 00:00:00', '982.00', '2', '1');
INSERT INTO `sale_order` VALUES ('764', 'SO-2017-04-14-0001', '0000', '2017-04-14 00:00:00', '301.00', '2', '1');
INSERT INTO `sale_order` VALUES ('765', 'SO-2017-04-15-0001', '0000', '2017-04-15 00:00:00', '526.00', '2', '1');
INSERT INTO `sale_order` VALUES ('766', 'SO-2017-04-16-0001', '0000', '2017-04-16 00:00:00', '777.00', '2', '1');
INSERT INTO `sale_order` VALUES ('767', 'SO-2017-04-17-0001', '0000', '2017-04-17 00:00:00', '701.00', '2', '1');
INSERT INTO `sale_order` VALUES ('768', 'SO-2017-04-18-0001', '0000', '2017-04-18 00:00:00', '490.00', '2', '1');
INSERT INTO `sale_order` VALUES ('769', 'SO-2017-04-19-0001', '0000', '2017-04-19 00:00:00', '596.00', '2', '1');
INSERT INTO `sale_order` VALUES ('770', 'SO-2017-04-20-0001', '0000', '2017-04-20 00:00:00', '296.00', '2', '1');
INSERT INTO `sale_order` VALUES ('771', 'SO-2017-04-21-0001', '0000', '2017-04-21 00:00:00', '764.00', '2', '1');
INSERT INTO `sale_order` VALUES ('772', 'SO-2017-04-22-0001', '0000', '2017-04-22 00:00:00', '479.00', '2', '1');
INSERT INTO `sale_order` VALUES ('773', 'SO-2017-04-23-0001', '0000', '2017-04-23 00:00:00', '501.00', '2', '1');
INSERT INTO `sale_order` VALUES ('774', 'SO-2017-04-24-0001', '0000', '2017-04-24 00:00:00', '720.00', '2', '1');
INSERT INTO `sale_order` VALUES ('775', 'SO-2017-04-25-0001', '0000', '2017-04-25 00:00:00', '151.00', '2', '1');
INSERT INTO `sale_order` VALUES ('776', 'SO-2017-04-26-0001', '0000', '2017-04-26 00:00:00', '271.00', '2', '1');
INSERT INTO `sale_order` VALUES ('777', 'SO-2017-04-30-0001', '0000', '2017-04-30 00:00:00', '638.00', '2', '1');
INSERT INTO `sale_order` VALUES ('778', 'SO-2017-05-01-0001', '0000', '2017-05-01 00:00:00', '839.00', '2', '1');
INSERT INTO `sale_order` VALUES ('779', 'SO-2017-05-02-0001', '0000', '2017-05-02 00:00:00', '791.00', '2', '1');
INSERT INTO `sale_order` VALUES ('780', 'SO-2017-05-03-0001', '0000', '2017-05-03 00:00:00', '720.00', '2', '1');
INSERT INTO `sale_order` VALUES ('781', 'SO-2017-05-04-0001', '0000', '2017-05-04 00:00:00', '697.00', '2', '1');
INSERT INTO `sale_order` VALUES ('782', 'SO-2017-05-05-0001', '0000', '2017-05-05 00:00:00', '676.00', '2', '1');
INSERT INTO `sale_order` VALUES ('783', 'SO-2017-05-06-0001', '0000', '2017-05-06 00:00:00', '179.00', '2', '1');
INSERT INTO `sale_order` VALUES ('784', 'SO-2017-05-07-0001', '0000', '2017-05-07 00:00:00', '537.00', '2', '1');
INSERT INTO `sale_order` VALUES ('785', 'SO-2017-05-08-0001', '0000', '2017-05-08 00:00:00', '431.00', '2', '1');
INSERT INTO `sale_order` VALUES ('786', 'SO-2017-05-09-0001', '0000', '2017-05-09 00:00:00', '204.00', '2', '1');
INSERT INTO `sale_order` VALUES ('787', 'SO-2017-05-10-0001', '0000', '2017-05-10 00:00:00', '910.00', '2', '1');
INSERT INTO `sale_order` VALUES ('788', 'SO-2017-05-11-0001', '0000', '2017-05-11 00:00:00', '787.00', '2', '1');
INSERT INTO `sale_order` VALUES ('789', 'SO-2017-05-12-0001', '0000', '2017-05-12 00:00:00', '633.00', '2', '1');
INSERT INTO `sale_order` VALUES ('790', 'SO-2017-05-13-0001', '0000', '2017-05-13 00:00:00', '802.00', '2', '1');
INSERT INTO `sale_order` VALUES ('791', 'SO-2017-05-14-0001', '0000', '2017-05-14 00:00:00', '176.00', '2', '1');
INSERT INTO `sale_order` VALUES ('792', 'SO-2017-05-15-0001', '0000', '2017-05-15 00:00:00', '248.00', '2', '1');
INSERT INTO `sale_order` VALUES ('793', 'SO-2017-05-16-0001', '0000', '2017-05-16 00:00:00', '749.00', '2', '1');
INSERT INTO `sale_order` VALUES ('794', 'SO-2017-05-17-0001', '0000', '2017-05-17 00:00:00', '911.00', '2', '1');
INSERT INTO `sale_order` VALUES ('795', 'SO-2017-05-18-0001', '0000', '2017-05-18 00:00:00', '995.00', '2', '1');
INSERT INTO `sale_order` VALUES ('796', 'SO-2017-05-19-0001', '0000', '2017-05-19 00:00:00', '424.00', '2', '1');
INSERT INTO `sale_order` VALUES ('797', 'SO-2017-05-20-0001', '0000', '2017-05-20 00:00:00', '292.00', '2', '1');
INSERT INTO `sale_order` VALUES ('798', 'SO-2017-05-21-0001', '0000', '2017-05-21 00:00:00', '401.00', '2', '1');
INSERT INTO `sale_order` VALUES ('799', 'SO-2017-05-22-0001', '0000', '2017-05-22 00:00:00', '905.00', '2', '1');
INSERT INTO `sale_order` VALUES ('800', 'SO-2017-05-23-0001', '0000', '2017-05-23 00:00:00', '979.00', '2', '1');
INSERT INTO `sale_order` VALUES ('801', 'SO-2017-05-24-0001', '0000', '2017-05-24 00:00:00', '686.00', '2', '1');
INSERT INTO `sale_order` VALUES ('802', 'SO-2017-05-25-0001', '0000', '2017-05-25 00:00:00', '286.00', '2', '1');
INSERT INTO `sale_order` VALUES ('803', 'SO-2017-05-26-0001', '0000', '2017-05-26 00:00:00', '126.00', '2', '1');
INSERT INTO `sale_order` VALUES ('804', 'SO-2017-05-31-0001', '0000', '2017-05-31 00:00:00', '824.00', '2', '1');
INSERT INTO `sale_order` VALUES ('805', 'SO-2017-06-01-0001', '0000', '2017-06-01 00:00:00', '491.00', '2', '1');
INSERT INTO `sale_order` VALUES ('806', 'SO-2017-06-02-0001', '0000', '2017-06-02 00:00:00', '541.00', '2', '1');
INSERT INTO `sale_order` VALUES ('807', 'SO-2017-06-03-0001', '0000', '2017-06-03 00:00:00', '757.00', '2', '1');
INSERT INTO `sale_order` VALUES ('808', 'SO-2017-06-04-0001', '0000', '2017-06-04 00:00:00', '152.00', '2', '1');
INSERT INTO `sale_order` VALUES ('809', 'SO-2017-06-05-0001', '0000', '2017-06-05 00:00:00', '9.00', '2', '1');
INSERT INTO `sale_order` VALUES ('810', 'SO-2017-06-06-0001', '0000', '2017-06-06 00:00:00', '937.00', '2', '1');
INSERT INTO `sale_order` VALUES ('811', 'SO-2017-06-07-0001', '0000', '2017-06-07 00:00:00', '382.00', '2', '1');
INSERT INTO `sale_order` VALUES ('812', 'SO-2017-06-08-0001', '0000', '2017-06-08 00:00:00', '245.00', '2', '1');
INSERT INTO `sale_order` VALUES ('813', 'SO-2017-06-09-0001', '0000', '2017-06-09 00:00:00', '91.00', '2', '1');
INSERT INTO `sale_order` VALUES ('814', 'SO-2017-06-10-0001', '0000', '2017-06-10 00:00:00', '36.00', '2', '1');
INSERT INTO `sale_order` VALUES ('815', 'SO-2017-06-11-0001', '0000', '2017-06-11 00:00:00', '590.00', '2', '1');
INSERT INTO `sale_order` VALUES ('816', 'SO-2017-06-12-0001', '0000', '2017-06-12 00:00:00', '965.00', '2', '1');
INSERT INTO `sale_order` VALUES ('817', 'SO-2017-06-13-0001', '0000', '2017-06-13 00:00:00', '637.00', '2', '1');
INSERT INTO `sale_order` VALUES ('818', 'SO-2017-06-14-0001', '0000', '2017-06-14 00:00:00', '672.00', '2', '1');
INSERT INTO `sale_order` VALUES ('819', 'SO-2017-06-15-0001', '0000', '2017-06-15 00:00:00', '281.00', '2', '1');
INSERT INTO `sale_order` VALUES ('820', 'SO-2017-06-16-0001', '0000', '2017-06-16 00:00:00', '472.00', '2', '1');
INSERT INTO `sale_order` VALUES ('821', 'SO-2017-06-17-0001', '0000', '2017-06-17 00:00:00', '654.00', '2', '1');
INSERT INTO `sale_order` VALUES ('822', 'SO-2017-06-18-0001', '0000', '2017-06-18 00:00:00', '536.00', '2', '1');
INSERT INTO `sale_order` VALUES ('823', 'SO-2017-06-19-0001', '0000', '2017-06-19 00:00:00', '334.00', '2', '1');
INSERT INTO `sale_order` VALUES ('824', 'SO-2017-06-20-0001', '0000', '2017-06-20 00:00:00', '856.00', '2', '1');
INSERT INTO `sale_order` VALUES ('825', 'SO-2017-06-21-0001', '0000', '2017-06-21 00:00:00', '935.00', '2', '1');
INSERT INTO `sale_order` VALUES ('826', 'SO-2017-06-22-0001', '0000', '2017-06-22 00:00:00', '764.00', '2', '1');
INSERT INTO `sale_order` VALUES ('827', 'SO-2017-06-23-0001', '0000', '2017-06-23 00:00:00', '141.00', '2', '1');
INSERT INTO `sale_order` VALUES ('828', 'SO-2017-06-24-0001', '0000', '2017-06-24 00:00:00', '44.00', '2', '1');
INSERT INTO `sale_order` VALUES ('829', 'SO-2017-06-25-0001', '0000', '2017-06-25 00:00:00', '392.00', '2', '1');
INSERT INTO `sale_order` VALUES ('830', 'SO-2017-06-26-0001', '0000', '2017-06-26 00:00:00', '735.00', '2', '1');
INSERT INTO `sale_order` VALUES ('831', 'SO-2017-06-30-0001', '0000', '2017-06-30 00:00:00', '755.00', '2', '1');
INSERT INTO `sale_order` VALUES ('832', 'SO-2017-07-01-0001', '0000', '2017-07-01 00:00:00', '561.00', '2', '1');
INSERT INTO `sale_order` VALUES ('833', 'SO-2017-07-02-0001', '0000', '2017-07-02 00:00:00', '834.00', '2', '1');
INSERT INTO `sale_order` VALUES ('834', 'SO-2017-07-03-0001', '0000', '2017-07-03 00:00:00', '669.00', '2', '1');
INSERT INTO `sale_order` VALUES ('835', 'SO-2017-07-04-0001', '0000', '2017-07-04 00:00:00', '920.00', '2', '1');
INSERT INTO `sale_order` VALUES ('836', 'SO-2017-07-05-0001', '0000', '2017-07-05 00:00:00', '469.00', '2', '1');
INSERT INTO `sale_order` VALUES ('837', 'SO-2017-07-06-0001', '0000', '2017-07-06 00:00:00', '498.00', '2', '1');
INSERT INTO `sale_order` VALUES ('838', 'SO-2017-07-07-0001', '0000', '2017-07-07 00:00:00', '954.00', '2', '1');
INSERT INTO `sale_order` VALUES ('839', 'SO-2017-07-08-0001', '0000', '2017-07-08 00:00:00', '48.00', '2', '1');
INSERT INTO `sale_order` VALUES ('840', 'SO-2017-07-09-0001', '0000', '2017-07-09 00:00:00', '80.00', '2', '1');
INSERT INTO `sale_order` VALUES ('841', 'SO-2017-07-10-0001', '0000', '2017-07-10 00:00:00', '971.00', '2', '1');
INSERT INTO `sale_order` VALUES ('842', 'SO-2017-07-11-0001', '0000', '2017-07-11 00:00:00', '594.00', '2', '1');
INSERT INTO `sale_order` VALUES ('843', 'SO-2017-07-12-0001', '0000', '2017-07-12 00:00:00', '287.00', '2', '1');
INSERT INTO `sale_order` VALUES ('844', 'SO-2017-07-13-0001', '0000', '2017-07-13 00:00:00', '838.00', '2', '1');
INSERT INTO `sale_order` VALUES ('845', 'SO-2017-07-14-0001', '0000', '2017-07-14 00:00:00', '220.00', '2', '1');
INSERT INTO `sale_order` VALUES ('846', 'SO-2017-07-15-0001', '0000', '2017-07-15 00:00:00', '588.00', '2', '1');
INSERT INTO `sale_order` VALUES ('847', 'SO-2017-07-16-0001', '0000', '2017-07-16 00:00:00', '168.00', '2', '1');
INSERT INTO `sale_order` VALUES ('848', 'SO-2017-07-17-0001', '0000', '2017-07-17 00:00:00', '120.00', '2', '1');
INSERT INTO `sale_order` VALUES ('849', 'SO-2017-07-18-0001', '0000', '2017-07-18 00:00:00', '337.00', '2', '1');
INSERT INTO `sale_order` VALUES ('850', 'SO-2017-07-19-0001', '0000', '2017-07-19 00:00:00', '523.00', '2', '1');
INSERT INTO `sale_order` VALUES ('851', 'SO-2017-07-20-0001', '0000', '2017-07-20 00:00:00', '999.00', '2', '1');
INSERT INTO `sale_order` VALUES ('852', 'SO-2017-07-21-0001', '0000', '2017-07-21 00:00:00', '551.00', '2', '1');
INSERT INTO `sale_order` VALUES ('853', 'SO-2017-07-22-0001', '0000', '2017-07-22 00:00:00', '258.00', '2', '1');
INSERT INTO `sale_order` VALUES ('854', 'SO-2017-07-23-0001', '0000', '2017-07-23 00:00:00', '196.00', '2', '1');
INSERT INTO `sale_order` VALUES ('855', 'SO-2017-07-24-0001', '0000', '2017-07-24 00:00:00', '53.00', '2', '1');
INSERT INTO `sale_order` VALUES ('856', 'SO-2017-07-25-0001', '0000', '2017-07-25 00:00:00', '839.00', '2', '1');
INSERT INTO `sale_order` VALUES ('857', 'SO-2017-07-26-0001', '0000', '2017-07-26 00:00:00', '143.00', '2', '1');
INSERT INTO `sale_order` VALUES ('858', 'SO-2017-07-31-0001', '0000', '2017-07-31 00:00:00', '604.00', '2', '1');
INSERT INTO `sale_order` VALUES ('859', 'SO-2017-08-01-0001', '0000', '2017-08-01 00:00:00', '832.00', '2', '1');
INSERT INTO `sale_order` VALUES ('860', 'SO-2017-08-02-0001', '0000', '2017-08-02 00:00:00', '84.00', '2', '1');
INSERT INTO `sale_order` VALUES ('861', 'SO-2017-08-03-0001', '0000', '2017-08-03 00:00:00', '350.00', '2', '1');
INSERT INTO `sale_order` VALUES ('862', 'SO-2017-08-04-0001', '0000', '2017-08-04 00:00:00', '210.00', '2', '1');
INSERT INTO `sale_order` VALUES ('863', 'SO-2017-08-05-0001', '0000', '2017-08-05 00:00:00', '160.00', '2', '1');
INSERT INTO `sale_order` VALUES ('864', 'SO-2017-08-06-0001', '0000', '2017-08-06 00:00:00', '935.00', '2', '1');
INSERT INTO `sale_order` VALUES ('865', 'SO-2017-08-07-0001', '0000', '2017-08-07 00:00:00', '897.00', '2', '1');
INSERT INTO `sale_order` VALUES ('866', 'SO-2017-08-08-0001', '0000', '2017-08-08 00:00:00', '8.00', '2', '1');
INSERT INTO `sale_order` VALUES ('867', 'SO-2017-08-09-0001', '0000', '2017-08-09 00:00:00', '626.00', '2', '1');
INSERT INTO `sale_order` VALUES ('868', 'SO-2017-08-10-0001', '0000', '2017-08-10 00:00:00', '1000.00', '2', '1');
INSERT INTO `sale_order` VALUES ('869', 'SO-2017-08-11-0001', '0000', '2017-08-11 00:00:00', '137.00', '2', '1');
INSERT INTO `sale_order` VALUES ('870', 'SO-2017-08-12-0001', '0000', '2017-08-12 00:00:00', '537.00', '2', '1');
INSERT INTO `sale_order` VALUES ('871', 'SO-2017-08-13-0001', '0000', '2017-08-13 00:00:00', '960.00', '2', '1');
INSERT INTO `sale_order` VALUES ('872', 'SO-2017-08-14-0001', '0000', '2017-08-14 00:00:00', '429.00', '2', '1');
INSERT INTO `sale_order` VALUES ('873', 'SO-2017-08-15-0001', '0000', '2017-08-15 00:00:00', '889.00', '2', '1');
INSERT INTO `sale_order` VALUES ('874', 'SO-2017-08-16-0001', '0000', '2017-08-16 00:00:00', '648.00', '2', '1');
INSERT INTO `sale_order` VALUES ('875', 'SO-2017-08-17-0001', '0000', '2017-08-17 00:00:00', '218.00', '2', '1');
INSERT INTO `sale_order` VALUES ('876', 'SO-2017-08-18-0001', '0000', '2017-08-18 00:00:00', '627.00', '2', '1');
INSERT INTO `sale_order` VALUES ('877', 'SO-2017-08-19-0001', '0000', '2017-08-19 00:00:00', '645.00', '2', '1');
INSERT INTO `sale_order` VALUES ('878', 'SO-2017-08-20-0001', '0000', '2017-08-20 00:00:00', '554.00', '2', '1');
INSERT INTO `sale_order` VALUES ('879', 'SO-2017-08-21-0001', '0000', '2017-08-21 00:00:00', '318.00', '2', '1');
INSERT INTO `sale_order` VALUES ('880', 'SO-2017-08-22-0001', '0000', '2017-08-22 00:00:00', '675.00', '2', '1');
INSERT INTO `sale_order` VALUES ('881', 'SO-2017-08-23-0001', '0000', '2017-08-23 00:00:00', '578.00', '2', '1');
INSERT INTO `sale_order` VALUES ('882', 'SO-2017-08-24-0001', '0000', '2017-08-24 00:00:00', '381.00', '2', '1');
INSERT INTO `sale_order` VALUES ('883', 'SO-2017-08-25-0001', '0000', '2017-08-25 00:00:00', '300.00', '2', '1');
INSERT INTO `sale_order` VALUES ('884', 'SO-2017-08-26-0001', '0000', '2017-08-26 00:00:00', '114.00', '2', '1');
INSERT INTO `sale_order` VALUES ('885', 'SO-2017-08-31-0001', '0000', '2017-08-31 00:00:00', '999.00', '2', '1');
INSERT INTO `sale_order` VALUES ('886', 'SO-2017-09-01-0001', '0000', '2017-09-01 00:00:00', '237.00', '2', '1');
INSERT INTO `sale_order` VALUES ('887', 'SO-2017-09-02-0001', '0000', '2017-09-02 00:00:00', '906.00', '2', '1');
INSERT INTO `sale_order` VALUES ('888', 'SO-2017-09-03-0001', '0000', '2017-09-03 00:00:00', '441.00', '2', '1');
INSERT INTO `sale_order` VALUES ('889', 'SO-2017-09-04-0001', '0000', '2017-09-04 00:00:00', '591.00', '2', '1');
INSERT INTO `sale_order` VALUES ('890', 'SO-2017-09-05-0001', '0000', '2017-09-05 00:00:00', '574.00', '2', '1');
INSERT INTO `sale_order` VALUES ('891', 'SO-2017-09-06-0001', '0000', '2017-09-06 00:00:00', '494.00', '2', '1');
INSERT INTO `sale_order` VALUES ('892', 'SO-2017-09-07-0001', '0000', '2017-09-07 00:00:00', '800.00', '2', '1');
INSERT INTO `sale_order` VALUES ('893', 'SO-2017-09-08-0001', '0000', '2017-09-08 00:00:00', '209.00', '2', '1');
INSERT INTO `sale_order` VALUES ('894', 'SO-2017-09-09-0001', '0000', '2017-09-09 00:00:00', '450.00', '2', '1');
INSERT INTO `sale_order` VALUES ('895', 'SO-2017-09-10-0001', '0000', '2017-09-10 00:00:00', '62.00', '2', '1');
INSERT INTO `sale_order` VALUES ('896', 'SO-2017-09-11-0001', '0000', '2017-09-11 00:00:00', '110.00', '2', '1');
INSERT INTO `sale_order` VALUES ('897', 'SO-2017-09-12-0001', '0000', '2017-09-12 00:00:00', '316.00', '2', '1');
INSERT INTO `sale_order` VALUES ('898', 'SO-2017-09-13-0001', '0000', '2017-09-13 00:00:00', '170.00', '2', '1');
INSERT INTO `sale_order` VALUES ('899', 'SO-2017-09-14-0001', '0000', '2017-09-14 00:00:00', '161.00', '2', '1');
INSERT INTO `sale_order` VALUES ('900', 'SO-2017-09-15-0001', '0000', '2017-09-15 00:00:00', '75.00', '2', '1');
INSERT INTO `sale_order` VALUES ('901', 'SO-2017-09-16-0001', '0000', '2017-09-16 00:00:00', '117.00', '2', '1');
INSERT INTO `sale_order` VALUES ('902', 'SO-2017-09-17-0001', '0000', '2017-09-17 00:00:00', '626.00', '2', '1');
INSERT INTO `sale_order` VALUES ('903', 'SO-2017-09-18-0001', '0000', '2017-09-18 00:00:00', '761.00', '2', '1');
INSERT INTO `sale_order` VALUES ('904', 'SO-2017-09-19-0001', '0000', '2017-09-19 00:00:00', '321.00', '2', '1');
INSERT INTO `sale_order` VALUES ('905', 'SO-2017-09-20-0001', '0000', '2017-09-20 00:00:00', '299.00', '2', '1');
INSERT INTO `sale_order` VALUES ('906', 'SO-2017-09-21-0001', '0000', '2017-09-21 00:00:00', '621.00', '2', '1');
INSERT INTO `sale_order` VALUES ('907', 'SO-2017-09-22-0001', '0000', '2017-09-22 00:00:00', '756.00', '2', '1');
INSERT INTO `sale_order` VALUES ('908', 'SO-2017-09-23-0001', '0000', '2017-09-23 00:00:00', '197.00', '2', '1');
INSERT INTO `sale_order` VALUES ('909', 'SO-2017-09-24-0001', '0000', '2017-09-24 00:00:00', '866.00', '2', '1');
INSERT INTO `sale_order` VALUES ('910', 'SO-2017-09-25-0001', '0000', '2017-09-25 00:00:00', '361.00', '2', '1');
INSERT INTO `sale_order` VALUES ('911', 'SO-2017-09-26-0001', '0000', '2017-09-26 00:00:00', '598.00', '2', '1');
INSERT INTO `sale_order` VALUES ('912', 'SO-2017-09-30-0001', '0000', '2017-09-30 00:00:00', '623.00', '2', '1');
INSERT INTO `sale_order` VALUES ('913', 'SO-2017-10-01-0001', '0000', '2017-10-01 00:00:00', '930.00', '2', '1');
INSERT INTO `sale_order` VALUES ('914', 'SO-2017-10-02-0001', '0000', '2017-10-02 00:00:00', '322.00', '2', '1');
INSERT INTO `sale_order` VALUES ('915', 'SO-2017-10-03-0001', '0000', '2017-10-03 00:00:00', '738.00', '2', '1');
INSERT INTO `sale_order` VALUES ('916', 'SO-2017-10-04-0001', '0000', '2017-10-04 00:00:00', '733.00', '2', '1');
INSERT INTO `sale_order` VALUES ('917', 'SO-2017-10-05-0001', '0000', '2017-10-05 00:00:00', '487.00', '2', '1');
INSERT INTO `sale_order` VALUES ('918', 'SO-2017-10-06-0001', '0000', '2017-10-06 00:00:00', '662.00', '2', '1');
INSERT INTO `sale_order` VALUES ('919', 'SO-2017-10-07-0001', '0000', '2017-10-07 00:00:00', '953.00', '2', '1');
INSERT INTO `sale_order` VALUES ('920', 'SO-2017-10-08-0001', '0000', '2017-10-08 00:00:00', '952.00', '2', '1');
INSERT INTO `sale_order` VALUES ('921', 'SO-2017-10-09-0001', '0000', '2017-10-09 00:00:00', '139.00', '2', '1');
INSERT INTO `sale_order` VALUES ('922', 'SO-2017-10-10-0001', '0000', '2017-10-10 00:00:00', '429.00', '2', '1');
INSERT INTO `sale_order` VALUES ('923', 'SO-2017-10-11-0001', '0000', '2017-10-11 00:00:00', '338.00', '2', '1');
INSERT INTO `sale_order` VALUES ('924', 'SO-2017-10-12-0001', '0000', '2017-10-12 00:00:00', '591.00', '2', '1');
INSERT INTO `sale_order` VALUES ('925', 'SO-2017-10-13-0001', '0000', '2017-10-13 00:00:00', '440.00', '2', '1');
INSERT INTO `sale_order` VALUES ('926', 'SO-2017-10-14-0001', '0000', '2017-10-14 00:00:00', '863.00', '2', '1');
INSERT INTO `sale_order` VALUES ('927', 'SO-2017-10-15-0001', '0000', '2017-10-15 00:00:00', '745.00', '2', '1');
INSERT INTO `sale_order` VALUES ('928', 'SO-2017-10-16-0001', '0000', '2017-10-16 00:00:00', '999.00', '2', '1');
INSERT INTO `sale_order` VALUES ('929', 'SO-2017-10-17-0001', '0000', '2017-10-17 00:00:00', '62.00', '2', '1');
INSERT INTO `sale_order` VALUES ('930', 'SO-2017-10-18-0001', '0000', '2017-10-18 00:00:00', '187.00', '2', '1');
INSERT INTO `sale_order` VALUES ('931', 'SO-2017-10-19-0001', '0000', '2017-10-19 00:00:00', '708.00', '2', '1');
INSERT INTO `sale_order` VALUES ('932', 'SO-2017-10-20-0001', '0000', '2017-10-20 00:00:00', '802.00', '2', '1');
INSERT INTO `sale_order` VALUES ('933', 'SO-2017-10-21-0001', '0000', '2017-10-21 00:00:00', '220.00', '2', '1');
INSERT INTO `sale_order` VALUES ('934', 'SO-2017-10-22-0001', '0000', '2017-10-22 00:00:00', '457.00', '2', '1');
INSERT INTO `sale_order` VALUES ('935', 'SO-2017-10-23-0001', '0000', '2017-10-23 00:00:00', '429.00', '2', '1');
INSERT INTO `sale_order` VALUES ('936', 'SO-2017-10-24-0001', '0000', '2017-10-24 00:00:00', '784.00', '2', '1');
INSERT INTO `sale_order` VALUES ('937', 'SO-2017-10-25-0001', '0000', '2017-10-25 00:00:00', '919.00', '2', '1');
INSERT INTO `sale_order` VALUES ('938', 'SO-2017-10-26-0001', '0000', '2017-10-26 00:00:00', '139.00', '2', '1');
INSERT INTO `sale_order` VALUES ('939', 'SO-2017-10-31-0001', '0000', '2017-10-31 00:00:00', '252.00', '2', '1');
INSERT INTO `sale_order` VALUES ('940', 'SO-2017-11-01-0001', '0000', '2017-11-01 00:00:00', '527.00', '2', '1');
INSERT INTO `sale_order` VALUES ('941', 'SO-2017-11-02-0001', '0000', '2017-11-02 00:00:00', '367.00', '2', '1');
INSERT INTO `sale_order` VALUES ('942', 'SO-2017-11-03-0001', '0000', '2017-11-03 00:00:00', '349.00', '2', '1');
INSERT INTO `sale_order` VALUES ('943', 'SO-2017-11-04-0001', '0000', '2017-11-04 00:00:00', '153.00', '2', '1');
INSERT INTO `sale_order` VALUES ('944', 'SO-2017-11-05-0001', '0000', '2017-11-05 00:00:00', '7.00', '2', '1');
INSERT INTO `sale_order` VALUES ('945', 'SO-2017-11-06-0001', '0000', '2017-11-06 00:00:00', '564.00', '2', '1');
INSERT INTO `sale_order` VALUES ('946', 'SO-2017-11-07-0001', '0000', '2017-11-07 00:00:00', '861.00', '2', '1');
INSERT INTO `sale_order` VALUES ('947', 'SO-2017-11-08-0001', '0000', '2017-11-08 00:00:00', '150.00', '2', '1');
INSERT INTO `sale_order` VALUES ('948', 'SO-2017-11-09-0001', '0000', '2017-11-09 00:00:00', '959.00', '2', '1');
INSERT INTO `sale_order` VALUES ('949', 'SO-2017-11-10-0001', '0000', '2017-11-10 00:00:00', '485.00', '2', '1');
INSERT INTO `sale_order` VALUES ('950', 'SO-2017-11-11-0001', '0000', '2017-11-11 00:00:00', '285.00', '2', '1');
INSERT INTO `sale_order` VALUES ('951', 'SO-2017-11-12-0001', '0000', '2017-11-12 00:00:00', '239.00', '2', '1');
INSERT INTO `sale_order` VALUES ('952', 'SO-2017-11-13-0001', '0000', '2017-11-13 00:00:00', '988.00', '2', '1');
INSERT INTO `sale_order` VALUES ('953', 'SO-2017-11-14-0001', '0000', '2017-11-14 00:00:00', '427.00', '2', '1');
INSERT INTO `sale_order` VALUES ('954', 'SO-2017-11-15-0001', '0000', '2017-11-15 00:00:00', '89.00', '2', '1');
INSERT INTO `sale_order` VALUES ('955', 'SO-2017-11-16-0001', '0000', '2017-11-16 00:00:00', '389.00', '2', '1');
INSERT INTO `sale_order` VALUES ('956', 'SO-2017-11-17-0001', '0000', '2017-11-17 00:00:00', '64.00', '2', '1');
INSERT INTO `sale_order` VALUES ('957', 'SO-2017-11-18-0001', '0000', '2017-11-18 00:00:00', '110.00', '2', '1');
INSERT INTO `sale_order` VALUES ('958', 'SO-2017-11-19-0001', '0000', '2017-11-19 00:00:00', '459.00', '2', '1');
INSERT INTO `sale_order` VALUES ('959', 'SO-2017-11-20-0001', '0000', '2017-11-20 00:00:00', '385.00', '2', '1');
INSERT INTO `sale_order` VALUES ('960', 'SO-2017-11-21-0001', '0000', '2017-11-21 00:00:00', '264.00', '2', '1');
INSERT INTO `sale_order` VALUES ('961', 'SO-2017-11-22-0001', '0000', '2017-11-22 00:00:00', '832.00', '2', '1');
INSERT INTO `sale_order` VALUES ('962', 'SO-2017-11-23-0001', '0000', '2017-11-23 00:00:00', '367.00', '2', '1');
INSERT INTO `sale_order` VALUES ('963', 'SO-2017-11-24-0001', '0000', '2017-11-24 00:00:00', '810.00', '2', '1');
INSERT INTO `sale_order` VALUES ('964', 'SO-2017-11-25-0001', '0000', '2017-11-25 00:00:00', '363.00', '2', '1');
INSERT INTO `sale_order` VALUES ('965', 'SO-2017-11-26-0001', '0000', '2017-11-26 00:00:00', '529.00', '2', '1');
INSERT INTO `sale_order` VALUES ('966', 'SO-2017-11-30-0001', '0000', '2017-11-30 00:00:00', '555.00', '2', '1');
INSERT INTO `sale_order` VALUES ('967', 'SO-2017-12-01-0001', '0000', '2017-12-01 00:00:00', '260.00', '2', '1');
INSERT INTO `sale_order` VALUES ('968', 'SO-2017-12-02-0001', '0000', '2017-12-02 00:00:00', '156.00', '2', '1');
INSERT INTO `sale_order` VALUES ('969', 'SO-2017-12-03-0001', '0000', '2017-12-03 00:00:00', '909.00', '2', '1');
INSERT INTO `sale_order` VALUES ('970', 'SO-2017-12-04-0001', '0000', '2017-12-04 00:00:00', '611.00', '2', '1');
INSERT INTO `sale_order` VALUES ('971', 'SO-2017-12-05-0001', '0000', '2017-12-05 00:00:00', '972.00', '2', '1');
INSERT INTO `sale_order` VALUES ('972', 'SO-2017-12-06-0001', '0000', '2017-12-06 00:00:00', '183.00', '2', '1');
INSERT INTO `sale_order` VALUES ('973', 'SO-2017-12-07-0001', '0000', '2017-12-07 00:00:00', '901.00', '2', '1');
INSERT INTO `sale_order` VALUES ('974', 'SO-2017-12-08-0001', '0000', '2017-12-08 00:00:00', '724.00', '2', '1');
INSERT INTO `sale_order` VALUES ('975', 'SO-2017-12-09-0001', '0000', '2017-12-09 00:00:00', '393.00', '2', '1');
INSERT INTO `sale_order` VALUES ('976', 'SO-2017-12-10-0001', '0000', '2017-12-10 00:00:00', '884.00', '2', '1');
INSERT INTO `sale_order` VALUES ('977', 'SO-2017-12-11-0001', '0000', '2017-12-11 00:00:00', '568.00', '2', '1');
INSERT INTO `sale_order` VALUES ('978', 'SO-2017-12-12-0001', '0000', '2017-12-12 00:00:00', '189.00', '2', '1');
INSERT INTO `sale_order` VALUES ('979', 'SO-2017-12-13-0001', '0000', '2017-12-13 00:00:00', '866.00', '2', '1');
INSERT INTO `sale_order` VALUES ('980', 'SO-2017-12-14-0001', '0000', '2017-12-14 00:00:00', '76.00', '2', '1');
INSERT INTO `sale_order` VALUES ('981', 'SO-2017-12-15-0001', '0000', '2017-12-15 00:00:00', '263.00', '2', '1');
INSERT INTO `sale_order` VALUES ('982', 'SO-2017-12-16-0001', '0000', '2017-12-16 00:00:00', '255.00', '2', '1');
INSERT INTO `sale_order` VALUES ('983', 'SO-2017-12-17-0001', '0000', '2017-12-17 00:00:00', '533.00', '2', '1');
INSERT INTO `sale_order` VALUES ('984', 'SO-2017-12-18-0001', '0000', '2017-12-18 00:00:00', '26.00', '2', '1');
INSERT INTO `sale_order` VALUES ('985', 'SO-2017-12-19-0001', '0000', '2017-12-19 00:00:00', '258.00', '2', '1');
INSERT INTO `sale_order` VALUES ('986', 'SO-2017-12-20-0001', '0000', '2017-12-20 00:00:00', '429.00', '2', '1');
INSERT INTO `sale_order` VALUES ('987', 'SO-2017-12-21-0001', '0000', '2017-12-21 00:00:00', '758.00', '2', '1');
INSERT INTO `sale_order` VALUES ('988', 'SO-2017-12-22-0001', '0000', '2017-12-22 00:00:00', '350.00', '2', '1');
INSERT INTO `sale_order` VALUES ('989', 'SO-2017-12-23-0001', '0000', '2017-12-23 00:00:00', '293.00', '2', '1');
INSERT INTO `sale_order` VALUES ('990', 'SO-2017-12-24-0001', '0000', '2017-12-24 00:00:00', '939.00', '2', '1');
INSERT INTO `sale_order` VALUES ('991', 'SO-2017-12-25-0001', '0000', '2017-12-25 00:00:00', '860.00', '2', '1');
INSERT INTO `sale_order` VALUES ('992', 'SO-2017-12-26-0001', '0000', '2017-12-26 00:00:00', '412.00', '2', '1');
INSERT INTO `sale_order` VALUES ('993', 'SO-2015-12-31-0001', '0000', '2015-12-31 00:00:00', '497.00', '2', '1');
INSERT INTO `sale_order` VALUES ('994', 'SO-2016-01-01-0001', '0000', '2016-01-01 00:00:00', '653.00', '2', '1');
INSERT INTO `sale_order` VALUES ('995', 'SO-2016-01-02-0001', '0000', '2016-01-02 00:00:00', '701.00', '2', '1');
INSERT INTO `sale_order` VALUES ('996', 'SO-2016-01-03-0001', '0000', '2016-01-03 00:00:00', '895.00', '2', '1');
INSERT INTO `sale_order` VALUES ('997', 'SO-2016-01-04-0001', '0000', '2016-01-04 00:00:00', '905.00', '2', '1');
INSERT INTO `sale_order` VALUES ('998', 'SO-2016-01-05-0001', '0000', '2016-01-05 00:00:00', '379.00', '2', '1');
INSERT INTO `sale_order` VALUES ('999', 'SO-2016-01-06-0001', '0000', '2016-01-06 00:00:00', '744.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1000', 'SO-2016-01-07-0001', '0000', '2016-01-07 00:00:00', '747.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1001', 'SO-2016-01-08-0001', '0000', '2016-01-08 00:00:00', '375.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1002', 'SO-2016-01-09-0001', '0000', '2016-01-09 00:00:00', '146.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1003', 'SO-2016-01-10-0001', '0000', '2016-01-10 00:00:00', '502.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1004', 'SO-2016-01-11-0001', '0000', '2016-01-11 00:00:00', '748.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1005', 'SO-2016-01-12-0001', '0000', '2016-01-12 00:00:00', '33.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1006', 'SO-2016-01-13-0001', '0000', '2016-01-13 00:00:00', '759.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1007', 'SO-2016-01-14-0001', '0000', '2016-01-14 00:00:00', '928.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1008', 'SO-2016-01-15-0001', '0000', '2016-01-15 00:00:00', '545.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1009', 'SO-2016-01-16-0001', '0000', '2016-01-16 00:00:00', '519.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1010', 'SO-2016-01-17-0001', '0000', '2016-01-17 00:00:00', '655.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1011', 'SO-2016-01-18-0001', '0000', '2016-01-18 00:00:00', '174.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1012', 'SO-2016-01-19-0001', '0000', '2016-01-19 00:00:00', '100.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1013', 'SO-2016-01-20-0001', '0000', '2016-01-20 00:00:00', '203.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1014', 'SO-2016-01-21-0001', '0000', '2016-01-21 00:00:00', '815.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1015', 'SO-2016-01-22-0001', '0000', '2016-01-22 00:00:00', '323.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1016', 'SO-2016-01-23-0001', '0000', '2016-01-23 00:00:00', '182.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1017', 'SO-2016-01-24-0001', '0000', '2016-01-24 00:00:00', '234.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1018', 'SO-2016-01-25-0001', '0000', '2016-01-25 00:00:00', '335.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1019', 'SO-2016-01-26-0001', '0000', '2016-01-26 00:00:00', '166.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1020', 'SO-2016-01-31-0001', '0000', '2016-01-31 00:00:00', '662.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1021', 'SO-2016-02-01-0001', '0000', '2016-02-01 00:00:00', '743.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1022', 'SO-2016-02-02-0001', '0000', '2016-02-02 00:00:00', '16.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1023', 'SO-2016-02-03-0001', '0000', '2016-02-03 00:00:00', '803.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1024', 'SO-2016-02-04-0001', '0000', '2016-02-04 00:00:00', '137.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1025', 'SO-2016-02-05-0001', '0000', '2016-02-05 00:00:00', '799.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1026', 'SO-2016-02-06-0001', '0000', '2016-02-06 00:00:00', '234.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1027', 'SO-2016-02-07-0001', '0000', '2016-02-07 00:00:00', '898.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1028', 'SO-2016-02-08-0001', '0000', '2016-02-08 00:00:00', '608.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1029', 'SO-2016-02-09-0001', '0000', '2016-02-09 00:00:00', '713.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1030', 'SO-2016-02-10-0001', '0000', '2016-02-10 00:00:00', '212.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1031', 'SO-2016-02-11-0001', '0000', '2016-02-11 00:00:00', '679.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1032', 'SO-2016-02-12-0001', '0000', '2016-02-12 00:00:00', '740.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1033', 'SO-2016-02-13-0001', '0000', '2016-02-13 00:00:00', '132.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1034', 'SO-2016-02-14-0001', '0000', '2016-02-14 00:00:00', '727.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1035', 'SO-2016-02-15-0001', '0000', '2016-02-15 00:00:00', '391.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1036', 'SO-2016-02-16-0001', '0000', '2016-02-16 00:00:00', '521.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1037', 'SO-2016-02-17-0001', '0000', '2016-02-17 00:00:00', '929.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1038', 'SO-2016-02-18-0001', '0000', '2016-02-18 00:00:00', '254.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1039', 'SO-2016-02-19-0001', '0000', '2016-02-19 00:00:00', '742.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1040', 'SO-2016-02-20-0001', '0000', '2016-02-20 00:00:00', '987.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1041', 'SO-2016-02-21-0001', '0000', '2016-02-21 00:00:00', '307.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1042', 'SO-2016-02-22-0001', '0000', '2016-02-22 00:00:00', '501.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1043', 'SO-2016-02-23-0001', '0000', '2016-02-23 00:00:00', '27.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1044', 'SO-2016-02-24-0001', '0000', '2016-02-24 00:00:00', '34.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1045', 'SO-2016-02-25-0001', '0000', '2016-02-25 00:00:00', '650.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1046', 'SO-2016-02-26-0001', '0000', '2016-02-26 00:00:00', '322.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1047', 'SO-2016-02-29-0001', '0000', '2016-02-29 00:00:00', '59.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1048', 'SO-2016-03-01-0001', '0000', '2016-03-01 00:00:00', '247.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1049', 'SO-2016-03-02-0001', '0000', '2016-03-02 00:00:00', '635.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1050', 'SO-2016-03-03-0001', '0000', '2016-03-03 00:00:00', '996.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1051', 'SO-2016-03-04-0001', '0000', '2016-03-04 00:00:00', '718.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1052', 'SO-2016-03-05-0001', '0000', '2016-03-05 00:00:00', '113.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1053', 'SO-2016-03-06-0001', '0000', '2016-03-06 00:00:00', '800.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1054', 'SO-2016-03-07-0001', '0000', '2016-03-07 00:00:00', '997.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1055', 'SO-2016-03-08-0001', '0000', '2016-03-08 00:00:00', '911.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1056', 'SO-2016-03-09-0001', '0000', '2016-03-09 00:00:00', '918.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1057', 'SO-2016-03-10-0001', '0000', '2016-03-10 00:00:00', '293.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1058', 'SO-2016-03-11-0001', '0000', '2016-03-11 00:00:00', '405.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1059', 'SO-2016-03-12-0001', '0000', '2016-03-12 00:00:00', '34.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1060', 'SO-2016-03-13-0001', '0000', '2016-03-13 00:00:00', '169.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1061', 'SO-2016-03-14-0001', '0000', '2016-03-14 00:00:00', '803.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1062', 'SO-2016-03-15-0001', '0000', '2016-03-15 00:00:00', '303.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1063', 'SO-2016-03-16-0001', '0000', '2016-03-16 00:00:00', '541.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1064', 'SO-2016-03-17-0001', '0000', '2016-03-17 00:00:00', '353.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1065', 'SO-2016-03-18-0001', '0000', '2016-03-18 00:00:00', '712.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1066', 'SO-2016-03-19-0001', '0000', '2016-03-19 00:00:00', '638.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1067', 'SO-2016-03-20-0001', '0000', '2016-03-20 00:00:00', '58.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1068', 'SO-2016-03-21-0001', '0000', '2016-03-21 00:00:00', '445.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1069', 'SO-2016-03-22-0001', '0000', '2016-03-22 00:00:00', '398.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1070', 'SO-2016-03-23-0001', '0000', '2016-03-23 00:00:00', '232.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1071', 'SO-2016-03-24-0001', '0000', '2016-03-24 00:00:00', '630.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1072', 'SO-2016-03-25-0001', '0000', '2016-03-25 00:00:00', '632.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1073', 'SO-2016-03-26-0001', '0000', '2016-03-26 00:00:00', '205.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1074', 'SO-2016-03-31-0001', '0000', '2016-03-31 00:00:00', '853.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1075', 'SO-2016-04-01-0001', '0000', '2016-04-01 00:00:00', '10.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1076', 'SO-2016-04-02-0001', '0000', '2016-04-02 00:00:00', '363.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1077', 'SO-2016-04-03-0001', '0000', '2016-04-03 00:00:00', '14.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1078', 'SO-2016-04-04-0001', '0000', '2016-04-04 00:00:00', '513.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1079', 'SO-2016-04-05-0001', '0000', '2016-04-05 00:00:00', '647.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1080', 'SO-2016-04-06-0001', '0000', '2016-04-06 00:00:00', '970.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1081', 'SO-2016-04-07-0001', '0000', '2016-04-07 00:00:00', '558.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1082', 'SO-2016-04-08-0001', '0000', '2016-04-08 00:00:00', '455.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1083', 'SO-2016-04-09-0001', '0000', '2016-04-09 00:00:00', '930.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1084', 'SO-2016-04-10-0001', '0000', '2016-04-10 00:00:00', '777.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1085', 'SO-2016-04-11-0001', '0000', '2016-04-11 00:00:00', '560.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1086', 'SO-2016-04-12-0001', '0000', '2016-04-12 00:00:00', '616.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1087', 'SO-2016-04-13-0001', '0000', '2016-04-13 00:00:00', '495.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1088', 'SO-2016-04-14-0001', '0000', '2016-04-14 00:00:00', '861.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1089', 'SO-2016-04-15-0001', '0000', '2016-04-15 00:00:00', '549.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1090', 'SO-2016-04-16-0001', '0000', '2016-04-16 00:00:00', '678.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1091', 'SO-2016-04-17-0001', '0000', '2016-04-17 00:00:00', '948.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1092', 'SO-2016-04-18-0001', '0000', '2016-04-18 00:00:00', '323.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1093', 'SO-2016-04-19-0001', '0000', '2016-04-19 00:00:00', '732.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1094', 'SO-2016-04-20-0001', '0000', '2016-04-20 00:00:00', '257.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1095', 'SO-2016-04-21-0001', '0000', '2016-04-21 00:00:00', '100.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1096', 'SO-2016-04-22-0001', '0000', '2016-04-22 00:00:00', '247.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1097', 'SO-2016-04-23-0001', '0000', '2016-04-23 00:00:00', '620.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1098', 'SO-2016-04-24-0001', '0000', '2016-04-24 00:00:00', '132.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1099', 'SO-2016-04-25-0001', '0000', '2016-04-25 00:00:00', '935.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1100', 'SO-2016-04-26-0001', '0000', '2016-04-26 00:00:00', '304.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1101', 'SO-2016-04-30-0001', '0000', '2016-04-30 00:00:00', '179.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1102', 'SO-2016-05-01-0001', '0000', '2016-05-01 00:00:00', '903.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1103', 'SO-2016-05-02-0001', '0000', '2016-05-02 00:00:00', '875.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1104', 'SO-2016-05-03-0001', '0000', '2016-05-03 00:00:00', '295.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1105', 'SO-2016-05-04-0001', '0000', '2016-05-04 00:00:00', '189.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1106', 'SO-2016-05-05-0001', '0000', '2016-05-05 00:00:00', '950.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1107', 'SO-2016-05-06-0001', '0000', '2016-05-06 00:00:00', '550.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1108', 'SO-2016-05-07-0001', '0000', '2016-05-07 00:00:00', '812.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1109', 'SO-2016-05-08-0001', '0000', '2016-05-08 00:00:00', '123.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1110', 'SO-2016-05-09-0001', '0000', '2016-05-09 00:00:00', '23.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1111', 'SO-2016-05-10-0001', '0000', '2016-05-10 00:00:00', '191.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1112', 'SO-2016-05-11-0001', '0000', '2016-05-11 00:00:00', '585.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1113', 'SO-2016-05-12-0001', '0000', '2016-05-12 00:00:00', '298.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1114', 'SO-2016-05-13-0001', '0000', '2016-05-13 00:00:00', '407.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1115', 'SO-2016-05-14-0001', '0000', '2016-05-14 00:00:00', '1000.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1116', 'SO-2016-05-15-0001', '0000', '2016-05-15 00:00:00', '7.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1117', 'SO-2016-05-16-0001', '0000', '2016-05-16 00:00:00', '291.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1118', 'SO-2016-05-17-0001', '0000', '2016-05-17 00:00:00', '105.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1119', 'SO-2016-05-18-0001', '0000', '2016-05-18 00:00:00', '292.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1120', 'SO-2016-05-19-0001', '0000', '2016-05-19 00:00:00', '796.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1121', 'SO-2016-05-20-0001', '0000', '2016-05-20 00:00:00', '592.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1122', 'SO-2016-05-21-0001', '0000', '2016-05-21 00:00:00', '141.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1123', 'SO-2016-05-22-0001', '0000', '2016-05-22 00:00:00', '20.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1124', 'SO-2016-05-23-0001', '0000', '2016-05-23 00:00:00', '770.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1125', 'SO-2016-05-24-0001', '0000', '2016-05-24 00:00:00', '249.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1126', 'SO-2016-05-25-0001', '0000', '2016-05-25 00:00:00', '680.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1127', 'SO-2016-05-26-0001', '0000', '2016-05-26 00:00:00', '292.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1128', 'SO-2016-05-31-0001', '0000', '2016-05-31 00:00:00', '179.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1129', 'SO-2016-06-01-0001', '0000', '2016-06-01 00:00:00', '848.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1130', 'SO-2016-06-02-0001', '0000', '2016-06-02 00:00:00', '354.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1131', 'SO-2016-06-03-0001', '0000', '2016-06-03 00:00:00', '867.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1132', 'SO-2016-06-04-0001', '0000', '2016-06-04 00:00:00', '157.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1133', 'SO-2016-06-05-0001', '0000', '2016-06-05 00:00:00', '481.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1134', 'SO-2016-06-06-0001', '0000', '2016-06-06 00:00:00', '860.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1135', 'SO-2016-06-07-0001', '0000', '2016-06-07 00:00:00', '180.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1136', 'SO-2016-06-08-0001', '0000', '2016-06-08 00:00:00', '405.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1137', 'SO-2016-06-09-0001', '0000', '2016-06-09 00:00:00', '511.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1138', 'SO-2016-06-10-0001', '0000', '2016-06-10 00:00:00', '632.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1139', 'SO-2016-06-11-0001', '0000', '2016-06-11 00:00:00', '376.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1140', 'SO-2016-06-12-0001', '0000', '2016-06-12 00:00:00', '339.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1141', 'SO-2016-06-13-0001', '0000', '2016-06-13 00:00:00', '824.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1142', 'SO-2016-06-14-0001', '0000', '2016-06-14 00:00:00', '151.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1143', 'SO-2016-06-15-0001', '0000', '2016-06-15 00:00:00', '986.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1144', 'SO-2016-06-16-0001', '0000', '2016-06-16 00:00:00', '599.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1145', 'SO-2016-06-17-0001', '0000', '2016-06-17 00:00:00', '979.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1146', 'SO-2016-06-18-0001', '0000', '2016-06-18 00:00:00', '244.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1147', 'SO-2016-06-19-0001', '0000', '2016-06-19 00:00:00', '337.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1148', 'SO-2016-06-20-0001', '0000', '2016-06-20 00:00:00', '989.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1149', 'SO-2016-06-21-0001', '0000', '2016-06-21 00:00:00', '95.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1150', 'SO-2016-06-22-0001', '0000', '2016-06-22 00:00:00', '532.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1151', 'SO-2016-06-23-0001', '0000', '2016-06-23 00:00:00', '518.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1152', 'SO-2016-06-24-0001', '0000', '2016-06-24 00:00:00', '621.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1153', 'SO-2016-06-25-0001', '0000', '2016-06-25 00:00:00', '606.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1154', 'SO-2016-06-26-0001', '0000', '2016-06-26 00:00:00', '70.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1155', 'SO-2016-06-30-0001', '0000', '2016-06-30 00:00:00', '756.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1156', 'SO-2016-07-01-0001', '0000', '2016-07-01 00:00:00', '294.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1157', 'SO-2016-07-02-0001', '0000', '2016-07-02 00:00:00', '17.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1158', 'SO-2016-07-03-0001', '0000', '2016-07-03 00:00:00', '66.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1159', 'SO-2016-07-04-0001', '0000', '2016-07-04 00:00:00', '333.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1160', 'SO-2016-07-05-0001', '0000', '2016-07-05 00:00:00', '911.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1161', 'SO-2016-07-06-0001', '0000', '2016-07-06 00:00:00', '629.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1162', 'SO-2016-07-07-0001', '0000', '2016-07-07 00:00:00', '519.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1163', 'SO-2016-07-08-0001', '0000', '2016-07-08 00:00:00', '768.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1164', 'SO-2016-07-09-0001', '0000', '2016-07-09 00:00:00', '26.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1165', 'SO-2016-07-10-0001', '0000', '2016-07-10 00:00:00', '778.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1166', 'SO-2016-07-11-0001', '0000', '2016-07-11 00:00:00', '536.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1167', 'SO-2016-07-12-0001', '0000', '2016-07-12 00:00:00', '849.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1168', 'SO-2016-07-13-0001', '0000', '2016-07-13 00:00:00', '476.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1169', 'SO-2016-07-14-0001', '0000', '2016-07-14 00:00:00', '518.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1170', 'SO-2016-07-15-0001', '0000', '2016-07-15 00:00:00', '75.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1171', 'SO-2016-07-16-0001', '0000', '2016-07-16 00:00:00', '234.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1172', 'SO-2016-07-17-0001', '0000', '2016-07-17 00:00:00', '393.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1173', 'SO-2016-07-18-0001', '0000', '2016-07-18 00:00:00', '840.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1174', 'SO-2016-07-19-0001', '0000', '2016-07-19 00:00:00', '874.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1175', 'SO-2016-07-20-0001', '0000', '2016-07-20 00:00:00', '761.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1176', 'SO-2016-07-21-0001', '0000', '2016-07-21 00:00:00', '821.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1177', 'SO-2016-07-22-0001', '0000', '2016-07-22 00:00:00', '445.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1178', 'SO-2016-07-23-0001', '0000', '2016-07-23 00:00:00', '355.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1179', 'SO-2016-07-24-0001', '0000', '2016-07-24 00:00:00', '329.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1180', 'SO-2016-07-25-0001', '0000', '2016-07-25 00:00:00', '568.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1181', 'SO-2016-07-26-0001', '0000', '2016-07-26 00:00:00', '824.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1182', 'SO-2016-07-31-0001', '0000', '2016-07-31 00:00:00', '374.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1183', 'SO-2016-08-01-0001', '0000', '2016-08-01 00:00:00', '172.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1184', 'SO-2016-08-02-0001', '0000', '2016-08-02 00:00:00', '893.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1185', 'SO-2016-08-03-0001', '0000', '2016-08-03 00:00:00', '872.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1186', 'SO-2016-08-04-0001', '0000', '2016-08-04 00:00:00', '789.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1187', 'SO-2016-08-05-0001', '0000', '2016-08-05 00:00:00', '632.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1188', 'SO-2016-08-06-0001', '0000', '2016-08-06 00:00:00', '132.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1189', 'SO-2016-08-07-0001', '0000', '2016-08-07 00:00:00', '590.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1190', 'SO-2016-08-08-0001', '0000', '2016-08-08 00:00:00', '943.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1191', 'SO-2016-08-09-0001', '0000', '2016-08-09 00:00:00', '89.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1192', 'SO-2016-08-10-0001', '0000', '2016-08-10 00:00:00', '368.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1193', 'SO-2016-08-11-0001', '0000', '2016-08-11 00:00:00', '448.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1194', 'SO-2016-08-12-0001', '0000', '2016-08-12 00:00:00', '328.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1195', 'SO-2016-08-13-0001', '0000', '2016-08-13 00:00:00', '510.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1196', 'SO-2016-08-14-0001', '0000', '2016-08-14 00:00:00', '839.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1197', 'SO-2016-08-15-0001', '0000', '2016-08-15 00:00:00', '843.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1198', 'SO-2016-08-16-0001', '0000', '2016-08-16 00:00:00', '908.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1199', 'SO-2016-08-17-0001', '0000', '2016-08-17 00:00:00', '216.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1200', 'SO-2016-08-18-0001', '0000', '2016-08-18 00:00:00', '825.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1201', 'SO-2016-08-19-0001', '0000', '2016-08-19 00:00:00', '727.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1202', 'SO-2016-08-20-0001', '0000', '2016-08-20 00:00:00', '779.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1203', 'SO-2016-08-21-0001', '0000', '2016-08-21 00:00:00', '846.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1204', 'SO-2016-08-22-0001', '0000', '2016-08-22 00:00:00', '410.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1205', 'SO-2016-08-23-0001', '0000', '2016-08-23 00:00:00', '867.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1206', 'SO-2016-08-24-0001', '0000', '2016-08-24 00:00:00', '117.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1207', 'SO-2016-08-25-0001', '0000', '2016-08-25 00:00:00', '175.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1208', 'SO-2016-08-26-0001', '0000', '2016-08-26 00:00:00', '643.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1209', 'SO-2016-08-31-0001', '0000', '2016-08-31 00:00:00', '389.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1210', 'SO-2016-09-01-0001', '0000', '2016-09-01 00:00:00', '673.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1211', 'SO-2016-09-02-0001', '0000', '2016-09-02 00:00:00', '375.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1212', 'SO-2016-09-03-0001', '0000', '2016-09-03 00:00:00', '299.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1213', 'SO-2016-09-04-0001', '0000', '2016-09-04 00:00:00', '245.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1214', 'SO-2016-09-05-0001', '0000', '2016-09-05 00:00:00', '346.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1215', 'SO-2016-09-06-0001', '0000', '2016-09-06 00:00:00', '593.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1216', 'SO-2016-09-07-0001', '0000', '2016-09-07 00:00:00', '680.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1217', 'SO-2016-09-08-0001', '0000', '2016-09-08 00:00:00', '969.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1218', 'SO-2016-09-09-0001', '0000', '2016-09-09 00:00:00', '780.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1219', 'SO-2016-09-10-0001', '0000', '2016-09-10 00:00:00', '171.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1220', 'SO-2016-09-11-0001', '0000', '2016-09-11 00:00:00', '608.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1221', 'SO-2016-09-12-0001', '0000', '2016-09-12 00:00:00', '646.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1222', 'SO-2016-09-13-0001', '0000', '2016-09-13 00:00:00', '262.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1223', 'SO-2016-09-14-0001', '0000', '2016-09-14 00:00:00', '695.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1224', 'SO-2016-09-15-0001', '0000', '2016-09-15 00:00:00', '46.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1225', 'SO-2016-09-16-0001', '0000', '2016-09-16 00:00:00', '300.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1226', 'SO-2016-09-17-0001', '0000', '2016-09-17 00:00:00', '646.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1227', 'SO-2016-09-18-0001', '0000', '2016-09-18 00:00:00', '82.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1228', 'SO-2016-09-19-0001', '0000', '2016-09-19 00:00:00', '611.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1229', 'SO-2016-09-20-0001', '0000', '2016-09-20 00:00:00', '40.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1230', 'SO-2016-09-21-0001', '0000', '2016-09-21 00:00:00', '453.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1231', 'SO-2016-09-22-0001', '0000', '2016-09-22 00:00:00', '327.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1232', 'SO-2016-09-23-0001', '0000', '2016-09-23 00:00:00', '540.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1233', 'SO-2016-09-24-0001', '0000', '2016-09-24 00:00:00', '143.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1234', 'SO-2016-09-25-0001', '0000', '2016-09-25 00:00:00', '797.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1235', 'SO-2016-09-26-0001', '0000', '2016-09-26 00:00:00', '126.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1236', 'SO-2016-09-30-0001', '0000', '2016-09-30 00:00:00', '569.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1237', 'SO-2016-10-01-0001', '0000', '2016-10-01 00:00:00', '930.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1238', 'SO-2016-10-02-0001', '0000', '2016-10-02 00:00:00', '269.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1239', 'SO-2016-10-03-0001', '0000', '2016-10-03 00:00:00', '555.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1240', 'SO-2016-10-04-0001', '0000', '2016-10-04 00:00:00', '577.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1241', 'SO-2016-10-05-0001', '0000', '2016-10-05 00:00:00', '735.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1242', 'SO-2016-10-06-0001', '0000', '2016-10-06 00:00:00', '475.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1243', 'SO-2016-10-07-0001', '0000', '2016-10-07 00:00:00', '152.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1244', 'SO-2016-10-08-0001', '0000', '2016-10-08 00:00:00', '770.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1245', 'SO-2016-10-09-0001', '0000', '2016-10-09 00:00:00', '456.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1246', 'SO-2016-10-10-0001', '0000', '2016-10-10 00:00:00', '485.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1247', 'SO-2016-10-11-0001', '0000', '2016-10-11 00:00:00', '267.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1248', 'SO-2016-10-12-0001', '0000', '2016-10-12 00:00:00', '651.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1249', 'SO-2016-10-13-0001', '0000', '2016-10-13 00:00:00', '222.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1250', 'SO-2016-10-14-0001', '0000', '2016-10-14 00:00:00', '42.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1251', 'SO-2016-10-15-0001', '0000', '2016-10-15 00:00:00', '290.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1252', 'SO-2016-10-16-0001', '0000', '2016-10-16 00:00:00', '3.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1253', 'SO-2016-10-17-0001', '0000', '2016-10-17 00:00:00', '459.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1254', 'SO-2016-10-18-0001', '0000', '2016-10-18 00:00:00', '40.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1255', 'SO-2016-10-19-0001', '0000', '2016-10-19 00:00:00', '422.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1256', 'SO-2016-10-20-0001', '0000', '2016-10-20 00:00:00', '667.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1257', 'SO-2016-10-21-0001', '0000', '2016-10-21 00:00:00', '200.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1258', 'SO-2016-10-22-0001', '0000', '2016-10-22 00:00:00', '422.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1259', 'SO-2016-10-23-0001', '0000', '2016-10-23 00:00:00', '985.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1260', 'SO-2016-10-24-0001', '0000', '2016-10-24 00:00:00', '892.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1261', 'SO-2016-10-25-0001', '0000', '2016-10-25 00:00:00', '867.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1262', 'SO-2016-10-26-0001', '0000', '2016-10-26 00:00:00', '348.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1263', 'SO-2016-10-31-0001', '0000', '2016-10-31 00:00:00', '871.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1264', 'SO-2016-11-01-0001', '0000', '2016-11-01 00:00:00', '706.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1265', 'SO-2016-11-02-0001', '0000', '2016-11-02 00:00:00', '831.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1266', 'SO-2016-11-03-0001', '0000', '2016-11-03 00:00:00', '228.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1267', 'SO-2016-11-04-0001', '0000', '2016-11-04 00:00:00', '637.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1268', 'SO-2016-11-05-0001', '0000', '2016-11-05 00:00:00', '788.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1269', 'SO-2016-11-06-0001', '0000', '2016-11-06 00:00:00', '986.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1270', 'SO-2016-11-07-0001', '0000', '2016-11-07 00:00:00', '946.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1271', 'SO-2016-11-08-0001', '0000', '2016-11-08 00:00:00', '895.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1272', 'SO-2016-11-09-0001', '0000', '2016-11-09 00:00:00', '33.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1273', 'SO-2016-11-10-0001', '0000', '2016-11-10 00:00:00', '277.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1274', 'SO-2016-11-11-0001', '0000', '2016-11-11 00:00:00', '428.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1275', 'SO-2016-11-12-0001', '0000', '2016-11-12 00:00:00', '144.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1276', 'SO-2016-11-13-0001', '0000', '2016-11-13 00:00:00', '162.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1277', 'SO-2016-11-14-0001', '0000', '2016-11-14 00:00:00', '550.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1278', 'SO-2016-11-15-0001', '0000', '2016-11-15 00:00:00', '475.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1279', 'SO-2016-11-16-0001', '0000', '2016-11-16 00:00:00', '880.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1280', 'SO-2016-11-17-0001', '0000', '2016-11-17 00:00:00', '418.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1281', 'SO-2016-11-18-0001', '0000', '2016-11-18 00:00:00', '394.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1282', 'SO-2016-11-19-0001', '0000', '2016-11-19 00:00:00', '704.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1283', 'SO-2016-11-20-0001', '0000', '2016-11-20 00:00:00', '878.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1284', 'SO-2016-11-21-0001', '0000', '2016-11-21 00:00:00', '686.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1285', 'SO-2016-11-22-0001', '0000', '2016-11-22 00:00:00', '629.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1286', 'SO-2016-11-23-0001', '0000', '2016-11-23 00:00:00', '251.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1287', 'SO-2016-11-24-0001', '0000', '2016-11-24 00:00:00', '795.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1288', 'SO-2016-11-25-0001', '0000', '2016-11-25 00:00:00', '86.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1289', 'SO-2016-11-26-0001', '0000', '2016-11-26 00:00:00', '939.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1290', 'SO-2016-11-30-0001', '0000', '2016-11-30 00:00:00', '865.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1291', 'SO-2016-12-01-0001', '0000', '2016-12-01 00:00:00', '879.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1292', 'SO-2016-12-02-0001', '0000', '2016-12-02 00:00:00', '446.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1293', 'SO-2016-12-03-0001', '0000', '2016-12-03 00:00:00', '743.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1294', 'SO-2016-12-04-0001', '0000', '2016-12-04 00:00:00', '929.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1295', 'SO-2016-12-05-0001', '0000', '2016-12-05 00:00:00', '360.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1296', 'SO-2016-12-06-0001', '0000', '2016-12-06 00:00:00', '867.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1297', 'SO-2016-12-07-0001', '0000', '2016-12-07 00:00:00', '739.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1298', 'SO-2016-12-08-0001', '0000', '2016-12-08 00:00:00', '946.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1299', 'SO-2016-12-09-0001', '0000', '2016-12-09 00:00:00', '305.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1300', 'SO-2016-12-10-0001', '0000', '2016-12-10 00:00:00', '976.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1301', 'SO-2016-12-11-0001', '0000', '2016-12-11 00:00:00', '774.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1302', 'SO-2016-12-12-0001', '0000', '2016-12-12 00:00:00', '15.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1303', 'SO-2016-12-13-0001', '0000', '2016-12-13 00:00:00', '94.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1304', 'SO-2016-12-14-0001', '0000', '2016-12-14 00:00:00', '354.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1305', 'SO-2016-12-15-0001', '0000', '2016-12-15 00:00:00', '558.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1306', 'SO-2016-12-16-0001', '0000', '2016-12-16 00:00:00', '884.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1307', 'SO-2016-12-17-0001', '0000', '2016-12-17 00:00:00', '415.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1308', 'SO-2016-12-18-0001', '0000', '2016-12-18 00:00:00', '60.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1309', 'SO-2016-12-19-0001', '0000', '2016-12-19 00:00:00', '531.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1310', 'SO-2016-12-20-0001', '0000', '2016-12-20 00:00:00', '227.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1311', 'SO-2016-12-21-0001', '0000', '2016-12-21 00:00:00', '628.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1312', 'SO-2016-12-22-0001', '0000', '2016-12-22 00:00:00', '139.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1313', 'SO-2016-12-23-0001', '0000', '2016-12-23 00:00:00', '634.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1314', 'SO-2016-12-24-0001', '0000', '2016-12-24 00:00:00', '884.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1315', 'SO-2016-12-25-0001', '0000', '2016-12-25 00:00:00', '639.00', '2', '1');
INSERT INTO `sale_order` VALUES ('1316', 'SO-2016-12-26-0001', '0000', '2016-12-26 00:00:00', '485.00', '2', '1');

-- ----------------------------
-- Table structure for sale_order_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_order_item`;
CREATE TABLE `sale_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标记',
  `saleOrderNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号，参照sale_order表订单编号',
  `itemId` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品编号，即条形码，参照goods表',
  `quantity` int(11) NOT NULL DEFAULT '1' COMMENT '数量',
  `salePrice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `subTotal` decimal(10,2) NOT NULL COMMENT '小计',
  PRIMARY KEY (`id`),
  KEY `FK_soi_saleOrderNo` (`saleOrderNo`),
  KEY `FK_soi_itemId` (`itemId`),
  CONSTRAINT `FK_soi_itemId` FOREIGN KEY (`itemId`) REFERENCES `goods` (`barcode`),
  CONSTRAINT `FK_soi_saleOrderNo` FOREIGN KEY (`saleOrderNo`) REFERENCES `sale_order` (`saleOrderNo`)
) ENGINE=InnoDB AUTO_INCREMENT=649 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_order_item
-- ----------------------------
INSERT INTO `sale_order_item` VALUES ('1', 'SO-2016-12-31-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('2', 'SO-2017-01-01-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('3', 'SO-2017-01-02-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('4', 'SO-2017-01-03-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('5', 'SO-2017-01-04-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('6', 'SO-2017-01-05-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('7', 'SO-2017-01-06-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('8', 'SO-2017-01-07-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('9', 'SO-2017-01-08-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('10', 'SO-2017-01-09-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('11', 'SO-2017-01-10-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('12', 'SO-2017-01-11-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('13', 'SO-2017-01-12-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('14', 'SO-2017-01-13-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('15', 'SO-2017-01-14-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('16', 'SO-2017-01-15-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('17', 'SO-2017-01-16-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('18', 'SO-2017-01-17-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('19', 'SO-2017-01-18-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('20', 'SO-2017-01-19-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('21', 'SO-2017-01-20-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('22', 'SO-2017-01-21-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('23', 'SO-2017-01-22-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('24', 'SO-2017-01-23-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('25', 'SO-2017-01-24-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('26', 'SO-2017-01-25-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('27', 'SO-2017-01-26-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('28', 'SO-2017-01-31-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('29', 'SO-2017-02-01-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('30', 'SO-2017-02-02-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('31', 'SO-2017-02-03-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('32', 'SO-2017-02-04-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('33', 'SO-2017-02-05-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('34', 'SO-2017-02-06-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('35', 'SO-2017-02-07-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('36', 'SO-2017-02-08-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('37', 'SO-2017-02-09-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('38', 'SO-2017-02-10-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('39', 'SO-2017-02-11-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('40', 'SO-2017-02-12-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('41', 'SO-2017-02-13-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('42', 'SO-2017-02-14-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('43', 'SO-2017-02-15-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('44', 'SO-2017-02-16-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('45', 'SO-2017-02-17-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('46', 'SO-2017-02-18-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('47', 'SO-2017-02-19-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('48', 'SO-2017-02-20-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('49', 'SO-2017-02-21-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('50', 'SO-2017-02-22-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('51', 'SO-2017-02-23-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('52', 'SO-2017-02-24-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('53', 'SO-2017-02-25-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('54', 'SO-2017-02-26-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('55', 'SO-2017-02-28-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('56', 'SO-2017-03-01-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('57', 'SO-2017-03-02-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('58', 'SO-2017-03-03-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('59', 'SO-2017-03-04-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('60', 'SO-2017-03-05-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('61', 'SO-2017-03-06-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('62', 'SO-2017-03-07-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('63', 'SO-2017-03-08-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('64', 'SO-2017-03-09-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('65', 'SO-2017-03-10-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('66', 'SO-2017-03-11-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('67', 'SO-2017-03-12-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('68', 'SO-2017-03-13-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('69', 'SO-2017-03-14-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('70', 'SO-2017-03-15-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('71', 'SO-2017-03-16-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('72', 'SO-2017-03-17-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('73', 'SO-2017-03-18-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('74', 'SO-2017-03-19-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('75', 'SO-2017-03-20-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('76', 'SO-2017-03-21-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('77', 'SO-2017-03-22-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('78', 'SO-2017-03-23-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('79', 'SO-2017-03-24-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('80', 'SO-2017-03-25-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('81', 'SO-2017-03-26-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('82', 'SO-2017-03-31-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('83', 'SO-2017-04-01-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('84', 'SO-2017-04-02-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('85', 'SO-2017-04-03-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('86', 'SO-2017-04-04-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('87', 'SO-2017-04-05-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('88', 'SO-2017-04-06-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('89', 'SO-2017-04-07-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('90', 'SO-2017-04-08-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('91', 'SO-2017-04-09-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('92', 'SO-2017-04-10-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('93', 'SO-2017-04-11-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('94', 'SO-2017-04-12-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('95', 'SO-2017-04-13-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('96', 'SO-2017-04-14-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('97', 'SO-2017-04-15-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('98', 'SO-2017-04-16-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('99', 'SO-2017-04-17-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('100', 'SO-2017-04-18-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('101', 'SO-2017-04-19-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('102', 'SO-2017-04-20-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('103', 'SO-2017-04-21-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('104', 'SO-2017-04-22-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('105', 'SO-2017-04-23-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('106', 'SO-2017-04-24-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('107', 'SO-2017-04-25-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('108', 'SO-2017-04-26-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('109', 'SO-2017-04-30-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('110', 'SO-2017-05-01-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('111', 'SO-2017-05-02-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('112', 'SO-2017-05-03-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('113', 'SO-2017-05-04-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('114', 'SO-2017-05-05-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('115', 'SO-2017-05-06-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('116', 'SO-2017-05-07-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('117', 'SO-2017-05-08-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('118', 'SO-2017-05-09-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('119', 'SO-2017-05-10-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('120', 'SO-2017-05-11-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('121', 'SO-2017-05-12-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('122', 'SO-2017-05-13-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('123', 'SO-2017-05-14-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('124', 'SO-2017-05-15-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('125', 'SO-2017-05-16-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('126', 'SO-2017-05-17-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('127', 'SO-2017-05-18-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('128', 'SO-2017-05-19-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('129', 'SO-2017-05-20-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('130', 'SO-2017-05-21-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('131', 'SO-2017-05-22-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('132', 'SO-2017-05-23-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('133', 'SO-2017-05-24-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('134', 'SO-2017-05-25-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('135', 'SO-2017-05-26-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('136', 'SO-2017-05-31-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('137', 'SO-2017-06-01-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('138', 'SO-2017-06-02-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('139', 'SO-2017-06-03-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('140', 'SO-2017-06-04-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('141', 'SO-2017-06-05-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('142', 'SO-2017-06-06-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('143', 'SO-2017-06-07-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('144', 'SO-2017-06-08-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('145', 'SO-2017-06-09-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('146', 'SO-2017-06-10-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('147', 'SO-2017-06-11-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('148', 'SO-2017-06-12-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('149', 'SO-2017-06-13-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('150', 'SO-2017-06-14-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('151', 'SO-2017-06-15-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('152', 'SO-2017-06-16-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('153', 'SO-2017-06-17-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('154', 'SO-2017-06-18-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('155', 'SO-2017-06-19-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('156', 'SO-2017-06-20-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('157', 'SO-2017-06-21-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('158', 'SO-2017-06-22-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('159', 'SO-2017-06-23-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('160', 'SO-2017-06-24-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('161', 'SO-2017-06-25-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('162', 'SO-2017-06-26-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('163', 'SO-2017-06-30-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('164', 'SO-2017-07-01-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('165', 'SO-2017-07-02-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('166', 'SO-2017-07-03-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('167', 'SO-2017-07-04-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('168', 'SO-2017-07-05-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('169', 'SO-2017-07-06-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('170', 'SO-2017-07-07-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('171', 'SO-2017-07-08-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('172', 'SO-2017-07-09-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('173', 'SO-2017-07-10-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('174', 'SO-2017-07-11-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('175', 'SO-2017-07-12-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('176', 'SO-2017-07-13-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('177', 'SO-2017-07-14-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('178', 'SO-2017-07-15-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('179', 'SO-2017-07-16-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('180', 'SO-2017-07-17-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('181', 'SO-2017-07-18-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('182', 'SO-2017-07-19-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('183', 'SO-2017-07-20-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('184', 'SO-2017-07-21-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('185', 'SO-2017-07-22-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('186', 'SO-2017-07-23-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('187', 'SO-2017-07-24-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('188', 'SO-2017-07-25-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('189', 'SO-2017-07-26-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('190', 'SO-2017-07-31-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('191', 'SO-2017-08-01-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('192', 'SO-2017-08-02-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('193', 'SO-2017-08-03-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('194', 'SO-2017-08-04-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('195', 'SO-2017-08-05-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('196', 'SO-2017-08-06-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('197', 'SO-2017-08-07-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('198', 'SO-2017-08-08-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('199', 'SO-2017-08-09-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('200', 'SO-2017-08-10-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('201', 'SO-2017-08-11-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('202', 'SO-2017-08-12-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('203', 'SO-2017-08-13-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('204', 'SO-2017-08-14-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('205', 'SO-2017-08-15-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('206', 'SO-2017-08-16-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('207', 'SO-2017-08-17-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('208', 'SO-2017-08-18-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('209', 'SO-2017-08-19-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('210', 'SO-2017-08-20-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('211', 'SO-2017-08-21-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('212', 'SO-2017-08-22-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('213', 'SO-2017-08-23-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('214', 'SO-2017-08-24-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('215', 'SO-2017-08-25-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('216', 'SO-2017-08-26-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('217', 'SO-2017-08-31-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('218', 'SO-2017-09-01-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('219', 'SO-2017-09-02-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('220', 'SO-2017-09-03-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('221', 'SO-2017-09-04-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('222', 'SO-2017-09-05-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('223', 'SO-2017-09-06-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('224', 'SO-2017-09-07-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('225', 'SO-2017-09-08-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('226', 'SO-2017-09-09-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('227', 'SO-2017-09-10-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('228', 'SO-2017-09-11-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('229', 'SO-2017-09-12-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('230', 'SO-2017-09-13-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('231', 'SO-2017-09-14-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('232', 'SO-2017-09-15-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('233', 'SO-2017-09-16-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('234', 'SO-2017-09-17-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('235', 'SO-2017-09-18-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('236', 'SO-2017-09-19-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('237', 'SO-2017-09-20-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('238', 'SO-2017-09-21-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('239', 'SO-2017-09-22-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('240', 'SO-2017-09-23-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('241', 'SO-2017-09-24-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('242', 'SO-2017-09-25-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('243', 'SO-2017-09-26-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('244', 'SO-2017-09-30-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('245', 'SO-2017-10-01-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('246', 'SO-2017-10-02-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('247', 'SO-2017-10-03-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('248', 'SO-2017-10-04-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('249', 'SO-2017-10-05-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('250', 'SO-2017-10-06-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('251', 'SO-2017-10-07-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('252', 'SO-2017-10-08-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('253', 'SO-2017-10-09-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('254', 'SO-2017-10-10-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('255', 'SO-2017-10-11-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('256', 'SO-2017-10-12-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('257', 'SO-2017-10-13-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('258', 'SO-2017-10-14-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('259', 'SO-2017-10-15-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('260', 'SO-2017-10-16-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('261', 'SO-2017-10-17-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('262', 'SO-2017-10-18-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('263', 'SO-2017-10-19-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('264', 'SO-2017-10-20-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('265', 'SO-2017-10-21-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('266', 'SO-2017-10-22-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('267', 'SO-2017-10-23-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('268', 'SO-2017-10-24-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('269', 'SO-2017-10-25-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('270', 'SO-2017-10-26-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('271', 'SO-2017-10-31-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('272', 'SO-2017-11-01-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('273', 'SO-2017-11-02-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('274', 'SO-2017-11-03-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('275', 'SO-2017-11-04-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('276', 'SO-2017-11-05-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('277', 'SO-2017-11-06-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('278', 'SO-2017-11-07-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('279', 'SO-2017-11-08-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('280', 'SO-2017-11-09-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('281', 'SO-2017-11-10-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('282', 'SO-2017-11-11-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('283', 'SO-2017-11-12-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('284', 'SO-2017-11-13-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('285', 'SO-2017-11-14-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('286', 'SO-2017-11-15-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('287', 'SO-2017-11-16-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('288', 'SO-2017-11-17-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('289', 'SO-2017-11-18-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('290', 'SO-2017-11-19-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('291', 'SO-2017-11-20-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('292', 'SO-2017-11-21-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('293', 'SO-2017-11-22-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('294', 'SO-2017-11-23-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('295', 'SO-2017-11-24-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('296', 'SO-2017-11-25-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('297', 'SO-2017-11-26-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('298', 'SO-2017-11-30-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('299', 'SO-2017-12-01-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('300', 'SO-2017-12-02-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('301', 'SO-2017-12-03-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('302', 'SO-2017-12-04-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('303', 'SO-2017-12-05-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('304', 'SO-2017-12-06-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('305', 'SO-2017-12-07-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('306', 'SO-2017-12-08-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('307', 'SO-2017-12-09-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('308', 'SO-2017-12-10-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('309', 'SO-2017-12-11-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('310', 'SO-2017-12-12-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('311', 'SO-2017-12-13-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('312', 'SO-2017-12-14-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('313', 'SO-2017-12-15-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('314', 'SO-2017-12-16-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('315', 'SO-2017-12-17-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('316', 'SO-2017-12-18-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('317', 'SO-2017-12-19-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('318', 'SO-2017-12-20-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('319', 'SO-2017-12-21-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('320', 'SO-2017-12-22-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('321', 'SO-2017-12-23-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('322', 'SO-2017-12-24-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('323', 'SO-2017-12-25-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('324', 'SO-2017-12-26-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('325', 'SO-2015-12-31-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('326', 'SO-2016-01-01-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('327', 'SO-2016-01-02-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('328', 'SO-2016-01-03-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('329', 'SO-2016-01-04-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('330', 'SO-2016-01-05-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('331', 'SO-2016-01-06-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('332', 'SO-2016-01-07-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('333', 'SO-2016-01-08-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('334', 'SO-2016-01-09-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('335', 'SO-2016-01-10-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('336', 'SO-2016-01-11-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('337', 'SO-2016-01-12-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('338', 'SO-2016-01-13-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('339', 'SO-2016-01-14-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('340', 'SO-2016-01-15-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('341', 'SO-2016-01-16-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('342', 'SO-2016-01-17-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('343', 'SO-2016-01-18-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('344', 'SO-2016-01-19-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('345', 'SO-2016-01-20-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('346', 'SO-2016-01-21-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('347', 'SO-2016-01-22-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('348', 'SO-2016-01-23-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('349', 'SO-2016-01-24-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('350', 'SO-2016-01-25-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('351', 'SO-2016-01-26-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('352', 'SO-2016-01-31-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('353', 'SO-2016-02-01-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('354', 'SO-2016-02-02-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('355', 'SO-2016-02-03-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('356', 'SO-2016-02-04-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('357', 'SO-2016-02-05-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('358', 'SO-2016-02-06-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('359', 'SO-2016-02-07-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('360', 'SO-2016-02-08-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('361', 'SO-2016-02-09-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('362', 'SO-2016-02-10-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('363', 'SO-2016-02-11-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('364', 'SO-2016-02-12-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('365', 'SO-2016-02-13-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('366', 'SO-2016-02-14-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('367', 'SO-2016-02-15-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('368', 'SO-2016-02-16-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('369', 'SO-2016-02-17-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('370', 'SO-2016-02-18-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('371', 'SO-2016-02-19-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('372', 'SO-2016-02-20-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('373', 'SO-2016-02-21-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('374', 'SO-2016-02-22-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('375', 'SO-2016-02-23-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('376', 'SO-2016-02-24-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('377', 'SO-2016-02-25-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('378', 'SO-2016-02-26-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('379', 'SO-2016-02-29-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('380', 'SO-2016-03-01-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('381', 'SO-2016-03-02-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('382', 'SO-2016-03-03-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('383', 'SO-2016-03-04-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('384', 'SO-2016-03-05-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('385', 'SO-2016-03-06-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('386', 'SO-2016-03-07-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('387', 'SO-2016-03-08-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('388', 'SO-2016-03-09-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('389', 'SO-2016-03-10-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('390', 'SO-2016-03-11-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('391', 'SO-2016-03-12-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('392', 'SO-2016-03-13-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('393', 'SO-2016-03-14-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('394', 'SO-2016-03-15-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('395', 'SO-2016-03-16-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('396', 'SO-2016-03-17-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('397', 'SO-2016-03-18-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('398', 'SO-2016-03-19-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('399', 'SO-2016-03-20-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('400', 'SO-2016-03-21-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('401', 'SO-2016-03-22-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('402', 'SO-2016-03-23-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('403', 'SO-2016-03-24-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('404', 'SO-2016-03-25-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('405', 'SO-2016-03-26-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('406', 'SO-2016-03-31-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('407', 'SO-2016-04-01-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('408', 'SO-2016-04-02-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('409', 'SO-2016-04-03-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('410', 'SO-2016-04-04-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('411', 'SO-2016-04-05-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('412', 'SO-2016-04-06-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('413', 'SO-2016-04-07-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('414', 'SO-2016-04-08-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('415', 'SO-2016-04-09-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('416', 'SO-2016-04-10-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('417', 'SO-2016-04-11-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('418', 'SO-2016-04-12-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('419', 'SO-2016-04-13-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('420', 'SO-2016-04-14-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('421', 'SO-2016-04-15-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('422', 'SO-2016-04-16-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('423', 'SO-2016-04-17-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('424', 'SO-2016-04-18-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('425', 'SO-2016-04-19-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('426', 'SO-2016-04-20-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('427', 'SO-2016-04-21-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('428', 'SO-2016-04-22-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('429', 'SO-2016-04-23-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('430', 'SO-2016-04-24-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('431', 'SO-2016-04-25-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('432', 'SO-2016-04-26-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('433', 'SO-2016-04-30-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('434', 'SO-2016-05-01-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('435', 'SO-2016-05-02-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('436', 'SO-2016-05-03-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('437', 'SO-2016-05-04-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('438', 'SO-2016-05-05-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('439', 'SO-2016-05-06-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('440', 'SO-2016-05-07-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('441', 'SO-2016-05-08-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('442', 'SO-2016-05-09-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('443', 'SO-2016-05-10-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('444', 'SO-2016-05-11-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('445', 'SO-2016-05-12-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('446', 'SO-2016-05-13-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('447', 'SO-2016-05-14-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('448', 'SO-2016-05-15-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('449', 'SO-2016-05-16-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('450', 'SO-2016-05-17-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('451', 'SO-2016-05-18-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('452', 'SO-2016-05-19-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('453', 'SO-2016-05-20-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('454', 'SO-2016-05-21-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('455', 'SO-2016-05-22-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('456', 'SO-2016-05-23-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('457', 'SO-2016-05-24-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('458', 'SO-2016-05-25-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('459', 'SO-2016-05-26-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('460', 'SO-2016-05-31-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('461', 'SO-2016-06-01-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('462', 'SO-2016-06-02-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('463', 'SO-2016-06-03-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('464', 'SO-2016-06-04-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('465', 'SO-2016-06-05-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('466', 'SO-2016-06-06-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('467', 'SO-2016-06-07-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('468', 'SO-2016-06-08-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('469', 'SO-2016-06-09-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('470', 'SO-2016-06-10-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('471', 'SO-2016-06-11-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('472', 'SO-2016-06-12-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('473', 'SO-2016-06-13-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('474', 'SO-2016-06-14-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('475', 'SO-2016-06-15-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('476', 'SO-2016-06-16-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('477', 'SO-2016-06-17-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('478', 'SO-2016-06-18-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('479', 'SO-2016-06-19-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('480', 'SO-2016-06-20-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('481', 'SO-2016-06-21-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('482', 'SO-2016-06-22-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('483', 'SO-2016-06-23-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('484', 'SO-2016-06-24-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('485', 'SO-2016-06-25-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('486', 'SO-2016-06-26-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('487', 'SO-2016-06-30-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('488', 'SO-2016-07-01-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('489', 'SO-2016-07-02-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('490', 'SO-2016-07-03-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('491', 'SO-2016-07-04-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('492', 'SO-2016-07-05-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('493', 'SO-2016-07-06-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('494', 'SO-2016-07-07-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('495', 'SO-2016-07-08-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('496', 'SO-2016-07-09-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('497', 'SO-2016-07-10-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('498', 'SO-2016-07-11-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('499', 'SO-2016-07-12-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('500', 'SO-2016-07-13-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('501', 'SO-2016-07-14-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('502', 'SO-2016-07-15-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('503', 'SO-2016-07-16-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('504', 'SO-2016-07-17-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('505', 'SO-2016-07-18-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('506', 'SO-2016-07-19-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('507', 'SO-2016-07-20-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('508', 'SO-2016-07-21-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('509', 'SO-2016-07-22-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('510', 'SO-2016-07-23-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('511', 'SO-2016-07-24-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('512', 'SO-2016-07-25-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('513', 'SO-2016-07-26-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('514', 'SO-2016-07-31-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('515', 'SO-2016-08-01-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('516', 'SO-2016-08-02-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('517', 'SO-2016-08-03-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('518', 'SO-2016-08-04-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('519', 'SO-2016-08-05-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('520', 'SO-2016-08-06-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('521', 'SO-2016-08-07-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('522', 'SO-2016-08-08-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('523', 'SO-2016-08-09-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('524', 'SO-2016-08-10-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('525', 'SO-2016-08-11-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('526', 'SO-2016-08-12-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('527', 'SO-2016-08-13-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('528', 'SO-2016-08-14-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('529', 'SO-2016-08-15-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('530', 'SO-2016-08-16-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('531', 'SO-2016-08-17-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('532', 'SO-2016-08-18-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('533', 'SO-2016-08-19-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('534', 'SO-2016-08-20-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('535', 'SO-2016-08-21-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('536', 'SO-2016-08-22-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('537', 'SO-2016-08-23-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('538', 'SO-2016-08-24-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('539', 'SO-2016-08-25-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('540', 'SO-2016-08-26-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('541', 'SO-2016-08-31-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('542', 'SO-2016-09-01-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('543', 'SO-2016-09-02-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('544', 'SO-2016-09-03-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('545', 'SO-2016-09-04-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('546', 'SO-2016-09-05-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('547', 'SO-2016-09-06-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('548', 'SO-2016-09-07-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('549', 'SO-2016-09-08-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('550', 'SO-2016-09-09-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('551', 'SO-2016-09-10-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('552', 'SO-2016-09-11-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('553', 'SO-2016-09-12-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('554', 'SO-2016-09-13-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('555', 'SO-2016-09-14-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('556', 'SO-2016-09-15-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('557', 'SO-2016-09-16-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('558', 'SO-2016-09-17-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('559', 'SO-2016-09-18-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('560', 'SO-2016-09-19-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('561', 'SO-2016-09-20-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('562', 'SO-2016-09-21-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('563', 'SO-2016-09-22-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('564', 'SO-2016-09-23-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('565', 'SO-2016-09-24-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('566', 'SO-2016-09-25-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('567', 'SO-2016-09-26-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('568', 'SO-2016-09-30-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('569', 'SO-2016-10-01-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('570', 'SO-2016-10-02-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('571', 'SO-2016-10-03-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('572', 'SO-2016-10-04-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('573', 'SO-2016-10-05-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('574', 'SO-2016-10-06-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('575', 'SO-2016-10-07-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('576', 'SO-2016-10-08-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('577', 'SO-2016-10-09-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('578', 'SO-2016-10-10-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('579', 'SO-2016-10-11-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('580', 'SO-2016-10-12-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('581', 'SO-2016-10-13-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('582', 'SO-2016-10-14-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('583', 'SO-2016-10-15-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('584', 'SO-2016-10-16-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('585', 'SO-2016-10-17-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('586', 'SO-2016-10-18-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('587', 'SO-2016-10-19-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('588', 'SO-2016-10-20-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('589', 'SO-2016-10-21-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('590', 'SO-2016-10-22-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('591', 'SO-2016-10-23-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('592', 'SO-2016-10-24-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('593', 'SO-2016-10-25-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('594', 'SO-2016-10-26-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('595', 'SO-2016-10-31-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('596', 'SO-2016-11-01-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('597', 'SO-2016-11-02-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('598', 'SO-2016-11-03-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('599', 'SO-2016-11-04-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('600', 'SO-2016-11-05-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('601', 'SO-2016-11-06-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('602', 'SO-2016-11-07-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('603', 'SO-2016-11-08-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('604', 'SO-2016-11-09-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('605', 'SO-2016-11-10-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('606', 'SO-2016-11-11-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('607', 'SO-2016-11-12-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('608', 'SO-2016-11-13-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('609', 'SO-2016-11-14-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('610', 'SO-2016-11-15-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('611', 'SO-2016-11-16-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('612', 'SO-2016-11-17-0001', '20170411221135', '4', '230.00', '920.00');
INSERT INTO `sale_order_item` VALUES ('613', 'SO-2016-11-18-0001', '20170411221145', '4', '250.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('614', 'SO-2016-11-19-0001', '20170411221930', '4', '140.00', '560.00');
INSERT INTO `sale_order_item` VALUES ('615', 'SO-2016-11-20-0001', '20170411222447', '4', '200.00', '800.00');
INSERT INTO `sale_order_item` VALUES ('616', 'SO-2016-11-21-0001', '20170521165247', '4', '100.00', '400.00');
INSERT INTO `sale_order_item` VALUES ('617', 'SO-2016-11-22-0001', '20170411211559', '4', '99.00', '396.00');
INSERT INTO `sale_order_item` VALUES ('618', 'SO-2016-11-23-0001', '20170325015835', '4', '261.00', '1044.00');
INSERT INTO `sale_order_item` VALUES ('619', 'SO-2016-11-24-0001', '20170411220201', '4', '88.00', '352.00');
INSERT INTO `sale_order_item` VALUES ('620', 'SO-2016-11-25-0001', '20170411221135', '5', '230.00', '1150.00');
INSERT INTO `sale_order_item` VALUES ('621', 'SO-2016-11-26-0001', '20170411221145', '5', '250.00', '1250.00');
INSERT INTO `sale_order_item` VALUES ('622', 'SO-2016-11-30-0001', '20170411221930', '5', '140.00', '700.00');
INSERT INTO `sale_order_item` VALUES ('623', 'SO-2016-12-01-0001', '20170411222447', '5', '200.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('624', 'SO-2016-12-02-0001', '20170521165247', '5', '100.00', '500.00');
INSERT INTO `sale_order_item` VALUES ('625', 'SO-2016-12-03-0001', '20170411211559', '5', '99.00', '495.00');
INSERT INTO `sale_order_item` VALUES ('626', 'SO-2016-12-04-0001', '20170325015835', '5', '261.00', '1305.00');
INSERT INTO `sale_order_item` VALUES ('627', 'SO-2016-12-05-0001', '20170411220201', '5', '88.00', '440.00');
INSERT INTO `sale_order_item` VALUES ('628', 'SO-2016-12-06-0001', '20170411221135', '5', '230.00', '1150.00');
INSERT INTO `sale_order_item` VALUES ('629', 'SO-2016-12-07-0001', '20170411221145', '5', '250.00', '1250.00');
INSERT INTO `sale_order_item` VALUES ('630', 'SO-2016-12-08-0001', '20170411221930', '5', '140.00', '700.00');
INSERT INTO `sale_order_item` VALUES ('631', 'SO-2016-12-09-0001', '20170411222447', '5', '200.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('632', 'SO-2016-12-10-0001', '20170521165247', '5', '100.00', '500.00');
INSERT INTO `sale_order_item` VALUES ('633', 'SO-2016-12-11-0001', '20170411211559', '5', '99.00', '495.00');
INSERT INTO `sale_order_item` VALUES ('634', 'SO-2016-12-12-0001', '20170325015835', '5', '261.00', '1305.00');
INSERT INTO `sale_order_item` VALUES ('635', 'SO-2016-12-13-0001', '20170411220201', '5', '88.00', '440.00');
INSERT INTO `sale_order_item` VALUES ('636', 'SO-2016-12-14-0001', '20170411221135', '5', '230.00', '1150.00');
INSERT INTO `sale_order_item` VALUES ('637', 'SO-2016-12-15-0001', '20170411221145', '5', '250.00', '1250.00');
INSERT INTO `sale_order_item` VALUES ('638', 'SO-2016-12-16-0001', '20170411221930', '5', '140.00', '700.00');
INSERT INTO `sale_order_item` VALUES ('639', 'SO-2016-12-17-0001', '20170411222447', '5', '200.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('640', 'SO-2016-12-18-0001', '20170521165247', '5', '100.00', '500.00');
INSERT INTO `sale_order_item` VALUES ('641', 'SO-2016-12-19-0001', '20170411211559', '5', '99.00', '495.00');
INSERT INTO `sale_order_item` VALUES ('642', 'SO-2016-12-20-0001', '20170325015835', '5', '261.00', '1305.00');
INSERT INTO `sale_order_item` VALUES ('643', 'SO-2016-12-21-0001', '20170411220201', '5', '88.00', '440.00');
INSERT INTO `sale_order_item` VALUES ('644', 'SO-2016-12-22-0001', '20170411221135', '5', '230.00', '1150.00');
INSERT INTO `sale_order_item` VALUES ('645', 'SO-2016-12-23-0001', '20170411221145', '5', '250.00', '1250.00');
INSERT INTO `sale_order_item` VALUES ('646', 'SO-2016-12-24-0001', '20170411221930', '5', '140.00', '700.00');
INSERT INTO `sale_order_item` VALUES ('647', 'SO-2016-12-25-0001', '20170411222447', '5', '200.00', '1000.00');
INSERT INTO `sale_order_item` VALUES ('648', 'SO-2016-12-26-0001', '20170521165247', '5', '100.00', '500.00');

-- ----------------------------
-- Table structure for sale_reject_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_reject_order`;
CREATE TABLE `sale_reject_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标记',
  `rejectNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '退货单号',
  `rejectOrderNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '源订单号，参照sale_order表',
  `rejectDateTime` datetime NOT NULL COMMENT '退货时间',
  `total` decimal(10,2) NOT NULL COMMENT '退货总金额',
  `operatorId` bigint(20) NOT NULL COMMENT '操作员id，参照user表',
  `shopId` bigint(20) NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`),
  KEY `FK_sro_rejectOrderNo` (`rejectOrderNo`),
  KEY `FK_sro_operatorId` (`operatorId`),
  KEY `rejectNo` (`rejectNo`),
  KEY `FK_sro_shopId` (`shopId`),
  CONSTRAINT `FK_sro_operatorId` FOREIGN KEY (`operatorId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_sro_rejectOrderNo` FOREIGN KEY (`rejectOrderNo`) REFERENCES `sale_order` (`saleOrderNo`),
  CONSTRAINT `FK_sro_shopId` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_reject_order
-- ----------------------------

-- ----------------------------
-- Table structure for sale_reject_order_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_reject_order_item`;
CREATE TABLE `sale_reject_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `rejectNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '退货订单号，参照sale_reject_order表',
  `itemId` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品编号，条形码，参照goods表',
  `quantity` int(11) NOT NULL,
  `rejectPrice` decimal(10,2) NOT NULL COMMENT '退货单价',
  `subTotal` decimal(10,2) NOT NULL COMMENT '小计',
  `rejectReason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '退货理由',
  PRIMARY KEY (`id`),
  KEY `FK_sroi_rejectNo` (`rejectNo`),
  KEY `FK_sroi_itemId` (`itemId`),
  CONSTRAINT `FK_sroi_itemId` FOREIGN KEY (`itemId`) REFERENCES `goods` (`barcode`),
  CONSTRAINT `FK_sroi_rejectNo` FOREIGN KEY (`rejectNo`) REFERENCES `sale_reject_order` (`rejectNo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_reject_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '店铺名称，非空',
  `manager` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '负责人，非空',
  `telephone` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '负责人，非空',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '住址',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,"0"为下架，"1"为上架，"2"为删除废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '35组POS公司', '何晓锋', '020-1231231', '华南农业大学', null, '2017-04-22 22:54:15', '0');

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `type` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '尺码所属的类型（例如上衣的尺码，裤子，鞋子等）',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态,"0"为下架，"1"为上架，"2"为删除废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('1', 'XL', '衣服', null, '2017-03-23 23:24:54', '0');
INSERT INTO `size` VALUES ('2', 'L', '衣服', null, '2017-03-24 22:36:21', '0');
INSERT INTO `size` VALUES ('3', 'S', '衣服', null, '2017-03-23 23:24:57', '0');
INSERT INTO `size` VALUES ('4', 'M', '衣服', null, '2017-03-23 23:24:59', '0');
INSERT INTO `size` VALUES ('5', '30', '鞋子', '阿凡萨达', '2017-03-27 23:41:25', '0');
INSERT INTO `size` VALUES ('6', 'ml', '衣服', null, '2017-04-08 18:02:20', '0');
INSERT INTO `size` VALUES ('7', 'snad', '衣服', null, '2017-04-08 18:05:57', '0');
INSERT INTO `size` VALUES ('8', 'a', '衣服', null, '2017-04-08 18:28:24', '0');
INSERT INTO `size` VALUES ('9', 'ada', '鞋子', 'aasd', '2017-04-08 18:31:12', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` char(64) DEFAULT NULL COMMENT '密码',
  `state` varchar(32) DEFAULT NULL COMMENT '状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '060a897e18657b80b51ab9bc47276012', null, '2014-07-17 12:59:08');
INSERT INTO `user` VALUES ('2', 'cashier', '060a897e18657b80b51ab9bc47276012', null, '2014-07-17 12:59:08');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `roleId` bigint(20) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `FK_userRole_userId` (`userId`),
  KEY `FK_userRole_roleId` (`roleId`),
  CONSTRAINT `FK_userRole_roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_userRole_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户与角色关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('3', '2', '2');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID标识',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '仓库名称',
  `manager` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '仓库负责人',
  `telephone` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系电话',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '仓库地址',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述，可为空',
  `shopId` bigint(20) NOT NULL COMMENT '店铺id',
  PRIMARY KEY (`id`),
  KEY `FK_w_shopId` (`shopId`),
  CONSTRAINT `FK_w_shopId` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('1', '仓库1', '丁浩', '18819260900', '华南农业大学', '测试帐号', '1');
SET FOREIGN_KEY_CHECKS=1;
