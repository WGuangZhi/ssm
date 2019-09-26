/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50644
Source Host           : localhost:3306
Source Database       : db_rolemanage

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2019-09-26 16:16:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `parent_id` int(4) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `url` varchar(150) NOT NULL DEFAULT '#',
  `icon` varchar(50) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `sort` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '0', '系统管理', '#', 'fa-cog', '1', '1');
INSERT INTO `t_permission` VALUES ('2', '1', '用户管理', 'user/index', 'fa-users', '1', '1');
INSERT INTO `t_permission` VALUES ('3', '1', '角色管理', 'role/index', 'fa-pencil-square-o', '1', '2');
INSERT INTO `t_permission` VALUES ('4', '1', '权限管理', 'permission/list', 'fa-cogs', '1', '3');
INSERT INTO `t_permission` VALUES ('5', '0', '商品管理', '#', 'fa-sitemap', '1', '2');
INSERT INTO `t_permission` VALUES ('6', '5', '商品列表', 'item/index', 'fa-sitemap', '1', '4');
INSERT INTO `t_permission` VALUES ('8', '1', '个人信息管理', 'user/userInfo', 'fa-pencil-square-o', '1', '2');

-- ----------------------------
-- Table structure for `t_permission_v`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission_v`;
CREATE TABLE `t_permission_v` (
  `uid` int(2) NOT NULL,
  `pid` int(2) NOT NULL,
  `veid` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission_v
-- ----------------------------

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'superAdmin', '超级管理员');
INSERT INTO `t_role` VALUES ('2', 'admin', '管理员');
INSERT INTO `t_role` VALUES ('3', 'user', '普通用户');
INSERT INTO `t_role` VALUES ('4', 'shopkeeper', '商家');
INSERT INTO `t_role` VALUES ('5', 'tourist', '游客');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `rid` int(4) NOT NULL,
  `pid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('2', '1');
INSERT INTO `t_role_permission` VALUES ('2', '2');
INSERT INTO `t_role_permission` VALUES ('2', '5');
INSERT INTO `t_role_permission` VALUES ('2', '6');
INSERT INTO `t_role_permission` VALUES ('5', '6');
INSERT INTO `t_role_permission` VALUES ('5', '5');
INSERT INTO `t_role_permission` VALUES ('3', '5');
INSERT INTO `t_role_permission` VALUES ('3', '6');
INSERT INTO `t_role_permission` VALUES ('3', '7');
INSERT INTO `t_role_permission` VALUES ('4', '5');
INSERT INTO `t_role_permission` VALUES ('4', '6');
INSERT INTO `t_role_permission` VALUES ('1', '3');
INSERT INTO `t_role_permission` VALUES ('1', '4');
INSERT INTO `t_role_permission` VALUES ('1', '5');
INSERT INTO `t_role_permission` VALUES ('1', '6');
INSERT INTO `t_role_permission` VALUES ('1', '1');
INSERT INTO `t_role_permission` VALUES ('1', '2');
INSERT INTO `t_role_permission` VALUES ('1', '8');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'zs', '123456', 'zs@qq.com', '15285988836', '1');
INSERT INTO `t_user` VALUES ('10', '张飞', 'wgz123456', '12313987@qq.com', '13195142601', '1');
INSERT INTO `t_user` VALUES ('11', '关羽', '1231265', '12312323@qq.com', '13195142601', '1');
INSERT INTO `t_user` VALUES ('12', '刘备', '123131', '123123@qq.com', '13195142601', '1');
INSERT INTO `t_user` VALUES ('13', '李四', '123456', '123313@qq.com', '13411111111', '1');
INSERT INTO `t_user` VALUES ('14', '王宇', '123123123', '13123123@qq.com', '13411111111', '1');
INSERT INTO `t_user` VALUES ('15', '王五', '123123213', '13123@qq.com', '18371298371', '1');
INSERT INTO `t_user` VALUES ('16', '麻子', '123618236', '1231231@qq.com', '13212312311', '1');
INSERT INTO `t_user` VALUES ('17', '杨洋', '1312312', '121238@qq.com', '13195142601', '1');
INSERT INTO `t_user` VALUES ('18', '王天伦', '1231231', '213123@qq.com', '13195142601', '1');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `uid` int(11) NOT NULL,
  `imageurl` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('1', 'upload/images/20190823171602166.jpg');
INSERT INTO `t_userinfo` VALUES ('10', 'upload/images/20190823171950130.jpg');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `uid` int(4) NOT NULL,
  `rid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('10', '3');
INSERT INTO `t_user_role` VALUES ('11', '2');
INSERT INTO `t_user_role` VALUES ('11', '3');
INSERT INTO `t_user_role` VALUES ('12', '3');
INSERT INTO `t_user_role` VALUES ('15', '3');
INSERT INTO `t_user_role` VALUES ('15', '4');
INSERT INTO `t_user_role` VALUES ('16', '3');
INSERT INTO `t_user_role` VALUES ('17', '1');
INSERT INTO `t_user_role` VALUES ('17', '4');
INSERT INTO `t_user_role` VALUES ('18', '3');
INSERT INTO `t_user_role` VALUES ('14', '3');
INSERT INTO `t_user_role` VALUES ('14', '4');
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('1', '2');
INSERT INTO `t_user_role` VALUES ('1', '3');
INSERT INTO `t_user_role` VALUES ('13', '2');
INSERT INTO `t_user_role` VALUES ('13', '3');

-- ----------------------------
-- Table structure for `t_viewandedit`
-- ----------------------------
DROP TABLE IF EXISTS `t_viewandedit`;
CREATE TABLE `t_viewandedit` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `description` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_viewandedit
-- ----------------------------
INSERT INTO `t_viewandedit` VALUES ('1', 'view', '查看');
INSERT INTO `t_viewandedit` VALUES ('2', 'edit', '编辑');
