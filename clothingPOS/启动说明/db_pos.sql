/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : db_pos

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-16 22:19:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id标识',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '类别名称，非空',
  `parentId` bigint(20) DEFAULT NULL COMMENT '父类别，参照本表的id',
  `script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `createTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_parentId` (`parentId`),
  CONSTRAINT `FK_parentId` FOREIGN KEY (`parentId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '服装', null, '测试数据', '2017-03-15 11:19:37');
INSERT INTO `category` VALUES ('2', '上衣', '1', '测试数据', '2017-03-15 11:23:35');
INSERT INTO `category` VALUES ('3', '鞋子', null, '测试数据', '2017-03-15 11:23:37');
INSERT INTO `category` VALUES ('4', '下装', '1', '测试数据', '2017-03-15 11:23:41');
INSERT INTO `category` VALUES ('5', '皮鞋', '3', null, '2017-03-15 11:25:13');
INSERT INTO `category` VALUES ('6', 'T恤', '2', '测试数据', '2017-03-15 12:19:32');
INSERT INTO `category` VALUES ('7', '饰品', null, '测试', '2017-03-16 13:31:33');
SET FOREIGN_KEY_CHECKS=1;
