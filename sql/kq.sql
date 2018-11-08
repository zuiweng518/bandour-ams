/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : kq

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-11-04 20:12:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `api`
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api
-- ----------------------------
INSERT INTO `api` VALUES ('1', '/rest/token/getToken');
INSERT INTO `api` VALUES ('2', '/rest/account/verifyPassword');
INSERT INTO `api` VALUES ('3', '/rest/account/getUserById');
INSERT INTO `api` VALUES ('4', '/rest/account/getUserByAccount');
INSERT INTO `api` VALUES ('5', '/rest/account/getUserByEmpNo');
INSERT INTO `api` VALUES ('6', '/rest/account/getPropertiesByAccount');
INSERT INTO `api` VALUES ('7', '/rest/account/getUsers');
INSERT INTO `api` VALUES ('8', '/rest/account/getUsersByJobId');
INSERT INTO `api` VALUES ('9', '/rest/account/getUsersByJobCode');
INSERT INTO `api` VALUES ('10', '/rest/account/getUsersByDeptId');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) DEFAULT NULL,
  `api` varchar(50) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `param`
-- ----------------------------
DROP TABLE IF EXISTS `param`;
CREATE TABLE `param` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of param
-- ----------------------------
INSERT INTO `param` VALUES ('1', null);
INSERT INTO `param` VALUES ('2', 'account');
INSERT INTO `param` VALUES ('2', 'password');
INSERT INTO `param` VALUES ('3', 'id');
INSERT INTO `param` VALUES ('4', 'account');
INSERT INTO `param` VALUES ('5', 'empNo');
INSERT INTO `param` VALUES ('6', 'account');
INSERT INTO `param` VALUES ('8', 'id');
INSERT INTO `param` VALUES ('8', 'recursion');
INSERT INTO `param` VALUES ('9', 'code');
INSERT INTO `param` VALUES ('9', 'recursion');
INSERT INTO `param` VALUES ('10', 'id');
INSERT INTO `param` VALUES ('10', 'recursion');
