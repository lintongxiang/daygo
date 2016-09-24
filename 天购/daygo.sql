/*
Navicat MySQL Data Transfer

Source Server         : ss
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : daygo

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-27 12:17:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dg_address
-- ----------------------------
DROP TABLE IF EXISTS `dg_address`;
CREATE TABLE `dg_address` (
  `a_tel` varchar(11) NOT NULL,
  `a_add` varchar(255) NOT NULL,
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_name` varchar(255) NOT NULL,
  `a_phone` varchar(13) DEFAULT NULL,
  `a_mail` varchar(50) DEFAULT NULL,
  `a_num` varchar(20) DEFAULT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_address
-- ----------------------------
INSERT INTO `dg_address` VALUES ('7776677766', 'gg', '1', ' gg', '7865655', 'testreg@163.com', '445656', '6');

-- ----------------------------
-- Table structure for dg_comment
-- ----------------------------
DROP TABLE IF EXISTS `dg_comment`;
CREATE TABLE `dg_comment` (
  `c_time` datetime NOT NULL,
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_rank` int(11) NOT NULL,
  `c_context` varchar(255) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_comment
-- ----------------------------

-- ----------------------------
-- Table structure for dg_goods
-- ----------------------------
DROP TABLE IF EXISTS `dg_goods`;
CREATE TABLE `dg_goods` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_describe` varchar(255) DEFAULT NULL,
  `g_category` varchar(255) NOT NULL,
  `g_size` varchar(255) NOT NULL,
  `g_name` varchar(255) NOT NULL,
  `g_number` int(11) NOT NULL,
  `g_price` double(255,2) NOT NULL,
  `g_picture` varchar(255) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_goods
-- ----------------------------
INSERT INTO `dg_goods` VALUES ('1', '<p>&nbsp;<img src=\"images/upload/Image/a1.jpg\" width=\"760\" height=\"6317\" alt=\"\" /></p>', '女装/内衣/衬衫1', 'M-黄;M-白;L-黄;L-白;XL-黄;XL-白;XXL-黄;XXL-白', '衬衫粉红大布娃娃2014秋新 白色拼蕾丝立体蝴蝶结长袖衬衫 女', '888', '288.00', 'images/201408/thumb_img/140_thumb_G_1409076056693.jpg', '1');
INSERT INTO `dg_goods` VALUES ('2', '<p>&nbsp;<img alt=\"\" width=\"760\" height=\"6317\" src=\"images/upload/Image/a1.jpg\" /></p>', '女装/内衣/T恤', 'M-黄;M-白;L-黄;L-白;XL-黄;XL-白;XXL-黄;XXL-白', '女式两色通勤韩版两件套条纹长袖T恤TK3303', '999', '168.00', 'images/201312/goods_img/134_G_1386627874991.jpg', '1');
INSERT INTO `dg_goods` VALUES ('3', '<p>&nbsp;<img src=\"images/upload/Image/a1.jpg\" width=\"760\" height=\"6317\" alt=\"\" /></p>', '女装/内衣/外套', 'M-黄;M-白;L-黄;L-白;XL-黄;XL-白;XXL-黄;XXL-白', '花噜噜2014秋装新款女装修身西服中长款单扣长袖小西装蕾丝外套潮', '321', '120.00', 'images/201408/goods_img/136_G_1409076772700.jpg', '1');
INSERT INTO `dg_goods` VALUES ('4', '<p>&nbsp;<img src=\"images/upload/Image/a1.jpg\" width=\"760\" height=\"6317\" alt=\"\" /></p>', '女装/内衣/衬衫', 'M-黄;M-白;L-黄;L-白;XL-黄;XL-白;XXL-黄;XXL-白', '天猫独家发售预售呛口小辣椒糖果色甜美系带长袖薄衬衫女6114009C', '352', '198.00', 'images/201408/goods_img/137_G_1409076145169.jpg', '1');
INSERT INTO `dg_goods` VALUES ('5', '<p>&nbsp;<img src=\"images/upload/Image/a1.jpg\" width=\"760\" height=\"6317\" alt=\"\" /></p>', '女装/内衣/外套', 'M-黄;M-白;L-黄;L-白;XL-黄;XL-白;XXL-黄;XXL-白', '女式黑色韩版拉链纽扣口袋装饰拼接工艺千鸟格短外套OU3045', '674', '318.00', 'images/201408/goods_img/138_G_1409076277252.jpg', '1');
INSERT INTO `dg_goods` VALUES ('6', '<p>&nbsp;<img src=\"images/upload/Image/a1.jpg\" width=\"760\" height=\"6317\" alt=\"\" /></p>', '女装/内衣/长袖', 'M-黄;M-白;L-黄;L-白;XL-黄;XL-白;XXL-黄;XXL-白', '棉立方2014秋新款韩版大码中长款白色宽松欧根纱上衣棉t恤女长袖', '1223', '120.00', 'images/201408/goods_img/139_G_1409076470233.jpg', '1');
INSERT INTO `dg_goods` VALUES ('7', '<p>&nbsp;<img src=\"images/upload/Image/CgQDrVMYZuSAWHrqAAKbNRMq8Dg85800.jpg\" width=\"750\" height=\"956\" alt=\"\" /></p>', '女装/内衣/针织衫', 'M-黄;M-白;L-黄;L-白;XL-黄;XL-白;XXL-黄;XXL-白', '女米白色韩版春装新款条纹镂空开衫针织衫MQ3160', '123', '258.00', 'images/201408/goods_img/141_G_1409076369609.jpg', '1');

-- ----------------------------
-- Table structure for dg_orders
-- ----------------------------
DROP TABLE IF EXISTS `dg_orders`;
CREATE TABLE `dg_orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_time` datetime NOT NULL,
  `o_status` int(11) NOT NULL,
  `o_totalprice` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_orders
-- ----------------------------
INSERT INTO `dg_orders` VALUES ('2', '2016-05-09 21:20:17', '2', '311.00');
INSERT INTO `dg_orders` VALUES ('6', '2016-05-26 00:00:00', '2', '576.00');
INSERT INTO `dg_orders` VALUES ('7', '2016-05-26 00:00:00', '2', '288.00');
INSERT INTO `dg_orders` VALUES ('8', '2016-05-26 00:00:00', '1', '258.00');
INSERT INTO `dg_orders` VALUES ('9', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('10', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('11', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('12', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('13', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('14', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('15', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('16', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('17', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('18', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('19', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('20', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('21', '2016-05-26 00:00:00', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('23', '2016-05-26 21:23:36', '3', '288.00');
INSERT INTO `dg_orders` VALUES ('24', '2016-05-26 21:26:20', '3', '600.00');
INSERT INTO `dg_orders` VALUES ('25', '2016-05-26 21:29:57', '1', '0.00');
INSERT INTO `dg_orders` VALUES ('26', '2016-05-26 21:30:08', '2', '318.00');
INSERT INTO `dg_orders` VALUES ('27', '2016-05-26 21:30:59', '2', '0.00');
INSERT INTO `dg_orders` VALUES ('28', '2016-05-26 21:35:48', '2', '2568.00');
INSERT INTO `dg_orders` VALUES ('29', '2016-05-27 10:52:18', '2', '20610.00');

-- ----------------------------
-- Table structure for dg_rel_shoppingcart_goods
-- ----------------------------
DROP TABLE IF EXISTS `dg_rel_shoppingcart_goods`;
CREATE TABLE `dg_rel_shoppingcart_goods` (
  `s_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `g_size` varchar(20) NOT NULL,
  `s_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`,`g_id`,`g_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_rel_shoppingcart_goods
-- ----------------------------

-- ----------------------------
-- Table structure for dg_rel_user_address
-- ----------------------------
DROP TABLE IF EXISTS `dg_rel_user_address`;
CREATE TABLE `dg_rel_user_address` (
  `u_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  PRIMARY KEY (`u_id`,`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_rel_user_address
-- ----------------------------

-- ----------------------------
-- Table structure for dg_rel_user_comment_goods
-- ----------------------------
DROP TABLE IF EXISTS `dg_rel_user_comment_goods`;
CREATE TABLE `dg_rel_user_comment_goods` (
  `u_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  PRIMARY KEY (`u_id`,`c_id`,`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_rel_user_comment_goods
-- ----------------------------

-- ----------------------------
-- Table structure for dg_rel_user_orders_goods
-- ----------------------------
DROP TABLE IF EXISTS `dg_rel_user_orders_goods`;
CREATE TABLE `dg_rel_user_orders_goods` (
  `u_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `g_number` int(11) NOT NULL,
  `g_size` varchar(20) DEFAULT NULL,
  `g_price` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`u_id`,`o_id`,`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_rel_user_orders_goods
-- ----------------------------
INSERT INTO `dg_rel_user_orders_goods` VALUES ('1', '6', '1', '2', 'M-黄', '288.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('1', '7', '1', '1', 'M-黄', '288.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('1', '8', '7', '1', 'M-黄', '258.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('6', '29', '2', '6', 'M-黄', '168.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('6', '29', '4', '99', 'M-黄', '198.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('9', '23', '1', '1', 'M-黄', '288.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('9', '24', '3', '5', 'M-黄', '120.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('9', '26', '5', '1', 'M-黄', '318.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('9', '28', '1', '6', 'M-黄', '288.00');
INSERT INTO `dg_rel_user_orders_goods` VALUES ('9', '28', '3', '7', 'M-黄', '120.00');

-- ----------------------------
-- Table structure for dg_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `dg_shoppingcart`;
CREATE TABLE `dg_shoppingcart` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`s_id`,`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_shoppingcart
-- ----------------------------
INSERT INTO `dg_shoppingcart` VALUES ('1', '1');
INSERT INTO `dg_shoppingcart` VALUES ('6', '6');
INSERT INTO `dg_shoppingcart` VALUES ('9', '9');
INSERT INTO `dg_shoppingcart` VALUES ('10', '10');

-- ----------------------------
-- Table structure for dg_user
-- ----------------------------
DROP TABLE IF EXISTS `dg_user`;
CREATE TABLE `dg_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `u_pwd` varchar(32) NOT NULL,
  `u_salt` varchar(8) NOT NULL,
  `u_problem` varchar(255) NOT NULL,
  `u_answer` varchar(255) NOT NULL,
  `u_sex` int(1) NOT NULL,
  `u_tel` char(11) NOT NULL,
  `u_mail` varchar(255) DEFAULT NULL,
  `u_lasttime` timestamp NULL DEFAULT NULL,
  `u_lastip` varchar(64) DEFAULT NULL,
  `u_sid` int(11) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_name` (`u_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dg_user
-- ----------------------------
INSERT INTO `dg_user` VALUES ('1', 'wang', 'bb7626810ec56fb8d4be3d7503a57308', '61', 'favorite_novel', '1', '0', '12121212121', '1@qq.com', '2016-05-27 10:50:18', 'fe80:0:0:0:11ed:7bed:1ef4:316a%11', '0');
INSERT INTO `dg_user` VALUES ('6', 'xiang', '9eb1f14dee2103710eb1952e28e4b39a', '1UHFX13C', 'friend_birthday', '11', '0', '12312312312', '1@qq.com', '2016-05-27 12:00:06', 'fe80:0:0:0:11ed:7bed:1ef4:316a%11', '0');
INSERT INTO `dg_user` VALUES ('9', 'qsa', 'f1a0dde5bbbff74107b538a5cf578567', '34QZH3NV', 'favorite_novel', '1', '0', '12345671234', '1@qq.com', '2016-05-26 21:18:01', 'fe80:0:0:0:11ed:7bed:1ef4:316a%11', '0');
