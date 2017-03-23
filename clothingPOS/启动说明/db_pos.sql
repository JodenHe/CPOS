/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_pos

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-23 23:39:25
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
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', '李宁', null, '2017-03-19 12:59:07');
INSERT INTO `brand` VALUES ('2', 'ANTA', null, '2017-03-19 13:00:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('14', '服装', null, '测试', '2017-03-18 21:58:00');
INSERT INTO `category` VALUES ('15', '上衣2', '14', '测试', '2017-03-23 15:53:59');
INSERT INTO `category` VALUES ('17', '皮衣', '15', '测试', '2017-03-18 22:01:48');
INSERT INTO `category` VALUES ('18', '皮衣的子类1', '17', '测试', '2017-03-23 15:49:37');
INSERT INTO `category` VALUES ('28', 'T恤', '15', '的规范地方', '2017-03-23 15:54:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of color
-- ----------------------------
INSERT INTO `color` VALUES ('1', '黄色', '', '2017-03-18 10:28:35');

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
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_goods_color` (`colorId`),
  KEY `FK_goods_categoryId` (`categoryId`),
  KEY `FK_goods_brandId` (`brandId`),
  KEY `FK_goods_sizeId` (`sizeId`),
  CONSTRAINT `FK_goods_brandId` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`),
  CONSTRAINT `FK_goods_categoryId` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_goods_color` FOREIGN KEY (`colorId`) REFERENCES `color` (`id`),
  CONSTRAINT `FK_goods_sizeId` FOREIGN KEY (`sizeId`) REFERENCES `size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `goodsId` bigint(20) NOT NULL COMMENT '商品id，参照goods表',
  `warehouseId` bigint(20) NOT NULL COMMENT '仓库id，参照warehouse表',
  `amount` int(20) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_inventory_goodsId` (`goodsId`),
  KEY `FK_inventory_warehouseId` (`warehouseId`),
  CONSTRAINT `FK_inventory_goodsId` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`id`),
  CONSTRAINT `FK_inventory_warehouseId` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of inventory
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of member
-- ----------------------------

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
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '用户新增', 'user:create', null);

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
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', 'admin', '管理员');

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
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '2', '1');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sales
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
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shop
-- ----------------------------

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称，非空',
  `type` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '尺码所属的类型（例如上衣的尺码，裤子，鞋子等）',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('1', 'XL', '衣服', null, '2017-03-23 23:24:54');
INSERT INTO `size` VALUES ('2', 'L', '衣服', null, '2017-03-23 23:24:56');
INSERT INTO `size` VALUES ('3', 'S', '衣服', null, '2017-03-23 23:24:57');
INSERT INTO `size` VALUES ('4', 'M', '衣服', null, '2017-03-23 23:24:59');

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
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '2014-07-17 12:59:08');

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

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
