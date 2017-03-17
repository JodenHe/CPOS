/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_pos

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-17 20:47:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `pId` bigint(20) DEFAULT NULL COMMENT '父品牌，参照本表的id',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_parentId` (`pId`),
  CONSTRAINT `FK_pId` FOREIGN KEY (`pId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '类别名称，非空',
  `pId` bigint(20) DEFAULT NULL COMMENT '父类别，参照本表的id',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_parentId` (`pId`),
  CONSTRAINT `FK_parentId` FOREIGN KEY (`pId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `styleId` bigint(20) NOT NULL COMMENT '款式id，参照style表',
  `colorId` bigint(20) NOT NULL COMMENT '颜色id，参照color表',
  `barcode` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '条形码，非空',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `originalPrice` decimal(10,2) DEFAULT '0.00' COMMENT '进货价',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '售价',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_styleId` (`styleId`),
  KEY `FK_colorId` (`colorId`),
  CONSTRAINT `FK_colorId` FOREIGN KEY (`colorId`) REFERENCES `color` (`id`),
  CONSTRAINT `FK_styleId` FOREIGN KEY (`styleId`) REFERENCES `style` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `goodsId` bigint(20) NOT NULL COMMENT '商品id，参照goods表',
  `amount` int(20) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_goodsId` (`goodsId`),
  CONSTRAINT `FK_goodsId` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `shopId` bigint(20) NOT NULL COMMENT '店铺id，参照shop表',
  `operatorId` bigint(20) NOT NULL COMMENT '操作员id，参照user表',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `sex` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `telephone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'email',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '住址',
  `birthday` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生日',
  `password` char(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `grade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '等级',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_member_shopId` (`shopId`),
  KEY `FK_member_operatorId` (`operatorId`),
  CONSTRAINT `FK_member_shopId` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`),
  CONSTRAINT `FK_members_operatorId` FOREIGN KEY (`operatorId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permissionName` varchar(32) DEFAULT NULL COMMENT '权限名',
  `permissionSign` varchar(128) DEFAULT NULL COMMENT '权限标识,程序中判断使用,如"user:create"',
  `description` varchar(256) DEFAULT NULL COMMENT '权限描述,UI界面显示使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `roleName` varchar(32) DEFAULT NULL COMMENT '角色名',
  `roleSign` varchar(128) DEFAULT NULL COMMENT '角色标识,程序中判断使用,如"admin"',
  `description` varchar(256) DEFAULT NULL COMMENT '角色描述,UI界面显示使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `roleId` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `permissionId` bigint(20) unsigned DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色与权限关联表';

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `shopId` bigint(20) NOT NULL COMMENT '店铺id，参照shop表',
  `goodsId` bigint(20) NOT NULL COMMENT '商品id，参照goods表',
  `operatorId` bigint(20) NOT NULL COMMENT '操作员id，参照user表',
  `quantity` int(20) NOT NULL DEFAULT '0' COMMENT '销售数量',
  `salesAmount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售金额',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_sales_shopId` (`shopId`),
  KEY `FK_sales_goodsId` (`goodsId`),
  KEY `FK_sales_operatorId` (`operatorId`),
  CONSTRAINT `FK_sales_goodsId` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_sales_operatorId` FOREIGN KEY (`operatorId`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_sales_shopId` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for style
-- ----------------------------
DROP TABLE IF EXISTS `style`;
CREATE TABLE `style` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `sizeId` bigint(20) NOT NULL COMMENT '尺码id，参照size表',
  `brandId` bigint(20) NOT NULL COMMENT '品牌id，参照brand表',
  `categoryId` bigint(20) NOT NULL COMMENT '类别id，参照category表',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_sizeId` (`sizeId`),
  KEY `FK_brandId` (`brandId`),
  KEY `FK_categoryId` (`categoryId`),
  CONSTRAINT `FK_brandId` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_categoryId` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_sizeId` FOREIGN KEY (`sizeId`) REFERENCES `size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` char(64) DEFAULT NULL COMMENT '密码',
  `state` varchar(32) DEFAULT NULL COMMENT '状态',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `userId` bigint(20) unsigned DEFAULT NULL COMMENT '用户id',
  `roleId` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色关联表';
SET FOREIGN_KEY_CHECKS=1;
