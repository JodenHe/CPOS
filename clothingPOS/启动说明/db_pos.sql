/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : db_pos

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-05-19 18:58:26
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', '28', '2', '3', '4', '20170325015835', '测试1', '阿三大婶a', '261.00', '1111\najfdasf', '2017-04-11 22:00:40', '0');
INSERT INTO `goods` VALUES ('8', '28', '2', '3', '1', '20170411211559', '测试2', '士大夫是', '99.00', null, '2017-04-11 22:01:28', '0');
INSERT INTO `goods` VALUES ('9', '28', '1', '1', '5', '20170411220201', '2016夏季新款运动衫', 'null', '88.00', 'safds', '2017-04-11 22:02:01', '0');
INSERT INTO `goods` VALUES ('10', '28', '1', '1', '1', '20170411221135', '2017半袖新款夏装', 'null', '230.00', null, '2017-04-11 22:11:35', '0');
INSERT INTO `goods` VALUES ('11', '28', '1', '1', '1', '20170411221145', '2016爆款', 'null', '250.00', null, '2017-04-11 22:11:45', '0');
INSERT INTO `goods` VALUES ('12', '28', '2', '1', '1', '20170411221930', '2017夏季新款Polo衫', 'null', '140.00', null, '2017-04-11 22:19:30', '0');
INSERT INTO `goods` VALUES ('13', '28', '1', '1', '1', '20170411222447', '2017夏季短袖', 'null', '200.00', null, '2017-04-11 22:24:47', '0');

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
  `customerNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '会员编号，0000默认为散客',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `sex` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `telephone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'email',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '住址',
  `birthday` datetime NOT NULL COMMENT '生日',
  `password` char(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `grade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '等级',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_member_shopId` (`shopId`),
  KEY `FK_member_operatorId` (`operatorId`),
  KEY `customerNo` (`customerNo`),
  CONSTRAINT `FK_member_shopId` FOREIGN KEY (`shopId`) REFERENCES `shop` (`id`),
  CONSTRAINT `FK_members_operatorId` FOREIGN KEY (`operatorId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', '1', '1', '0000', '散客', '男', '', null, null, '2017-04-22 22:55:12', null, null, null, '2017-04-22 22:55:23');
INSERT INTO `member` VALUES ('2', '1', '1', '0001', '会员1', '男', '12345678910', null, null, '2017-04-22 22:55:12', '123456', null, null, '2017-04-22 22:55:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', 'P-2017-04-22-2002252248', 'SO-2017-04-22-923302993', '376.00', '0', null, '2017-04-22 23:42:20', '2', '1');
INSERT INTO `payment` VALUES ('2', 'P-2017-04-23--2048306974', 'SO-2017-04-23--2135662066', '1902.00', '0', null, '2017-04-23 10:20:12', '2', '1');
INSERT INTO `payment` VALUES ('3', 'P-2017-04-23--298595468', 'SO-2017-04-23-2145874', '1902.00', '0', null, '2017-04-23 10:20:53', '2', '1');
INSERT INTO `payment` VALUES ('4', 'P-2017-04-23-1355936162', 'SO-2017-04-23-1652662847', '480.00', '1', null, '2017-04-23 13:31:18', '2', '1');
INSERT INTO `payment` VALUES ('5', 'P-2017-04-23-33915870', 'SO-2017-04-23--1850286821', '288.00', '1', null, '2017-04-23 13:31:50', '2', '1');
INSERT INTO `payment` VALUES ('6', 'P-2017-04-23--242967757', 'SO-2017-04-23-1467970278', '480.00', '0', null, '2017-04-23 13:32:37', '2', '1');
INSERT INTO `payment` VALUES ('7', 'P-2017-04-23--1589732842', 'SO-2017-04-23--1987975701', '480.00', '0', null, '2017-04-23 13:32:56', '2', '1');
INSERT INTO `payment` VALUES ('8', 'P-2017-05-05-80474964', 'SO-2017-05-05-1066213818', '26750.00', '0', null, '2017-05-05 23:08:37', '2', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='权限表';

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='角色与权限关联表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('57', '1', '1');
INSERT INTO `role_permission` VALUES ('58', '1', '2');
INSERT INTO `role_permission` VALUES ('59', '1', '3');
INSERT INTO `role_permission` VALUES ('60', '1', '4');
INSERT INTO `role_permission` VALUES ('61', '1', '5');
INSERT INTO `role_permission` VALUES ('62', '1', '6');
INSERT INTO `role_permission` VALUES ('63', '1', '7');
INSERT INTO `role_permission` VALUES ('64', '1', '8');
INSERT INTO `role_permission` VALUES ('65', '1', '9');
INSERT INTO `role_permission` VALUES ('66', '1', '10');
INSERT INTO `role_permission` VALUES ('67', '1', '11');
INSERT INTO `role_permission` VALUES ('68', '1', '12');
INSERT INTO `role_permission` VALUES ('69', '2', '1');
INSERT INTO `role_permission` VALUES ('70', '2', '2');
INSERT INTO `role_permission` VALUES ('71', '2', '3');
INSERT INTO `role_permission` VALUES ('72', '2', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES ('1', 'SO-2017-04-22-923302993', '0001', '2017-04-22 23:42:20', '376.00', '2', '1');
INSERT INTO `sale_order` VALUES ('2', 'SO-2017-04-23--2135662066', '0001', '2017-04-23 10:20:12', '1902.00', '2', '1');
INSERT INTO `sale_order` VALUES ('3', 'SO-2017-04-23-2145874', '0001', '2017-04-23 10:20:53', '1902.00', '2', '1');
INSERT INTO `sale_order` VALUES ('4', 'SO-2017-04-23-1652662847', '0001', '2017-04-23 13:31:18', '480.00', '2', '1');
INSERT INTO `sale_order` VALUES ('5', 'SO-2017-04-23--1850286821', '0001', '2017-04-23 13:31:50', '288.00', '2', '1');
INSERT INTO `sale_order` VALUES ('6', 'SO-2017-04-23-1467970278', '0001', '2017-04-23 13:32:37', '480.00', '2', '1');
INSERT INTO `sale_order` VALUES ('7', 'SO-2017-04-23--1987975701', '0001', '2017-04-23 13:32:56', '480.00', '2', '1');
INSERT INTO `sale_order` VALUES ('8', 'SO-2017-05-05-1066213818', '0001', '2017-05-05 23:08:37', '26750.00', '2', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_order_item
-- ----------------------------
INSERT INTO `sale_order_item` VALUES ('1', 'SO-2017-04-22-923302993', '20170411222447', '1', '200.00', '200.00');
INSERT INTO `sale_order_item` VALUES ('2', 'SO-2017-04-22-923302993', '20170411220201', '2', '88.00', '176.00');
INSERT INTO `sale_order_item` VALUES ('3', 'SO-2017-04-23--2135662066', '20170411221135', '1', '230.00', '230.00');
INSERT INTO `sale_order_item` VALUES ('4', 'SO-2017-04-23--2135662066', '20170411220201', '19', '88.00', '1672.00');
INSERT INTO `sale_order_item` VALUES ('5', 'SO-2017-04-23-2145874', '20170411221135', '1', '230.00', '230.00');
INSERT INTO `sale_order_item` VALUES ('6', 'SO-2017-04-23-2145874', '20170411220201', '19', '88.00', '1672.00');
INSERT INTO `sale_order_item` VALUES ('7', 'SO-2017-04-23-1652662847', '20170411221145', '1', '250.00', '250.00');
INSERT INTO `sale_order_item` VALUES ('8', 'SO-2017-04-23-1652662847', '20170411221135', '1', '230.00', '230.00');
INSERT INTO `sale_order_item` VALUES ('9', 'SO-2017-04-23--1850286821', '20170411222447', '1', '200.00', '200.00');
INSERT INTO `sale_order_item` VALUES ('10', 'SO-2017-04-23--1850286821', '20170411220201', '1', '88.00', '88.00');
INSERT INTO `sale_order_item` VALUES ('11', 'SO-2017-04-23-1467970278', '20170411221135', '1', '230.00', '230.00');
INSERT INTO `sale_order_item` VALUES ('12', 'SO-2017-04-23-1467970278', '20170411221145', '1', '250.00', '250.00');
INSERT INTO `sale_order_item` VALUES ('13', 'SO-2017-04-23--1987975701', '20170411221145', '1', '250.00', '250.00');
INSERT INTO `sale_order_item` VALUES ('14', 'SO-2017-04-23--1987975701', '20170411221135', '1', '230.00', '230.00');
INSERT INTO `sale_order_item` VALUES ('15', 'SO-2017-05-05-1066213818', '20170411221145', '15', '250.00', '3750.00');
INSERT INTO `sale_order_item` VALUES ('16', 'SO-2017-05-05-1066213818', '20170411221135', '100', '230.00', '23000.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_reject_order
-- ----------------------------
INSERT INTO `sale_reject_order` VALUES ('1', 'R-2017-05-06--1964509698', 'SO-2017-04-23-1652662847', '2017-04-06 00:12:57', '250.00', '2', '1');
INSERT INTO `sale_reject_order` VALUES ('2', 'R-2017-05-06-628422228', 'SO-2017-04-23-1652662847', '2017-04-06 02:19:33', '230.00', '2', '1');
INSERT INTO `sale_reject_order` VALUES ('3', 'R-2017-05-06-1311610260', 'SO-2017-04-23-2145874', '2017-04-06 02:26:15', '88.00', '2', '1');
INSERT INTO `sale_reject_order` VALUES ('4', 'R-2017-05-06--596997945', 'SO-2017-04-23-2145874', '2017-04-06 02:28:42', '88.00', '2', '1');
INSERT INTO `sale_reject_order` VALUES ('5', 'R-2017-05-06--1108789285', 'SO-2017-04-23-2145874', '2017-05-06 03:00:15', '1056.00', '2', '1');
INSERT INTO `sale_reject_order` VALUES ('6', 'R-2017-05-06-1117693986', 'SO-2017-04-23-2145874', '2017-05-06 03:20:08', '230.00', '2', '1');
INSERT INTO `sale_reject_order` VALUES ('7', 'R-2017-05-06--1213421387', 'SO-2017-04-23-2145874', '2017-05-06 03:20:31', '230.00', '2', '1');
INSERT INTO `sale_reject_order` VALUES ('8', 'R-2017-05-06--2021526457', 'SO-2017-04-23-2145874', '2017-05-06 03:20:45', '230.00', '2', '1');
INSERT INTO `sale_reject_order` VALUES ('9', 'R-2017-05-06--925484199', 'SO-2017-04-23-2145874', '2017-05-06 11:11:44', '440.00', '2', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sale_reject_order_item
-- ----------------------------
INSERT INTO `sale_reject_order_item` VALUES ('1', 'R-2017-05-06--1964509698', '20170411221145', '1', '250.00', '250.00', '');
INSERT INTO `sale_reject_order_item` VALUES ('2', 'R-2017-05-06-628422228', '20170411221135', '1', '230.00', '230.00', '');
INSERT INTO `sale_reject_order_item` VALUES ('3', 'R-2017-05-06-1311610260', '20170411220201', '1', '88.00', '88.00', '123');
INSERT INTO `sale_reject_order_item` VALUES ('4', 'R-2017-05-06--596997945', '20170411220201', '1', '88.00', '88.00', '123');
INSERT INTO `sale_reject_order_item` VALUES ('5', 'R-2017-05-06--1108789285', '20170411220201', '12', '88.00', '1056.00', '');
INSERT INTO `sale_reject_order_item` VALUES ('6', 'R-2017-05-06-1117693986', '20170411221135', '1', '230.00', '230.00', '');
INSERT INTO `sale_reject_order_item` VALUES ('7', 'R-2017-05-06--1213421387', '20170411221135', '1', '230.00', '230.00', '');
INSERT INTO `sale_reject_order_item` VALUES ('8', 'R-2017-05-06--2021526457', '20170411221135', '1', '230.00', '230.00', '');
INSERT INTO `sale_reject_order_item` VALUES ('9', 'R-2017-05-06--925484199', '20170411220201', '5', '88.00', '440.00', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
