/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : kq

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-12-03 10:56:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `api`
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `annotation` varchar(50) DEFAULT NULL COMMENT '接口注释',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of api
-- ----------------------------
INSERT INTO `api` VALUES ('1', '/rest/token/getToken', '获取调用接口认证token');
INSERT INTO `api` VALUES ('2', '/rest/account/verifyPassword', '验证账号密码');
INSERT INTO `api` VALUES ('3', '/rest/account/getUserById', '根据帐号获取用户信息');
INSERT INTO `api` VALUES ('4', '/rest/account/getUserByAccount', '根据帐号获取用户信息');
INSERT INTO `api` VALUES ('5', '/rest/account/getUserByEmpNo', '根据工号获取用户信息');
INSERT INTO `api` VALUES ('6', '/rest/account/getPropertiesByAccount', '根据帐号获取用户属性信息');
INSERT INTO `api` VALUES ('7', '/rest/account/getUsers', '获取所有用户信息');
INSERT INTO `api` VALUES ('8', '/rest/account/getUsersByJobId', '获取指定职位下的所有用户(jobid)');
INSERT INTO `api` VALUES ('9', '/rest/account/getUsersByJobCode', '获取指定职位下的所有用户(jobcode)');
INSERT INTO `api` VALUES ('13', '/rest/account/getUsersByDeptId', '获取指定部门下的所有用户(部门ID)');
INSERT INTO `api` VALUES ('14', '/rest/account/getUsersByDeptCode', '获取指定部门下的所有用户(部门code）');
INSERT INTO `api` VALUES ('15', '/rest/account/getUsersByAreaId', '获取指定区域下的所有用户(区域ID)');
INSERT INTO `api` VALUES ('16', '/rest/account/getUsersByAreaCode', '获取指定区域下的所有有用户(区域code)');
INSERT INTO `api` VALUES ('17', '/rest/account/getUsersByDutyId', '获取所有党职务下的所有用户(id)');
INSERT INTO `api` VALUES ('18', '/rest/account/getUsersByDutyCode', '获取指定党职务下的所有用户(code)');
INSERT INTO `api` VALUES ('19', '/rest/account/getUsersByOrgId', '获取所有党组织下的所有用户(id)');
INSERT INTO `api` VALUES ('20', '/rest/account/getUsersByOrgcode', '获取指定党组织下的所有用户(code)');
INSERT INTO `api` VALUES ('21', '/rest/account/getUsersByValidRoleCode', '获取指定角色有效关联的所有用户');
INSERT INTO `api` VALUES ('22', '/rest/account/getUsersByPermitCode', '获取指定授权码有效关联的所以用户');
INSERT INTO `api` VALUES ('23', '/rest/account/getJobs', '获取所有职位信息');
INSERT INTO `api` VALUES ('24', '/rest/account/getJobsByAccount', '根据账号获取用户所在职位信息');
INSERT INTO `api` VALUES ('25', '/rest/account/getDepts', '获取所有部门信息');
INSERT INTO `api` VALUES ('26', '/rest/account/getDeptsByAccount', '根据账号获取用户所在部门信息');
INSERT INTO `api` VALUES ('27', '/rest/account/getAreas', '获取所有区域信息');
INSERT INTO `api` VALUES ('28', '/rest/account/getAreasByAccount', '根据账号获取用户所在区域信息');
INSERT INTO `api` VALUES ('29', '/rest/account/getDuties', '获取所有党职务信息');
INSERT INTO `api` VALUES ('30', '/rest/account/getDutiesByAccount', '根据账号获取用户所在党职务信息');
INSERT INTO `api` VALUES ('31', '/rest/account/getOrgs', '获取所有党组织信息');
INSERT INTO `api` VALUES ('32', '/rest/account/getOrgsByAccount', '根据账号获取用户所在党组织信息');
INSERT INTO `api` VALUES ('33', '/rest/account/getAllUserJobs', '根据所有用户职位关联关系');
INSERT INTO `api` VALUES ('34', '/rest/authorization/getAppAdmins', '获取APP管理员信息');
INSERT INTO `api` VALUES ('35', '/rest/authorization/getAppPassports', '获取APP通行证信息');
INSERT INTO `api` VALUES ('36', '/rest/authorization/getAppUsers', '获取APP从账号信息');
INSERT INTO `api` VALUES ('37', '/rest/authorization/getAppUserByAccount', '根据指定的主账号获取APP从账号信息');
INSERT INTO `api` VALUES ('38', '/rest/authorization/getAppUserByAppAccount', '根据指定的从账号获取APP从账号信息');
INSERT INTO `api` VALUES ('39', '/rest/authorization/getRoles', '获取APP的角色信息');
INSERT INTO `api` VALUES ('40', '/rest/authorization/getValidRolesByAccount', '获取指定帐号关联的有效角色信息');
INSERT INTO `api` VALUES ('42', '/rest/authorization/getValidRoleCodesByAccount', '获取指定帐号关联的有效角色编码');
INSERT INTO `api` VALUES ('43', '/rest/authorization/getPermits', '获取APP的授权码信息');
INSERT INTO `api` VALUES ('44', '/rest/authorization/getValidPermitsByAccount', '获取指定帐号关联的有效授权码信息');
INSERT INTO `api` VALUES ('45', '/rest/authorization/getValidPermitCodesByAccount', '获取指定帐号关联的有效授权码编码');
INSERT INTO `api` VALUES ('46', '/rest/authorization/getResTypes', '获取APP的资源类型信息');
INSERT INTO `api` VALUES ('47', '/rest/authorization/getReses', '获取APP的资源信息');
INSERT INTO `api` VALUES ('48', '/rest/authorization/getResesByResType', '获取APP的置顶资源类型关联的资源信息');
INSERT INTO `api` VALUES ('49', '/rest/authorization/getValidResesByAccount', '获取指定帐号关联的有效资源信息');
INSERT INTO `api` VALUES ('50', '/rest/authorization/getValidResesByAccountAndResType', '获取指定帐号和资源类型关联的有效资源信息');
INSERT INTO `api` VALUES ('51', '/rest/authorization/getValidResCodesByAccount', '获取指定帐号关联的有效资源编码');
INSERT INTO `api` VALUES ('52', '/rest/authorization/getValidResCodesByAccountAndResType', '获取指定帐号和资源类型关联的有效资源编码');
INSERT INTO `api` VALUES ('53', '/rest/account/getAllRolePermits', '获取APP下角色和授权码的关联关系');
INSERT INTO `api` VALUES ('54', '/rest/authentication/hasPermit', '判断用户是否关联指定授权码');
INSERT INTO `api` VALUES ('55', '/rest/authentication/hasAllPermits', '判断用户是否关联所有授权码');
INSERT INTO `api` VALUES ('56', '/rest/authentication/hasAnyPermits', '判断用户是否关联任一授权码');
INSERT INTO `api` VALUES ('57', '/rest/authentication/hasRes', '判断用户是否关联指定资源');
INSERT INTO `api` VALUES ('58', '/rest/authentication/hasResByResType', '判断用户是否关联指定资源类型的资源');
INSERT INTO `api` VALUES ('59', '/rest/authentication/hasAllReses', '判断用户是否关联所有资源');
INSERT INTO `api` VALUES ('60', '/rest/authentication/hasAllResByResType', '判断用户是否关联指定资源类型的所有资源');
INSERT INTO `api` VALUES ('61', '/rest/authentication/hasAnyReses', '判断用户是否关联任一资源');
INSERT INTO `api` VALUES ('62', '/rest/authentication/hasAnyResByResType', '判断用户是否关联指定资源类型的任一资源');
INSERT INTO `api` VALUES ('63', '/rest/authentication/hasRole', '判断用户是否关联指定角色');
INSERT INTO `api` VALUES ('64', '/rest/authentication/hasAllRoles', '判断用户是否关联所有角色');
INSERT INTO `api` VALUES ('65', '/rest/authentication/hasAnyRoles', '判断用户是否关联任一角色');
INSERT INTO `api` VALUES ('66', '/rest/audit/logAudit', '记录审计日志');

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
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` smallint(6) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'baidu', '百度', 'http://www.baidu.com');
INSERT INTO `menu` VALUES ('2', 'qq', '腾讯', 'http://www.qq.com');
INSERT INTO `menu` VALUES ('3', 'taobao', '淘宝', 'http://www.taobao.com');
INSERT INTO `menu` VALUES ('4', 'bandour', '邦道', '/api/page');
INSERT INTO `menu` VALUES ('5', '126', '文档', '/file/index');

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
INSERT INTO `param` VALUES ('11', 'account');
INSERT INTO `param` VALUES ('12', 'account');
INSERT INTO `param` VALUES ('13', 'id');
INSERT INTO `param` VALUES ('13', 'recursion');
INSERT INTO `param` VALUES ('14', 'code');
INSERT INTO `param` VALUES ('14', 'recursion');
INSERT INTO `param` VALUES ('15', 'id');
INSERT INTO `param` VALUES ('15', 'recursion');
INSERT INTO `param` VALUES ('16', 'code');
INSERT INTO `param` VALUES ('16', 'recursion');
INSERT INTO `param` VALUES ('17', 'id');
INSERT INTO `param` VALUES ('17', 'recursion');
INSERT INTO `param` VALUES ('18', 'code');
INSERT INTO `param` VALUES ('18', 'recursion');
INSERT INTO `param` VALUES ('19', 'id');
INSERT INTO `param` VALUES ('19', 'recursion');
INSERT INTO `param` VALUES ('20', 'code');
INSERT INTO `param` VALUES ('20', 'recursion');
INSERT INTO `param` VALUES ('21', 'code');
INSERT INTO `param` VALUES ('22', 'code');
INSERT INTO `param` VALUES ('24', 'account');
INSERT INTO `param` VALUES ('26', 'account');
INSERT INTO `param` VALUES ('28', 'account');
INSERT INTO `param` VALUES ('30', 'account');
INSERT INTO `param` VALUES ('32', 'account');
INSERT INTO `param` VALUES ('37', 'account');
INSERT INTO `param` VALUES ('38', 'appAccount');
INSERT INTO `param` VALUES ('40', 'account');
INSERT INTO `param` VALUES ('42', 'account');
INSERT INTO `param` VALUES ('44', 'account');
INSERT INTO `param` VALUES ('45', 'account');
INSERT INTO `param` VALUES ('48', 'resTypeCode');
INSERT INTO `param` VALUES ('49', 'account');
INSERT INTO `param` VALUES ('50', 'account');
INSERT INTO `param` VALUES ('50', 'resTypeCode');
INSERT INTO `param` VALUES ('51', 'account');
INSERT INTO `param` VALUES ('52', 'account');
INSERT INTO `param` VALUES ('52', 'resTypeCode');
INSERT INTO `param` VALUES ('54', 'account');
INSERT INTO `param` VALUES ('54', 'code');
INSERT INTO `param` VALUES ('55', 'account');
INSERT INTO `param` VALUES ('55', 'codes');
INSERT INTO `param` VALUES ('56', 'account');
INSERT INTO `param` VALUES ('56', 'codes');
INSERT INTO `param` VALUES ('57', 'account');
INSERT INTO `param` VALUES ('57', 'code');
INSERT INTO `param` VALUES ('58', 'account');
INSERT INTO `param` VALUES ('58', 'resTypeCode');
INSERT INTO `param` VALUES ('58', 'code');
INSERT INTO `param` VALUES ('59', 'account');
INSERT INTO `param` VALUES ('59', 'codes');
INSERT INTO `param` VALUES ('60', 'account');
INSERT INTO `param` VALUES ('60', 'resTypeCode');
INSERT INTO `param` VALUES ('60', 'codes');
INSERT INTO `param` VALUES ('61', 'account');
INSERT INTO `param` VALUES ('61', 'codes');
INSERT INTO `param` VALUES ('62', 'account');
INSERT INTO `param` VALUES ('62', 'resTypeCode');
INSERT INTO `param` VALUES ('62', 'codes');
INSERT INTO `param` VALUES ('63', 'account');
INSERT INTO `param` VALUES ('63', 'code');
INSERT INTO `param` VALUES ('64', 'account');
INSERT INTO `param` VALUES ('64', 'codes');
INSERT INTO `param` VALUES ('65', 'account');
INSERT INTO `param` VALUES ('65', 'codes');
INSERT INTO `param` VALUES ('66', 'obj');
