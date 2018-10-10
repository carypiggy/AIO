/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50722
Source Host           : 192.168.140.36:3306
Source Database       : smmp

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-09-27 16:04:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for don_donation_file
-- ----------------------------
DROP TABLE IF EXISTS `don_donation_file`;
CREATE TABLE `don_donation_file` (
  `id` varchar(64) NOT NULL,
  `don_donation_id` varchar(64) NOT NULL,
  `filepath` varchar(256) NOT NULL,
  `sequence` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `state` varchar(64) DEFAULT '0',
  `createdate` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of don_donation_file
-- ----------------------------

-- ----------------------------
-- Table structure for don_project
-- ----------------------------
DROP TABLE IF EXISTS `don_project`;
CREATE TABLE `don_project` (
  `id` varchar(64) NOT NULL,
  `name` varchar(256) NOT NULL,
  `second_name` varchar(256) DEFAULT NULL,
  `pic` varchar(256) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `master` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `target_money` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `got_money` decimal(10,2) unsigned zerofill DEFAULT NULL,
  `donating_num` int(11) DEFAULT NULL,
  `summary` varchar(512) DEFAULT NULL,
  `content` text,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT '0',
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of don_project
-- ----------------------------
INSERT INTO `don_project` VALUES ('148788a3c8e0480784629c933acb8f82', '六十周年校庆·西区活动', null, '', '', 'cccccccccccccc', '', null, null, null, null, '', '红专并进一甲子，科教报国六十年。2018年恰逢中国科学技术大学建校60周年，为了让更多的学校师生、校友参与到校庆的建设中，经海内外校友提议，学校将开展综合座椅冠名认捐活动。', '2018-09-01 16:10:55', '2018-09-30 16:13:02', 'BEDOING', '2018-08-30 09:45:08', '0', 'HOLD');
INSERT INTO `don_project` VALUES ('a289a136a6864aeeaf37e0f5ffb2e1c2', '六十周年校庆 西区活动', null, '/upload/file/donfile/2018-09-26/1537952089308.jpg', '', '张老师', '', '', '00100000.00', '00000000.01', '1', '红专并进一甲子，科教报国六十年。', '红专并进一甲子，科教报国六十年。2018年恰逢中国科学技术大学建校60周年，为了让更多的学校师生、校友参与到校庆的建设中，经海内外校友提议，学校将开展综合座椅冠名认捐活动。', '2018-09-17 16:00:00', '2018-10-07 16:00:00', 'BEDOING', '2018-09-26 08:54:52', '0', 'NORMAL');
INSERT INTO `don_project` VALUES ('da61810f2d9d4245b755a54339b73c27', '六十周年校庆 西区活动', null, '/upload/file/donfile/2018-09-26/1537951851958.png', '', '张老师', '', '', '00100000.00', null, null, '红专并进一甲子，科教报国六十年。', '红专并进一甲子，科教报国六十年。2018年恰逢中国科学技术大学建校60周年，为了让更多的学校师生、校友参与到校庆的建设中，经海内外校友提议，学校将开展综合座椅冠名认捐活动。', '2018-09-17 16:00:00', '2018-09-29 16:00:00', 'HASDONE', '2018-09-26 08:55:05', '0', 'NORMAL');

-- ----------------------------
-- Table structure for don_record
-- ----------------------------
DROP TABLE IF EXISTS `don_record`;
CREATE TABLE `don_record` (
  `id` varchar(64) NOT NULL,
  `don_project_id` varchar(64) DEFAULT NULL,
  `don_type` varchar(64) DEFAULT NULL,
  `sys_user_id` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `money_type` varchar(64) DEFAULT NULL,
  `donation_name` varchar(512) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_certificate` varchar(64) DEFAULT NULL,
  `is_invoice` varchar(64) DEFAULT NULL,
  `customid` varchar(64) DEFAULT NULL,
  `prepay_id` varchar(64) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `style` varchar(64) DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of don_record
-- ----------------------------
INSERT INTO `don_record` VALUES ('13a00d7af1bc4588b9047f5fcb779f1d', 'a289a136a6864aeeaf37e0f5ffb2e1c2', null, 'cf8d45120d4e4eee9532e7022081215d', null, '梁志强', '1313', null, '', '0.01', null, '六十周年校庆 西区活动', '2018-09-27 11:11:53', null, 'false', 'ab201f3f99c44b54a8d43f05ab689e01', 'wx271111243728471219f2aa1a2670514054', 'NORMAL', null, null, 'NORMAL');
INSERT INTO `don_record` VALUES ('4461cf3873654ab4b6698da590375a93', '0df02298428d4b02b2deaa03aac83f87', null, '9ac230a42f034e4b9ad4c146a66bb85b', null, '桂佳斌', '15991602102', '466455954@qq.com', '', '0.00', 'RMB', '六十周年校庆·西区活动中心室内座椅捐赠', '2018-09-26 16:47:16', '', '', null, null, 'WAITING', null, null, 'NORMAL');
INSERT INTO `don_record` VALUES ('c0b023c3bfa1401383d9a697290a90e2', 'a289a136a6864aeeaf37e0f5ffb2e1c2', null, 'cf8d45120d4e4eee9532e7022081215d', null, '梁志强', '1', null, '', '2.00', null, '六十周年校庆 西区活动', '2018-09-27 13:36:30', null, 'false', '0b7121f3d19e4162ab404ee4a5da81cf', 'wx271336260898794ce09d18d53426345369', 'FAIL', null, null, 'NORMAL');
INSERT INTO `don_record` VALUES ('c89926113f004c9e96c4c50d2f3be57c', 'a289a136a6864aeeaf37e0f5ffb2e1c2', null, 'cf8d45120d4e4eee9532e7022081215d', null, '梁志强', '1', null, '', '1.00', null, '六十周年校庆 西区活动', '2018-09-26 19:42:23', null, 'false', 'f7c7febe9dff4f5e92e9efe28e2e7301', null, 'NORMAL', null, null, 'NORMAL');
INSERT INTO `don_record` VALUES ('d5313a8f3011418ea2667b073a9513b6', 'a289a136a6864aeeaf37e0f5ffb2e1c2', null, 'cf8d45120d4e4eee9532e7022081215d', null, '梁志强', '1', null, '', '0.01', null, '六十周年校庆 西区活动', '2018-09-27 11:42:49', null, 'false', '515a544793384d99812f433413590db0', 'wx27114245773637cd723eb42f1023148962', 'FAIL', null, null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_address
-- ----------------------------
DROP TABLE IF EXISTS `sm_address`;
CREATE TABLE `sm_address` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `ispost` char(64) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `province` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `district` varchar(256) DEFAULT NULL,
  `detail` varchar(256) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_address
-- ----------------------------
INSERT INTO `sm_address` VALUES ('00b873c8d95a46b7aed5fd0ccd531a7a', '', '', null, null, '130000', '130100', '130102', '22', null, '11', '2018-09-26 12:44:49', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('03174762e998418d9d3fbf73a928f2e0', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', null, '1', '150000', '150200', '1020101', null, null, null, '2018-08-31 06:24:24', null, 'NORMAL', 'IS_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('05a5171640bc4f858ee1c62dad6235da', 'aeea839ce68840049d12b2a44161f624', 'zhang', 'IS_POST', '1', '150000', '150200', '1020101', 'sdasdasdasd', null, '123123@qq.com', '2018-09-06 06:49:44', '12312', 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('09edff0d959246948dc400085f4dbb22', '8e8df9eb2f52485e90bb24ae8a146b49', 'mlxg', null, '1', '150000', '150200', '1020101', null, null, null, '2018-09-13 10:23:16', null, 'NORMAL', 'IS_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('21841cc9d7cb4ebd9226d3efbce4f3a0', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, null, '130000', '130100', '130102', '', null, '', '2018-09-26 10:44:25', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('272c82742fd941939a6ec8e23f03837c', '', '', null, null, '140000', '140100', '140105', '22', null, '11', '2018-09-26 13:11:15', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('283311eec6e148ce883b9721032cf722', '472466b8aa3241fe9af7cc073113fded', 'bear', null, '1', '150000', '150200', '1020101', null, null, null, '2018-09-03 10:07:42', null, 'NORMAL', 'IS_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('2eea59da5d8b423696bb3cee3f5d0775', 'undefined', 'lzqlzq', null, null, '150000', '', '', '', null, '', '2018-09-25 12:20:46', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('334e211d7c304764a565334ea8a28f2d', '', '', null, null, '130000', '130100', '130102', '22', null, '11', '2018-09-26 12:23:16', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('3dddcc3078034aa1a2da22b301139ce8', 'aeea839ce68840049d12b2a44161f624', 'zhang', null, '1', '150000', '150200', '1020101', null, null, null, '2018-08-31 03:36:58', null, 'NORMAL', 'IS_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('49e93ba29a5e4394bdf09553599c991d', '', '', null, null, '130000', '130100', '130102', '22', null, '11', '2018-09-27 02:57:32', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('59b24ba1ce5d4808b90875881cdf4062', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, null, '110000', '110100', '110101', '', null, '', '2018-09-26 10:33:22', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('5cf1006b813a46bcbd8d6009332b40df', 'undefined', 'lzqlzq', null, '', '130000', '', '', '', null, '', '2018-09-25 12:21:39', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('6e699394c29e4cfda916b306ccd0a7a7', 'undefined', 'lzqlzq', null, null, '110000', '', '', '', null, '', '2018-09-25 12:19:25', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('7899d3a246de454cb0501208e7e1c91e', '', '', null, null, '140000', '140100', '140105', '22', null, '11', '2018-09-27 01:31:39', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('7910f05fe626429e94158a7201a2e039', 'undefined', 'lzqlzq', null, null, '', '', '', 'dsaf', null, 'dafsf', '2018-09-25 12:31:20', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('7d01942d52d0449f95b21bbbaa295838', '', '', null, null, '130000', '130100', '130102', '22', null, '11', '2018-09-26 13:04:24', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('8c0816d2480045bf93f70f55140cb255', 'c1d1050cdaa14e6983fe66988441d378', 'mlxg', null, '1', '110000', '150200', '1020101', null, null, null, '2018-09-13 10:20:30', null, 'NORMAL', 'IS_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('8ed31ce7c510482fba363cef3c510a69', '', '', null, null, '130000', '130100', '130102', '22', null, '11', '2018-09-26 12:58:09', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('9c7ff2bd5d784adba98a1ffd94439fe8', '', '', null, null, '140000', '140100', '140105', '22', null, '11', '2018-09-27 02:05:59', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('9de818d2a02a4c938059fb868219bcd5', '123123', 'test1', null, null, null, null, '1020101', null, '12345645678', null, '2018-08-22 03:09:50', null, 'NORMAL', '');
INSERT INTO `sm_address` VALUES ('9eb4ffe3124844628f1912d097a46053', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, null, '110000', '110100', '110101', 'ddd', null, 'dddd', '2018-09-25 13:09:38', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('aed7e76a765f4c218c57bb6d6a801736', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', 'IS_POST', '2', '', '', '1020101', 'asdasdasd', null, '123123', '2018-09-03 08:34:08', '3123123', 'HOLD', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('b6637704d8a0404a91d5e29cbbebb8d1', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', 'IS_POST', '000000', '110000', '110101', '', 'dasdasdasd', null, '1123111', '2018-09-03 07:41:13', '1231231', 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('b94ce9fbda0c43029a1144b59687bf3c', '', '', null, null, '', '', '', '22', null, '11', '2018-09-27 01:54:17', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('c1da5d8b9a27426aa233a7722d6386c5', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, null, '110000', '110100', '110101', 'sss', null, 'sss', '2018-09-25 13:01:43', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('cb6fa5db5d6848b88bb5e64e4c41b454', 'ee969b718ecc4de3b1084c47398aca26', 'bear', null, '1', '150000', '150200', '1020101', null, null, null, '2018-09-03 10:18:01', null, 'NORMAL', 'IS_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('d4288a26bedf4603a29f54df3d6817b6', '', '', null, null, '110000', '', '', '22', null, '11', '2018-09-27 01:30:11', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('d6063b85e68047b48c8385e8e56d7a30', '462bbd2e610b4cfdb926dd9dfefda938', 'pawn', null, '1', '150000', '150200', '1020102', null, null, null, '2018-09-13 05:01:23', null, 'NORMAL', 'IS_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('d7329c42594d4e44a255419893ed5a6f', '12313213123', 'sdsada', '1', '1', '150000', '150200', '1020101', 'ssssss', null, null, '2018-09-11 13:23:13', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('dd164052603e4c388867c686a46371cd', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, null, '130000', '130100', '130102', '', null, '', '2018-09-26 12:13:41', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('e20eacff7b2543aab777d2145a4948ca', 'undefined', 'lzqlzq', null, null, '120000', '', '', '', null, '', '2018-09-25 12:20:08', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('e74e2197d4844b67b6c5bc64a8e21be4', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, null, '110000', '', '', 'dsaf', null, 'dsfasdfs', '2018-09-25 12:34:48', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('ef605077cae94d1d97210cb8c6590ec2', 'ee969b718ecc4de3b1084c47398aca26', 'bear', 'NO_POST', '1', '150000', '150200', '1020101', '十里长廊', null, '111111111', '2018-09-03 10:21:57', '备注', 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('f122ba77af2b404095fd394e6c335b4d', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, null, '130000', '130100', '130102', '', null, '', '2018-09-26 11:54:29', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('f90daf16e41d4da9a86c43c971b46b21', 'undefined', 'lzqlzq', null, null, '140000', '', '', '', null, '', '2018-09-25 12:29:13', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('fb77f07d6fc14fb58844a8f68f4ba7d2', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, null, '130000', '130100', '130102', '', null, '', '2018-09-26 11:48:20', null, 'NORMAL', 'NO_NATION_PLACE');
INSERT INTO `sm_address` VALUES ('fcd3a3c1dc614d90b0213558d27ffb98', 'undefined', 'lzqlzq', null, null, '110000', '', '', '', null, '', '2018-09-25 12:17:27', null, 'NORMAL', 'NO_NATION_PLACE');

-- ----------------------------
-- Table structure for sm_association
-- ----------------------------
DROP TABLE IF EXISTS `sm_association`;
CREATE TABLE `sm_association` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) NOT NULL,
  `parent_ids` varchar(2048) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `logo` varchar(256) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `build_date` datetime DEFAULT NULL,
  `summary` text,
  `master` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `wcaccount` varchar(64) DEFAULT NULL,
  `wcigroup` varchar(64) DEFAULT NULL,
  `constitution` text,
  `province` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_association
-- ----------------------------
INSERT INTO `sm_association` VALUES ('1000', '736abca568d441b09ce5784e75cb7248', 'root,736abca568d441b09ce5784e75cb7248,', '信息工程学院校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('1001', '1000', 'root,736abca568d441b09ce5784e75cb7248,1000', '计科系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('1002', '1000', 'root,736abca568d441b09ce5784e75cb7248,1000', '网络工程系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('1003', '1000', 'root,736abca568d441b09ce5784e75cb7248,1000', '软件工程系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('2000', '736abca568d441b09ce5784e75cb7248', 'root,736abca568d441b09ce5784e75cb7248', '建筑学院校友会', '/upload/file/Association/2018-09-26/1537943255438.gif', 'INDUSTRY_TYPE', '2018-09-04 16:00:00', '没有简介', 'aaaaaaaaa', '13@123.com', '13112311231', '', null, '', '', '没有简介', '150000', '150300', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('2001', '2000', 'root,736abca568d441b09ce5784e75cb7248,2000', '建筑学系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('2002', '2000', 'root,736abca568d441b09ce5784e75cb7248,2000', '城市规划系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('3000', '736abca568d441b09ce5784e75cb7248', 'root,736abca568d441b09ce5784e75cb7248', '汽车学院校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('3002', '3000', 'root,736abca568d441b09ce5784e75cb7248,3000', '车辆工程系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('3003', '3000', 'root,736abca568d441b09ce5784e75cb7248,3000', '交通安全系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('3004', '3000', 'root,736abca568d441b09ce5784e75cb7248,3000', '物流工程系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('3005', '3000', 'root,736abca568d441b09ce5784e75cb7248,3000', '服务工程系校友会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('4c3c7cd5974e4cbf9e5740c66870471d', '2000', 'root,736abca568d441b09ce5784e75cb7248,2000', '土木工程校友会', '', 'INDUSTRY_TYPE', '2017-09-15 16:00:00', '无简介', '张胖胖', '323@qq.com', '13112311231', '镇魂街', null, 'wwwe', '111223', '无简介', '110000', '110105', '2018-09-19 04:38:41', null, 'NORMAL');
INSERT INTO `sm_association` VALUES ('736abca568d441b09ce5784e75cb7248', 'root', 'root', '校友总会', '', 'INDUSTRY_TYPE', '2018-09-05 16:00:00', null, 'aaaaaaaaa', '', '', '', null, '', '', null, '', '', '2018-08-28 07:11:46', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_card
-- ----------------------------
DROP TABLE IF EXISTS `sm_card`;
CREATE TABLE `sm_card` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `start_level` int(11) DEFAULT NULL,
  `end_level` int(11) DEFAULT NULL,
  `front_font` varchar(64) DEFAULT NULL,
  `front_font_color` varchar(64) DEFAULT NULL,
  `front_font_style` varchar(64) DEFAULT NULL,
  `back_font` varchar(64) DEFAULT NULL,
  `back_font_color` varchar(64) DEFAULT NULL,
  `back_font_style` varchar(64) DEFAULT NULL,
  `card_style_line` varchar(64) DEFAULT NULL,
  `card_style_radius` varchar(64) DEFAULT NULL,
  `card_style_opacity` varchar(64) DEFAULT NULL,
  `front_background` varchar(256) DEFAULT NULL,
  `back_background` varchar(256) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_card
-- ----------------------------
INSERT INTO `sm_card` VALUES ('0388982f7b4a4095bdaf7b5d7b3146a0', 'wewewewewewe', 'NORMAL', '0', '0', null, null, null, null, null, null, null, null, null, null, null, '2018-08-23 02:00:28', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('08e4f68cc09a4cdc91592c101c4c2c18', '桂佳斌', 'TEMP', '2', '4', null, null, null, null, null, null, null, null, null, '2018-08-24/TIM截图20180824130147.png', '2018-08-24/TIM截图20180824130147.png', '2018-08-23 05:57:38', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('220a8c71b2374231817e9844e3803c0a', '临时校友卡', 'TEMP', '2', '5', null, null, null, null, null, null, null, null, null, '/upload/file/smCard/2018-09-25/1537857079124.png', '/upload/file/smCard/2018-09-25/1537857090095.png', '2018-09-13 04:49:00', null, 'NORMAL');
INSERT INTO `sm_card` VALUES ('2664e1d217b24faa9052f74db8484848', '桂**', 'TEMP', '4', '5', null, null, null, null, null, null, null, null, null, '2018-09-05/1536127152647.png', '2018-09-05/1536127156694.png', '2018-08-23 13:14:11', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('32d9a3e528994992872aae1a1ac7b7a1', 'aaaaaaaaabbbbbbbbb', 'NORMAL', '4', '5', null, null, null, null, null, null, null, null, null, null, null, '2018-08-22 10:40:38', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('3fd72e75c62b42a1bf7f5706e7076d27', 'aaaaaaaaa', null, '4', '5', null, null, null, null, null, null, null, null, null, null, null, '2018-08-22 10:40:22', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('569b17bbddd04a27855f49d46acf1d0e', 'aaaaaaaaa', null, '4', '9', null, null, null, null, null, null, null, null, null, null, null, '2018-08-22 09:57:15', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('6d27c554a9264485890ad25694143d76', 'aaaaaaaaabbbbbbbbbccccccccccddddddddd', 'TEMP', '4', '9', null, null, null, null, null, null, null, null, null, null, null, '2018-08-22 10:52:06', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('716e7110719740579073907ad290b2be', 'test\'or\'1\'=\'1', 'TEMP', '4', '9', null, null, null, null, null, null, null, null, null, '', '', '2018-08-23 13:08:00', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('9331053871b04a1d86d4ebcd14c49621', '临时卡', 'TEMP', '4', '9', null, null, null, null, null, null, null, null, null, '/upload/file/2018-09-15/1536994191487.gif', '/upload/file/2018-09-15/1536994197674.gif', '2018-09-15 06:50:14', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('a52d36b26f9b477a8002fe8cd91b2189', '张三', 'VIP', '4', '9', null, null, null, null, null, null, null, null, null, '2018-09-05/1536126132609.png', '2018-09-05/1536126134801.png', '2018-09-05 05:42:16', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('c98d5306483340f3acb8406a80366bf9', 'dsadsadsadsa', 'NORMAL', '4', '9', null, null, null, null, null, null, null, null, null, '2018-08-23/a1.png', '2018-08-23/c1.png', '2018-08-23 12:56:38', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('d0a37de5da65478f8d181433aca66351', '桂**', 'TEMP', '4', '9', null, null, null, null, null, null, null, null, null, '2018-08-23/b1.png', '2018-08-23/j1.png', '2018-08-23 13:07:26', null, 'HOLD');
INSERT INTO `sm_card` VALUES ('f831dfcf6aa54f9cad1770e15bb1c22a', '校友普通卡', 'NORMAL', '4', '9', null, null, null, null, null, null, null, null, null, '/upload/file/smCard/2018-09-25/1537857102271.png', '/upload/file/smCard/2018-09-25/1537857104506.png', '2018-08-23 06:00:59', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_contact
-- ----------------------------
DROP TABLE IF EXISTS `sm_contact`;
CREATE TABLE `sm_contact` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `contact` varchar(128) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT '0',
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_contact
-- ----------------------------
INSERT INTO `sm_contact` VALUES ('11ac4461c4ce47dfa8cbb2127bd892e4', '6f45d56e52a14c9ab658cebf8f464449', 'lzqlzq', 'emali', 'daf', '2018-09-21 04:02:52', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('14c0f91fa7964bd6823659b5370e7b4e', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', 'photo', '13484478234', '2018-08-31 09:54:23', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('201f94e8128a4fa58e162bbff1dd0274', '6f45d56e52a14c9ab658cebf8f464449', 'lzqlzq', 'emali', 'da11f@w.xx', '2018-09-21 04:04:25', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('2903e66d563d447eabf549aa3295b59c', '12313213123', null, null, null, '2018-09-13 03:40:53', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('2c7fac750e2e4b6b8834a8d163fc5125', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', '123@3d3.da', '2018-09-25 08:28:13', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('2d4568166a72483f902466d9a85481ea', '838fe6cf1ba1466d95e98339f2128e42', '123123', 'photo', '123123123123', '2018-08-21 07:32:00', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('30cc6f2dcc7b4c0396d085b9b5e6d7b6', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', '123@.ddv', '2018-09-25 08:29:54', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('33e730e4ea88472085d6cbc57d185402', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', '123@qq.3vb', '2018-09-25 08:27:26', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('3d03ff02505347a5a4ebbe0f8d703f03', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', '', '1111', '2018-09-03 01:14:54', '0', 'HOLD');
INSERT INTO `sm_contact` VALUES ('4a363010a39e454c9458d89b2f78958c', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', '123@.ddv', '2018-09-25 08:29:58', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('4d0fb56c33f2499aa2147cd8a9cc512e', '123123', '123123', 'photo', '123123123123', '2018-08-21 12:36:16', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('55ff544a152741c7a76a243fa82d010e', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', '123@.ddv', '2018-09-25 08:29:58', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('75a4b2643f6f48e0986c569406646c1d', '6f45d56e52a14c9ab658cebf8f464449', null, 'photo', '12345612311', '2018-09-21 04:04:36', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('7806cb186e3540e48d63af2d7f6ced2a', '123123', '123123', 'photo', '123123123123', '2018-08-21 07:33:48', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('79be896f014643238d95e9ef2bc75e2a', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', '12312@qq.cn', '2018-09-25 03:03:24', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('7d8dfe8027b54173a408792b08505e66', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', 'photo', '3123', '2018-09-01 01:36:46', '0', 'HOLD');
INSERT INTO `sm_contact` VALUES ('8e8c5b5cd85247a88aa4a252ea196835', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', 'we@qq.com', '2018-09-25 08:33:49', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('9cfe49a821f64cf4a2ea70ecedce8a97', '12313213123', null, null, null, '2018-09-11 13:17:04', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('a312a17951404ddf8ed4eb70a16c6dcb', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', '123@qq.com', '2018-09-25 08:33:21', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('a3713bf205744b8588167b46b6f4e529', 'ee969b718ecc4de3b1084c47398aca26', 'bear', 'emali', '1111', '2018-09-03 10:22:12', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('b47db860c3f444179dd31fb169ddae33', 'ee969b718ecc4de3b1084c47398aca26', 'bear', 'photo', '3123123123', '2018-09-03 10:22:03', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('c8a0793cc6bf44c2ab52d78772bbfc9f', '6f45d56e52a14c9ab658cebf8f464449', null, 'photo', 'dasaf21323123 ', '2018-09-21 04:02:52', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('d10869bda00d44e9ad8e4cf03e7713ac', 'aeea839ce68840049d12b2a44161f624', 'zhang', 'photo', '12312312312', '2018-09-06 06:49:50', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('dbbc4fe94f89464ea4ef56b32361f0b5', 'ee969b718ecc4de3b1084c47398aca26', 'bear', 'photo', '1111', '2018-09-04 01:08:49', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('e00f85b9d8dc40e7a15426518a40d1ae', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'email', '123@.ddv', '2018-09-25 08:29:57', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('f614fab59b484906b6d6e69b1bfff6e7', '123123', '123123', 'photo', '123123@qwe.com', '2018-08-21 07:34:07', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('fafbd40b8bea49b0ba52aec889dfb264', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'photo', '1312312312 ', '2018-09-25 03:03:25', '0', 'NORMAL');
INSERT INTO `sm_contact` VALUES ('fd56469a452048768a2769398ef4cc18', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'emali', '11111111', '2018-09-26 01:04:11', '0', 'NORMAL');

-- ----------------------------
-- Table structure for sm_education
-- ----------------------------
DROP TABLE IF EXISTS `sm_education`;
CREATE TABLE `sm_education` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  `sys_user_username` varchar(64) NOT NULL,
  `school` varchar(64) DEFAULT NULL,
  `college` varchar(64) DEFAULT NULL,
  `academy` varchar(64) DEFAULT NULL,
  `series` varchar(64) DEFAULT NULL,
  `specialty` varchar(64) DEFAULT NULL,
  `class_name` varchar(64) DEFAULT NULL,
  `degree` varchar(64) DEFAULT NULL,
  `degreetype` varchar(64) DEFAULT NULL,
  `studentid` varchar(32) DEFAULT NULL,
  `schoollen` varchar(64) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_education
-- ----------------------------
INSERT INTO `sm_education` VALUES ('6fa6948098e3467c9aba89890f59ec0b', 'aeea839ce68840049d12b2a44161f624', 'zhang', '0', '1000101', '10001', null, null, null, 'REGULAR_COLLEGE', 'BACHELOR', '1231212', 'FULL_TIME', '2014-09-09 16:00:00', '2018-09-05 16:00:00', '2018-09-06 06:49:24', null, 'NORMAL');
INSERT INTO `sm_education` VALUES ('8cdb80bd87874ec6911d20b8733fd5fd', 'ee969b718ecc4de3b1084c47398aca26', 'bear', '0', '1000102', '10001', null, null, null, 'REGULAR_COLLEGE', 'MASTER', '123', 'FULL_TIME', '2009-09-02 16:00:00', '2012-09-03 16:00:00', '2018-09-03 10:21:17', null, 'NORMAL');
INSERT INTO `sm_education` VALUES ('ac4e0f38a8314c0f97563673853df6b0', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', '0', '1000101', '10001', null, null, null, 'REGULAR_COLLEGE', 'BACHELOR', '23424', 'FULL_TIME', '2013-09-04 16:00:00', '2016-09-07 16:00:00', '2018-09-03 05:08:05', null, 'NORMAL');
INSERT INTO `sm_education` VALUES ('b8ee4c6935f1476dad0b5d8eeb767a9f', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', '100', '', '10001', null, '', '23123123', 'JUNIOR_COLLEGE', null, null, null, '2018-08-31 16:00:00', null, '2018-09-26 09:05:24', null, 'NORMAL');
INSERT INTO `sm_education` VALUES ('ba8645c8ec0a49869d2c46ed6a7f4ac5', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', '0', '40001', null, null, null, null, 'JUNIOR_COLLEGE', 'BACHELOR', '3123123', 'FULL_TIME', '2017-09-04 16:00:00', '2018-09-03 16:00:00', '2018-09-03 05:12:58', null, 'NORMAL');
INSERT INTO `sm_education` VALUES ('c2ebd2aa1bf94fa0a513bf9819a3c3fe', 'ee969b718ecc4de3b1084c47398aca26', 'bear', '0', '40001', null, null, null, null, 'REGULAR_COLLEGE', 'BACHELOR', '110', 'FULL_TIME', '2016-08-31 16:00:00', '2009-09-15 16:00:00', '2018-09-03 10:20:41', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_experience
-- ----------------------------
DROP TABLE IF EXISTS `sm_experience`;
CREATE TABLE `sm_experience` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `organization` varchar(64) NOT NULL,
  `position` varchar(64) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_experience
-- ----------------------------
INSERT INTO `sm_experience` VALUES ('075d734ea94644329ef8267bffd72213', '123123', '123123', 'dd', '123', '2018-08-21 00:00:00', '2018-08-21 00:00:00', '2018-08-21 12:35:56', null, 'NORMAL');
INSERT INTO `sm_experience` VALUES ('64a4a524d7b9438d8d8f12fee37507a2', '123123', 'test1', '阿斯蒂芬', '阿斯蒂芬', '2018-08-21 00:00:00', null, '2018-08-21 07:17:30', null, 'NORMAL');
INSERT INTO `sm_experience` VALUES ('95e15416ed0e4e9bbfb3a97c5ec350d8', '123123', 'test1', '阿斯蒂芬', '职务', '2018-08-22 00:00:00', null, '2018-08-21 09:39:37', null, 'NORMAL');
INSERT INTO `sm_experience` VALUES ('cef3fd66429f4fab8d2f52562472cc7b', '123123', 'test1', '答复', '是的', null, null, '2018-08-21 07:33:36', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_family
-- ----------------------------
DROP TABLE IF EXISTS `sm_family`;
CREATE TABLE `sm_family` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sex` varchar(64) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `relation` varchar(64) DEFAULT NULL,
  `profession` varchar(64) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `workplace` varchar(64) DEFAULT NULL,
  `isschool` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT '0',
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_family
-- ----------------------------

-- ----------------------------
-- Table structure for sm_honor
-- ----------------------------
DROP TABLE IF EXISTS `sm_honor`;
CREATE TABLE `sm_honor` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `domain` varchar(256) DEFAULT NULL,
  `infoval` text,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_honor
-- ----------------------------

-- ----------------------------
-- Table structure for sm_invite_code
-- ----------------------------
DROP TABLE IF EXISTS `sm_invite_code`;
CREATE TABLE `sm_invite_code` (
  `id` varchar(64) NOT NULL,
  `sm_temp_id` varchar(64) DEFAULT NULL,
  `sys_user_id` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `invitecode` varchar(64) NOT NULL,
  `status` varchar(64) DEFAULT NULL,
  `send_user_id` varchar(64) DEFAULT NULL,
  `send_date` varchar(64) DEFAULT NULL,
  `active_date` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_invite_code
-- ----------------------------
INSERT INTO `sm_invite_code` VALUES ('09fd970f599f4234bc2ae09fec4c9285', '030ea01edb8344fab00ffe331ddf6b47', null, null, 'CixOXB', null, '0e207e95eb9d4f3985120ec7d5528013', null, null, '2018-09-11 02:52:12', null, 'NORMAL');
INSERT INTO `sm_invite_code` VALUES ('15fa741bc8444a3ba37813a32247fbdb', '07e92075c25a459bb8df725f520dbf4c', null, null, 'Fb4zvp', null, '0e207e95eb9d4f3985120ec7d5528013', null, null, '2018-09-11 02:10:46', null, 'NORMAL');
INSERT INTO `sm_invite_code` VALUES ('7419df9880eb4d98b99c6df919a4e511', '1db5b62c9cc443c79c5ae17ec6f0d8ba', null, null, 'FmsRAe', null, '0e207e95eb9d4f3985120ec7d5528013', null, null, '2018-09-27 03:31:47', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_level
-- ----------------------------
DROP TABLE IF EXISTS `sm_level`;
CREATE TABLE `sm_level` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `start_point` int(11) NOT NULL,
  `end_point` int(11) NOT NULL,
  `level_icon` varchar(256) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_level
-- ----------------------------
INSERT INTO `sm_level` VALUES ('0e207e95eb9d4f3985120ec7d5528013', '青铜', '1', 'Bronze', '0', '10', 'http://127.0.0.1:8080//upload/file/2018-09-14/1536891444123.gif', '2018-09-14 11:35:31', '青', 'NORMAL');
INSERT INTO `sm_level` VALUES ('47714ec5898b49248695671e0a47878c', '白银', '2', 'silver', '11', '20', 'http://127.0.0.1:8080//upload/file/smLevel/2018-09-14/1536905282137.gif', '2018-09-14 06:08:07', '白银', 'NORMAL');
INSERT INTO `sm_level` VALUES ('dc0b583868ab49199fee91ec445d069d', '黄金', '3', 'gold', '20', '30', 'http://192.168.140.36:8080//upload/file/smLevel/2018-09-21/1537496816842.gif', '2018-09-21 02:27:38', '黄金', 'NORMAL');

-- ----------------------------
-- Table structure for sm_mark
-- ----------------------------
DROP TABLE IF EXISTS `sm_mark`;
CREATE TABLE `sm_mark` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) NOT NULL,
  `parent_ids` varchar(2048) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `useable` varchar(64) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_mark
-- ----------------------------
INSERT INTO `sm_mark` VALUES ('275431c93da24e63b9da9010e6853ad0', 'root', null, '联系人', '1', null, '1', '2018-09-26 03:00:37', null, 'NORMAL');
INSERT INTO `sm_mark` VALUES ('31699bff18c24d5d9c04241d35286b22', 'ce8c7074a6514bf6a8ae322f9ab7cd6f', null, 'dasdasdas', 'dsadasd', null, 'ABLE', '2018-08-24 10:09:52', null, 'HOLD');
INSERT INTO `sm_mark` VALUES ('ce8c7074a6514bf6a8ae322f9ab7cd6f', 'root', null, '校友', 'xy', null, 'ABLE', '2018-08-24 10:02:18', null, 'NORMAL');
INSERT INTO `sm_mark` VALUES ('d360a872d04d4271aa3eabdce5382112', 'ce8c7074a6514bf6a8ae322f9ab7cd6f', null, '企业负责人', 'xybm', null, 'ABLE', '2018-08-24 10:02:30', null, 'NORMAL');
INSERT INTO `sm_mark` VALUES ('d6af5c03abfb44fe8da2948bdea47b42', 'root', null, '慈善家', 'cs', null, 'ABLE', '2018-08-30 09:03:56', null, 'NORMAL');
INSERT INTO `sm_mark` VALUES ('dba76ad36e1e4502b062382d45ee7082', 'root', null, '经济学家', 'jj', null, 'ABLE', '2018-08-30 09:04:12', null, 'NORMAL');
INSERT INTO `sm_mark` VALUES ('f48634c5cb8147399a443c1b500dc5ae', 'root', null, '教授', 'js', null, 'ABLE', '2018-08-24 10:10:30', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_mark_schoolmate
-- ----------------------------
DROP TABLE IF EXISTS `sm_mark_schoolmate`;
CREATE TABLE `sm_mark_schoolmate` (
  `mark_id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  PRIMARY KEY (`mark_id`,`sys_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_mark_schoolmate
-- ----------------------------
INSERT INTO `sm_mark_schoolmate` VALUES ('ce8c7074a6514bf6a8ae322f9ab7cd6f', '8e8df9eb2f52485e90bb24ae8a146b49');
INSERT INTO `sm_mark_schoolmate` VALUES ('d360a872d04d4271aa3eabdce5382112', '8e8df9eb2f52485e90bb24ae8a146b49');
INSERT INTO `sm_mark_schoolmate` VALUES ('d6af5c03abfb44fe8da2948bdea47b42', '8e8df9eb2f52485e90bb24ae8a146b49');
INSERT INTO `sm_mark_schoolmate` VALUES ('dba76ad36e1e4502b062382d45ee7082', '8e8df9eb2f52485e90bb24ae8a146b49');
INSERT INTO `sm_mark_schoolmate` VALUES ('f48634c5cb8147399a443c1b500dc5ae', '8e8df9eb2f52485e90bb24ae8a146b49');

-- ----------------------------
-- Table structure for sm_point_function
-- ----------------------------
DROP TABLE IF EXISTS `sm_point_function`;
CREATE TABLE `sm_point_function` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `point` int(11) NOT NULL,
  `isuse` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_point_function
-- ----------------------------
INSERT INTO `sm_point_function` VALUES ('111112313zxd', '登录', 'login', '3', 'YES', '2018-09-14 18:11:21', '登录', 'NORMAL');
INSERT INTO `sm_point_function` VALUES ('ea4f4e0fb1234a3492e7e47608227ab9', '信息填写', 'save', '2', 'YES', '2018-09-15 01:53:12', '信息填写', 'NORMAL');

-- ----------------------------
-- Table structure for sm_point_logs
-- ----------------------------
DROP TABLE IF EXISTS `sm_point_logs`;
CREATE TABLE `sm_point_logs` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `operateIp` varchar(256) DEFAULT NULL,
  `integraltion` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_point_logs
-- ----------------------------
INSERT INTO `sm_point_logs` VALUES ('1119012lkjsdfjkhsdfjk', '8e8df9eb2f52485e90bb24ae8a146b49', 'mlxg', 'ADD', '127.0.0.1', '5', '2018-09-14 15:28:03', '自忖', 'NORMAL');
INSERT INTO `sm_point_logs` VALUES ('bbb1a418db994a1684de7431b9d0aece', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', 'ADD', '127.0.0.1', '3', '2018-09-15 06:14:49', '登录', 'NORMAL');

-- ----------------------------
-- Table structure for sm_profession
-- ----------------------------
DROP TABLE IF EXISTS `sm_profession`;
CREATE TABLE `sm_profession` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `workplace` varchar(256) NOT NULL,
  `nature` varchar(64) DEFAULT NULL,
  `industry` varchar(64) DEFAULT NULL,
  `department` varchar(64) DEFAULT NULL,
  `position` varchar(64) DEFAULT NULL,
  `telephone` varchar(64) DEFAULT NULL,
  `fax` varchar(64) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_profession
-- ----------------------------
INSERT INTO `sm_profession` VALUES ('4a21958afc5c457aba7a10d70ff28c80', '123123', 'test1', '123123', '', '', '大师傅', 'dd', '12312312', '123123', null, null, '2018-08-22 03:14:19', 'qwewwew', 'NORMAL');
INSERT INTO `sm_profession` VALUES ('f8e7622ce4e34119abd0c27495dbdce3', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', 'werwe', null, null, null, '12321', '213123', '213123', '2015-06-17 16:00:00', '2018-09-17 16:00:00', '2018-09-18 03:16:35', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_schoolmate
-- ----------------------------
DROP TABLE IF EXISTS `sm_schoolmate`;
CREATE TABLE `sm_schoolmate` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `card_id` varchar(64) DEFAULT NULL,
  `card_status` varchar(64) DEFAULT NULL,
  `openid` varchar(64) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `pinyin` varchar(64) DEFAULT NULL,
  `sex` varchar(64) DEFAULT NULL,
  `true_photo` varchar(200) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `pos_city` varchar(64) DEFAULT NULL,
  `pos_lat` varchar(64) DEFAULT NULL,
  `pos_long` varchar(64) DEFAULT NULL,
  `card_num` varchar(20) DEFAULT NULL,
  `card_type` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `don_fee` decimal(10,2) DEFAULT NULL,
  `nation` varchar(64) DEFAULT NULL,
  `complete` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_schoolmate
-- ----------------------------
INSERT INTO `sm_schoolmate` VALUES ('00f16ff435814b118faa570863b08f67', '8e8df9eb2f52485e90bb24ae8a146b49', 'mlxg', null, null, null, 'mlxg', null, '0', null, '1995-09-11 00:00:00', null, null, null, '111111111111111111', 'PASSPORT', 'zaixiaosheng', '0', null, null, 'manzu', '3', '2018-09-13 10:23:16', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('061588eaa16b45fdad8d17f7fa366dc1', 'eadf4b92771441f98a01dd02687df8f2', 'lzq', null, 'NORMAL', null, 'lzq', null, '0', '/images/user.png', null, null, null, null, '123456789987456321', null, null, '0', null, null, null, null, '2018-09-14 06:10:13', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('45dec222b9e44096b153168f672bad00', '67fb5eaf2ee74f2d9ae7d54c7fdaac62', 'wang', '', 'NORMAL', null, '张三', null, '0', null, '2018-07-04 16:00:00', null, null, null, '11111111111111111', 'PASSPORT', 'biyesheng', '1', '3', null, 'manzu', null, '2018-08-31 04:51:40', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('6c3bb09b128e4aa1a69e2a6da711cf44', '83d650c8658243cfadaec949bf10cd8d', 'lzqtest', null, 'NORMAL', 'obMLi5MkToK1ZE9f7HN8ubzu69qg', '了准确的说', null, '0', '/images/user.png', null, '中国,陕西省,西安市,长安区', '34.15775', '108.90688', '256335986358', null, null, '0', null, null, null, null, '2018-09-19 05:53:49', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('6f45d56e52a14c9ab658cebf8f464449', 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, 'NORMAL', null, '梁志强', null, '0', '/upload/file/smSchoolmate/2018-09-25/1537847061004.jpg', '2018-09-26 13:29:37', '中国,陕西省,西安市,长安区', '34.15775', '108.90688', '梁志11强', null, null, '2', '10', '1.00', null, '9', '2018-09-18 02:49:30', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('7632829c23874efd8901736a4450a5a6', '462bbd2e610b4cfdb926dd9dfefda938', 'pawn', null, null, null, '李四', null, '0', null, '2011-09-12 16:00:00', null, null, null, '610272772727271727', 'PASSPORT', 'zaixiaosheng', '0', '0', null, 'manzu', '6', '2018-09-13 05:01:23', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('7c680b282d9e4b7a962fcba1938462aa', 'e97b4c08102a4144b531abddbf2a4a83', 'lzqlzq1', null, 'NORMAL', null, 'lzqlzq', null, '0', '/images/user.png', '2015-09-11 13:47:54', null, null, null, '369789456123456', 'PASSPORT', 'zaixiaosheng', '0', '10', null, 'manzu', '5', '2018-09-14 07:42:05', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('9ac230a42f034e4b9ad4c146a66bb85b', 'ee969b718ecc4de3b1084c47398aca26', 'bear', '0388982f7b4a4095bdaf7b5d7b3146a0', 'NORMAL', null, '王二', null, '0', null, '1993-09-08 16:00:00', null, null, null, '6110030333222121', 'PASSPORT', 'zaixiaosheng', '0', null, null, 'manzu', null, '2018-09-03 10:18:01', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('a530aa14727c4336bef857fdde68274a', 'aeea839ce68840049d12b2a44161f624', 'guest', '', null, null, 'zhang', null, '0', null, '2018-07-31 16:00:00', null, null, null, '11111111111111111', 'IDCARD', 'zaixiaosheng', '0', null, null, 'manzu', null, '2018-08-31 03:37:00', null, 'HOLD');
INSERT INTO `sm_schoolmate` VALUES ('db1dc545680d48dc998fcc2f09841b1c', '19e59ffad0074d79942aaca3c3daa69f', '159263', null, 'NORMAL', null, '123as', null, '0', '/images/user.png', null, null, null, null, '123111112131231231', null, null, '0', null, null, null, null, '2018-09-18 06:08:50', null, 'NORMAL');
INSERT INTO `sm_schoolmate` VALUES ('e712beb5ba864fc9bff66948c5cbd8a6', 'b65b6406d90748a1a8edaffbe5b07555', 'lzaq1', null, 'NORMAL', null, '梁志强', null, '0', '/upload/file/smSchoolmate/2018-09-17/1537178639900.jpg', null, null, null, null, '123456789', null, null, '0', null, null, null, null, '2018-09-17 06:39:23', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_schoolmate_friend
-- ----------------------------
DROP TABLE IF EXISTS `sm_schoolmate_friend`;
CREATE TABLE `sm_schoolmate_friend` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `friend_user_id` varchar(64) DEFAULT NULL,
  `friend_name` varchar(64) DEFAULT NULL,
  `friend_photo` varchar(1024) DEFAULT NULL,
  `friend_type` varchar(64) DEFAULT NULL,
  `friend_username` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_schoolmate_friend
-- ----------------------------
INSERT INTO `sm_schoolmate_friend` VALUES ('1', '0e207e95eb9d4f3985120ec7d5528013', 'test1', '0bd4ad9ee64b4b73bbfb9b7dbba6ba41', '方涛', 'http://pic.qiantucdn.com/58pic/27/31/46/81p58PICYvR_1024.jpg!qt324', 'NORMAL', 'guest', '2018-09-14 16:21:54', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_schoolmate_prove
-- ----------------------------
DROP TABLE IF EXISTS `sm_schoolmate_prove`;
CREATE TABLE `sm_schoolmate_prove` (
  `id` varchar(64) NOT NULL,
  `start_user_id` varchar(64) DEFAULT NULL,
  `start_username` varchar(64) DEFAULT NULL,
  `prove_user_id` varchar(64) DEFAULT NULL,
  `prove_username` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_schoolmate_prove
-- ----------------------------
INSERT INTO `sm_schoolmate_prove` VALUES ('0e207e95eb9d4f3985120ec7d5528013', '0e207e95eb9d4f3985120ec7d5528013', 'test1', '0bd4ad9ee64b4b73bbfb9b7dbba6ba41', 'guest', 'PASS', '2018-09-14 16:24:26', null, 'NORMAL');
INSERT INTO `sm_schoolmate_prove` VALUES ('a1700e8ee885442b95e750e97c31d8f3', null, null, 'cf8d45120d4e4eee9532e7022081215d', 'lzqlzq', null, '2018-09-21 01:27:41', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_schoolmate_temp
-- ----------------------------
DROP TABLE IF EXISTS `sm_schoolmate_temp`;
CREATE TABLE `sm_schoolmate_temp` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sex` varchar(64) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `card_num` varchar(32) DEFAULT NULL,
  `card_type` varchar(32) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `native_place` varchar(64) DEFAULT NULL,
  `nation` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `school` varchar(64) DEFAULT NULL,
  `college` varchar(64) DEFAULT NULL,
  `academy` varchar(64) DEFAULT NULL,
  `series` varchar(64) DEFAULT NULL,
  `specialty` varchar(64) DEFAULT NULL,
  `smclass` varchar(64) DEFAULT NULL,
  `degree` varchar(64) DEFAULT NULL,
  `degreetype` varchar(64) DEFAULT NULL,
  `studentid` varchar(64) DEFAULT NULL,
  `schoollen` varchar(64) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `workplace` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `card_Issue_count` int(11) DEFAULT '0' COMMENT '发卡次数',
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_schoolmate_temp
-- ----------------------------
INSERT INTO `sm_schoolmate_temp` VALUES ('030ea01edb8344fab00ffe331ddf6b47', '王二', '男', '1992-02-20 00:00:00', '616161661616161616', '身份证', null, null, null, null, '大学', '', '潇湘书院', '计科系', null, null, null, null, '100331', null, null, null, '401345807@qq.com', null, '第8内容3', '5', '2018-08-30 08:31:22', null, 'NORMAL');
INSERT INTO `sm_schoolmate_temp` VALUES ('07e92075c25a459bb8df725f520dbf4c', '张三', '女', '1992-02-20 00:00:00', '112312312312312', '护照', null, null, null, null, '大学', null, '潇湘书院', '计科系', null, null, null, null, '100332', null, null, null, 'suyupeng@aliyun.com', null, '第3内容3', '4', '2018-08-30 08:31:00', null, 'NORMAL');
INSERT INTO `sm_schoolmate_temp` VALUES ('148d7f4e08d949dd914164e0ea5f2c6d', '2', '3', null, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', null, null, '', '1', '1', '0', '2018-09-04 12:23:05', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('1db5b62c9cc443c79c5ae17ec6f0d8ba', '王三', '男', '2017-02-02 16:00:00', '身份证', '610525199103292000', '在校生', '陕西省/西安市', '汉族', '陕西省/西安市', '长安大学', '计科院', null, '计科系', '计算机网络', '102', '本科', '1', '1', '1', '2017-02-02 16:00:00', '2017-02-02 16:00:00', '735031272@qq.com', '1', '13727272727', '1', '2018-09-18 07:14:01', null, 'NORMAL');
INSERT INTO `sm_schoolmate_temp` VALUES ('20b7d35071834a7cb5b7c527dbfd46ff', '第7内容1', '第7内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第7内容3', '0', '2018-08-30 08:31:00', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('232bba062b83411d8a92cea7c8de2546', '第4内容1', '第4内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第4内容3', '0', '2018-08-30 08:31:22', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('249a61b89195421592559552e87721a6', '第8内容1', '第8内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第8内容3', '0', '2018-08-30 08:31:00', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('2dffe44a1eef4d8892f6a3009d740597', '第6内容1', '第6内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第6内容3', '0', '2018-08-30 08:31:00', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('338d8a663ba84ff780ef29e52ae14729', '第0内容1', '第0内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第0内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('33f2bfbda0d2427992cff3921ae9c307', '第8内容1', '第8内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第8内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('3611fc4c430f4c27986eff50a280e33a', '第5内容1', '第5内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第5内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('3a63a3bb0e544c4a8f080ce452e5f908', '第4内容1', '第4内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第4内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('3f848d17359145b68e83ff6f5ad350c0', '王三锤', '3', '2017-02-02 16:00:00', '1', '1', '1', '1', '1', '1', null, null, null, null, '1', '1', '1', '1', '1', '1', '2017-02-02 16:00:00', '2017-02-02 16:00:00', '', '1', '1', '0', '2018-09-05 02:26:49', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('5120aeab49eb4129b85f9812ff015631', '第8内容1', '第8内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第8内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('59d7abdeffd64cbea50ec2f692b62da2', '第1内容1', '第1内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第1内容3', '0', '2018-08-30 08:31:22', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('6065661254df4902812a8c176e67c850', '第1内容1', '第1内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第1内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('6813c820d39846bbafa7b31c8714975e', '第1内容1', '第1内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第1内容3', '0', '2018-08-30 08:31:00', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('698ca06b7bad420dac24d1ccb84dbb84', '第5内容1', '第5内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第5内容3', '0', '2018-08-30 08:31:00', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('734dc23df67d4c89849d5625b6af094e', '2', '3', '2017-02-02 16:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-02-02 16:00:00', '2017-02-02 16:00:00', '', '1', '1', '0', '2018-09-05 01:13:30', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('735054f1836643dea439552c37531d6f', '第0内容1', '第0内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第0内容3', '0', '2018-08-30 08:31:00', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('773e04cfce0e43ce8143c460bab6ba46', '第4内容1', '第4内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第4内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('7f511a3229684b659b511ca8a5420ca3', '第0内容1', '第0内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第0内容3', '0', '2018-08-30 08:31:22', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('80ca5cab4cca4010940186b467ee84f1', '第5内容1', '第5内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第5内容3', '0', '2018-08-30 08:31:22', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('82fc50748d214de6b411db00c45e0e92', '王二锤', '3', '2017-02-02 16:00:00', '1', '1', '1', '1', '1', '1', null, null, null, null, '1', '1', '1', '1', '1', '1', '2017-02-02 16:00:00', '2017-02-02 16:00:00', '', '1', '1', '0', '2018-09-05 01:24:56', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('8382a986e22a4911aa6b6fc447dd183f', '第6内容1', '第6内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第6内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('8bb38cfb15e340b6a8411c0c55f002ec', '王三锤', '3', '2017-02-02 16:00:00', '1', '1', '1', '1', '1', '1', null, null, null, null, '1', '1', '1', '1', '1', '1', '2017-02-02 16:00:00', '2017-02-02 16:00:00', '', '1', '1', '0', '2018-09-06 01:16:53', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('8c9605b3dcbe42c68b14d19ccc8fd5cf', '第2内容1', '第2内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第2内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('95df42ac47be49e1b4a4c72a1b8369b6', '第3内容1', '第3内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第3内容3', '0', '2018-08-30 08:31:22', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('975b118088f94030b66e0327d9775b93', '第2内容1', '第2内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第2内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('a0b8e1ab61454fd18ed3fdc3cdf2af37', '第5内容1', '第5内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第5内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('a669a8b0625a4bee9403da77ab0cbca5', '第1内容1', '第1内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第1内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('a6f3b829fd6245a0aafc4d4e2f35c869', '第4内容1', '第4内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第4内容3', '0', '2018-08-30 08:31:00', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('b627efdc07ea450f8eea899221d72d24', '2', '3', '2017-02-02 16:00:00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-02-02 16:00:00', '2017-02-02 16:00:00', '', '1', '1', '0', '2018-09-05 01:20:54', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('b69d14b837eb477f95a56c2cd53e1bd9', '第3内容1', '第3内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第3内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('bda64e92e60447b887039336764da16c', '第2内容1', '第2内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第2内容3', '0', '2018-08-30 08:31:00', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('d12ed23c032b4c86968a387ad4028734', '第6内容1', '第6内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第6内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('d7d6f7c1a6644c3dbb5384a64dc7ce45', '王三', '男', '2017-02-02 16:00:00', '身份证', '610525199103292000', '在校生', '陕西省/西安市', '汉族', '陕西省/西安市', '长安大学', '计科院', null, '计科系', '计算机网络', '102', '本科', '1', '1', '1', '2017-02-02 16:00:00', '2017-02-02 16:00:00', '735031272@qq.com', '1', '13727272727', '0', '2018-09-18 07:11:54', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('da40f581ed69430d807d5b073e80a3dc', '第7内容1', '第7内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第7内容3', '0', '2018-08-30 08:39:44', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('dc0c029f0a0c4a1d9f4d166b350b95be', '王大锤', '男', '2017-02-02 16:00:00', '123456789123456789', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '2017-02-02 16:00:00', '2017-02-02 16:00:00', '', '1', '1', '0', '2018-09-05 01:21:45', null, 'NORMAL');
INSERT INTO `sm_schoolmate_temp` VALUES ('debfdb4aeaee47568fb9e9a2c4f3ddf7', '第6内容1', '第6内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第6内容3', '0', '2018-08-30 08:31:22', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('e4f9d66292964c9d9f9a39a805eb4400', '第7内容1', '第7内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第7内容3', '0', '2018-08-30 08:31:22', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('e537a0e48efa43b497419e0bc442acca', '第7内容1', '第7内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第7内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('e5493db5c3f54f0e8441ce9ecbd66db1', '第3内容1', '第3内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第3内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('e7deb16fd9c64a3ab15173ddafb21fc9', '第0内容1', '第0内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第0内容3', '0', '2018-08-30 08:53:29', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('f696fd5617324967a562e7cfc84134e0', '123', '123', '2009-09-08 16:00:00', '123123123', '身份证', '无', '123asd', '123asd', '1阿斯达', '123', '123', '123', '123', '312', '312', '3123', '2132', '123', '123', '2009-09-15 16:00:00', '2013-10-03 16:00:00', '', null, '123123123', '0', '2018-09-04 06:36:13', null, 'HOLD');
INSERT INTO `sm_schoolmate_temp` VALUES ('f9bd95a19ea94a33bff71e03a9c77636', '第2内容1', '第2内容2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', null, '第2内容3', '0', '2018-08-30 08:31:22', null, 'HOLD');

-- ----------------------------
-- Table structure for sm_social
-- ----------------------------
DROP TABLE IF EXISTS `sm_social`;
CREATE TABLE `sm_social` (
  `id` varchar(64) NOT NULL,
  `sys_user_id` varchar(64) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `position` varchar(64) DEFAULT NULL,
  `infoval` varchar(512) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT '0',
  `flag` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_social
-- ----------------------------
INSERT INTO `sm_social` VALUES ('28b1948566074f5882f2344d58cdcf79', '123123', 'test1', '0', null, null, '2018-08-22 00:00:00', null, '政治面貌', '2018-08-22 03:10:01', '123123', 'NORMAL');
INSERT INTO `sm_social` VALUES ('57b5d5b824a44246ab36ea7dddac93ae', '123123', 'test1', '打发打发', '阿道夫', '圣达菲', '2018-08-21 00:00:00', '2018-08-21 00:00:00', '社会兼职', '2018-08-22 03:11:29', '0', 'NORMAL');

-- ----------------------------
-- Table structure for sm_star
-- ----------------------------
DROP TABLE IF EXISTS `sm_star`;
CREATE TABLE `sm_star` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `info_level` int(11) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_star
-- ----------------------------
INSERT INTO `sm_star` VALUES ('23005734c9f24e82bb1f671e679111ed', '一星', '1', null, '2018-09-12 03:41:50', '一星', 'NORMAL');
INSERT INTO `sm_star` VALUES ('7f3520bd10294810a0aef32617667362', '二星', '2', null, '2018-09-12 03:44:30', '二星', 'NORMAL');
INSERT INTO `sm_star` VALUES ('ece6176713624bd2bbf0de2fea69d763', '三星', '3', null, '2018-09-12 09:43:08', null, 'HOLD');
INSERT INTO `sm_star` VALUES ('27799b8919b74380b17913927ee2ea91', '三星', '3', null, '2018-09-13 02:27:22', null, 'HOLD');
INSERT INTO `sm_star` VALUES ('e2eac95b09a64712b535db0133242260', '三星', '3', null, '2018-09-13 10:36:52', null, 'HOLD');
INSERT INTO `sm_star` VALUES ('55e811f72dbf4ef9abdcde96c45dca10', '三星', '3', null, '2018-09-21 02:25:48', null, 'NORMAL');

-- ----------------------------
-- Table structure for sm_star_sminfo
-- ----------------------------
DROP TABLE IF EXISTS `sm_star_sminfo`;
CREATE TABLE `sm_star_sminfo` (
  `id` varchar(64) NOT NULL,
  `sm_star_id` varchar(64) DEFAULT NULL,
  `sm_sminfo_id` varchar(64) DEFAULT NULL,
  `sm_sminfo_code` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_star_sminfo
-- ----------------------------
INSERT INTO `sm_star_sminfo` VALUES ('15cb5cb4950f43019bb0742a67d8c4c8', '7f3520bd10294810a0aef32617667362', '联系方式', 'CONTACTINFO', '2018-09-12 05:59:46', '联系资料', 'NORMAL');
INSERT INTO `sm_star_sminfo` VALUES ('33b1e77f0b3b4501b498c1414a25ff35', '7f3520bd10294810a0aef32617667362', '基本资料', 'BASEINFO', '2018-09-12 05:58:54', '基本资料', 'NORMAL');
INSERT INTO `sm_star_sminfo` VALUES ('4b6be077303644d190a52a261339206d', '55e811f72dbf4ef9abdcde96c45dca10', '通讯地址信息', 'ADDRESSINFO', '2018-09-26 05:45:43', '通讯地址信息', 'NORMAL');
INSERT INTO `sm_star_sminfo` VALUES ('795f721248674b4ea6a0cbfba650eb94', '55e811f72dbf4ef9abdcde96c45dca10', '教育经历信息', 'EDUCATIONINFO', '2018-09-26 05:45:43', '教育经历信息', 'NORMAL');
INSERT INTO `sm_star_sminfo` VALUES ('937108fac8c44ff884d031a7362ce782', '55e811f72dbf4ef9abdcde96c45dca10', '管理员审核', 'ADMININFO', '2018-09-26 05:45:43', '管理员审核', 'NORMAL');
INSERT INTO `sm_star_sminfo` VALUES ('a63498fdd89a4d65bb1016a3bac4378e', '23005734c9f24e82bb1f671e679111ed', '基本资料', 'BASEINFO', '2018-09-12 05:57:55', '基本资料', 'NORMAL');
INSERT INTO `sm_star_sminfo` VALUES ('f1c86e5bf69d47bcb57b4080efc982e1', '55e811f72dbf4ef9abdcde96c45dca10', '基本信息', 'BASEINFO', '2018-09-26 05:45:43', '基本信息', 'NORMAL');
INSERT INTO `sm_star_sminfo` VALUES ('fe631174dec04be4a467af7b1746dd66', '55e811f72dbf4ef9abdcde96c45dca10', '联系方式信息', 'CONTACTINFO', '2018-09-26 05:45:43', '联系方式信息', 'NORMAL');

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `parent_ids` varchar(2048) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `sort` decimal(10,0) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('000000', 'Root', null, '中国', '0', '000000', 'PROVINCE', '2018-09-13 18:18:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110000', '000000', null, '北京市', '110000', '110000', 'PROVINCE', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110101', '110000', null, '东城区', '110101', '110101', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110102', '110000', null, '西城区', '110102', '110102', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110105', '110000', null, '朝阳区', '110105', '110105', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110106', '110000', null, '丰台区', '110106', '110106', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110107', '110000', null, '石景山区', '110107', '110107', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110108', '110000', null, '海淀区', '110108', '110108', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110109', '110000', null, '门头沟区', '110109', '110109', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110111', '110000', null, '房山区', '110111', '110111', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110112', '110000', null, '通州区', '110112', '110112', 'CITY', '2018-09-13 09:32:41', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110113', '110000', null, '顺义区', '110113', '110113', 'CITY', '2018-09-13 09:32:43', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110114', '110000', null, '昌平区', '110114', '110114', 'CITY', '2018-09-13 09:32:43', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110115', '110000', null, '大兴区', '110115', '110115', 'CITY', '2018-09-13 09:32:43', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110116', '110000', null, '怀柔区', '110116', '110116', 'CITY', '2018-09-13 09:32:43', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110117', '110000', null, '平谷区', '110117', '110117', 'CITY', '2018-09-13 09:32:43', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110118', '110000', null, '密云区', '110118', '110118', 'CITY', '2018-09-13 09:32:43', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('110119', '110000', null, '延庆区', '110119', '110119', 'CITY', '2018-09-13 09:32:43', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120000', '000000', null, '天津市', '120000', '120000', 'PROVINCE', '2018-09-13 09:32:43', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120101', '120000', null, '和平区', '120101', '120101', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120102', '120000', null, '河东区', '120102', '120102', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120103', '120000', null, '河西区', '120103', '120103', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120104', '120000', null, '南开区', '120104', '120104', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120105', '120000', null, '河北区', '120105', '120105', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120106', '120000', null, '红桥区', '120106', '120106', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120110', '120000', null, '东丽区', '120110', '120110', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120111', '120000', null, '西青区', '120111', '120111', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120112', '120000', null, '津南区', '120112', '120112', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120113', '120000', null, '北辰区', '120113', '120113', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120114', '120000', null, '武清区', '120114', '120114', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120115', '120000', null, '宝坻区', '120115', '120115', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120116', '120000', null, '滨海新区', '120116', '120116', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120117', '120000', null, '宁河区', '120117', '120117', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120118', '120000', null, '静海区', '120118', '120118', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('120119', '120000', null, '蓟州区', '120119', '120119', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130000', '000000', null, '河北省', '130000', '130000', 'PROVINCE', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130100', '130000', null, '石家庄市', '130100', '130100', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130102', '130100', null, '长安区', '130102', '130102', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130104', '130100', null, '桥西区', '130104', '130104', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130105', '130100', null, '新华区', '130105', '130105', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130107', '130100', null, '井陉矿区', '130107', '130107', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130108', '130100', null, '裕华区', '130108', '130108', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130109', '130100', null, '藁城区', '130109', '130109', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130110', '130100', null, '鹿泉区', '130110', '130110', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130111', '130100', null, '栾城区', '130111', '130111', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130121', '130100', null, '井陉县', '130121', '130121', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130123', '130100', null, '正定县', '130123', '130123', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130125', '130100', null, '行唐县', '130125', '130125', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130126', '130100', null, '灵寿县', '130126', '130126', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130127', '130100', null, '高邑县', '130127', '130127', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130128', '130100', null, '深泽县', '130128', '130128', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130129', '130100', null, '赞皇县', '130129', '130129', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130130', '130100', null, '无极县', '130130', '130130', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130131', '130100', null, '平山县', '130131', '130131', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130132', '130100', null, '元氏县', '130132', '130132', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130133', '130100', null, '赵县', '130133', '130133', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130181', '130100', null, '辛集市', '130181', '130181', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130183', '130100', null, '晋州市', '130183', '130183', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130184', '130100', null, '新乐市', '130184', '130184', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130200', '130000', null, '唐山市', '130200', '130200', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130202', '130200', null, '路南区', '130202', '130202', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130203', '130200', null, '路北区', '130203', '130203', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130204', '130200', null, '古冶区', '130204', '130204', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130205', '130200', null, '开平区', '130205', '130205', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130207', '130200', null, '丰南区', '130207', '130207', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130208', '130200', null, '丰润区', '130208', '130208', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130209', '130200', null, '曹妃甸区', '130209', '130209', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130223', '130200', null, '滦县', '130223', '130223', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130224', '130200', null, '滦南县', '130224', '130224', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130225', '130200', null, '乐亭县', '130225', '130225', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130227', '130200', null, '迁西县', '130227', '130227', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130229', '130200', null, '玉田县', '130229', '130229', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130281', '130200', null, '遵化市', '130281', '130281', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130283', '130200', null, '迁安市', '130283', '130283', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130300', '130000', null, '秦皇岛市', '130300', '130300', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130302', '130300', null, '海港区', '130302', '130302', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130303', '130300', null, '山海关区', '130303', '130303', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130304', '130300', null, '北戴河区', '130304', '130304', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130306', '130300', null, '抚宁区', '130306', '130306', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130321', '130300', null, '青龙满族自治县', '130321', '130321', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130322', '130300', null, '昌黎县', '130322', '130322', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130324', '130300', null, '卢龙县', '130324', '130324', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130400', '130000', null, '邯郸市', '130400', '130400', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130402', '130400', null, '邯山区', '130402', '130402', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130403', '130400', null, '丛台区', '130403', '130403', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130404', '130400', null, '复兴区', '130404', '130404', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130406', '130400', null, '峰峰矿区', '130406', '130406', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130407', '130400', null, '肥乡区', '130407', '130407', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130408', '130400', null, '永年区', '130408', '130408', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130423', '130400', null, '临漳县', '130423', '130423', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130424', '130400', null, '成安县', '130424', '130424', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130425', '130400', null, '大名县', '130425', '130425', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130426', '130400', null, '涉县', '130426', '130426', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130427', '130400', null, '磁县', '130427', '130427', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130430', '130400', null, '邱县', '130430', '130430', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130431', '130400', null, '鸡泽县', '130431', '130431', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130432', '130400', null, '广平县', '130432', '130432', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130433', '130400', null, '馆陶县', '130433', '130433', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130434', '130400', null, '魏县', '130434', '130434', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130435', '130400', null, '曲周县', '130435', '130435', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130481', '130400', null, '武安市', '130481', '130481', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130500', '130000', null, '邢台市', '130500', '130500', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130502', '130500', null, '桥东区', '130502', '130502', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130503', '130500', null, '桥西区', '130503', '130503', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130521', '130500', null, '邢台县', '130521', '130521', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130522', '130500', null, '临城县', '130522', '130522', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130523', '130500', null, '内丘县', '130523', '130523', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130524', '130500', null, '柏乡县', '130524', '130524', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130525', '130500', null, '隆尧县', '130525', '130525', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130526', '130500', null, '任县', '130526', '130526', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130527', '130500', null, '南和县', '130527', '130527', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130528', '130500', null, '宁晋县', '130528', '130528', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130529', '130500', null, '巨鹿县', '130529', '130529', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130530', '130500', null, '新河县', '130530', '130530', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130531', '130500', null, '广宗县', '130531', '130531', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130532', '130500', null, '平乡县', '130532', '130532', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130533', '130500', null, '威县', '130533', '130533', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130534', '130500', null, '清河县', '130534', '130534', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130535', '130500', null, '临西县', '130535', '130535', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130581', '130500', null, '南宫市', '130581', '130581', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130582', '130500', null, '沙河市', '130582', '130582', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130600', '130000', null, '保定市', '130600', '130600', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130602', '130600', null, '竞秀区', '130602', '130602', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130606', '130600', null, '莲池区', '130606', '130606', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130607', '130600', null, '满城区', '130607', '130607', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130608', '130600', null, '清苑区', '130608', '130608', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130609', '130600', null, '徐水区', '130609', '130609', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130623', '130600', null, '涞水县', '130623', '130623', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130624', '130600', null, '阜平县', '130624', '130624', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130626', '130600', null, '定兴县', '130626', '130626', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130627', '130600', null, '唐县', '130627', '130627', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130628', '130600', null, '高阳县', '130628', '130628', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130629', '130600', null, '容城县', '130629', '130629', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130630', '130600', null, '涞源县', '130630', '130630', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130631', '130600', null, '望都县', '130631', '130631', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130632', '130600', null, '安新县', '130632', '130632', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130633', '130600', null, '易县', '130633', '130633', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130634', '130600', null, '曲阳县', '130634', '130634', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130635', '130600', null, '蠡县', '130635', '130635', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130636', '130600', null, '顺平县', '130636', '130636', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130637', '130600', null, '博野县', '130637', '130637', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130638', '130600', null, '雄县', '130638', '130638', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130681', '130600', null, '涿州市', '130681', '130681', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130682', '130600', null, '定州市', '130682', '130682', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130683', '130600', null, '安国市', '130683', '130683', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130684', '130600', null, '高碑店市', '130684', '130684', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130700', '130000', null, '张家口市', '130700', '130700', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130702', '130700', null, '桥东区', '130702', '130702', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130703', '130700', null, '桥西区', '130703', '130703', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130705', '130700', null, '宣化区', '130705', '130705', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130706', '130700', null, '下花园区', '130706', '130706', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130708', '130700', null, '万全区', '130708', '130708', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130709', '130700', null, '崇礼区', '130709', '130709', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130722', '130700', null, '张北县', '130722', '130722', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130723', '130700', null, '康保县', '130723', '130723', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130724', '130700', null, '沽源县', '130724', '130724', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130725', '130700', null, '尚义县', '130725', '130725', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130726', '130700', null, '蔚县', '130726', '130726', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130727', '130700', null, '阳原县', '130727', '130727', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130728', '130700', null, '怀安县', '130728', '130728', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130730', '130700', null, '怀来县', '130730', '130730', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130731', '130700', null, '涿鹿县', '130731', '130731', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130732', '130700', null, '赤城县', '130732', '130732', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130800', '130000', null, '承德市', '130800', '130800', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130802', '130800', null, '双桥区', '130802', '130802', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130803', '130800', null, '双滦区', '130803', '130803', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130804', '130800', null, '鹰手营子矿区', '130804', '130804', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130821', '130800', null, '承德县', '130821', '130821', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130822', '130800', null, '兴隆县', '130822', '130822', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130824', '130800', null, '滦平县', '130824', '130824', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130825', '130800', null, '隆化县', '130825', '130825', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130826', '130800', null, '丰宁满族自治县', '130826', '130826', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130827', '130800', null, '宽城满族自治县', '130827', '130827', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130828', '130800', null, '围场满族蒙古族自治县', '130828', '130828', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130881', '130800', null, '平泉市', '130881', '130881', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130900', '130000', null, '沧州市', '130900', '130900', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130902', '130900', null, '新华区', '130902', '130902', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130903', '130900', null, '运河区', '130903', '130903', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130921', '130900', null, '沧县', '130921', '130921', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130922', '130900', null, '青县', '130922', '130922', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130923', '130900', null, '东光县', '130923', '130923', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130924', '130900', null, '海兴县', '130924', '130924', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130925', '130900', null, '盐山县', '130925', '130925', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130926', '130900', null, '肃宁县', '130926', '130926', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130927', '130900', null, '南皮县', '130927', '130927', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130928', '130900', null, '吴桥县', '130928', '130928', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130929', '130900', null, '献县', '130929', '130929', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130930', '130900', null, '孟村回族自治县', '130930', '130930', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130981', '130900', null, '泊头市', '130981', '130981', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130982', '130900', null, '任丘市', '130982', '130982', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130983', '130900', null, '黄骅市', '130983', '130983', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('130984', '130900', null, '河间市', '130984', '130984', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131000', '130000', null, '廊坊市', '131000', '131000', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131002', '131000', null, '安次区', '131002', '131002', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131003', '131000', null, '广阳区', '131003', '131003', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131022', '131000', null, '固安县', '131022', '131022', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131023', '131000', null, '永清县', '131023', '131023', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131024', '131000', null, '香河县', '131024', '131024', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131025', '131000', null, '大城县', '131025', '131025', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131026', '131000', null, '文安县', '131026', '131026', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131028', '131000', null, '大厂回族自治县', '131028', '131028', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131081', '131000', null, '霸州市', '131081', '131081', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131082', '131000', null, '三河市', '131082', '131082', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131100', '130000', null, '衡水市', '131100', '131100', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131102', '131100', null, '桃城区', '131102', '131102', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131103', '131100', null, '冀州区', '131103', '131103', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131121', '131100', null, '枣强县', '131121', '131121', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131122', '131100', null, '武邑县', '131122', '131122', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131123', '131100', null, '武强县', '131123', '131123', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131124', '131100', null, '饶阳县', '131124', '131124', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131125', '131100', null, '安平县', '131125', '131125', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131126', '131100', null, '故城县', '131126', '131126', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131127', '131100', null, '景县', '131127', '131127', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131128', '131100', null, '阜城县', '131128', '131128', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('131182', '131100', null, '深州市', '131182', '131182', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140000', '000000', null, '山西省', '140000', '140000', 'PROVINCE', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140100', '140000', null, '太原市', '140100', '140100', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140105', '140100', null, '小店区', '140105', '140105', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140106', '140100', null, '迎泽区', '140106', '140106', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140107', '140100', null, '杏花岭区', '140107', '140107', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140108', '140100', null, '尖草坪区', '140108', '140108', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140109', '140100', null, '万柏林区', '140109', '140109', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140110', '140100', null, '晋源区', '140110', '140110', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140121', '140100', null, '清徐县', '140121', '140121', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140122', '140100', null, '阳曲县', '140122', '140122', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140123', '140100', null, '娄烦县', '140123', '140123', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140181', '140100', null, '古交市', '140181', '140181', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140200', '140000', null, '大同市', '140200', '140200', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140212', '140200', null, '新荣区', '140212', '140212', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140213', '140200', null, '平城区', '140213', '140213', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140214', '140200', null, '云冈区', '140214', '140214', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140215', '140200', null, '云州区', '140215', '140215', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140221', '140200', null, '阳高县', '140221', '140221', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140222', '140200', null, '天镇县', '140222', '140222', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140223', '140200', null, '广灵县', '140223', '140223', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140224', '140200', null, '灵丘县', '140224', '140224', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140225', '140200', null, '浑源县', '140225', '140225', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140226', '140200', null, '左云县', '140226', '140226', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140300', '140000', null, '阳泉市', '140300', '140300', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140302', '140300', null, '城区', '140302', '140302', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140303', '140300', null, '矿区', '140303', '140303', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140311', '140300', null, '郊区', '140311', '140311', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140321', '140300', null, '平定县', '140321', '140321', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140322', '140300', null, '盂县', '140322', '140322', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140400', '140000', null, '长治市', '140400', '140400', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140402', '140400', null, '城区', '140402', '140402', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140411', '140400', null, '郊区', '140411', '140411', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140421', '140400', null, '长治县', '140421', '140421', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140423', '140400', null, '襄垣县', '140423', '140423', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140424', '140400', null, '屯留县', '140424', '140424', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140425', '140400', null, '平顺县', '140425', '140425', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140426', '140400', null, '黎城县', '140426', '140426', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140427', '140400', null, '壶关县', '140427', '140427', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140428', '140400', null, '长子县', '140428', '140428', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140429', '140400', null, '武乡县', '140429', '140429', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140430', '140400', null, '沁县', '140430', '140430', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140431', '140400', null, '沁源县', '140431', '140431', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140481', '140400', null, '潞城市', '140481', '140481', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140500', '140000', null, '晋城市', '140500', '140500', 'CITY', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140502', '140500', null, '城区', '140502', '140502', 'TOWN', '2018-09-13 09:32:44', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140521', '140500', null, '沁水县', '140521', '140521', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140522', '140500', null, '阳城县', '140522', '140522', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140524', '140500', null, '陵川县', '140524', '140524', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140525', '140500', null, '泽州县', '140525', '140525', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140581', '140500', null, '高平市', '140581', '140581', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140600', '140000', null, '朔州市', '140600', '140600', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140602', '140600', null, '朔城区', '140602', '140602', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140603', '140600', null, '平鲁区', '140603', '140603', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140621', '140600', null, '山阴县', '140621', '140621', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140622', '140600', null, '应县', '140622', '140622', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140623', '140600', null, '右玉县', '140623', '140623', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140624', '140600', null, '怀仁县', '140624', '140624', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140700', '140000', null, '晋中市', '140700', '140700', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140702', '140700', null, '榆次区', '140702', '140702', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140721', '140700', null, '榆社县', '140721', '140721', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140722', '140700', null, '左权县', '140722', '140722', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140723', '140700', null, '和顺县', '140723', '140723', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140724', '140700', null, '昔阳县', '140724', '140724', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140725', '140700', null, '寿阳县', '140725', '140725', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140726', '140700', null, '太谷县', '140726', '140726', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140727', '140700', null, '祁县', '140727', '140727', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140728', '140700', null, '平遥县', '140728', '140728', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140729', '140700', null, '灵石县', '140729', '140729', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140781', '140700', null, '介休市', '140781', '140781', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140800', '140000', null, '运城市', '140800', '140800', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140802', '140800', null, '盐湖区', '140802', '140802', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140821', '140800', null, '临猗县', '140821', '140821', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140822', '140800', null, '万荣县', '140822', '140822', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140823', '140800', null, '闻喜县', '140823', '140823', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140824', '140800', null, '稷山县', '140824', '140824', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140825', '140800', null, '新绛县', '140825', '140825', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140826', '140800', null, '绛县', '140826', '140826', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140827', '140800', null, '垣曲县', '140827', '140827', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140828', '140800', null, '夏县', '140828', '140828', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140829', '140800', null, '平陆县', '140829', '140829', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140830', '140800', null, '芮城县', '140830', '140830', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140881', '140800', null, '永济市', '140881', '140881', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140882', '140800', null, '河津市', '140882', '140882', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140900', '140000', null, '忻州市', '140900', '140900', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140902', '140900', null, '忻府区', '140902', '140902', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140921', '140900', null, '定襄县', '140921', '140921', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140922', '140900', null, '五台县', '140922', '140922', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140923', '140900', null, '代县', '140923', '140923', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140924', '140900', null, '繁峙县', '140924', '140924', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140925', '140900', null, '宁武县', '140925', '140925', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140926', '140900', null, '静乐县', '140926', '140926', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140927', '140900', null, '神池县', '140927', '140927', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140928', '140900', null, '五寨县', '140928', '140928', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140929', '140900', null, '岢岚县', '140929', '140929', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140930', '140900', null, '河曲县', '140930', '140930', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140931', '140900', null, '保德县', '140931', '140931', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140932', '140900', null, '偏关县', '140932', '140932', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('140981', '140900', null, '原平市', '140981', '140981', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141000', '140000', null, '临汾市', '141000', '141000', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141002', '141000', null, '尧都区', '141002', '141002', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141021', '141000', null, '曲沃县', '141021', '141021', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141022', '141000', null, '翼城县', '141022', '141022', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141023', '141000', null, '襄汾县', '141023', '141023', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141024', '141000', null, '洪洞县', '141024', '141024', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141025', '141000', null, '古县', '141025', '141025', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141026', '141000', null, '安泽县', '141026', '141026', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141027', '141000', null, '浮山县', '141027', '141027', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141028', '141000', null, '吉县', '141028', '141028', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141029', '141000', null, '乡宁县', '141029', '141029', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141030', '141000', null, '大宁县', '141030', '141030', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141031', '141000', null, '隰县', '141031', '141031', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141032', '141000', null, '永和县', '141032', '141032', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141033', '141000', null, '蒲县', '141033', '141033', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141034', '141000', null, '汾西县', '141034', '141034', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141081', '141000', null, '侯马市', '141081', '141081', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141082', '141000', null, '霍州市', '141082', '141082', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141100', '140000', null, '吕梁市', '141100', '141100', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141102', '141100', null, '离石区', '141102', '141102', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141121', '141100', null, '文水县', '141121', '141121', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141122', '141100', null, '交城县', '141122', '141122', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141123', '141100', null, '兴县', '141123', '141123', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141124', '141100', null, '临县', '141124', '141124', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141125', '141100', null, '柳林县', '141125', '141125', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141126', '141100', null, '石楼县', '141126', '141126', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141127', '141100', null, '岚县', '141127', '141127', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141128', '141100', null, '方山县', '141128', '141128', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141129', '141100', null, '中阳县', '141129', '141129', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141130', '141100', null, '交口县', '141130', '141130', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141181', '141100', null, '孝义市', '141181', '141181', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('141182', '141100', null, '汾阳市', '141182', '141182', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150000', '000000', null, '内蒙古自治区', '150000', '150000', 'PROVINCE', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150100', '150000', null, '呼和浩特市', '150100', '150100', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150102', '150100', null, '新城区', '150102', '150102', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150103', '150100', null, '回民区', '150103', '150103', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150104', '150100', null, '玉泉区', '150104', '150104', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150105', '150100', null, '赛罕区', '150105', '150105', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150121', '150100', null, '土默特左旗', '150121', '150121', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150122', '150100', null, '托克托县', '150122', '150122', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150123', '150100', null, '和林格尔县', '150123', '150123', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150124', '150100', null, '清水河县', '150124', '150124', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150125', '150100', null, '武川县', '150125', '150125', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150200', '150000', null, '包头市', '150200', '150200', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150202', '150200', null, '东河区', '150202', '150202', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150203', '150200', null, '昆都仑区', '150203', '150203', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150204', '150200', null, '青山区', '150204', '150204', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150205', '150200', null, '石拐区', '150205', '150205', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150206', '150200', null, '白云鄂博矿区', '150206', '150206', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150207', '150200', null, '九原区', '150207', '150207', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150221', '150200', null, '土默特右旗', '150221', '150221', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150222', '150200', null, '固阳县', '150222', '150222', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150223', '150200', null, '达尔罕茂明安联合旗', '150223', '150223', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150300', '150000', null, '乌海市', '150300', '150300', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150302', '150300', null, '海勃湾区', '150302', '150302', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150303', '150300', null, '海南区', '150303', '150303', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150304', '150300', null, '乌达区', '150304', '150304', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150400', '150000', null, '赤峰市', '150400', '150400', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150402', '150400', null, '红山区', '150402', '150402', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150403', '150400', null, '元宝山区', '150403', '150403', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150404', '150400', null, '松山区', '150404', '150404', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150421', '150400', null, '阿鲁科尔沁旗', '150421', '150421', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150422', '150400', null, '巴林左旗', '150422', '150422', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150423', '150400', null, '巴林右旗', '150423', '150423', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150424', '150400', null, '林西县', '150424', '150424', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150425', '150400', null, '克什克腾旗', '150425', '150425', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150426', '150400', null, '翁牛特旗', '150426', '150426', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150428', '150400', null, '喀喇沁旗', '150428', '150428', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150429', '150400', null, '宁城县', '150429', '150429', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150430', '150400', null, '敖汉旗', '150430', '150430', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150500', '150000', null, '通辽市', '150500', '150500', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150502', '150500', null, '科尔沁区', '150502', '150502', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150521', '150500', null, '科尔沁左翼中旗', '150521', '150521', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150522', '150500', null, '科尔沁左翼后旗', '150522', '150522', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150523', '150500', null, '开鲁县', '150523', '150523', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150524', '150500', null, '库伦旗', '150524', '150524', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150525', '150500', null, '奈曼旗', '150525', '150525', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150526', '150500', null, '扎鲁特旗', '150526', '150526', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150581', '150500', null, '霍林郭勒市', '150581', '150581', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150600', '150000', null, '鄂尔多斯市', '150600', '150600', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150602', '150600', null, '东胜区', '150602', '150602', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150603', '150600', null, '康巴什区', '150603', '150603', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150621', '150600', null, '达拉特旗', '150621', '150621', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150622', '150600', null, '准格尔旗', '150622', '150622', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150623', '150600', null, '鄂托克前旗', '150623', '150623', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150624', '150600', null, '鄂托克旗', '150624', '150624', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150625', '150600', null, '杭锦旗', '150625', '150625', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150626', '150600', null, '乌审旗', '150626', '150626', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150627', '150600', null, '伊金霍洛旗', '150627', '150627', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150700', '150000', null, '呼伦贝尔市', '150700', '150700', 'CITY', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150702', '150700', null, '海拉尔区', '150702', '150702', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150703', '150700', null, '扎赉诺尔区', '150703', '150703', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150721', '150700', null, '阿荣旗', '150721', '150721', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150722', '150700', null, '莫力达瓦达斡尔族自治旗', '150722', '150722', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150723', '150700', null, '鄂伦春自治旗', '150723', '150723', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150724', '150700', null, '鄂温克族自治旗', '150724', '150724', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150725', '150700', null, '陈巴尔虎旗', '150725', '150725', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150726', '150700', null, '新巴尔虎左旗', '150726', '150726', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150727', '150700', null, '新巴尔虎右旗', '150727', '150727', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150781', '150700', null, '满洲里市', '150781', '150781', 'TOWN', '2018-09-13 09:32:45', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150782', '150700', null, '牙克石市', '150782', '150782', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150783', '150700', null, '扎兰屯市', '150783', '150783', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150784', '150700', null, '额尔古纳市', '150784', '150784', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150785', '150700', null, '根河市', '150785', '150785', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150800', '150000', null, '巴彦淖尔市', '150800', '150800', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150802', '150800', null, '临河区', '150802', '150802', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150821', '150800', null, '五原县', '150821', '150821', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150822', '150800', null, '磴口县', '150822', '150822', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150823', '150800', null, '乌拉特前旗', '150823', '150823', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150824', '150800', null, '乌拉特中旗', '150824', '150824', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150825', '150800', null, '乌拉特后旗', '150825', '150825', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150826', '150800', null, '杭锦后旗', '150826', '150826', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150900', '150000', null, '乌兰察布市', '150900', '150900', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150902', '150900', null, '集宁区', '150902', '150902', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150921', '150900', null, '卓资县', '150921', '150921', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150922', '150900', null, '化德县', '150922', '150922', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150923', '150900', null, '商都县', '150923', '150923', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150924', '150900', null, '兴和县', '150924', '150924', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150925', '150900', null, '凉城县', '150925', '150925', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150926', '150900', null, '察哈尔右翼前旗', '150926', '150926', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150927', '150900', null, '察哈尔右翼中旗', '150927', '150927', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150928', '150900', null, '察哈尔右翼后旗', '150928', '150928', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150929', '150900', null, '四子王旗', '150929', '150929', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('150981', '150900', null, '丰镇市', '150981', '150981', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152200', '150000', null, '兴安盟', '152200', '152200', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152201', '152200', null, '乌兰浩特市', '152201', '152201', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152202', '152200', null, '阿尔山市', '152202', '152202', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152221', '152200', null, '科尔沁右翼前旗', '152221', '152221', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152222', '152200', null, '科尔沁右翼中旗', '152222', '152222', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152223', '152200', null, '扎赉特旗', '152223', '152223', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152224', '152200', null, '突泉县', '152224', '152224', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152500', '150000', null, '锡林郭勒盟', '152500', '152500', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152501', '152500', null, '二连浩特市', '152501', '152501', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152502', '152500', null, '锡林浩特市', '152502', '152502', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152522', '152500', null, '阿巴嘎旗', '152522', '152522', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152523', '152500', null, '苏尼特左旗', '152523', '152523', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152524', '152500', null, '苏尼特右旗', '152524', '152524', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152525', '152500', null, '东乌珠穆沁旗', '152525', '152525', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152526', '152500', null, '西乌珠穆沁旗', '152526', '152526', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152527', '152500', null, '太仆寺旗', '152527', '152527', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152528', '152500', null, '镶黄旗', '152528', '152528', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152529', '152500', null, '正镶白旗', '152529', '152529', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152530', '152500', null, '正蓝旗', '152530', '152530', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152531', '152500', null, '多伦县', '152531', '152531', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152900', '150000', null, '阿拉善盟', '152900', '152900', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152921', '152900', null, '阿拉善左旗', '152921', '152921', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152922', '152900', null, '阿拉善右旗', '152922', '152922', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('152923', '152900', null, '额济纳旗', '152923', '152923', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210000', '000000', null, '辽宁省', '210000', '210000', 'PROVINCE', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210100', '210000', null, '沈阳市', '210100', '210100', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210102', '210100', null, '和平区', '210102', '210102', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210103', '210100', null, '沈河区', '210103', '210103', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210104', '210100', null, '大东区', '210104', '210104', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210105', '210100', null, '皇姑区', '210105', '210105', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210106', '210100', null, '铁西区', '210106', '210106', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210111', '210100', null, '苏家屯区', '210111', '210111', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210112', '210100', null, '浑南区', '210112', '210112', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210113', '210100', null, '沈北新区', '210113', '210113', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210114', '210100', null, '于洪区', '210114', '210114', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210115', '210100', null, '辽中区', '210115', '210115', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210123', '210100', null, '康平县', '210123', '210123', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210124', '210100', null, '法库县', '210124', '210124', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210181', '210100', null, '新民市', '210181', '210181', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210200', '210000', null, '大连市', '210200', '210200', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210202', '210200', null, '中山区', '210202', '210202', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210203', '210200', null, '西岗区', '210203', '210203', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210204', '210200', null, '沙河口区', '210204', '210204', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210211', '210200', null, '甘井子区', '210211', '210211', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210212', '210200', null, '旅顺口区', '210212', '210212', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210213', '210200', null, '金州区', '210213', '210213', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210214', '210200', null, '普兰店区', '210214', '210214', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210224', '210200', null, '长海县', '210224', '210224', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210281', '210200', null, '瓦房店市', '210281', '210281', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210283', '210200', null, '庄河市', '210283', '210283', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210300', '210000', null, '鞍山市', '210300', '210300', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210302', '210300', null, '铁东区', '210302', '210302', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210303', '210300', null, '铁西区', '210303', '210303', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210304', '210300', null, '立山区', '210304', '210304', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210311', '210300', null, '千山区', '210311', '210311', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210321', '210300', null, '台安县', '210321', '210321', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210323', '210300', null, '岫岩满族自治县', '210323', '210323', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210381', '210300', null, '海城市', '210381', '210381', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210400', '210000', null, '抚顺市', '210400', '210400', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210402', '210400', null, '新抚区', '210402', '210402', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210403', '210400', null, '东洲区', '210403', '210403', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210404', '210400', null, '望花区', '210404', '210404', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210411', '210400', null, '顺城区', '210411', '210411', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210421', '210400', null, '抚顺县', '210421', '210421', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210422', '210400', null, '新宾满族自治县', '210422', '210422', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210423', '210400', null, '清原满族自治县', '210423', '210423', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210500', '210000', null, '本溪市', '210500', '210500', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210502', '210500', null, '平山区', '210502', '210502', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210503', '210500', null, '溪湖区', '210503', '210503', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210504', '210500', null, '明山区', '210504', '210504', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210505', '210500', null, '南芬区', '210505', '210505', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210521', '210500', null, '本溪满族自治县', '210521', '210521', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210522', '210500', null, '桓仁满族自治县', '210522', '210522', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210600', '210000', null, '丹东市', '210600', '210600', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210602', '210600', null, '元宝区', '210602', '210602', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210603', '210600', null, '振兴区', '210603', '210603', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210604', '210600', null, '振安区', '210604', '210604', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210624', '210600', null, '宽甸满族自治县', '210624', '210624', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210681', '210600', null, '东港市', '210681', '210681', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210682', '210600', null, '凤城市', '210682', '210682', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210700', '210000', null, '锦州市', '210700', '210700', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210702', '210700', null, '古塔区', '210702', '210702', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210703', '210700', null, '凌河区', '210703', '210703', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210711', '210700', null, '太和区', '210711', '210711', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210726', '210700', null, '黑山县', '210726', '210726', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210727', '210700', null, '义县', '210727', '210727', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210781', '210700', null, '凌海市', '210781', '210781', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210782', '210700', null, '北镇市', '210782', '210782', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210800', '210000', null, '营口市', '210800', '210800', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210802', '210800', null, '站前区', '210802', '210802', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210803', '210800', null, '西市区', '210803', '210803', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210804', '210800', null, '鲅鱼圈区', '210804', '210804', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210811', '210800', null, '老边区', '210811', '210811', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210881', '210800', null, '盖州市', '210881', '210881', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210882', '210800', null, '大石桥市', '210882', '210882', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210900', '210000', null, '阜新市', '210900', '210900', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210902', '210900', null, '海州区', '210902', '210902', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210903', '210900', null, '新邱区', '210903', '210903', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210904', '210900', null, '太平区', '210904', '210904', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210905', '210900', null, '清河门区', '210905', '210905', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210911', '210900', null, '细河区', '210911', '210911', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210921', '210900', null, '阜新蒙古族自治县', '210921', '210921', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('210922', '210900', null, '彰武县', '210922', '210922', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211000', '210000', null, '辽阳市', '211000', '211000', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211002', '211000', null, '白塔区', '211002', '211002', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211003', '211000', null, '文圣区', '211003', '211003', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211004', '211000', null, '宏伟区', '211004', '211004', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211005', '211000', null, '弓长岭区', '211005', '211005', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211011', '211000', null, '太子河区', '211011', '211011', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211021', '211000', null, '辽阳县', '211021', '211021', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211081', '211000', null, '灯塔市', '211081', '211081', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211100', '210000', null, '盘锦市', '211100', '211100', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211102', '211100', null, '双台子区', '211102', '211102', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211103', '211100', null, '兴隆台区', '211103', '211103', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211104', '211100', null, '大洼区', '211104', '211104', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211122', '211100', null, '盘山县', '211122', '211122', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211200', '210000', null, '铁岭市', '211200', '211200', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211202', '211200', null, '银州区', '211202', '211202', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211204', '211200', null, '清河区', '211204', '211204', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211221', '211200', null, '铁岭县', '211221', '211221', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211223', '211200', null, '西丰县', '211223', '211223', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211224', '211200', null, '昌图县', '211224', '211224', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211281', '211200', null, '调兵山市', '211281', '211281', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211282', '211200', null, '开原市', '211282', '211282', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211300', '210000', null, '朝阳市', '211300', '211300', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211302', '211300', null, '双塔区', '211302', '211302', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211303', '211300', null, '龙城区', '211303', '211303', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211321', '211300', null, '朝阳县', '211321', '211321', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211322', '211300', null, '建平县', '211322', '211322', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211324', '211300', null, '喀喇沁左翼蒙古族自治县', '211324', '211324', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211381', '211300', null, '北票市', '211381', '211381', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211382', '211300', null, '凌源市', '211382', '211382', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211400', '210000', null, '葫芦岛市', '211400', '211400', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211402', '211400', null, '连山区', '211402', '211402', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211403', '211400', null, '龙港区', '211403', '211403', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211404', '211400', null, '南票区', '211404', '211404', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211421', '211400', null, '绥中县', '211421', '211421', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211422', '211400', null, '建昌县', '211422', '211422', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('211481', '211400', null, '兴城市', '211481', '211481', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220000', '000000', null, '吉林省', '220000', '220000', 'PROVINCE', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220100', '220000', null, '长春市', '220100', '220100', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220102', '220100', null, '南关区', '220102', '220102', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220103', '220100', null, '宽城区', '220103', '220103', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220104', '220100', null, '朝阳区', '220104', '220104', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220105', '220100', null, '二道区', '220105', '220105', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220106', '220100', null, '绿园区', '220106', '220106', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220112', '220100', null, '双阳区', '220112', '220112', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220113', '220100', null, '九台区', '220113', '220113', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220122', '220100', null, '农安县', '220122', '220122', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220182', '220100', null, '榆树市', '220182', '220182', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220183', '220100', null, '德惠市', '220183', '220183', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220200', '220000', null, '吉林市', '220200', '220200', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220202', '220200', null, '昌邑区', '220202', '220202', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220203', '220200', null, '龙潭区', '220203', '220203', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220204', '220200', null, '船营区', '220204', '220204', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220211', '220200', null, '丰满区', '220211', '220211', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220221', '220200', null, '永吉县', '220221', '220221', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220281', '220200', null, '蛟河市', '220281', '220281', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220282', '220200', null, '桦甸市', '220282', '220282', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220283', '220200', null, '舒兰市', '220283', '220283', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220284', '220200', null, '磐石市', '220284', '220284', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220300', '220000', null, '四平市', '220300', '220300', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220302', '220300', null, '铁西区', '220302', '220302', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220303', '220300', null, '铁东区', '220303', '220303', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220322', '220300', null, '梨树县', '220322', '220322', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220323', '220300', null, '伊通满族自治县', '220323', '220323', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220381', '220300', null, '公主岭市', '220381', '220381', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220382', '220300', null, '双辽市', '220382', '220382', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220400', '220000', null, '辽源市', '220400', '220400', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220402', '220400', null, '龙山区', '220402', '220402', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220403', '220400', null, '西安区', '220403', '220403', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220421', '220400', null, '东丰县', '220421', '220421', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220422', '220400', null, '东辽县', '220422', '220422', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220500', '220000', null, '通化市', '220500', '220500', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220502', '220500', null, '东昌区', '220502', '220502', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220503', '220500', null, '二道江区', '220503', '220503', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220521', '220500', null, '通化县', '220521', '220521', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220523', '220500', null, '辉南县', '220523', '220523', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220524', '220500', null, '柳河县', '220524', '220524', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220581', '220500', null, '梅河口市', '220581', '220581', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220582', '220500', null, '集安市', '220582', '220582', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220600', '220000', null, '白山市', '220600', '220600', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220602', '220600', null, '浑江区', '220602', '220602', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220605', '220600', null, '江源区', '220605', '220605', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220621', '220600', null, '抚松县', '220621', '220621', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220622', '220600', null, '靖宇县', '220622', '220622', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220623', '220600', null, '长白朝鲜族自治县', '220623', '220623', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220681', '220600', null, '临江市', '220681', '220681', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220700', '220000', null, '松原市', '220700', '220700', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220702', '220700', null, '宁江区', '220702', '220702', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220721', '220700', null, '前郭尔罗斯蒙古族自治县', '220721', '220721', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220722', '220700', null, '长岭县', '220722', '220722', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220723', '220700', null, '乾安县', '220723', '220723', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220781', '220700', null, '扶余市', '220781', '220781', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220800', '220000', null, '白城市', '220800', '220800', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220802', '220800', null, '洮北区', '220802', '220802', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220821', '220800', null, '镇赉县', '220821', '220821', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220822', '220800', null, '通榆县', '220822', '220822', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220881', '220800', null, '洮南市', '220881', '220881', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('220882', '220800', null, '大安市', '220882', '220882', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222400', '220000', null, '延边朝鲜族自治州', '222400', '222400', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222401', '222400', null, '延吉市', '222401', '222401', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222402', '222400', null, '图们市', '222402', '222402', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222403', '222400', null, '敦化市', '222403', '222403', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222404', '222400', null, '珲春市', '222404', '222404', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222405', '222400', null, '龙井市', '222405', '222405', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222406', '222400', null, '和龙市', '222406', '222406', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222424', '222400', null, '汪清县', '222424', '222424', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('222426', '222400', null, '安图县', '222426', '222426', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230000', '000000', null, '黑龙江省', '230000', '230000', 'PROVINCE', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230100', '230000', null, '哈尔滨市', '230100', '230100', 'CITY', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230102', '230100', null, '道里区', '230102', '230102', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230103', '230100', null, '南岗区', '230103', '230103', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230104', '230100', null, '道外区', '230104', '230104', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230108', '230100', null, '平房区', '230108', '230108', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230109', '230100', null, '松北区', '230109', '230109', 'TOWN', '2018-09-13 09:32:46', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230110', '230100', null, '香坊区', '230110', '230110', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230111', '230100', null, '呼兰区', '230111', '230111', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230112', '230100', null, '阿城区', '230112', '230112', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230113', '230100', null, '双城区', '230113', '230113', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230123', '230100', null, '依兰县', '230123', '230123', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230124', '230100', null, '方正县', '230124', '230124', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230125', '230100', null, '宾县', '230125', '230125', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230126', '230100', null, '巴彦县', '230126', '230126', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230127', '230100', null, '木兰县', '230127', '230127', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230128', '230100', null, '通河县', '230128', '230128', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230129', '230100', null, '延寿县', '230129', '230129', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230183', '230100', null, '尚志市', '230183', '230183', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230184', '230100', null, '五常市', '230184', '230184', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230200', '230000', null, '齐齐哈尔市', '230200', '230200', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230202', '230200', null, '龙沙区', '230202', '230202', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230203', '230200', null, '建华区', '230203', '230203', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230204', '230200', null, '铁锋区', '230204', '230204', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230205', '230200', null, '昂昂溪区', '230205', '230205', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230206', '230200', null, '富拉尔基区', '230206', '230206', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230207', '230200', null, '碾子山区', '230207', '230207', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230208', '230200', null, '梅里斯达斡尔族区', '230208', '230208', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230221', '230200', null, '龙江县', '230221', '230221', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230223', '230200', null, '依安县', '230223', '230223', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230224', '230200', null, '泰来县', '230224', '230224', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230225', '230200', null, '甘南县', '230225', '230225', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230227', '230200', null, '富裕县', '230227', '230227', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230229', '230200', null, '克山县', '230229', '230229', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230230', '230200', null, '克东县', '230230', '230230', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230231', '230200', null, '拜泉县', '230231', '230231', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230281', '230200', null, '讷河市', '230281', '230281', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230300', '230000', null, '鸡西市', '230300', '230300', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230302', '230300', null, '鸡冠区', '230302', '230302', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230303', '230300', null, '恒山区', '230303', '230303', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230304', '230300', null, '滴道区', '230304', '230304', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230305', '230300', null, '梨树区', '230305', '230305', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230306', '230300', null, '城子河区', '230306', '230306', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230307', '230300', null, '麻山区', '230307', '230307', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230321', '230300', null, '鸡东县', '230321', '230321', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230381', '230300', null, '虎林市', '230381', '230381', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230382', '230300', null, '密山市', '230382', '230382', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230400', '230000', null, '鹤岗市', '230400', '230400', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230402', '230400', null, '向阳区', '230402', '230402', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230403', '230400', null, '工农区', '230403', '230403', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230404', '230400', null, '南山区', '230404', '230404', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230405', '230400', null, '兴安区', '230405', '230405', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230406', '230400', null, '东山区', '230406', '230406', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230407', '230400', null, '兴山区', '230407', '230407', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230421', '230400', null, '萝北县', '230421', '230421', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230422', '230400', null, '绥滨县', '230422', '230422', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230500', '230000', null, '双鸭山市', '230500', '230500', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230502', '230500', null, '尖山区', '230502', '230502', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230503', '230500', null, '岭东区', '230503', '230503', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230505', '230500', null, '四方台区', '230505', '230505', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230506', '230500', null, '宝山区', '230506', '230506', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230521', '230500', null, '集贤县', '230521', '230521', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230522', '230500', null, '友谊县', '230522', '230522', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230523', '230500', null, '宝清县', '230523', '230523', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230524', '230500', null, '饶河县', '230524', '230524', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230600', '230000', null, '大庆市', '230600', '230600', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230602', '230600', null, '萨尔图区', '230602', '230602', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230603', '230600', null, '龙凤区', '230603', '230603', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230604', '230600', null, '让胡路区', '230604', '230604', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230605', '230600', null, '红岗区', '230605', '230605', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230606', '230600', null, '大同区', '230606', '230606', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230621', '230600', null, '肇州县', '230621', '230621', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230622', '230600', null, '肇源县', '230622', '230622', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230623', '230600', null, '林甸县', '230623', '230623', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230624', '230600', null, '杜尔伯特蒙古族自治县', '230624', '230624', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230700', '230000', null, '伊春市', '230700', '230700', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230702', '230700', null, '伊春区', '230702', '230702', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230703', '230700', null, '南岔区', '230703', '230703', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230704', '230700', null, '友好区', '230704', '230704', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230705', '230700', null, '西林区', '230705', '230705', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230706', '230700', null, '翠峦区', '230706', '230706', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230707', '230700', null, '新青区', '230707', '230707', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230708', '230700', null, '美溪区', '230708', '230708', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230709', '230700', null, '金山屯区', '230709', '230709', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230710', '230700', null, '五营区', '230710', '230710', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230711', '230700', null, '乌马河区', '230711', '230711', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230712', '230700', null, '汤旺河区', '230712', '230712', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230713', '230700', null, '带岭区', '230713', '230713', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230714', '230700', null, '乌伊岭区', '230714', '230714', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230715', '230700', null, '红星区', '230715', '230715', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230716', '230700', null, '上甘岭区', '230716', '230716', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230722', '230700', null, '嘉荫县', '230722', '230722', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230781', '230700', null, '铁力市', '230781', '230781', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230800', '230000', null, '佳木斯市', '230800', '230800', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230803', '230800', null, '向阳区', '230803', '230803', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230804', '230800', null, '前进区', '230804', '230804', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230805', '230800', null, '东风区', '230805', '230805', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230811', '230800', null, '郊区', '230811', '230811', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230822', '230800', null, '桦南县', '230822', '230822', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230826', '230800', null, '桦川县', '230826', '230826', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230828', '230800', null, '汤原县', '230828', '230828', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230881', '230800', null, '同江市', '230881', '230881', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230882', '230800', null, '富锦市', '230882', '230882', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230883', '230800', null, '抚远市', '230883', '230883', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230900', '230000', null, '七台河市', '230900', '230900', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230902', '230900', null, '新兴区', '230902', '230902', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230903', '230900', null, '桃山区', '230903', '230903', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230904', '230900', null, '茄子河区', '230904', '230904', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('230921', '230900', null, '勃利县', '230921', '230921', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231000', '230000', null, '牡丹江市', '231000', '231000', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231002', '231000', null, '东安区', '231002', '231002', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231003', '231000', null, '阳明区', '231003', '231003', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231004', '231000', null, '爱民区', '231004', '231004', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231005', '231000', null, '西安区', '231005', '231005', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231025', '231000', null, '林口县', '231025', '231025', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231081', '231000', null, '绥芬河市', '231081', '231081', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231083', '231000', null, '海林市', '231083', '231083', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231084', '231000', null, '宁安市', '231084', '231084', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231085', '231000', null, '穆棱市', '231085', '231085', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231086', '231000', null, '东宁市', '231086', '231086', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231100', '230000', null, '黑河市', '231100', '231100', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231102', '231100', null, '爱辉区', '231102', '231102', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231121', '231100', null, '嫩江县', '231121', '231121', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231123', '231100', null, '逊克县', '231123', '231123', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231124', '231100', null, '孙吴县', '231124', '231124', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231181', '231100', null, '北安市', '231181', '231181', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231182', '231100', null, '五大连池市', '231182', '231182', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231200', '230000', null, '绥化市', '231200', '231200', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231202', '231200', null, '北林区', '231202', '231202', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231221', '231200', null, '望奎县', '231221', '231221', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231222', '231200', null, '兰西县', '231222', '231222', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231223', '231200', null, '青冈县', '231223', '231223', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231224', '231200', null, '庆安县', '231224', '231224', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231225', '231200', null, '明水县', '231225', '231225', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231226', '231200', null, '绥棱县', '231226', '231226', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231281', '231200', null, '安达市', '231281', '231281', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231282', '231200', null, '肇东市', '231282', '231282', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('231283', '231200', null, '海伦市', '231283', '231283', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('232700', '230000', null, '大兴安岭地区', '232700', '232700', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('232721', '232700', null, '呼玛县', '232721', '232721', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('232722', '232700', null, '塔河县', '232722', '232722', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('232723', '232700', null, '漠河县', '232723', '232723', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310000', '000000', null, '上海市', '310000', '310000', 'PROVINCE', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310101', '310000', null, '黄浦区', '310101', '310101', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310104', '310000', null, '徐汇区', '310104', '310104', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310105', '310000', null, '长宁区', '310105', '310105', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310106', '310000', null, '静安区', '310106', '310106', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310107', '310000', null, '普陀区', '310107', '310107', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310109', '310000', null, '虹口区', '310109', '310109', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310110', '310000', null, '杨浦区', '310110', '310110', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310112', '310000', null, '闵行区', '310112', '310112', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310113', '310000', null, '宝山区', '310113', '310113', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310114', '310000', null, '嘉定区', '310114', '310114', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310115', '310000', null, '浦东新区', '310115', '310115', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310116', '310000', null, '金山区', '310116', '310116', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310117', '310000', null, '松江区', '310117', '310117', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310118', '310000', null, '青浦区', '310118', '310118', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310120', '310000', null, '奉贤区', '310120', '310120', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('310151', '310000', null, '崇明区', '310151', '310151', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320000', '000000', null, '江苏省', '320000', '320000', 'PROVINCE', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320100', '320000', null, '南京市', '320100', '320100', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320102', '320100', null, '玄武区', '320102', '320102', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320104', '320100', null, '秦淮区', '320104', '320104', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320105', '320100', null, '建邺区', '320105', '320105', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320106', '320100', null, '鼓楼区', '320106', '320106', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320111', '320100', null, '浦口区', '320111', '320111', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320113', '320100', null, '栖霞区', '320113', '320113', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320114', '320100', null, '雨花台区', '320114', '320114', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320115', '320100', null, '江宁区', '320115', '320115', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320116', '320100', null, '六合区', '320116', '320116', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320117', '320100', null, '溧水区', '320117', '320117', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320118', '320100', null, '高淳区', '320118', '320118', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320200', '320000', null, '无锡市', '320200', '320200', 'CITY', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320205', '320200', null, '锡山区', '320205', '320205', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320206', '320200', null, '惠山区', '320206', '320206', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320211', '320200', null, '滨湖区', '320211', '320211', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320213', '320200', null, '梁溪区', '320213', '320213', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320214', '320200', null, '新吴区', '320214', '320214', 'TOWN', '2018-09-13 09:32:47', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320281', '320200', null, '江阴市', '320281', '320281', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320282', '320200', null, '宜兴市', '320282', '320282', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320300', '320000', null, '徐州市', '320300', '320300', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320302', '320300', null, '鼓楼区', '320302', '320302', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320303', '320300', null, '云龙区', '320303', '320303', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320305', '320300', null, '贾汪区', '320305', '320305', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320311', '320300', null, '泉山区', '320311', '320311', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320312', '320300', null, '铜山区', '320312', '320312', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320321', '320300', null, '丰县', '320321', '320321', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320322', '320300', null, '沛县', '320322', '320322', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320324', '320300', null, '睢宁县', '320324', '320324', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320381', '320300', null, '新沂市', '320381', '320381', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320382', '320300', null, '邳州市', '320382', '320382', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320400', '320000', null, '常州市', '320400', '320400', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320402', '320400', null, '天宁区', '320402', '320402', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320404', '320400', null, '钟楼区', '320404', '320404', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320411', '320400', null, '新北区', '320411', '320411', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320412', '320400', null, '武进区', '320412', '320412', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320413', '320400', null, '金坛区', '320413', '320413', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320481', '320400', null, '溧阳市', '320481', '320481', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320500', '320000', null, '苏州市', '320500', '320500', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320505', '320500', null, '虎丘区', '320505', '320505', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320506', '320500', null, '吴中区', '320506', '320506', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320507', '320500', null, '相城区', '320507', '320507', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320508', '320500', null, '姑苏区', '320508', '320508', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320509', '320500', null, '吴江区', '320509', '320509', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320581', '320500', null, '常熟市', '320581', '320581', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320582', '320500', null, '张家港市', '320582', '320582', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320583', '320500', null, '昆山市', '320583', '320583', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320585', '320500', null, '太仓市', '320585', '320585', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320600', '320000', null, '南通市', '320600', '320600', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320602', '320600', null, '崇川区', '320602', '320602', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320611', '320600', null, '港闸区', '320611', '320611', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320612', '320600', null, '通州区', '320612', '320612', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320623', '320600', null, '如东县', '320623', '320623', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320681', '320600', null, '启东市', '320681', '320681', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320682', '320600', null, '如皋市', '320682', '320682', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320684', '320600', null, '海门市', '320684', '320684', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320685', '320600', null, '海安市', '320685', '320685', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320700', '320000', null, '连云港市', '320700', '320700', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320703', '320700', null, '连云区', '320703', '320703', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320706', '320700', null, '海州区', '320706', '320706', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320707', '320700', null, '赣榆区', '320707', '320707', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320722', '320700', null, '东海县', '320722', '320722', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320723', '320700', null, '灌云县', '320723', '320723', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320724', '320700', null, '灌南县', '320724', '320724', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320800', '320000', null, '淮安市', '320800', '320800', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320803', '320800', null, '淮安区', '320803', '320803', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320804', '320800', null, '淮阴区', '320804', '320804', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320812', '320800', null, '清江浦区', '320812', '320812', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320813', '320800', null, '洪泽区', '320813', '320813', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320826', '320800', null, '涟水县', '320826', '320826', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320830', '320800', null, '盱眙县', '320830', '320830', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320831', '320800', null, '金湖县', '320831', '320831', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320900', '320000', null, '盐城市', '320900', '320900', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320902', '320900', null, '亭湖区', '320902', '320902', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320903', '320900', null, '盐都区', '320903', '320903', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320904', '320900', null, '大丰区', '320904', '320904', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320921', '320900', null, '响水县', '320921', '320921', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320922', '320900', null, '滨海县', '320922', '320922', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320923', '320900', null, '阜宁县', '320923', '320923', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320924', '320900', null, '射阳县', '320924', '320924', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320925', '320900', null, '建湖县', '320925', '320925', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('320981', '320900', null, '东台市', '320981', '320981', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321000', '320000', null, '扬州市', '321000', '321000', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321002', '321000', null, '广陵区', '321002', '321002', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321003', '321000', null, '邗江区', '321003', '321003', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321012', '321000', null, '江都区', '321012', '321012', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321023', '321000', null, '宝应县', '321023', '321023', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321081', '321000', null, '仪征市', '321081', '321081', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321084', '321000', null, '高邮市', '321084', '321084', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321100', '320000', null, '镇江市', '321100', '321100', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321102', '321100', null, '京口区', '321102', '321102', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321111', '321100', null, '润州区', '321111', '321111', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321112', '321100', null, '丹徒区', '321112', '321112', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321181', '321100', null, '丹阳市', '321181', '321181', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321182', '321100', null, '扬中市', '321182', '321182', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321183', '321100', null, '句容市', '321183', '321183', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321200', '320000', null, '泰州市', '321200', '321200', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321202', '321200', null, '海陵区', '321202', '321202', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321203', '321200', null, '高港区', '321203', '321203', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321204', '321200', null, '姜堰区', '321204', '321204', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321281', '321200', null, '兴化市', '321281', '321281', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321282', '321200', null, '靖江市', '321282', '321282', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321283', '321200', null, '泰兴市', '321283', '321283', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321300', '320000', null, '宿迁市', '321300', '321300', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321302', '321300', null, '宿城区', '321302', '321302', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321311', '321300', null, '宿豫区', '321311', '321311', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321322', '321300', null, '沭阳县', '321322', '321322', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321323', '321300', null, '泗阳县', '321323', '321323', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('321324', '321300', null, '泗洪县', '321324', '321324', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330000', '000000', null, '浙江省', '330000', '330000', 'PROVINCE', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330100', '330000', null, '杭州市', '330100', '330100', 'CITY', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330102', '330100', null, '上城区', '330102', '330102', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330103', '330100', null, '下城区', '330103', '330103', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330104', '330100', null, '江干区', '330104', '330104', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330105', '330100', null, '拱墅区', '330105', '330105', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330106', '330100', null, '西湖区', '330106', '330106', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330108', '330100', null, '滨江区', '330108', '330108', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330109', '330100', null, '萧山区', '330109', '330109', 'TOWN', '2018-09-13 09:32:48', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330110', '330100', null, '余杭区', '330110', '330110', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330111', '330100', null, '富阳区', '330111', '330111', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330112', '330100', null, '临安区', '330112', '330112', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330122', '330100', null, '桐庐县', '330122', '330122', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330127', '330100', null, '淳安县', '330127', '330127', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330182', '330100', null, '建德市', '330182', '330182', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330200', '330000', null, '宁波市', '330200', '330200', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330203', '330200', null, '海曙区', '330203', '330203', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330205', '330200', null, '江北区', '330205', '330205', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330206', '330200', null, '北仑区', '330206', '330206', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330211', '330200', null, '镇海区', '330211', '330211', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330212', '330200', null, '鄞州区', '330212', '330212', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330213', '330200', null, '奉化区', '330213', '330213', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330225', '330200', null, '象山县', '330225', '330225', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330226', '330200', null, '宁海县', '330226', '330226', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330281', '330200', null, '余姚市', '330281', '330281', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330282', '330200', null, '慈溪市', '330282', '330282', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330300', '330000', null, '温州市', '330300', '330300', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330302', '330300', null, '鹿城区', '330302', '330302', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330303', '330300', null, '龙湾区', '330303', '330303', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330304', '330300', null, '瓯海区', '330304', '330304', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330305', '330300', null, '洞头区', '330305', '330305', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330324', '330300', null, '永嘉县', '330324', '330324', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330326', '330300', null, '平阳县', '330326', '330326', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330327', '330300', null, '苍南县', '330327', '330327', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330328', '330300', null, '文成县', '330328', '330328', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330329', '330300', null, '泰顺县', '330329', '330329', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330381', '330300', null, '瑞安市', '330381', '330381', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330382', '330300', null, '乐清市', '330382', '330382', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330400', '330000', null, '嘉兴市', '330400', '330400', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330402', '330400', null, '南湖区', '330402', '330402', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330411', '330400', null, '秀洲区', '330411', '330411', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330421', '330400', null, '嘉善县', '330421', '330421', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330424', '330400', null, '海盐县', '330424', '330424', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330481', '330400', null, '海宁市', '330481', '330481', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330482', '330400', null, '平湖市', '330482', '330482', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330483', '330400', null, '桐乡市', '330483', '330483', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330500', '330000', null, '湖州市', '330500', '330500', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330502', '330500', null, '吴兴区', '330502', '330502', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330503', '330500', null, '南浔区', '330503', '330503', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330521', '330500', null, '德清县', '330521', '330521', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330522', '330500', null, '长兴县', '330522', '330522', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330523', '330500', null, '安吉县', '330523', '330523', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330600', '330000', null, '绍兴市', '330600', '330600', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330602', '330600', null, '越城区', '330602', '330602', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330603', '330600', null, '柯桥区', '330603', '330603', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330604', '330600', null, '上虞区', '330604', '330604', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330624', '330600', null, '新昌县', '330624', '330624', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330681', '330600', null, '诸暨市', '330681', '330681', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330683', '330600', null, '嵊州市', '330683', '330683', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330700', '330000', null, '金华市', '330700', '330700', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330702', '330700', null, '婺城区', '330702', '330702', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330703', '330700', null, '金东区', '330703', '330703', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330723', '330700', null, '武义县', '330723', '330723', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330726', '330700', null, '浦江县', '330726', '330726', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330727', '330700', null, '磐安县', '330727', '330727', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330781', '330700', null, '兰溪市', '330781', '330781', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330782', '330700', null, '义乌市', '330782', '330782', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330783', '330700', null, '东阳市', '330783', '330783', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330784', '330700', null, '永康市', '330784', '330784', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330800', '330000', null, '衢州市', '330800', '330800', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330802', '330800', null, '柯城区', '330802', '330802', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330803', '330800', null, '衢江区', '330803', '330803', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330822', '330800', null, '常山县', '330822', '330822', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330824', '330800', null, '开化县', '330824', '330824', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330825', '330800', null, '龙游县', '330825', '330825', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330881', '330800', null, '江山市', '330881', '330881', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330900', '330000', null, '舟山市', '330900', '330900', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330902', '330900', null, '定海区', '330902', '330902', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330903', '330900', null, '普陀区', '330903', '330903', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330921', '330900', null, '岱山县', '330921', '330921', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('330922', '330900', null, '嵊泗县', '330922', '330922', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331000', '330000', null, '台州市', '331000', '331000', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331002', '331000', null, '椒江区', '331002', '331002', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331003', '331000', null, '黄岩区', '331003', '331003', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331004', '331000', null, '路桥区', '331004', '331004', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331022', '331000', null, '三门县', '331022', '331022', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331023', '331000', null, '天台县', '331023', '331023', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331024', '331000', null, '仙居县', '331024', '331024', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331081', '331000', null, '温岭市', '331081', '331081', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331082', '331000', null, '临海市', '331082', '331082', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331083', '331000', null, '玉环市', '331083', '331083', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331100', '330000', null, '丽水市', '331100', '331100', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331102', '331100', null, '莲都区', '331102', '331102', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331121', '331100', null, '青田县', '331121', '331121', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331122', '331100', null, '缙云县', '331122', '331122', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331123', '331100', null, '遂昌县', '331123', '331123', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331124', '331100', null, '松阳县', '331124', '331124', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331125', '331100', null, '云和县', '331125', '331125', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331126', '331100', null, '庆元县', '331126', '331126', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331127', '331100', null, '景宁畲族自治县', '331127', '331127', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('331181', '331100', null, '龙泉市', '331181', '331181', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340000', '000000', null, '安徽省', '340000', '340000', 'PROVINCE', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340100', '340000', null, '合肥市', '340100', '340100', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340102', '340100', null, '瑶海区', '340102', '340102', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340103', '340100', null, '庐阳区', '340103', '340103', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340104', '340100', null, '蜀山区', '340104', '340104', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340111', '340100', null, '包河区', '340111', '340111', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340121', '340100', null, '长丰县', '340121', '340121', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340122', '340100', null, '肥东县', '340122', '340122', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340123', '340100', null, '肥西县', '340123', '340123', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340124', '340100', null, '庐江县', '340124', '340124', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340181', '340100', null, '巢湖市', '340181', '340181', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340200', '340000', null, '芜湖市', '340200', '340200', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340202', '340200', null, '镜湖区', '340202', '340202', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340203', '340200', null, '弋江区', '340203', '340203', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340207', '340200', null, '鸠江区', '340207', '340207', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340208', '340200', null, '三山区', '340208', '340208', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340221', '340200', null, '芜湖县', '340221', '340221', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340222', '340200', null, '繁昌县', '340222', '340222', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340223', '340200', null, '南陵县', '340223', '340223', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340225', '340200', null, '无为县', '340225', '340225', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340300', '340000', null, '蚌埠市', '340300', '340300', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340302', '340300', null, '龙子湖区', '340302', '340302', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340303', '340300', null, '蚌山区', '340303', '340303', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340304', '340300', null, '禹会区', '340304', '340304', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340311', '340300', null, '淮上区', '340311', '340311', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340321', '340300', null, '怀远县', '340321', '340321', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340322', '340300', null, '五河县', '340322', '340322', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340323', '340300', null, '固镇县', '340323', '340323', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340400', '340000', null, '淮南市', '340400', '340400', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340402', '340400', null, '大通区', '340402', '340402', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340403', '340400', null, '田家庵区', '340403', '340403', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340404', '340400', null, '谢家集区', '340404', '340404', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340405', '340400', null, '八公山区', '340405', '340405', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340406', '340400', null, '潘集区', '340406', '340406', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340421', '340400', null, '凤台县', '340421', '340421', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340422', '340400', null, '寿县', '340422', '340422', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340500', '340000', null, '马鞍山市', '340500', '340500', 'CITY', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340503', '340500', null, '花山区', '340503', '340503', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340504', '340500', null, '雨山区', '340504', '340504', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340506', '340500', null, '博望区', '340506', '340506', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340521', '340500', null, '当涂县', '340521', '340521', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340522', '340500', null, '含山县', '340522', '340522', 'TOWN', '2018-09-13 09:32:50', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340523', '340500', null, '和县', '340523', '340523', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340600', '340000', null, '淮北市', '340600', '340600', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340602', '340600', null, '杜集区', '340602', '340602', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340603', '340600', null, '相山区', '340603', '340603', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340604', '340600', null, '烈山区', '340604', '340604', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340621', '340600', null, '濉溪县', '340621', '340621', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340700', '340000', null, '铜陵市', '340700', '340700', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340705', '340700', null, '铜官区', '340705', '340705', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340706', '340700', null, '义安区', '340706', '340706', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340711', '340700', null, '郊区', '340711', '340711', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340722', '340700', null, '枞阳县', '340722', '340722', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340800', '340000', null, '安庆市', '340800', '340800', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340802', '340800', null, '迎江区', '340802', '340802', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340803', '340800', null, '大观区', '340803', '340803', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340811', '340800', null, '宜秀区', '340811', '340811', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340822', '340800', null, '怀宁县', '340822', '340822', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340824', '340800', null, '潜山县', '340824', '340824', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340825', '340800', null, '太湖县', '340825', '340825', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340826', '340800', null, '宿松县', '340826', '340826', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340827', '340800', null, '望江县', '340827', '340827', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340828', '340800', null, '岳西县', '340828', '340828', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('340881', '340800', null, '桐城市', '340881', '340881', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341000', '340000', null, '黄山市', '341000', '341000', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341002', '341000', null, '屯溪区', '341002', '341002', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341003', '341000', null, '黄山区', '341003', '341003', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341004', '341000', null, '徽州区', '341004', '341004', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341021', '341000', null, '歙县', '341021', '341021', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341022', '341000', null, '休宁县', '341022', '341022', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341023', '341000', null, '黟县', '341023', '341023', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341024', '341000', null, '祁门县', '341024', '341024', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341100', '340000', null, '滁州市', '341100', '341100', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341102', '341100', null, '琅琊区', '341102', '341102', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341103', '341100', null, '南谯区', '341103', '341103', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341122', '341100', null, '来安县', '341122', '341122', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341124', '341100', null, '全椒县', '341124', '341124', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341125', '341100', null, '定远县', '341125', '341125', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341126', '341100', null, '凤阳县', '341126', '341126', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341181', '341100', null, '天长市', '341181', '341181', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341182', '341100', null, '明光市', '341182', '341182', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341200', '340000', null, '阜阳市', '341200', '341200', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341202', '341200', null, '颍州区', '341202', '341202', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341203', '341200', null, '颍东区', '341203', '341203', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341204', '341200', null, '颍泉区', '341204', '341204', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341221', '341200', null, '临泉县', '341221', '341221', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341222', '341200', null, '太和县', '341222', '341222', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341225', '341200', null, '阜南县', '341225', '341225', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341226', '341200', null, '颍上县', '341226', '341226', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341282', '341200', null, '界首市', '341282', '341282', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341300', '340000', null, '宿州市', '341300', '341300', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341302', '341300', null, '埇桥区', '341302', '341302', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341321', '341300', null, '砀山县', '341321', '341321', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341322', '341300', null, '萧县', '341322', '341322', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341323', '341300', null, '灵璧县', '341323', '341323', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341324', '341300', null, '泗县', '341324', '341324', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341500', '340000', null, '六安市', '341500', '341500', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341502', '341500', null, '金安区', '341502', '341502', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341503', '341500', null, '裕安区', '341503', '341503', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341504', '341500', null, '叶集区', '341504', '341504', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341522', '341500', null, '霍邱县', '341522', '341522', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341523', '341500', null, '舒城县', '341523', '341523', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341524', '341500', null, '金寨县', '341524', '341524', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341525', '341500', null, '霍山县', '341525', '341525', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341600', '340000', null, '亳州市', '341600', '341600', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341602', '341600', null, '谯城区', '341602', '341602', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341621', '341600', null, '涡阳县', '341621', '341621', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341622', '341600', null, '蒙城县', '341622', '341622', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341623', '341600', null, '利辛县', '341623', '341623', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341700', '340000', null, '池州市', '341700', '341700', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341702', '341700', null, '贵池区', '341702', '341702', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341721', '341700', null, '东至县', '341721', '341721', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341722', '341700', null, '石台县', '341722', '341722', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341723', '341700', null, '青阳县', '341723', '341723', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341800', '340000', null, '宣城市', '341800', '341800', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341802', '341800', null, '宣州区', '341802', '341802', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341821', '341800', null, '郎溪县', '341821', '341821', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341822', '341800', null, '广德县', '341822', '341822', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341823', '341800', null, '泾县', '341823', '341823', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341824', '341800', null, '绩溪县', '341824', '341824', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341825', '341800', null, '旌德县', '341825', '341825', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('341881', '341800', null, '宁国市', '341881', '341881', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350000', '000000', null, '福建省', '350000', '350000', 'PROVINCE', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350100', '350000', null, '福州市', '350100', '350100', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350102', '350100', null, '鼓楼区', '350102', '350102', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350103', '350100', null, '台江区', '350103', '350103', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350104', '350100', null, '仓山区', '350104', '350104', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350105', '350100', null, '马尾区', '350105', '350105', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350111', '350100', null, '晋安区', '350111', '350111', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350112', '350100', null, '长乐区', '350112', '350112', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350121', '350100', null, '闽侯县', '350121', '350121', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350122', '350100', null, '连江县', '350122', '350122', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350123', '350100', null, '罗源县', '350123', '350123', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350124', '350100', null, '闽清县', '350124', '350124', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350125', '350100', null, '永泰县', '350125', '350125', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350128', '350100', null, '平潭县', '350128', '350128', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350181', '350100', null, '福清市', '350181', '350181', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350200', '350000', null, '厦门市', '350200', '350200', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350203', '350200', null, '思明区', '350203', '350203', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350205', '350200', null, '海沧区', '350205', '350205', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350206', '350200', null, '湖里区', '350206', '350206', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350211', '350200', null, '集美区', '350211', '350211', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350212', '350200', null, '同安区', '350212', '350212', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350213', '350200', null, '翔安区', '350213', '350213', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350300', '350000', null, '莆田市', '350300', '350300', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350302', '350300', null, '城厢区', '350302', '350302', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350303', '350300', null, '涵江区', '350303', '350303', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350304', '350300', null, '荔城区', '350304', '350304', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350305', '350300', null, '秀屿区', '350305', '350305', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350322', '350300', null, '仙游县', '350322', '350322', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350400', '350000', null, '三明市', '350400', '350400', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350402', '350400', null, '梅列区', '350402', '350402', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350403', '350400', null, '三元区', '350403', '350403', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350421', '350400', null, '明溪县', '350421', '350421', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350423', '350400', null, '清流县', '350423', '350423', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350424', '350400', null, '宁化县', '350424', '350424', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350425', '350400', null, '大田县', '350425', '350425', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350426', '350400', null, '尤溪县', '350426', '350426', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350427', '350400', null, '沙县', '350427', '350427', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350428', '350400', null, '将乐县', '350428', '350428', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350429', '350400', null, '泰宁县', '350429', '350429', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350430', '350400', null, '建宁县', '350430', '350430', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350481', '350400', null, '永安市', '350481', '350481', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350500', '350000', null, '泉州市', '350500', '350500', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350502', '350500', null, '鲤城区', '350502', '350502', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350503', '350500', null, '丰泽区', '350503', '350503', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350504', '350500', null, '洛江区', '350504', '350504', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350505', '350500', null, '泉港区', '350505', '350505', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350521', '350500', null, '惠安县', '350521', '350521', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350524', '350500', null, '安溪县', '350524', '350524', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350525', '350500', null, '永春县', '350525', '350525', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350526', '350500', null, '德化县', '350526', '350526', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350527', '350500', null, '金门县', '350527', '350527', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350581', '350500', null, '石狮市', '350581', '350581', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350582', '350500', null, '晋江市', '350582', '350582', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350583', '350500', null, '南安市', '350583', '350583', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350600', '350000', null, '漳州市', '350600', '350600', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350602', '350600', null, '芗城区', '350602', '350602', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350603', '350600', null, '龙文区', '350603', '350603', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350622', '350600', null, '云霄县', '350622', '350622', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350623', '350600', null, '漳浦县', '350623', '350623', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350624', '350600', null, '诏安县', '350624', '350624', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350625', '350600', null, '长泰县', '350625', '350625', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350626', '350600', null, '东山县', '350626', '350626', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350627', '350600', null, '南靖县', '350627', '350627', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350628', '350600', null, '平和县', '350628', '350628', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350629', '350600', null, '华安县', '350629', '350629', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350681', '350600', null, '龙海市', '350681', '350681', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350700', '350000', null, '南平市', '350700', '350700', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350702', '350700', null, '延平区', '350702', '350702', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350703', '350700', null, '建阳区', '350703', '350703', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350721', '350700', null, '顺昌县', '350721', '350721', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350722', '350700', null, '浦城县', '350722', '350722', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350723', '350700', null, '光泽县', '350723', '350723', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350724', '350700', null, '松溪县', '350724', '350724', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350725', '350700', null, '政和县', '350725', '350725', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350781', '350700', null, '邵武市', '350781', '350781', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350782', '350700', null, '武夷山市', '350782', '350782', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350783', '350700', null, '建瓯市', '350783', '350783', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350800', '350000', null, '龙岩市', '350800', '350800', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350802', '350800', null, '新罗区', '350802', '350802', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350803', '350800', null, '永定区', '350803', '350803', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350821', '350800', null, '长汀县', '350821', '350821', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350823', '350800', null, '上杭县', '350823', '350823', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350824', '350800', null, '武平县', '350824', '350824', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350825', '350800', null, '连城县', '350825', '350825', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350881', '350800', null, '漳平市', '350881', '350881', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350900', '350000', null, '宁德市', '350900', '350900', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350902', '350900', null, '蕉城区', '350902', '350902', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350921', '350900', null, '霞浦县', '350921', '350921', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350922', '350900', null, '古田县', '350922', '350922', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350923', '350900', null, '屏南县', '350923', '350923', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350924', '350900', null, '寿宁县', '350924', '350924', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350925', '350900', null, '周宁县', '350925', '350925', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350926', '350900', null, '柘荣县', '350926', '350926', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350981', '350900', null, '福安市', '350981', '350981', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('350982', '350900', null, '福鼎市', '350982', '350982', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360000', '000000', null, '江西省', '360000', '360000', 'PROVINCE', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360100', '360000', null, '南昌市', '360100', '360100', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360102', '360100', null, '东湖区', '360102', '360102', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360103', '360100', null, '西湖区', '360103', '360103', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360104', '360100', null, '青云谱区', '360104', '360104', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360105', '360100', null, '湾里区', '360105', '360105', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360111', '360100', null, '青山湖区', '360111', '360111', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360112', '360100', null, '新建区', '360112', '360112', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360121', '360100', null, '南昌县', '360121', '360121', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360123', '360100', null, '安义县', '360123', '360123', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360124', '360100', null, '进贤县', '360124', '360124', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360200', '360000', null, '景德镇市', '360200', '360200', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360202', '360200', null, '昌江区', '360202', '360202', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360203', '360200', null, '珠山区', '360203', '360203', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360222', '360200', null, '浮梁县', '360222', '360222', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360281', '360200', null, '乐平市', '360281', '360281', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360300', '360000', null, '萍乡市', '360300', '360300', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360302', '360300', null, '安源区', '360302', '360302', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360313', '360300', null, '湘东区', '360313', '360313', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360321', '360300', null, '莲花县', '360321', '360321', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360322', '360300', null, '上栗县', '360322', '360322', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360323', '360300', null, '芦溪县', '360323', '360323', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360400', '360000', null, '九江市', '360400', '360400', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360402', '360400', null, '濂溪区', '360402', '360402', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360403', '360400', null, '浔阳区', '360403', '360403', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360404', '360400', null, '柴桑区', '360404', '360404', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360423', '360400', null, '武宁县', '360423', '360423', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360424', '360400', null, '修水县', '360424', '360424', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360425', '360400', null, '永修县', '360425', '360425', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360426', '360400', null, '德安县', '360426', '360426', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360428', '360400', null, '都昌县', '360428', '360428', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360429', '360400', null, '湖口县', '360429', '360429', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360430', '360400', null, '彭泽县', '360430', '360430', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360481', '360400', null, '瑞昌市', '360481', '360481', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360482', '360400', null, '共青城市', '360482', '360482', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360483', '360400', null, '庐山市', '360483', '360483', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360500', '360000', null, '新余市', '360500', '360500', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360502', '360500', null, '渝水区', '360502', '360502', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360521', '360500', null, '分宜县', '360521', '360521', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360600', '360000', null, '鹰潭市', '360600', '360600', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360602', '360600', null, '月湖区', '360602', '360602', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360622', '360600', null, '余江县', '360622', '360622', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360681', '360600', null, '贵溪市', '360681', '360681', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360700', '360000', null, '赣州市', '360700', '360700', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360702', '360700', null, '章贡区', '360702', '360702', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360703', '360700', null, '南康区', '360703', '360703', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360704', '360700', null, '赣县区', '360704', '360704', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360722', '360700', null, '信丰县', '360722', '360722', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360723', '360700', null, '大余县', '360723', '360723', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360724', '360700', null, '上犹县', '360724', '360724', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360725', '360700', null, '崇义县', '360725', '360725', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360726', '360700', null, '安远县', '360726', '360726', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360727', '360700', null, '龙南县', '360727', '360727', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360728', '360700', null, '定南县', '360728', '360728', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360729', '360700', null, '全南县', '360729', '360729', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360730', '360700', null, '宁都县', '360730', '360730', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360731', '360700', null, '于都县', '360731', '360731', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360732', '360700', null, '兴国县', '360732', '360732', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360733', '360700', null, '会昌县', '360733', '360733', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360734', '360700', null, '寻乌县', '360734', '360734', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360735', '360700', null, '石城县', '360735', '360735', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360781', '360700', null, '瑞金市', '360781', '360781', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360800', '360000', null, '吉安市', '360800', '360800', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360802', '360800', null, '吉州区', '360802', '360802', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360803', '360800', null, '青原区', '360803', '360803', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360821', '360800', null, '吉安县', '360821', '360821', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360822', '360800', null, '吉水县', '360822', '360822', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360823', '360800', null, '峡江县', '360823', '360823', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360824', '360800', null, '新干县', '360824', '360824', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360825', '360800', null, '永丰县', '360825', '360825', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360826', '360800', null, '泰和县', '360826', '360826', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360827', '360800', null, '遂川县', '360827', '360827', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360828', '360800', null, '万安县', '360828', '360828', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360829', '360800', null, '安福县', '360829', '360829', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360830', '360800', null, '永新县', '360830', '360830', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360881', '360800', null, '井冈山市', '360881', '360881', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360900', '360000', null, '宜春市', '360900', '360900', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360902', '360900', null, '袁州区', '360902', '360902', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360921', '360900', null, '奉新县', '360921', '360921', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360922', '360900', null, '万载县', '360922', '360922', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360923', '360900', null, '上高县', '360923', '360923', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360924', '360900', null, '宜丰县', '360924', '360924', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360925', '360900', null, '靖安县', '360925', '360925', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360926', '360900', null, '铜鼓县', '360926', '360926', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360981', '360900', null, '丰城市', '360981', '360981', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360982', '360900', null, '樟树市', '360982', '360982', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('360983', '360900', null, '高安市', '360983', '360983', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361000', '360000', null, '抚州市', '361000', '361000', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361002', '361000', null, '临川区', '361002', '361002', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361003', '361000', null, '东乡区', '361003', '361003', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361021', '361000', null, '南城县', '361021', '361021', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361022', '361000', null, '黎川县', '361022', '361022', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361023', '361000', null, '南丰县', '361023', '361023', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361024', '361000', null, '崇仁县', '361024', '361024', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361025', '361000', null, '乐安县', '361025', '361025', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361026', '361000', null, '宜黄县', '361026', '361026', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361027', '361000', null, '金溪县', '361027', '361027', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361028', '361000', null, '资溪县', '361028', '361028', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361030', '361000', null, '广昌县', '361030', '361030', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361100', '360000', null, '上饶市', '361100', '361100', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361102', '361100', null, '信州区', '361102', '361102', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361103', '361100', null, '广丰区', '361103', '361103', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361121', '361100', null, '上饶县', '361121', '361121', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361123', '361100', null, '玉山县', '361123', '361123', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361124', '361100', null, '铅山县', '361124', '361124', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361125', '361100', null, '横峰县', '361125', '361125', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361126', '361100', null, '弋阳县', '361126', '361126', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361127', '361100', null, '余干县', '361127', '361127', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361128', '361100', null, '鄱阳县', '361128', '361128', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361129', '361100', null, '万年县', '361129', '361129', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361130', '361100', null, '婺源县', '361130', '361130', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('361181', '361100', null, '德兴市', '361181', '361181', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370000', '000000', null, '山东省', '370000', '370000', 'PROVINCE', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370100', '370000', null, '济南市', '370100', '370100', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370102', '370100', null, '历下区', '370102', '370102', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370103', '370100', null, '市中区', '370103', '370103', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370104', '370100', null, '槐荫区', '370104', '370104', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370105', '370100', null, '天桥区', '370105', '370105', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370112', '370100', null, '历城区', '370112', '370112', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370113', '370100', null, '长清区', '370113', '370113', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370114', '370100', null, '章丘区', '370114', '370114', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370124', '370100', null, '平阴县', '370124', '370124', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370125', '370100', null, '济阳县', '370125', '370125', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370126', '370100', null, '商河县', '370126', '370126', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370200', '370000', null, '青岛市', '370200', '370200', 'CITY', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370202', '370200', null, '市南区', '370202', '370202', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370203', '370200', null, '市北区', '370203', '370203', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370211', '370200', null, '黄岛区', '370211', '370211', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370212', '370200', null, '崂山区', '370212', '370212', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370213', '370200', null, '李沧区', '370213', '370213', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370214', '370200', null, '城阳区', '370214', '370214', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370215', '370200', null, '即墨区', '370215', '370215', 'TOWN', '2018-09-13 09:32:51', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370281', '370200', null, '胶州市', '370281', '370281', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370283', '370200', null, '平度市', '370283', '370283', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370285', '370200', null, '莱西市', '370285', '370285', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370300', '370000', null, '淄博市', '370300', '370300', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370302', '370300', null, '淄川区', '370302', '370302', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370303', '370300', null, '张店区', '370303', '370303', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370304', '370300', null, '博山区', '370304', '370304', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370305', '370300', null, '临淄区', '370305', '370305', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370306', '370300', null, '周村区', '370306', '370306', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370321', '370300', null, '桓台县', '370321', '370321', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370322', '370300', null, '高青县', '370322', '370322', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370323', '370300', null, '沂源县', '370323', '370323', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370400', '370000', null, '枣庄市', '370400', '370400', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370402', '370400', null, '市中区', '370402', '370402', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370403', '370400', null, '薛城区', '370403', '370403', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370404', '370400', null, '峄城区', '370404', '370404', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370405', '370400', null, '台儿庄区', '370405', '370405', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370406', '370400', null, '山亭区', '370406', '370406', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370481', '370400', null, '滕州市', '370481', '370481', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370500', '370000', null, '东营市', '370500', '370500', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370502', '370500', null, '东营区', '370502', '370502', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370503', '370500', null, '河口区', '370503', '370503', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370505', '370500', null, '垦利区', '370505', '370505', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370522', '370500', null, '利津县', '370522', '370522', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370523', '370500', null, '广饶县', '370523', '370523', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370600', '370000', null, '烟台市', '370600', '370600', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370602', '370600', null, '芝罘区', '370602', '370602', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370611', '370600', null, '福山区', '370611', '370611', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370612', '370600', null, '牟平区', '370612', '370612', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370613', '370600', null, '莱山区', '370613', '370613', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370634', '370600', null, '长岛县', '370634', '370634', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370681', '370600', null, '龙口市', '370681', '370681', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370682', '370600', null, '莱阳市', '370682', '370682', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370683', '370600', null, '莱州市', '370683', '370683', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370684', '370600', null, '蓬莱市', '370684', '370684', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370685', '370600', null, '招远市', '370685', '370685', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370686', '370600', null, '栖霞市', '370686', '370686', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370687', '370600', null, '海阳市', '370687', '370687', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370700', '370000', null, '潍坊市', '370700', '370700', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370702', '370700', null, '潍城区', '370702', '370702', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370703', '370700', null, '寒亭区', '370703', '370703', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370704', '370700', null, '坊子区', '370704', '370704', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370705', '370700', null, '奎文区', '370705', '370705', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370724', '370700', null, '临朐县', '370724', '370724', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370725', '370700', null, '昌乐县', '370725', '370725', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370781', '370700', null, '青州市', '370781', '370781', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370782', '370700', null, '诸城市', '370782', '370782', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370783', '370700', null, '寿光市', '370783', '370783', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370784', '370700', null, '安丘市', '370784', '370784', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370785', '370700', null, '高密市', '370785', '370785', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370786', '370700', null, '昌邑市', '370786', '370786', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370800', '370000', null, '济宁市', '370800', '370800', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370811', '370800', null, '任城区', '370811', '370811', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370812', '370800', null, '兖州区', '370812', '370812', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370826', '370800', null, '微山县', '370826', '370826', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370827', '370800', null, '鱼台县', '370827', '370827', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370828', '370800', null, '金乡县', '370828', '370828', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370829', '370800', null, '嘉祥县', '370829', '370829', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370830', '370800', null, '汶上县', '370830', '370830', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370831', '370800', null, '泗水县', '370831', '370831', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370832', '370800', null, '梁山县', '370832', '370832', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370881', '370800', null, '曲阜市', '370881', '370881', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370883', '370800', null, '邹城市', '370883', '370883', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370900', '370000', null, '泰安市', '370900', '370900', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370902', '370900', null, '泰山区', '370902', '370902', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370911', '370900', null, '岱岳区', '370911', '370911', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370921', '370900', null, '宁阳县', '370921', '370921', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370923', '370900', null, '东平县', '370923', '370923', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370982', '370900', null, '新泰市', '370982', '370982', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('370983', '370900', null, '肥城市', '370983', '370983', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371000', '370000', null, '威海市', '371000', '371000', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371002', '371000', null, '环翠区', '371002', '371002', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371003', '371000', null, '文登区', '371003', '371003', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371082', '371000', null, '荣成市', '371082', '371082', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371083', '371000', null, '乳山市', '371083', '371083', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371100', '370000', null, '日照市', '371100', '371100', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371102', '371100', null, '东港区', '371102', '371102', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371103', '371100', null, '岚山区', '371103', '371103', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371121', '371100', null, '五莲县', '371121', '371121', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371122', '371100', null, '莒县', '371122', '371122', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371200', '370000', null, '莱芜市', '371200', '371200', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371202', '371200', null, '莱城区', '371202', '371202', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371203', '371200', null, '钢城区', '371203', '371203', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371300', '370000', null, '临沂市', '371300', '371300', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371302', '371300', null, '兰山区', '371302', '371302', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371311', '371300', null, '罗庄区', '371311', '371311', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371312', '371300', null, '河东区', '371312', '371312', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371321', '371300', null, '沂南县', '371321', '371321', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371322', '371300', null, '郯城县', '371322', '371322', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371323', '371300', null, '沂水县', '371323', '371323', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371324', '371300', null, '兰陵县', '371324', '371324', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371325', '371300', null, '费县', '371325', '371325', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371326', '371300', null, '平邑县', '371326', '371326', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371327', '371300', null, '莒南县', '371327', '371327', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371328', '371300', null, '蒙阴县', '371328', '371328', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371329', '371300', null, '临沭县', '371329', '371329', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371400', '370000', null, '德州市', '371400', '371400', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371402', '371400', null, '德城区', '371402', '371402', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371403', '371400', null, '陵城区', '371403', '371403', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371422', '371400', null, '宁津县', '371422', '371422', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371423', '371400', null, '庆云县', '371423', '371423', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371424', '371400', null, '临邑县', '371424', '371424', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371425', '371400', null, '齐河县', '371425', '371425', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371426', '371400', null, '平原县', '371426', '371426', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371427', '371400', null, '夏津县', '371427', '371427', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371428', '371400', null, '武城县', '371428', '371428', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371481', '371400', null, '乐陵市', '371481', '371481', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371482', '371400', null, '禹城市', '371482', '371482', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371500', '370000', null, '聊城市', '371500', '371500', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371502', '371500', null, '东昌府区', '371502', '371502', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371521', '371500', null, '阳谷县', '371521', '371521', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371522', '371500', null, '莘县', '371522', '371522', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371523', '371500', null, '茌平县', '371523', '371523', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371524', '371500', null, '东阿县', '371524', '371524', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371525', '371500', null, '冠县', '371525', '371525', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371526', '371500', null, '高唐县', '371526', '371526', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371581', '371500', null, '临清市', '371581', '371581', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371600', '370000', null, '滨州市', '371600', '371600', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371602', '371600', null, '滨城区', '371602', '371602', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371603', '371600', null, '沾化区', '371603', '371603', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371621', '371600', null, '惠民县', '371621', '371621', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371622', '371600', null, '阳信县', '371622', '371622', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371623', '371600', null, '无棣县', '371623', '371623', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371625', '371600', null, '博兴县', '371625', '371625', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371626', '371600', null, '邹平县', '371626', '371626', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371700', '370000', null, '菏泽市', '371700', '371700', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371702', '371700', null, '牡丹区', '371702', '371702', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371703', '371700', null, '定陶区', '371703', '371703', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371721', '371700', null, '曹县', '371721', '371721', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371722', '371700', null, '单县', '371722', '371722', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371723', '371700', null, '成武县', '371723', '371723', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371724', '371700', null, '巨野县', '371724', '371724', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371725', '371700', null, '郓城县', '371725', '371725', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371726', '371700', null, '鄄城县', '371726', '371726', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('371728', '371700', null, '东明县', '371728', '371728', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410000', '000000', null, '河南省', '410000', '410000', 'PROVINCE', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410100', '410000', null, '郑州市', '410100', '410100', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410102', '410100', null, '中原区', '410102', '410102', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410103', '410100', null, '二七区', '410103', '410103', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410104', '410100', null, '管城回族区', '410104', '410104', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410105', '410100', null, '金水区', '410105', '410105', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410106', '410100', null, '上街区', '410106', '410106', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410108', '410100', null, '惠济区', '410108', '410108', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410122', '410100', null, '中牟县', '410122', '410122', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410181', '410100', null, '巩义市', '410181', '410181', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410182', '410100', null, '荥阳市', '410182', '410182', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410183', '410100', null, '新密市', '410183', '410183', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410184', '410100', null, '新郑市', '410184', '410184', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410185', '410100', null, '登封市', '410185', '410185', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410200', '410000', null, '开封市', '410200', '410200', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410202', '410200', null, '龙亭区', '410202', '410202', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410203', '410200', null, '顺河回族区', '410203', '410203', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410204', '410200', null, '鼓楼区', '410204', '410204', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410205', '410200', null, '禹王台区', '410205', '410205', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410212', '410200', null, '祥符区', '410212', '410212', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410221', '410200', null, '杞县', '410221', '410221', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410222', '410200', null, '通许县', '410222', '410222', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410223', '410200', null, '尉氏县', '410223', '410223', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410225', '410200', null, '兰考县', '410225', '410225', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410300', '410000', null, '洛阳市', '410300', '410300', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410302', '410300', null, '老城区', '410302', '410302', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410303', '410300', null, '西工区', '410303', '410303', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410304', '410300', null, '瀍河回族区', '410304', '410304', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410305', '410300', null, '涧西区', '410305', '410305', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410306', '410300', null, '吉利区', '410306', '410306', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410311', '410300', null, '洛龙区', '410311', '410311', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410322', '410300', null, '孟津县', '410322', '410322', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410323', '410300', null, '新安县', '410323', '410323', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410324', '410300', null, '栾川县', '410324', '410324', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410325', '410300', null, '嵩县', '410325', '410325', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410326', '410300', null, '汝阳县', '410326', '410326', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410327', '410300', null, '宜阳县', '410327', '410327', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410328', '410300', null, '洛宁县', '410328', '410328', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410329', '410300', null, '伊川县', '410329', '410329', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410381', '410300', null, '偃师市', '410381', '410381', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410400', '410000', null, '平顶山市', '410400', '410400', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410402', '410400', null, '新华区', '410402', '410402', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410403', '410400', null, '卫东区', '410403', '410403', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410404', '410400', null, '石龙区', '410404', '410404', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410411', '410400', null, '湛河区', '410411', '410411', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410421', '410400', null, '宝丰县', '410421', '410421', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410422', '410400', null, '叶县', '410422', '410422', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410423', '410400', null, '鲁山县', '410423', '410423', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410425', '410400', null, '郏县', '410425', '410425', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410481', '410400', null, '舞钢市', '410481', '410481', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410482', '410400', null, '汝州市', '410482', '410482', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410500', '410000', null, '安阳市', '410500', '410500', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410502', '410500', null, '文峰区', '410502', '410502', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410503', '410500', null, '北关区', '410503', '410503', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410505', '410500', null, '殷都区', '410505', '410505', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410506', '410500', null, '龙安区', '410506', '410506', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410522', '410500', null, '安阳县', '410522', '410522', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410523', '410500', null, '汤阴县', '410523', '410523', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410526', '410500', null, '滑县', '410526', '410526', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410527', '410500', null, '内黄县', '410527', '410527', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410581', '410500', null, '林州市', '410581', '410581', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410600', '410000', null, '鹤壁市', '410600', '410600', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410602', '410600', null, '鹤山区', '410602', '410602', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410603', '410600', null, '山城区', '410603', '410603', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410611', '410600', null, '淇滨区', '410611', '410611', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410621', '410600', null, '浚县', '410621', '410621', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410622', '410600', null, '淇县', '410622', '410622', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410700', '410000', null, '新乡市', '410700', '410700', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410702', '410700', null, '红旗区', '410702', '410702', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410703', '410700', null, '卫滨区', '410703', '410703', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410704', '410700', null, '凤泉区', '410704', '410704', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410711', '410700', null, '牧野区', '410711', '410711', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410721', '410700', null, '新乡县', '410721', '410721', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410724', '410700', null, '获嘉县', '410724', '410724', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410725', '410700', null, '原阳县', '410725', '410725', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410726', '410700', null, '延津县', '410726', '410726', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410727', '410700', null, '封丘县', '410727', '410727', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410728', '410700', null, '长垣县', '410728', '410728', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410781', '410700', null, '卫辉市', '410781', '410781', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410782', '410700', null, '辉县市', '410782', '410782', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410800', '410000', null, '焦作市', '410800', '410800', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410802', '410800', null, '解放区', '410802', '410802', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410803', '410800', null, '中站区', '410803', '410803', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410804', '410800', null, '马村区', '410804', '410804', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410811', '410800', null, '山阳区', '410811', '410811', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410821', '410800', null, '修武县', '410821', '410821', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410822', '410800', null, '博爱县', '410822', '410822', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410823', '410800', null, '武陟县', '410823', '410823', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410825', '410800', null, '温县', '410825', '410825', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410882', '410800', null, '沁阳市', '410882', '410882', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410883', '410800', null, '孟州市', '410883', '410883', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410900', '410000', null, '濮阳市', '410900', '410900', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410902', '410900', null, '华龙区', '410902', '410902', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410922', '410900', null, '清丰县', '410922', '410922', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410923', '410900', null, '南乐县', '410923', '410923', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410926', '410900', null, '范县', '410926', '410926', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410927', '410900', null, '台前县', '410927', '410927', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('410928', '410900', null, '濮阳县', '410928', '410928', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411000', '410000', null, '许昌市', '411000', '411000', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411002', '411000', null, '魏都区', '411002', '411002', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411003', '411000', null, '建安区', '411003', '411003', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411024', '411000', null, '鄢陵县', '411024', '411024', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411025', '411000', null, '襄城县', '411025', '411025', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411081', '411000', null, '禹州市', '411081', '411081', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411082', '411000', null, '长葛市', '411082', '411082', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411100', '410000', null, '漯河市', '411100', '411100', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411102', '411100', null, '源汇区', '411102', '411102', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411103', '411100', null, '郾城区', '411103', '411103', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411104', '411100', null, '召陵区', '411104', '411104', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411121', '411100', null, '舞阳县', '411121', '411121', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411122', '411100', null, '临颍县', '411122', '411122', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411200', '410000', null, '三门峡市', '411200', '411200', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411202', '411200', null, '湖滨区', '411202', '411202', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411203', '411200', null, '陕州区', '411203', '411203', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411221', '411200', null, '渑池县', '411221', '411221', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411224', '411200', null, '卢氏县', '411224', '411224', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411281', '411200', null, '义马市', '411281', '411281', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411282', '411200', null, '灵宝市', '411282', '411282', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411300', '410000', null, '南阳市', '411300', '411300', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411302', '411300', null, '宛城区', '411302', '411302', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411303', '411300', null, '卧龙区', '411303', '411303', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411321', '411300', null, '南召县', '411321', '411321', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411322', '411300', null, '方城县', '411322', '411322', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411323', '411300', null, '西峡县', '411323', '411323', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411324', '411300', null, '镇平县', '411324', '411324', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411325', '411300', null, '内乡县', '411325', '411325', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411326', '411300', null, '淅川县', '411326', '411326', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411327', '411300', null, '社旗县', '411327', '411327', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411328', '411300', null, '唐河县', '411328', '411328', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411329', '411300', null, '新野县', '411329', '411329', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411330', '411300', null, '桐柏县', '411330', '411330', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411381', '411300', null, '邓州市', '411381', '411381', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411400', '410000', null, '商丘市', '411400', '411400', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411402', '411400', null, '梁园区', '411402', '411402', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411403', '411400', null, '睢阳区', '411403', '411403', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411421', '411400', null, '民权县', '411421', '411421', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411422', '411400', null, '睢县', '411422', '411422', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411423', '411400', null, '宁陵县', '411423', '411423', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411424', '411400', null, '柘城县', '411424', '411424', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411425', '411400', null, '虞城县', '411425', '411425', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411426', '411400', null, '夏邑县', '411426', '411426', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411481', '411400', null, '永城市', '411481', '411481', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411500', '410000', null, '信阳市', '411500', '411500', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411502', '411500', null, '浉河区', '411502', '411502', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411503', '411500', null, '平桥区', '411503', '411503', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411521', '411500', null, '罗山县', '411521', '411521', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411522', '411500', null, '光山县', '411522', '411522', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411523', '411500', null, '新县', '411523', '411523', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411524', '411500', null, '商城县', '411524', '411524', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411525', '411500', null, '固始县', '411525', '411525', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411526', '411500', null, '潢川县', '411526', '411526', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411527', '411500', null, '淮滨县', '411527', '411527', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411528', '411500', null, '息县', '411528', '411528', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411600', '410000', null, '周口市', '411600', '411600', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411602', '411600', null, '川汇区', '411602', '411602', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411621', '411600', null, '扶沟县', '411621', '411621', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411622', '411600', null, '西华县', '411622', '411622', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411623', '411600', null, '商水县', '411623', '411623', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411624', '411600', null, '沈丘县', '411624', '411624', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411625', '411600', null, '郸城县', '411625', '411625', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411626', '411600', null, '淮阳县', '411626', '411626', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411627', '411600', null, '太康县', '411627', '411627', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411628', '411600', null, '鹿邑县', '411628', '411628', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411681', '411600', null, '项城市', '411681', '411681', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411700', '410000', null, '驻马店市', '411700', '411700', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411702', '411700', null, '驿城区', '411702', '411702', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411721', '411700', null, '西平县', '411721', '411721', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411722', '411700', null, '上蔡县', '411722', '411722', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411723', '411700', null, '平舆县', '411723', '411723', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411724', '411700', null, '正阳县', '411724', '411724', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411725', '411700', null, '确山县', '411725', '411725', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411726', '411700', null, '泌阳县', '411726', '411726', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411727', '411700', null, '汝南县', '411727', '411727', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411728', '411700', null, '遂平县', '411728', '411728', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('411729', '411700', null, '新蔡县', '411729', '411729', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('419001', '410000', null, '济源市', '419001', '419001', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420000', '000000', null, '湖北省', '420000', '420000', 'PROVINCE', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420100', '420000', null, '武汉市', '420100', '420100', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420102', '420100', null, '江岸区', '420102', '420102', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420103', '420100', null, '江汉区', '420103', '420103', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420104', '420100', null, '硚口区', '420104', '420104', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420105', '420100', null, '汉阳区', '420105', '420105', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420106', '420100', null, '武昌区', '420106', '420106', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420107', '420100', null, '青山区', '420107', '420107', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420111', '420100', null, '洪山区', '420111', '420111', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420112', '420100', null, '东西湖区', '420112', '420112', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420113', '420100', null, '汉南区', '420113', '420113', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420114', '420100', null, '蔡甸区', '420114', '420114', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420115', '420100', null, '江夏区', '420115', '420115', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420116', '420100', null, '黄陂区', '420116', '420116', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420117', '420100', null, '新洲区', '420117', '420117', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420200', '420000', null, '黄石市', '420200', '420200', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420202', '420200', null, '黄石港区', '420202', '420202', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420203', '420200', null, '西塞山区', '420203', '420203', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420204', '420200', null, '下陆区', '420204', '420204', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420205', '420200', null, '铁山区', '420205', '420205', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420222', '420200', null, '阳新县', '420222', '420222', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420281', '420200', null, '大冶市', '420281', '420281', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420300', '420000', null, '十堰市', '420300', '420300', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420302', '420300', null, '茅箭区', '420302', '420302', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420303', '420300', null, '张湾区', '420303', '420303', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420304', '420300', null, '郧阳区', '420304', '420304', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420322', '420300', null, '郧西县', '420322', '420322', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420323', '420300', null, '竹山县', '420323', '420323', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420324', '420300', null, '竹溪县', '420324', '420324', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420325', '420300', null, '房县', '420325', '420325', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420381', '420300', null, '丹江口市', '420381', '420381', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420500', '420000', null, '宜昌市', '420500', '420500', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420502', '420500', null, '西陵区', '420502', '420502', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420503', '420500', null, '伍家岗区', '420503', '420503', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420504', '420500', null, '点军区', '420504', '420504', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420505', '420500', null, '猇亭区', '420505', '420505', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420506', '420500', null, '夷陵区', '420506', '420506', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420525', '420500', null, '远安县', '420525', '420525', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420526', '420500', null, '兴山县', '420526', '420526', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420527', '420500', null, '秭归县', '420527', '420527', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420528', '420500', null, '长阳土家族自治县', '420528', '420528', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420529', '420500', null, '五峰土家族自治县', '420529', '420529', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420581', '420500', null, '宜都市', '420581', '420581', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420582', '420500', null, '当阳市', '420582', '420582', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420583', '420500', null, '枝江市', '420583', '420583', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420600', '420000', null, '襄阳市', '420600', '420600', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420602', '420600', null, '襄城区', '420602', '420602', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420606', '420600', null, '樊城区', '420606', '420606', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420607', '420600', null, '襄州区', '420607', '420607', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420624', '420600', null, '南漳县', '420624', '420624', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420625', '420600', null, '谷城县', '420625', '420625', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420626', '420600', null, '保康县', '420626', '420626', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420682', '420600', null, '老河口市', '420682', '420682', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420683', '420600', null, '枣阳市', '420683', '420683', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420684', '420600', null, '宜城市', '420684', '420684', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420700', '420000', null, '鄂州市', '420700', '420700', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420702', '420700', null, '梁子湖区', '420702', '420702', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420703', '420700', null, '华容区', '420703', '420703', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420704', '420700', null, '鄂城区', '420704', '420704', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420800', '420000', null, '荆门市', '420800', '420800', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420802', '420800', null, '东宝区', '420802', '420802', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420804', '420800', null, '掇刀区', '420804', '420804', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420821', '420800', null, '京山县', '420821', '420821', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420822', '420800', null, '沙洋县', '420822', '420822', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420881', '420800', null, '钟祥市', '420881', '420881', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420900', '420000', null, '孝感市', '420900', '420900', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420902', '420900', null, '孝南区', '420902', '420902', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420921', '420900', null, '孝昌县', '420921', '420921', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420922', '420900', null, '大悟县', '420922', '420922', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420923', '420900', null, '云梦县', '420923', '420923', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420981', '420900', null, '应城市', '420981', '420981', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420982', '420900', null, '安陆市', '420982', '420982', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('420984', '420900', null, '汉川市', '420984', '420984', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421000', '420000', null, '荆州市', '421000', '421000', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421002', '421000', null, '沙市区', '421002', '421002', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421003', '421000', null, '荆州区', '421003', '421003', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421022', '421000', null, '公安县', '421022', '421022', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421023', '421000', null, '监利县', '421023', '421023', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421024', '421000', null, '江陵县', '421024', '421024', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421081', '421000', null, '石首市', '421081', '421081', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421083', '421000', null, '洪湖市', '421083', '421083', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421087', '421000', null, '松滋市', '421087', '421087', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421100', '420000', null, '黄冈市', '421100', '421100', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421102', '421100', null, '黄州区', '421102', '421102', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421121', '421100', null, '团风县', '421121', '421121', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421122', '421100', null, '红安县', '421122', '421122', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421123', '421100', null, '罗田县', '421123', '421123', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421124', '421100', null, '英山县', '421124', '421124', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421125', '421100', null, '浠水县', '421125', '421125', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421126', '421100', null, '蕲春县', '421126', '421126', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421127', '421100', null, '黄梅县', '421127', '421127', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421181', '421100', null, '麻城市', '421181', '421181', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421182', '421100', null, '武穴市', '421182', '421182', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421200', '420000', null, '咸宁市', '421200', '421200', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421202', '421200', null, '咸安区', '421202', '421202', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421221', '421200', null, '嘉鱼县', '421221', '421221', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421222', '421200', null, '通城县', '421222', '421222', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421223', '421200', null, '崇阳县', '421223', '421223', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421224', '421200', null, '通山县', '421224', '421224', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421281', '421200', null, '赤壁市', '421281', '421281', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421300', '420000', null, '随州市', '421300', '421300', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421303', '421300', null, '曾都区', '421303', '421303', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421321', '421300', null, '随县', '421321', '421321', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('421381', '421300', null, '广水市', '421381', '421381', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422800', '420000', null, '恩施土家族苗族自治州', '422800', '422800', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422801', '422800', null, '恩施市', '422801', '422801', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422802', '422800', null, '利川市', '422802', '422802', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422822', '422800', null, '建始县', '422822', '422822', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422823', '422800', null, '巴东县', '422823', '422823', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422825', '422800', null, '宣恩县', '422825', '422825', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422826', '422800', null, '咸丰县', '422826', '422826', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422827', '422800', null, '来凤县', '422827', '422827', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('422828', '422800', null, '鹤峰县', '422828', '422828', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('429004', '420000', null, '仙桃市', '429004', '429004', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('429005', '420000', null, '潜江市', '429005', '429005', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('429006', '420000', null, '天门市', '429006', '429006', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('429021', '420000', null, '神农架林区', '429021', '429021', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430000', '000000', null, '湖南省', '430000', '430000', 'PROVINCE', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430100', '430000', null, '长沙市', '430100', '430100', 'CITY', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430102', '430100', null, '芙蓉区', '430102', '430102', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430103', '430100', null, '天心区', '430103', '430103', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430104', '430100', null, '岳麓区', '430104', '430104', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430105', '430100', null, '开福区', '430105', '430105', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430111', '430100', null, '雨花区', '430111', '430111', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430112', '430100', null, '望城区', '430112', '430112', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430121', '430100', null, '长沙县', '430121', '430121', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430181', '430100', null, '浏阳市', '430181', '430181', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430182', '430100', null, '宁乡市', '430182', '430182', 'TOWN', '2018-09-13 09:32:52', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430200', '430000', null, '株洲市', '430200', '430200', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430202', '430200', null, '荷塘区', '430202', '430202', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430203', '430200', null, '芦淞区', '430203', '430203', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430204', '430200', null, '石峰区', '430204', '430204', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430211', '430200', null, '天元区', '430211', '430211', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430221', '430200', null, '株洲县', '430221', '430221', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430223', '430200', null, '攸县', '430223', '430223', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430224', '430200', null, '茶陵县', '430224', '430224', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430225', '430200', null, '炎陵县', '430225', '430225', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430281', '430200', null, '醴陵市', '430281', '430281', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430300', '430000', null, '湘潭市', '430300', '430300', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430302', '430300', null, '雨湖区', '430302', '430302', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430304', '430300', null, '岳塘区', '430304', '430304', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430321', '430300', null, '湘潭县', '430321', '430321', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430381', '430300', null, '湘乡市', '430381', '430381', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430382', '430300', null, '韶山市', '430382', '430382', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430400', '430000', null, '衡阳市', '430400', '430400', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430405', '430400', null, '珠晖区', '430405', '430405', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430406', '430400', null, '雁峰区', '430406', '430406', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430407', '430400', null, '石鼓区', '430407', '430407', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430408', '430400', null, '蒸湘区', '430408', '430408', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430412', '430400', null, '南岳区', '430412', '430412', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430421', '430400', null, '衡阳县', '430421', '430421', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430422', '430400', null, '衡南县', '430422', '430422', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430423', '430400', null, '衡山县', '430423', '430423', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430424', '430400', null, '衡东县', '430424', '430424', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430426', '430400', null, '祁东县', '430426', '430426', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430481', '430400', null, '耒阳市', '430481', '430481', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430482', '430400', null, '常宁市', '430482', '430482', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430500', '430000', null, '邵阳市', '430500', '430500', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430502', '430500', null, '双清区', '430502', '430502', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430503', '430500', null, '大祥区', '430503', '430503', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430511', '430500', null, '北塔区', '430511', '430511', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430521', '430500', null, '邵东县', '430521', '430521', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430522', '430500', null, '新邵县', '430522', '430522', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430523', '430500', null, '邵阳县', '430523', '430523', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430524', '430500', null, '隆回县', '430524', '430524', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430525', '430500', null, '洞口县', '430525', '430525', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430527', '430500', null, '绥宁县', '430527', '430527', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430528', '430500', null, '新宁县', '430528', '430528', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430529', '430500', null, '城步苗族自治县', '430529', '430529', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430581', '430500', null, '武冈市', '430581', '430581', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430600', '430000', null, '岳阳市', '430600', '430600', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430602', '430600', null, '岳阳楼区', '430602', '430602', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430603', '430600', null, '云溪区', '430603', '430603', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430611', '430600', null, '君山区', '430611', '430611', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430621', '430600', null, '岳阳县', '430621', '430621', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430623', '430600', null, '华容县', '430623', '430623', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430624', '430600', null, '湘阴县', '430624', '430624', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430626', '430600', null, '平江县', '430626', '430626', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430681', '430600', null, '汨罗市', '430681', '430681', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430682', '430600', null, '临湘市', '430682', '430682', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430700', '430000', null, '常德市', '430700', '430700', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430702', '430700', null, '武陵区', '430702', '430702', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430703', '430700', null, '鼎城区', '430703', '430703', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430721', '430700', null, '安乡县', '430721', '430721', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430722', '430700', null, '汉寿县', '430722', '430722', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430723', '430700', null, '澧县', '430723', '430723', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430724', '430700', null, '临澧县', '430724', '430724', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430725', '430700', null, '桃源县', '430725', '430725', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430726', '430700', null, '石门县', '430726', '430726', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430781', '430700', null, '津市市', '430781', '430781', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430800', '430000', null, '张家界市', '430800', '430800', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430802', '430800', null, '永定区', '430802', '430802', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430811', '430800', null, '武陵源区', '430811', '430811', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430821', '430800', null, '慈利县', '430821', '430821', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430822', '430800', null, '桑植县', '430822', '430822', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430900', '430000', null, '益阳市', '430900', '430900', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430902', '430900', null, '资阳区', '430902', '430902', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430903', '430900', null, '赫山区', '430903', '430903', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430921', '430900', null, '南县', '430921', '430921', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430922', '430900', null, '桃江县', '430922', '430922', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430923', '430900', null, '安化县', '430923', '430923', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('430981', '430900', null, '沅江市', '430981', '430981', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431000', '430000', null, '郴州市', '431000', '431000', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431002', '431000', null, '北湖区', '431002', '431002', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431003', '431000', null, '苏仙区', '431003', '431003', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431021', '431000', null, '桂阳县', '431021', '431021', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431022', '431000', null, '宜章县', '431022', '431022', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431023', '431000', null, '永兴县', '431023', '431023', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431024', '431000', null, '嘉禾县', '431024', '431024', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431025', '431000', null, '临武县', '431025', '431025', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431026', '431000', null, '汝城县', '431026', '431026', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431027', '431000', null, '桂东县', '431027', '431027', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431028', '431000', null, '安仁县', '431028', '431028', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431081', '431000', null, '资兴市', '431081', '431081', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431100', '430000', null, '永州市', '431100', '431100', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431102', '431100', null, '零陵区', '431102', '431102', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431103', '431100', null, '冷水滩区', '431103', '431103', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431121', '431100', null, '祁阳县', '431121', '431121', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431122', '431100', null, '东安县', '431122', '431122', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431123', '431100', null, '双牌县', '431123', '431123', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431124', '431100', null, '道县', '431124', '431124', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431125', '431100', null, '江永县', '431125', '431125', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431126', '431100', null, '宁远县', '431126', '431126', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431127', '431100', null, '蓝山县', '431127', '431127', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431128', '431100', null, '新田县', '431128', '431128', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431129', '431100', null, '江华瑶族自治县', '431129', '431129', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431200', '430000', null, '怀化市', '431200', '431200', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431202', '431200', null, '鹤城区', '431202', '431202', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431221', '431200', null, '中方县', '431221', '431221', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431222', '431200', null, '沅陵县', '431222', '431222', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431223', '431200', null, '辰溪县', '431223', '431223', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431224', '431200', null, '溆浦县', '431224', '431224', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431225', '431200', null, '会同县', '431225', '431225', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431226', '431200', null, '麻阳苗族自治县', '431226', '431226', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431227', '431200', null, '新晃侗族自治县', '431227', '431227', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431228', '431200', null, '芷江侗族自治县', '431228', '431228', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431229', '431200', null, '靖州苗族侗族自治县', '431229', '431229', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431230', '431200', null, '通道侗族自治县', '431230', '431230', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431281', '431200', null, '洪江市', '431281', '431281', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431300', '430000', null, '娄底市', '431300', '431300', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431302', '431300', null, '娄星区', '431302', '431302', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431321', '431300', null, '双峰县', '431321', '431321', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431322', '431300', null, '新化县', '431322', '431322', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431381', '431300', null, '冷水江市', '431381', '431381', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('431382', '431300', null, '涟源市', '431382', '431382', 'TOWN', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433100', '430000', null, '湘西土家族苗族自治州', '433100', '433100', 'CITY', '2018-09-13 09:32:53', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433101', '433100', null, '吉首市', '433101', '433101', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433122', '433100', null, '泸溪县', '433122', '433122', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433123', '433100', null, '凤凰县', '433123', '433123', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433124', '433100', null, '花垣县', '433124', '433124', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433125', '433100', null, '保靖县', '433125', '433125', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433126', '433100', null, '古丈县', '433126', '433126', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433127', '433100', null, '永顺县', '433127', '433127', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('433130', '433100', null, '龙山县', '433130', '433130', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440000', '000000', null, '广东省', '440000', '440000', 'PROVINCE', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440100', '440000', null, '广州市', '440100', '440100', 'CITY', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440103', '440100', null, '荔湾区', '440103', '440103', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440104', '440100', null, '越秀区', '440104', '440104', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440105', '440100', null, '海珠区', '440105', '440105', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440106', '440100', null, '天河区', '440106', '440106', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440111', '440100', null, '白云区', '440111', '440111', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440112', '440100', null, '黄埔区', '440112', '440112', 'TOWN', '2018-09-13 09:32:54', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440113', '440100', null, '番禺区', '440113', '440113', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440114', '440100', null, '花都区', '440114', '440114', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440115', '440100', null, '南沙区', '440115', '440115', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440117', '440100', null, '从化区', '440117', '440117', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440118', '440100', null, '增城区', '440118', '440118', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440200', '440000', null, '韶关市', '440200', '440200', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440203', '440200', null, '武江区', '440203', '440203', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440204', '440200', null, '浈江区', '440204', '440204', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440205', '440200', null, '曲江区', '440205', '440205', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440222', '440200', null, '始兴县', '440222', '440222', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440224', '440200', null, '仁化县', '440224', '440224', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440229', '440200', null, '翁源县', '440229', '440229', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440232', '440200', null, '乳源瑶族自治县', '440232', '440232', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440233', '440200', null, '新丰县', '440233', '440233', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440281', '440200', null, '乐昌市', '440281', '440281', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440282', '440200', null, '南雄市', '440282', '440282', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440300', '440000', null, '深圳市', '440300', '440300', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440303', '440300', null, '罗湖区', '440303', '440303', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440304', '440300', null, '福田区', '440304', '440304', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440305', '440300', null, '南山区', '440305', '440305', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440306', '440300', null, '宝安区', '440306', '440306', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440307', '440300', null, '龙岗区', '440307', '440307', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440308', '440300', null, '盐田区', '440308', '440308', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440309', '440300', null, '龙华区', '440309', '440309', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440310', '440300', null, '坪山区', '440310', '440310', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440400', '440000', null, '珠海市', '440400', '440400', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440402', '440400', null, '香洲区', '440402', '440402', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440403', '440400', null, '斗门区', '440403', '440403', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440404', '440400', null, '金湾区', '440404', '440404', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440500', '440000', null, '汕头市', '440500', '440500', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440507', '440500', null, '龙湖区', '440507', '440507', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440511', '440500', null, '金平区', '440511', '440511', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440512', '440500', null, '濠江区', '440512', '440512', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440513', '440500', null, '潮阳区', '440513', '440513', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440514', '440500', null, '潮南区', '440514', '440514', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440515', '440500', null, '澄海区', '440515', '440515', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440523', '440500', null, '南澳县', '440523', '440523', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440600', '440000', null, '佛山市', '440600', '440600', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440604', '440600', null, '禅城区', '440604', '440604', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440605', '440600', null, '南海区', '440605', '440605', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440606', '440600', null, '顺德区', '440606', '440606', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440607', '440600', null, '三水区', '440607', '440607', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440608', '440600', null, '高明区', '440608', '440608', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440700', '440000', null, '江门市', '440700', '440700', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440703', '440700', null, '蓬江区', '440703', '440703', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440704', '440700', null, '江海区', '440704', '440704', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440705', '440700', null, '新会区', '440705', '440705', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440781', '440700', null, '台山市', '440781', '440781', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440783', '440700', null, '开平市', '440783', '440783', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440784', '440700', null, '鹤山市', '440784', '440784', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440785', '440700', null, '恩平市', '440785', '440785', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440800', '440000', null, '湛江市', '440800', '440800', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440802', '440800', null, '赤坎区', '440802', '440802', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440803', '440800', null, '霞山区', '440803', '440803', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440804', '440800', null, '坡头区', '440804', '440804', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440811', '440800', null, '麻章区', '440811', '440811', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440823', '440800', null, '遂溪县', '440823', '440823', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440825', '440800', null, '徐闻县', '440825', '440825', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440881', '440800', null, '廉江市', '440881', '440881', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440882', '440800', null, '雷州市', '440882', '440882', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440883', '440800', null, '吴川市', '440883', '440883', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440900', '440000', null, '茂名市', '440900', '440900', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440902', '440900', null, '茂南区', '440902', '440902', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440904', '440900', null, '电白区', '440904', '440904', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440981', '440900', null, '高州市', '440981', '440981', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440982', '440900', null, '化州市', '440982', '440982', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('440983', '440900', null, '信宜市', '440983', '440983', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441200', '440000', null, '肇庆市', '441200', '441200', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441202', '441200', null, '端州区', '441202', '441202', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441203', '441200', null, '鼎湖区', '441203', '441203', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441204', '441200', null, '高要区', '441204', '441204', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441223', '441200', null, '广宁县', '441223', '441223', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441224', '441200', null, '怀集县', '441224', '441224', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441225', '441200', null, '封开县', '441225', '441225', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441226', '441200', null, '德庆县', '441226', '441226', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441284', '441200', null, '四会市', '441284', '441284', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441300', '440000', null, '惠州市', '441300', '441300', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441302', '441300', null, '惠城区', '441302', '441302', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441303', '441300', null, '惠阳区', '441303', '441303', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441322', '441300', null, '博罗县', '441322', '441322', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441323', '441300', null, '惠东县', '441323', '441323', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441324', '441300', null, '龙门县', '441324', '441324', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441400', '440000', null, '梅州市', '441400', '441400', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441402', '441400', null, '梅江区', '441402', '441402', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441403', '441400', null, '梅县区', '441403', '441403', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441422', '441400', null, '大埔县', '441422', '441422', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441423', '441400', null, '丰顺县', '441423', '441423', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441424', '441400', null, '五华县', '441424', '441424', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441426', '441400', null, '平远县', '441426', '441426', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441427', '441400', null, '蕉岭县', '441427', '441427', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441481', '441400', null, '兴宁市', '441481', '441481', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441500', '440000', null, '汕尾市', '441500', '441500', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441502', '441500', null, '城区', '441502', '441502', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441521', '441500', null, '海丰县', '441521', '441521', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441523', '441500', null, '陆河县', '441523', '441523', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441581', '441500', null, '陆丰市', '441581', '441581', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441600', '440000', null, '河源市', '441600', '441600', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441602', '441600', null, '源城区', '441602', '441602', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441621', '441600', null, '紫金县', '441621', '441621', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441622', '441600', null, '龙川县', '441622', '441622', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441623', '441600', null, '连平县', '441623', '441623', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441624', '441600', null, '和平县', '441624', '441624', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441625', '441600', null, '东源县', '441625', '441625', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441700', '440000', null, '阳江市', '441700', '441700', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441702', '441700', null, '江城区', '441702', '441702', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441704', '441700', null, '阳东区', '441704', '441704', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441721', '441700', null, '阳西县', '441721', '441721', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441781', '441700', null, '阳春市', '441781', '441781', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441800', '440000', null, '清远市', '441800', '441800', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441802', '441800', null, '清城区', '441802', '441802', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441803', '441800', null, '清新区', '441803', '441803', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441821', '441800', null, '佛冈县', '441821', '441821', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441823', '441800', null, '阳山县', '441823', '441823', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441825', '441800', null, '连山壮族瑶族自治县', '441825', '441825', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441826', '441800', null, '连南瑶族自治县', '441826', '441826', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441881', '441800', null, '英德市', '441881', '441881', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441882', '441800', null, '连州市', '441882', '441882', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('441900', '440000', null, '东莞市', '441900', '441900', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('442000', '440000', null, '中山市', '442000', '442000', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445100', '440000', null, '潮州市', '445100', '445100', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445102', '445100', null, '湘桥区', '445102', '445102', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445103', '445100', null, '潮安区', '445103', '445103', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445122', '445100', null, '饶平县', '445122', '445122', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445200', '440000', null, '揭阳市', '445200', '445200', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445202', '445200', null, '榕城区', '445202', '445202', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445203', '445200', null, '揭东区', '445203', '445203', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445222', '445200', null, '揭西县', '445222', '445222', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445224', '445200', null, '惠来县', '445224', '445224', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445281', '445200', null, '普宁市', '445281', '445281', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445300', '440000', null, '云浮市', '445300', '445300', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445302', '445300', null, '云城区', '445302', '445302', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445303', '445300', null, '云安区', '445303', '445303', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445321', '445300', null, '新兴县', '445321', '445321', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445322', '445300', null, '郁南县', '445322', '445322', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('445381', '445300', null, '罗定市', '445381', '445381', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450000', '000000', null, '广西壮族自治区', '450000', '450000', 'PROVINCE', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450100', '450000', null, '南宁市', '450100', '450100', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450102', '450100', null, '兴宁区', '450102', '450102', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450103', '450100', null, '青秀区', '450103', '450103', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450105', '450100', null, '江南区', '450105', '450105', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450107', '450100', null, '西乡塘区', '450107', '450107', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450108', '450100', null, '良庆区', '450108', '450108', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450109', '450100', null, '邕宁区', '450109', '450109', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450110', '450100', null, '武鸣区', '450110', '450110', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450123', '450100', null, '隆安县', '450123', '450123', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450124', '450100', null, '马山县', '450124', '450124', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450125', '450100', null, '上林县', '450125', '450125', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450126', '450100', null, '宾阳县', '450126', '450126', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450127', '450100', null, '横县', '450127', '450127', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450200', '450000', null, '柳州市', '450200', '450200', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450202', '450200', null, '城中区', '450202', '450202', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450203', '450200', null, '鱼峰区', '450203', '450203', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450204', '450200', null, '柳南区', '450204', '450204', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450205', '450200', null, '柳北区', '450205', '450205', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450206', '450200', null, '柳江区', '450206', '450206', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450222', '450200', null, '柳城县', '450222', '450222', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450223', '450200', null, '鹿寨县', '450223', '450223', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450224', '450200', null, '融安县', '450224', '450224', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450225', '450200', null, '融水苗族自治县', '450225', '450225', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450226', '450200', null, '三江侗族自治县', '450226', '450226', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450300', '450000', null, '桂林市', '450300', '450300', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450302', '450300', null, '秀峰区', '450302', '450302', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450303', '450300', null, '叠彩区', '450303', '450303', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450304', '450300', null, '象山区', '450304', '450304', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450305', '450300', null, '七星区', '450305', '450305', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450311', '450300', null, '雁山区', '450311', '450311', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450312', '450300', null, '临桂区', '450312', '450312', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450321', '450300', null, '阳朔县', '450321', '450321', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450323', '450300', null, '灵川县', '450323', '450323', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450324', '450300', null, '全州县', '450324', '450324', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450325', '450300', null, '兴安县', '450325', '450325', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450326', '450300', null, '永福县', '450326', '450326', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450327', '450300', null, '灌阳县', '450327', '450327', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450328', '450300', null, '龙胜各族自治县', '450328', '450328', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450329', '450300', null, '资源县', '450329', '450329', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450330', '450300', null, '平乐县', '450330', '450330', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450331', '450300', null, '荔浦县', '450331', '450331', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450332', '450300', null, '恭城瑶族自治县', '450332', '450332', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450400', '450000', null, '梧州市', '450400', '450400', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450403', '450400', null, '万秀区', '450403', '450403', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450405', '450400', null, '长洲区', '450405', '450405', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450406', '450400', null, '龙圩区', '450406', '450406', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450421', '450400', null, '苍梧县', '450421', '450421', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450422', '450400', null, '藤县', '450422', '450422', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450423', '450400', null, '蒙山县', '450423', '450423', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450481', '450400', null, '岑溪市', '450481', '450481', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450500', '450000', null, '北海市', '450500', '450500', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450502', '450500', null, '海城区', '450502', '450502', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450503', '450500', null, '银海区', '450503', '450503', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450512', '450500', null, '铁山港区', '450512', '450512', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450521', '450500', null, '合浦县', '450521', '450521', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450600', '450000', null, '防城港市', '450600', '450600', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450602', '450600', null, '港口区', '450602', '450602', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450603', '450600', null, '防城区', '450603', '450603', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450621', '450600', null, '上思县', '450621', '450621', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450681', '450600', null, '东兴市', '450681', '450681', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450700', '450000', null, '钦州市', '450700', '450700', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450702', '450700', null, '钦南区', '450702', '450702', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450703', '450700', null, '钦北区', '450703', '450703', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450721', '450700', null, '灵山县', '450721', '450721', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450722', '450700', null, '浦北县', '450722', '450722', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450800', '450000', null, '贵港市', '450800', '450800', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450802', '450800', null, '港北区', '450802', '450802', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450803', '450800', null, '港南区', '450803', '450803', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450804', '450800', null, '覃塘区', '450804', '450804', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450821', '450800', null, '平南县', '450821', '450821', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450881', '450800', null, '桂平市', '450881', '450881', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450900', '450000', null, '玉林市', '450900', '450900', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450902', '450900', null, '玉州区', '450902', '450902', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450903', '450900', null, '福绵区', '450903', '450903', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450921', '450900', null, '容县', '450921', '450921', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450922', '450900', null, '陆川县', '450922', '450922', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450923', '450900', null, '博白县', '450923', '450923', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450924', '450900', null, '兴业县', '450924', '450924', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('450981', '450900', null, '北流市', '450981', '450981', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451000', '450000', null, '百色市', '451000', '451000', 'CITY', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451002', '451000', null, '右江区', '451002', '451002', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451021', '451000', null, '田阳县', '451021', '451021', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451022', '451000', null, '田东县', '451022', '451022', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451023', '451000', null, '平果县', '451023', '451023', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451024', '451000', null, '德保县', '451024', '451024', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451026', '451000', null, '那坡县', '451026', '451026', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451027', '451000', null, '凌云县', '451027', '451027', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451028', '451000', null, '乐业县', '451028', '451028', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451029', '451000', null, '田林县', '451029', '451029', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451030', '451000', null, '西林县', '451030', '451030', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451031', '451000', null, '隆林各族自治县', '451031', '451031', 'TOWN', '2018-09-13 09:32:55', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451081', '451000', null, '靖西市', '451081', '451081', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451100', '450000', null, '贺州市', '451100', '451100', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451102', '451100', null, '八步区', '451102', '451102', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451103', '451100', null, '平桂区', '451103', '451103', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451121', '451100', null, '昭平县', '451121', '451121', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451122', '451100', null, '钟山县', '451122', '451122', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451123', '451100', null, '富川瑶族自治县', '451123', '451123', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451200', '450000', null, '河池市', '451200', '451200', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451202', '451200', null, '金城江区', '451202', '451202', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451203', '451200', null, '宜州区', '451203', '451203', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451221', '451200', null, '南丹县', '451221', '451221', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451222', '451200', null, '天峨县', '451222', '451222', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451223', '451200', null, '凤山县', '451223', '451223', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451224', '451200', null, '东兰县', '451224', '451224', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451225', '451200', null, '罗城仫佬族自治县', '451225', '451225', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451226', '451200', null, '环江毛南族自治县', '451226', '451226', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451227', '451200', null, '巴马瑶族自治县', '451227', '451227', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451228', '451200', null, '都安瑶族自治县', '451228', '451228', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451229', '451200', null, '大化瑶族自治县', '451229', '451229', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451300', '450000', null, '来宾市', '451300', '451300', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451302', '451300', null, '兴宾区', '451302', '451302', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451321', '451300', null, '忻城县', '451321', '451321', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451322', '451300', null, '象州县', '451322', '451322', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451323', '451300', null, '武宣县', '451323', '451323', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451324', '451300', null, '金秀瑶族自治县', '451324', '451324', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451381', '451300', null, '合山市', '451381', '451381', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451400', '450000', null, '崇左市', '451400', '451400', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451402', '451400', null, '江州区', '451402', '451402', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451421', '451400', null, '扶绥县', '451421', '451421', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451422', '451400', null, '宁明县', '451422', '451422', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451423', '451400', null, '龙州县', '451423', '451423', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451424', '451400', null, '大新县', '451424', '451424', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451425', '451400', null, '天等县', '451425', '451425', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('451481', '451400', null, '凭祥市', '451481', '451481', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460000', '000000', null, '海南省', '460000', '460000', 'PROVINCE', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460100', '460000', null, '海口市', '460100', '460100', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460105', '460100', null, '秀英区', '460105', '460105', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460106', '460100', null, '龙华区', '460106', '460106', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460107', '460100', null, '琼山区', '460107', '460107', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460108', '460100', null, '美兰区', '460108', '460108', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460200', '460000', null, '三亚市', '460200', '460200', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460202', '460200', null, '海棠区', '460202', '460202', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460203', '460200', null, '吉阳区', '460203', '460203', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460204', '460200', null, '天涯区', '460204', '460204', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460205', '460200', null, '崖州区', '460205', '460205', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460300', '460000', null, '三沙市', '460300', '460300', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('460400', '460000', null, '儋州市', '460400', '460400', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469001', '460000', null, '五指山市', '469001', '469001', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469002', '460000', null, '琼海市', '469002', '469002', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469005', '460000', null, '文昌市', '469005', '469005', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469006', '460000', null, '万宁市', '469006', '469006', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469007', '460000', null, '东方市', '469007', '469007', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469021', '460000', null, '定安县', '469021', '469021', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469022', '460000', null, '屯昌县', '469022', '469022', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469023', '460000', null, '澄迈县', '469023', '469023', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469024', '460000', null, '临高县', '469024', '469024', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469025', '460000', null, '白沙黎族自治县', '469025', '469025', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469026', '460000', null, '昌江黎族自治县', '469026', '469026', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469027', '460000', null, '乐东黎族自治县', '469027', '469027', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469028', '460000', null, '陵水黎族自治县', '469028', '469028', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469029', '460000', null, '保亭黎族苗族自治县', '469029', '469029', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('469030', '460000', null, '琼中黎族苗族自治县', '469030', '469030', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500000', '000000', null, '重庆市', '500000', '500000', 'PROVINCE', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500101', '500000', null, '万州区', '500101', '500101', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500102', '500000', null, '涪陵区', '500102', '500102', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500103', '500000', null, '渝中区', '500103', '500103', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500104', '500000', null, '大渡口区', '500104', '500104', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500105', '500000', null, '江北区', '500105', '500105', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500106', '500000', null, '沙坪坝区', '500106', '500106', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500107', '500000', null, '九龙坡区', '500107', '500107', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500108', '500000', null, '南岸区', '500108', '500108', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500109', '500000', null, '北碚区', '500109', '500109', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500110', '500000', null, '綦江区', '500110', '500110', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500111', '500000', null, '大足区', '500111', '500111', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500112', '500000', null, '渝北区', '500112', '500112', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500113', '500000', null, '巴南区', '500113', '500113', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500114', '500000', null, '黔江区', '500114', '500114', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500115', '500000', null, '长寿区', '500115', '500115', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500116', '500000', null, '江津区', '500116', '500116', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500117', '500000', null, '合川区', '500117', '500117', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500118', '500000', null, '永川区', '500118', '500118', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500119', '500000', null, '南川区', '500119', '500119', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500120', '500000', null, '璧山区', '500120', '500120', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500151', '500000', null, '铜梁区', '500151', '500151', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500152', '500000', null, '潼南区', '500152', '500152', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500153', '500000', null, '荣昌区', '500153', '500153', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500154', '500000', null, '开州区', '500154', '500154', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500155', '500000', null, '梁平区', '500155', '500155', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500156', '500000', null, '武隆区', '500156', '500156', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500229', '500000', null, '城口县', '500229', '500229', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500230', '500000', null, '丰都县', '500230', '500230', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500231', '500000', null, '垫江县', '500231', '500231', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500233', '500000', null, '忠县', '500233', '500233', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500235', '500000', null, '云阳县', '500235', '500235', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500236', '500000', null, '奉节县', '500236', '500236', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500237', '500000', null, '巫山县', '500237', '500237', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500238', '500000', null, '巫溪县', '500238', '500238', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500240', '500000', null, '石柱土家族自治县', '500240', '500240', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500241', '500000', null, '秀山土家族苗族自治县', '500241', '500241', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500242', '500000', null, '酉阳土家族苗族自治县', '500242', '500242', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('500243', '500000', null, '彭水苗族土家族自治县', '500243', '500243', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510000', '000000', null, '四川省', '510000', '510000', 'PROVINCE', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510100', '510000', null, '成都市', '510100', '510100', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510104', '510100', null, '锦江区', '510104', '510104', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510105', '510100', null, '青羊区', '510105', '510105', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510106', '510100', null, '金牛区', '510106', '510106', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510107', '510100', null, '武侯区', '510107', '510107', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510108', '510100', null, '成华区', '510108', '510108', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510112', '510100', null, '龙泉驿区', '510112', '510112', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510113', '510100', null, '青白江区', '510113', '510113', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510114', '510100', null, '新都区', '510114', '510114', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510115', '510100', null, '温江区', '510115', '510115', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510116', '510100', null, '双流区', '510116', '510116', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510117', '510100', null, '郫都区', '510117', '510117', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510121', '510100', null, '金堂县', '510121', '510121', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510129', '510100', null, '大邑县', '510129', '510129', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510131', '510100', null, '蒲江县', '510131', '510131', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510132', '510100', null, '新津县', '510132', '510132', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510181', '510100', null, '都江堰市', '510181', '510181', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510182', '510100', null, '彭州市', '510182', '510182', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510183', '510100', null, '邛崃市', '510183', '510183', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510184', '510100', null, '崇州市', '510184', '510184', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510185', '510100', null, '简阳市', '510185', '510185', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510300', '510000', null, '自贡市', '510300', '510300', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510302', '510300', null, '自流井区', '510302', '510302', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510303', '510300', null, '贡井区', '510303', '510303', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510304', '510300', null, '大安区', '510304', '510304', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510311', '510300', null, '沿滩区', '510311', '510311', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510321', '510300', null, '荣县', '510321', '510321', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510322', '510300', null, '富顺县', '510322', '510322', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510400', '510000', null, '攀枝花市', '510400', '510400', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510402', '510400', null, '东区', '510402', '510402', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510403', '510400', null, '西区', '510403', '510403', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510411', '510400', null, '仁和区', '510411', '510411', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510421', '510400', null, '米易县', '510421', '510421', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510422', '510400', null, '盐边县', '510422', '510422', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510500', '510000', null, '泸州市', '510500', '510500', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510502', '510500', null, '江阳区', '510502', '510502', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510503', '510500', null, '纳溪区', '510503', '510503', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510504', '510500', null, '龙马潭区', '510504', '510504', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510521', '510500', null, '泸县', '510521', '510521', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510522', '510500', null, '合江县', '510522', '510522', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510524', '510500', null, '叙永县', '510524', '510524', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510525', '510500', null, '古蔺县', '510525', '510525', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510600', '510000', null, '德阳市', '510600', '510600', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510603', '510600', null, '旌阳区', '510603', '510603', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510604', '510600', null, '罗江区', '510604', '510604', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510623', '510600', null, '中江县', '510623', '510623', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510681', '510600', null, '广汉市', '510681', '510681', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510682', '510600', null, '什邡市', '510682', '510682', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510683', '510600', null, '绵竹市', '510683', '510683', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510700', '510000', null, '绵阳市', '510700', '510700', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510703', '510700', null, '涪城区', '510703', '510703', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510704', '510700', null, '游仙区', '510704', '510704', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510705', '510700', null, '安州区', '510705', '510705', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510722', '510700', null, '三台县', '510722', '510722', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510723', '510700', null, '盐亭县', '510723', '510723', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510725', '510700', null, '梓潼县', '510725', '510725', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510726', '510700', null, '北川羌族自治县', '510726', '510726', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510727', '510700', null, '平武县', '510727', '510727', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510781', '510700', null, '江油市', '510781', '510781', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510800', '510000', null, '广元市', '510800', '510800', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510802', '510800', null, '利州区', '510802', '510802', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510811', '510800', null, '昭化区', '510811', '510811', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510812', '510800', null, '朝天区', '510812', '510812', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510821', '510800', null, '旺苍县', '510821', '510821', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510822', '510800', null, '青川县', '510822', '510822', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510823', '510800', null, '剑阁县', '510823', '510823', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510824', '510800', null, '苍溪县', '510824', '510824', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510900', '510000', null, '遂宁市', '510900', '510900', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510903', '510900', null, '船山区', '510903', '510903', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510904', '510900', null, '安居区', '510904', '510904', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510921', '510900', null, '蓬溪县', '510921', '510921', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510922', '510900', null, '射洪县', '510922', '510922', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('510923', '510900', null, '大英县', '510923', '510923', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511000', '510000', null, '内江市', '511000', '511000', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511002', '511000', null, '市中区', '511002', '511002', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511011', '511000', null, '东兴区', '511011', '511011', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511024', '511000', null, '威远县', '511024', '511024', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511025', '511000', null, '资中县', '511025', '511025', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511083', '511000', null, '隆昌市', '511083', '511083', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511100', '510000', null, '乐山市', '511100', '511100', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511102', '511100', null, '市中区', '511102', '511102', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511111', '511100', null, '沙湾区', '511111', '511111', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511112', '511100', null, '五通桥区', '511112', '511112', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511113', '511100', null, '金口河区', '511113', '511113', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511123', '511100', null, '犍为县', '511123', '511123', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511124', '511100', null, '井研县', '511124', '511124', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511126', '511100', null, '夹江县', '511126', '511126', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511129', '511100', null, '沐川县', '511129', '511129', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511132', '511100', null, '峨边彝族自治县', '511132', '511132', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511133', '511100', null, '马边彝族自治县', '511133', '511133', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511181', '511100', null, '峨眉山市', '511181', '511181', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511300', '510000', null, '南充市', '511300', '511300', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511302', '511300', null, '顺庆区', '511302', '511302', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511303', '511300', null, '高坪区', '511303', '511303', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511304', '511300', null, '嘉陵区', '511304', '511304', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511321', '511300', null, '南部县', '511321', '511321', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511322', '511300', null, '营山县', '511322', '511322', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511323', '511300', null, '蓬安县', '511323', '511323', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511324', '511300', null, '仪陇县', '511324', '511324', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511325', '511300', null, '西充县', '511325', '511325', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511381', '511300', null, '阆中市', '511381', '511381', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511400', '510000', null, '眉山市', '511400', '511400', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511402', '511400', null, '东坡区', '511402', '511402', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511403', '511400', null, '彭山区', '511403', '511403', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511421', '511400', null, '仁寿县', '511421', '511421', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511423', '511400', null, '洪雅县', '511423', '511423', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511424', '511400', null, '丹棱县', '511424', '511424', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511425', '511400', null, '青神县', '511425', '511425', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511500', '510000', null, '宜宾市', '511500', '511500', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511502', '511500', null, '翠屏区', '511502', '511502', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511503', '511500', null, '南溪区', '511503', '511503', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511521', '511500', null, '宜宾县', '511521', '511521', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511523', '511500', null, '江安县', '511523', '511523', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511524', '511500', null, '长宁县', '511524', '511524', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511525', '511500', null, '高县', '511525', '511525', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511526', '511500', null, '珙县', '511526', '511526', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511527', '511500', null, '筠连县', '511527', '511527', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511528', '511500', null, '兴文县', '511528', '511528', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511529', '511500', null, '屏山县', '511529', '511529', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511600', '510000', null, '广安市', '511600', '511600', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511602', '511600', null, '广安区', '511602', '511602', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511603', '511600', null, '前锋区', '511603', '511603', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511621', '511600', null, '岳池县', '511621', '511621', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511622', '511600', null, '武胜县', '511622', '511622', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511623', '511600', null, '邻水县', '511623', '511623', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511681', '511600', null, '华蓥市', '511681', '511681', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511700', '510000', null, '达州市', '511700', '511700', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511702', '511700', null, '通川区', '511702', '511702', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511703', '511700', null, '达川区', '511703', '511703', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511722', '511700', null, '宣汉县', '511722', '511722', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511723', '511700', null, '开江县', '511723', '511723', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511724', '511700', null, '大竹县', '511724', '511724', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511725', '511700', null, '渠县', '511725', '511725', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511781', '511700', null, '万源市', '511781', '511781', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511800', '510000', null, '雅安市', '511800', '511800', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511802', '511800', null, '雨城区', '511802', '511802', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511803', '511800', null, '名山区', '511803', '511803', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511822', '511800', null, '荥经县', '511822', '511822', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511823', '511800', null, '汉源县', '511823', '511823', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511824', '511800', null, '石棉县', '511824', '511824', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511825', '511800', null, '天全县', '511825', '511825', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511826', '511800', null, '芦山县', '511826', '511826', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511827', '511800', null, '宝兴县', '511827', '511827', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511900', '510000', null, '巴中市', '511900', '511900', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511902', '511900', null, '巴州区', '511902', '511902', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511903', '511900', null, '恩阳区', '511903', '511903', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511921', '511900', null, '通江县', '511921', '511921', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511922', '511900', null, '南江县', '511922', '511922', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('511923', '511900', null, '平昌县', '511923', '511923', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('512000', '510000', null, '资阳市', '512000', '512000', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('512002', '512000', null, '雁江区', '512002', '512002', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('512021', '512000', null, '安岳县', '512021', '512021', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('512022', '512000', null, '乐至县', '512022', '512022', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513200', '510000', null, '阿坝藏族羌族自治州', '513200', '513200', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513201', '513200', null, '马尔康市', '513201', '513201', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513221', '513200', null, '汶川县', '513221', '513221', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513222', '513200', null, '理县', '513222', '513222', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513223', '513200', null, '茂县', '513223', '513223', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513224', '513200', null, '松潘县', '513224', '513224', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513225', '513200', null, '九寨沟县', '513225', '513225', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513226', '513200', null, '金川县', '513226', '513226', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513227', '513200', null, '小金县', '513227', '513227', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513228', '513200', null, '黑水县', '513228', '513228', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513230', '513200', null, '壤塘县', '513230', '513230', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513231', '513200', null, '阿坝县', '513231', '513231', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513232', '513200', null, '若尔盖县', '513232', '513232', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513233', '513200', null, '红原县', '513233', '513233', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513300', '510000', null, '甘孜藏族自治州', '513300', '513300', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513301', '513300', null, '康定市', '513301', '513301', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513322', '513300', null, '泸定县', '513322', '513322', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513323', '513300', null, '丹巴县', '513323', '513323', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513324', '513300', null, '九龙县', '513324', '513324', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513325', '513300', null, '雅江县', '513325', '513325', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513326', '513300', null, '道孚县', '513326', '513326', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513327', '513300', null, '炉霍县', '513327', '513327', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513328', '513300', null, '甘孜县', '513328', '513328', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513329', '513300', null, '新龙县', '513329', '513329', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513330', '513300', null, '德格县', '513330', '513330', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513331', '513300', null, '白玉县', '513331', '513331', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513332', '513300', null, '石渠县', '513332', '513332', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513333', '513300', null, '色达县', '513333', '513333', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513334', '513300', null, '理塘县', '513334', '513334', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513335', '513300', null, '巴塘县', '513335', '513335', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513336', '513300', null, '乡城县', '513336', '513336', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513337', '513300', null, '稻城县', '513337', '513337', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513338', '513300', null, '得荣县', '513338', '513338', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513400', '510000', null, '凉山彝族自治州', '513400', '513400', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513401', '513400', null, '西昌市', '513401', '513401', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513422', '513400', null, '木里藏族自治县', '513422', '513422', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513423', '513400', null, '盐源县', '513423', '513423', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513424', '513400', null, '德昌县', '513424', '513424', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513425', '513400', null, '会理县', '513425', '513425', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513426', '513400', null, '会东县', '513426', '513426', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513427', '513400', null, '宁南县', '513427', '513427', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513428', '513400', null, '普格县', '513428', '513428', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513429', '513400', null, '布拖县', '513429', '513429', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513430', '513400', null, '金阳县', '513430', '513430', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513431', '513400', null, '昭觉县', '513431', '513431', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513432', '513400', null, '喜德县', '513432', '513432', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513433', '513400', null, '冕宁县', '513433', '513433', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513434', '513400', null, '越西县', '513434', '513434', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513435', '513400', null, '甘洛县', '513435', '513435', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513436', '513400', null, '美姑县', '513436', '513436', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('513437', '513400', null, '雷波县', '513437', '513437', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520000', '000000', null, '贵州省', '520000', '520000', 'PROVINCE', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520100', '520000', null, '贵阳市', '520100', '520100', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520102', '520100', null, '南明区', '520102', '520102', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520103', '520100', null, '云岩区', '520103', '520103', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520111', '520100', null, '花溪区', '520111', '520111', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520112', '520100', null, '乌当区', '520112', '520112', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520113', '520100', null, '白云区', '520113', '520113', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520115', '520100', null, '观山湖区', '520115', '520115', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520121', '520100', null, '开阳县', '520121', '520121', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520122', '520100', null, '息烽县', '520122', '520122', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520123', '520100', null, '修文县', '520123', '520123', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520181', '520100', null, '清镇市', '520181', '520181', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520200', '520000', null, '六盘水市', '520200', '520200', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520201', '520200', null, '钟山区', '520201', '520201', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520203', '520200', null, '六枝特区', '520203', '520203', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520221', '520200', null, '水城县', '520221', '520221', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520281', '520200', null, '盘州市', '520281', '520281', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520300', '520000', null, '遵义市', '520300', '520300', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520302', '520300', null, '红花岗区', '520302', '520302', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520303', '520300', null, '汇川区', '520303', '520303', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520304', '520300', null, '播州区', '520304', '520304', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520322', '520300', null, '桐梓县', '520322', '520322', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520323', '520300', null, '绥阳县', '520323', '520323', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520324', '520300', null, '正安县', '520324', '520324', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520325', '520300', null, '道真仡佬族苗族自治县', '520325', '520325', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520326', '520300', null, '务川仡佬族苗族自治县', '520326', '520326', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520327', '520300', null, '凤冈县', '520327', '520327', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520328', '520300', null, '湄潭县', '520328', '520328', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520329', '520300', null, '余庆县', '520329', '520329', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520330', '520300', null, '习水县', '520330', '520330', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520381', '520300', null, '赤水市', '520381', '520381', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520382', '520300', null, '仁怀市', '520382', '520382', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520400', '520000', null, '安顺市', '520400', '520400', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520402', '520400', null, '西秀区', '520402', '520402', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520403', '520400', null, '平坝区', '520403', '520403', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520422', '520400', null, '普定县', '520422', '520422', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520423', '520400', null, '镇宁布依族苗族自治县', '520423', '520423', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520424', '520400', null, '关岭布依族苗族自治县', '520424', '520424', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520425', '520400', null, '紫云苗族布依族自治县', '520425', '520425', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520500', '520000', null, '毕节市', '520500', '520500', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520502', '520500', null, '七星关区', '520502', '520502', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520521', '520500', null, '大方县', '520521', '520521', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520522', '520500', null, '黔西县', '520522', '520522', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520523', '520500', null, '金沙县', '520523', '520523', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520524', '520500', null, '织金县', '520524', '520524', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520525', '520500', null, '纳雍县', '520525', '520525', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520526', '520500', null, '威宁彝族回族苗族自治县', '520526', '520526', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520527', '520500', null, '赫章县', '520527', '520527', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520600', '520000', null, '铜仁市', '520600', '520600', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520602', '520600', null, '碧江区', '520602', '520602', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520603', '520600', null, '万山区', '520603', '520603', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520621', '520600', null, '江口县', '520621', '520621', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520622', '520600', null, '玉屏侗族自治县', '520622', '520622', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520623', '520600', null, '石阡县', '520623', '520623', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520624', '520600', null, '思南县', '520624', '520624', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520625', '520600', null, '印江土家族苗族自治县', '520625', '520625', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520626', '520600', null, '德江县', '520626', '520626', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520627', '520600', null, '沿河土家族自治县', '520627', '520627', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('520628', '520600', null, '松桃苗族自治县', '520628', '520628', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522300', '520000', null, '黔西南布依族苗族自治州', '522300', '522300', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522301', '522300', null, '兴义市', '522301', '522301', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522322', '522300', null, '兴仁县', '522322', '522322', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522323', '522300', null, '普安县', '522323', '522323', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522324', '522300', null, '晴隆县', '522324', '522324', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522325', '522300', null, '贞丰县', '522325', '522325', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522326', '522300', null, '望谟县', '522326', '522326', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522327', '522300', null, '册亨县', '522327', '522327', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522328', '522300', null, '安龙县', '522328', '522328', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522600', '520000', null, '黔东南苗族侗族自治州', '522600', '522600', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522601', '522600', null, '凯里市', '522601', '522601', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522622', '522600', null, '黄平县', '522622', '522622', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522623', '522600', null, '施秉县', '522623', '522623', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522624', '522600', null, '三穗县', '522624', '522624', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522625', '522600', null, '镇远县', '522625', '522625', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522626', '522600', null, '岑巩县', '522626', '522626', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522627', '522600', null, '天柱县', '522627', '522627', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522628', '522600', null, '锦屏县', '522628', '522628', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522629', '522600', null, '剑河县', '522629', '522629', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522630', '522600', null, '台江县', '522630', '522630', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522631', '522600', null, '黎平县', '522631', '522631', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522632', '522600', null, '榕江县', '522632', '522632', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522633', '522600', null, '从江县', '522633', '522633', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522634', '522600', null, '雷山县', '522634', '522634', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522635', '522600', null, '麻江县', '522635', '522635', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522636', '522600', null, '丹寨县', '522636', '522636', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522700', '520000', null, '黔南布依族苗族自治州', '522700', '522700', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522701', '522700', null, '都匀市', '522701', '522701', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522702', '522700', null, '福泉市', '522702', '522702', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522722', '522700', null, '荔波县', '522722', '522722', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522723', '522700', null, '贵定县', '522723', '522723', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522725', '522700', null, '瓮安县', '522725', '522725', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522726', '522700', null, '独山县', '522726', '522726', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522727', '522700', null, '平塘县', '522727', '522727', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522728', '522700', null, '罗甸县', '522728', '522728', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522729', '522700', null, '长顺县', '522729', '522729', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522730', '522700', null, '龙里县', '522730', '522730', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522731', '522700', null, '惠水县', '522731', '522731', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('522732', '522700', null, '三都水族自治县', '522732', '522732', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530000', '000000', null, '云南省', '530000', '530000', 'PROVINCE', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530100', '530000', null, '昆明市', '530100', '530100', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530102', '530100', null, '五华区', '530102', '530102', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530103', '530100', null, '盘龙区', '530103', '530103', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530111', '530100', null, '官渡区', '530111', '530111', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530112', '530100', null, '西山区', '530112', '530112', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530113', '530100', null, '东川区', '530113', '530113', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530114', '530100', null, '呈贡区', '530114', '530114', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530115', '530100', null, '晋宁区', '530115', '530115', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530124', '530100', null, '富民县', '530124', '530124', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530125', '530100', null, '宜良县', '530125', '530125', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530126', '530100', null, '石林彝族自治县', '530126', '530126', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530127', '530100', null, '嵩明县', '530127', '530127', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530128', '530100', null, '禄劝彝族苗族自治县', '530128', '530128', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530129', '530100', null, '寻甸回族彝族自治县', '530129', '530129', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530181', '530100', null, '安宁市', '530181', '530181', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530300', '530000', null, '曲靖市', '530300', '530300', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530302', '530300', null, '麒麟区', '530302', '530302', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530303', '530300', null, '沾益区', '530303', '530303', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530304', '530300', null, '马龙区', '530304', '530304', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530322', '530300', null, '陆良县', '530322', '530322', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530323', '530300', null, '师宗县', '530323', '530323', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530324', '530300', null, '罗平县', '530324', '530324', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530325', '530300', null, '富源县', '530325', '530325', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530326', '530300', null, '会泽县', '530326', '530326', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530381', '530300', null, '宣威市', '530381', '530381', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530400', '530000', null, '玉溪市', '530400', '530400', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530402', '530400', null, '红塔区', '530402', '530402', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530403', '530400', null, '江川区', '530403', '530403', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530422', '530400', null, '澄江县', '530422', '530422', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530423', '530400', null, '通海县', '530423', '530423', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530424', '530400', null, '华宁县', '530424', '530424', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530425', '530400', null, '易门县', '530425', '530425', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530426', '530400', null, '峨山彝族自治县', '530426', '530426', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530427', '530400', null, '新平彝族傣族自治县', '530427', '530427', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530428', '530400', null, '元江哈尼族彝族傣族自治县', '530428', '530428', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530500', '530000', null, '保山市', '530500', '530500', 'CITY', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530502', '530500', null, '隆阳区', '530502', '530502', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530521', '530500', null, '施甸县', '530521', '530521', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530523', '530500', null, '龙陵县', '530523', '530523', 'TOWN', '2018-09-13 09:32:56', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530524', '530500', null, '昌宁县', '530524', '530524', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530581', '530500', null, '腾冲市', '530581', '530581', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530600', '530000', null, '昭通市', '530600', '530600', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530602', '530600', null, '昭阳区', '530602', '530602', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530621', '530600', null, '鲁甸县', '530621', '530621', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530622', '530600', null, '巧家县', '530622', '530622', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530623', '530600', null, '盐津县', '530623', '530623', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530624', '530600', null, '大关县', '530624', '530624', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530625', '530600', null, '永善县', '530625', '530625', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530626', '530600', null, '绥江县', '530626', '530626', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530627', '530600', null, '镇雄县', '530627', '530627', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530628', '530600', null, '彝良县', '530628', '530628', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530629', '530600', null, '威信县', '530629', '530629', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530630', '530600', null, '水富县', '530630', '530630', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530700', '530000', null, '丽江市', '530700', '530700', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530702', '530700', null, '古城区', '530702', '530702', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530721', '530700', null, '玉龙纳西族自治县', '530721', '530721', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530722', '530700', null, '永胜县', '530722', '530722', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530723', '530700', null, '华坪县', '530723', '530723', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530724', '530700', null, '宁蒗彝族自治县', '530724', '530724', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530800', '530000', null, '普洱市', '530800', '530800', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530802', '530800', null, '思茅区', '530802', '530802', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530821', '530800', null, '宁洱哈尼族彝族自治县', '530821', '530821', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530822', '530800', null, '墨江哈尼族自治县', '530822', '530822', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530823', '530800', null, '景东彝族自治县', '530823', '530823', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530824', '530800', null, '景谷傣族彝族自治县', '530824', '530824', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530825', '530800', null, '镇沅彝族哈尼族拉祜族自治县', '530825', '530825', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530826', '530800', null, '江城哈尼族彝族自治县', '530826', '530826', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530827', '530800', null, '孟连傣族拉祜族佤族自治县', '530827', '530827', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530828', '530800', null, '澜沧拉祜族自治县', '530828', '530828', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530829', '530800', null, '西盟佤族自治县', '530829', '530829', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530900', '530000', null, '临沧市', '530900', '530900', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530902', '530900', null, '临翔区', '530902', '530902', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530921', '530900', null, '凤庆县', '530921', '530921', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530922', '530900', null, '云县', '530922', '530922', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530923', '530900', null, '永德县', '530923', '530923', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530924', '530900', null, '镇康县', '530924', '530924', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530925', '530900', null, '双江拉祜族佤族布朗族傣族自治县', '530925', '530925', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530926', '530900', null, '耿马傣族佤族自治县', '530926', '530926', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('530927', '530900', null, '沧源佤族自治县', '530927', '530927', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532300', '530000', null, '楚雄彝族自治州', '532300', '532300', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532301', '532300', null, '楚雄市', '532301', '532301', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532322', '532300', null, '双柏县', '532322', '532322', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532323', '532300', null, '牟定县', '532323', '532323', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532324', '532300', null, '南华县', '532324', '532324', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532325', '532300', null, '姚安县', '532325', '532325', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532326', '532300', null, '大姚县', '532326', '532326', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532327', '532300', null, '永仁县', '532327', '532327', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532328', '532300', null, '元谋县', '532328', '532328', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532329', '532300', null, '武定县', '532329', '532329', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532331', '532300', null, '禄丰县', '532331', '532331', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532500', '530000', null, '红河哈尼族彝族自治州', '532500', '532500', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532501', '532500', null, '个旧市', '532501', '532501', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532502', '532500', null, '开远市', '532502', '532502', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532503', '532500', null, '蒙自市', '532503', '532503', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532504', '532500', null, '弥勒市', '532504', '532504', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532523', '532500', null, '屏边苗族自治县', '532523', '532523', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532524', '532500', null, '建水县', '532524', '532524', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532525', '532500', null, '石屏县', '532525', '532525', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532527', '532500', null, '泸西县', '532527', '532527', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532528', '532500', null, '元阳县', '532528', '532528', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532529', '532500', null, '红河县', '532529', '532529', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532530', '532500', null, '金平苗族瑶族傣族自治县', '532530', '532530', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532531', '532500', null, '绿春县', '532531', '532531', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532532', '532500', null, '河口瑶族自治县', '532532', '532532', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532600', '530000', null, '文山壮族苗族自治州', '532600', '532600', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532601', '532600', null, '文山市', '532601', '532601', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532622', '532600', null, '砚山县', '532622', '532622', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532623', '532600', null, '西畴县', '532623', '532623', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532624', '532600', null, '麻栗坡县', '532624', '532624', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532625', '532600', null, '马关县', '532625', '532625', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532626', '532600', null, '丘北县', '532626', '532626', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532627', '532600', null, '广南县', '532627', '532627', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532628', '532600', null, '富宁县', '532628', '532628', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532800', '530000', null, '西双版纳傣族自治州', '532800', '532800', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532801', '532800', null, '景洪市', '532801', '532801', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532822', '532800', null, '勐海县', '532822', '532822', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532823', '532800', null, '勐腊县', '532823', '532823', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532900', '530000', null, '大理白族自治州', '532900', '532900', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532901', '532900', null, '大理市', '532901', '532901', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532922', '532900', null, '漾濞彝族自治县', '532922', '532922', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532923', '532900', null, '祥云县', '532923', '532923', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532924', '532900', null, '宾川县', '532924', '532924', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532925', '532900', null, '弥渡县', '532925', '532925', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532926', '532900', null, '南涧彝族自治县', '532926', '532926', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532927', '532900', null, '巍山彝族回族自治县', '532927', '532927', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532928', '532900', null, '永平县', '532928', '532928', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532929', '532900', null, '云龙县', '532929', '532929', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532930', '532900', null, '洱源县', '532930', '532930', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532931', '532900', null, '剑川县', '532931', '532931', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('532932', '532900', null, '鹤庆县', '532932', '532932', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533100', '530000', null, '德宏傣族景颇族自治州', '533100', '533100', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533102', '533100', null, '瑞丽市', '533102', '533102', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533103', '533100', null, '芒市', '533103', '533103', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533122', '533100', null, '梁河县', '533122', '533122', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533123', '533100', null, '盈江县', '533123', '533123', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533124', '533100', null, '陇川县', '533124', '533124', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533300', '530000', null, '怒江傈僳族自治州', '533300', '533300', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533301', '533300', null, '泸水市', '533301', '533301', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533323', '533300', null, '福贡县', '533323', '533323', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533324', '533300', null, '贡山独龙族怒族自治县', '533324', '533324', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533325', '533300', null, '兰坪白族普米族自治县', '533325', '533325', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533400', '530000', null, '迪庆藏族自治州', '533400', '533400', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533401', '533400', null, '香格里拉市', '533401', '533401', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533422', '533400', null, '德钦县', '533422', '533422', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('533423', '533400', null, '维西傈僳族自治县', '533423', '533423', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540000', '000000', null, '西藏自治区', '540000', '540000', 'PROVINCE', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540100', '540000', null, '拉萨市', '540100', '540100', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540102', '540100', null, '城关区', '540102', '540102', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540103', '540100', null, '堆龙德庆区', '540103', '540103', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540104', '540100', null, '达孜区', '540104', '540104', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540121', '540100', null, '林周县', '540121', '540121', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540122', '540100', null, '当雄县', '540122', '540122', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540123', '540100', null, '尼木县', '540123', '540123', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540124', '540100', null, '曲水县', '540124', '540124', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540127', '540100', null, '墨竹工卡县', '540127', '540127', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540200', '540000', null, '日喀则市', '540200', '540200', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540202', '540200', null, '桑珠孜区', '540202', '540202', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540221', '540200', null, '南木林县', '540221', '540221', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540222', '540200', null, '江孜县', '540222', '540222', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540223', '540200', null, '定日县', '540223', '540223', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540224', '540200', null, '萨迦县', '540224', '540224', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540225', '540200', null, '拉孜县', '540225', '540225', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540226', '540200', null, '昂仁县', '540226', '540226', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540227', '540200', null, '谢通门县', '540227', '540227', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540228', '540200', null, '白朗县', '540228', '540228', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540229', '540200', null, '仁布县', '540229', '540229', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540230', '540200', null, '康马县', '540230', '540230', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540231', '540200', null, '定结县', '540231', '540231', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540232', '540200', null, '仲巴县', '540232', '540232', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540233', '540200', null, '亚东县', '540233', '540233', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540234', '540200', null, '吉隆县', '540234', '540234', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540235', '540200', null, '聂拉木县', '540235', '540235', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540236', '540200', null, '萨嘎县', '540236', '540236', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540237', '540200', null, '岗巴县', '540237', '540237', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540300', '540000', null, '昌都市', '540300', '540300', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540302', '540300', null, '卡若区', '540302', '540302', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540321', '540300', null, '江达县', '540321', '540321', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540322', '540300', null, '贡觉县', '540322', '540322', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540323', '540300', null, '类乌齐县', '540323', '540323', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540324', '540300', null, '丁青县', '540324', '540324', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540325', '540300', null, '察雅县', '540325', '540325', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540326', '540300', null, '八宿县', '540326', '540326', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540327', '540300', null, '左贡县', '540327', '540327', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540328', '540300', null, '芒康县', '540328', '540328', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540329', '540300', null, '洛隆县', '540329', '540329', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540330', '540300', null, '边坝县', '540330', '540330', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540400', '540000', null, '林芝市', '540400', '540400', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540402', '540400', null, '巴宜区', '540402', '540402', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540421', '540400', null, '工布江达县', '540421', '540421', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540422', '540400', null, '米林县', '540422', '540422', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540423', '540400', null, '墨脱县', '540423', '540423', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540424', '540400', null, '波密县', '540424', '540424', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540425', '540400', null, '察隅县', '540425', '540425', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540426', '540400', null, '朗县', '540426', '540426', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540500', '540000', null, '山南市', '540500', '540500', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540502', '540500', null, '乃东区', '540502', '540502', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540521', '540500', null, '扎囊县', '540521', '540521', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540522', '540500', null, '贡嘎县', '540522', '540522', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540523', '540500', null, '桑日县', '540523', '540523', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540524', '540500', null, '琼结县', '540524', '540524', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540525', '540500', null, '曲松县', '540525', '540525', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540526', '540500', null, '措美县', '540526', '540526', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540527', '540500', null, '洛扎县', '540527', '540527', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540528', '540500', null, '加查县', '540528', '540528', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540529', '540500', null, '隆子县', '540529', '540529', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540530', '540500', null, '错那县', '540530', '540530', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540531', '540500', null, '浪卡子县', '540531', '540531', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540600', '540000', null, '那曲市', '540600', '540600', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540602', '540600', null, '色尼区', '540602', '540602', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540621', '540600', null, '嘉黎县 ', '540621', '540621', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540622', '540600', null, '比如县 ', '540622', '540622', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540623', '540600', null, '聂荣县 ', '540623', '540623', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540624', '540600', null, '安多县 ', '540624', '540624', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540625', '540600', null, '申扎县 ', '540625', '540625', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540626', '540600', null, '索县', '540626', '540626', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540627', '540600', null, '班戈县 ', '540627', '540627', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540628', '540600', null, '巴青县 ', '540628', '540628', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540629', '540600', null, '尼玛县 ', '540629', '540629', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('540630', '540600', null, '双湖县 ', '540630', '540630', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('542500', '540000', null, '阿里地区', '542500', '542500', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('542521', '542500', null, '普兰县', '542521', '542521', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('542522', '542500', null, '札达县', '542522', '542522', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('542523', '542500', null, '噶尔县', '542523', '542523', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('542524', '542500', null, '日土县', '542524', '542524', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('542525', '542500', null, '革吉县', '542525', '542525', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('542526', '542500', null, '改则县', '542526', '542526', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('542527', '542500', null, '措勤县', '542527', '542527', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610000', '000000', null, '陕西省', '610000', '610000', 'PROVINCE', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610100', '610000', null, '西安市', '610100', '610100', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610102', '610100', null, '新城区', '610102', '610102', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610103', '610100', null, '碑林区', '610103', '610103', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610104', '610100', null, '莲湖区', '610104', '610104', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610111', '610100', null, '灞桥区', '610111', '610111', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610112', '610100', null, '未央区', '610112', '610112', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610113', '610100', null, '雁塔区', '610113', '610113', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610114', '610100', null, '阎良区', '610114', '610114', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610115', '610100', null, '临潼区', '610115', '610115', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610116', '610100', null, '长安区', '610116', '610116', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610117', '610100', null, '高陵区', '610117', '610117', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610118', '610100', null, '鄠邑区', '610118', '610118', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610122', '610100', null, '蓝田县', '610122', '610122', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610124', '610100', null, '周至县', '610124', '610124', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610200', '610000', null, '铜川市', '610200', '610200', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610202', '610200', null, '王益区', '610202', '610202', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610203', '610200', null, '印台区', '610203', '610203', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610204', '610200', null, '耀州区', '610204', '610204', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610222', '610200', null, '宜君县', '610222', '610222', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610300', '610000', null, '宝鸡市', '610300', '610300', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610302', '610300', null, '渭滨区', '610302', '610302', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610303', '610300', null, '金台区', '610303', '610303', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610304', '610300', null, '陈仓区', '610304', '610304', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610322', '610300', null, '凤翔县', '610322', '610322', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610323', '610300', null, '岐山县', '610323', '610323', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610324', '610300', null, '扶风县', '610324', '610324', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610326', '610300', null, '眉县', '610326', '610326', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610327', '610300', null, '陇县', '610327', '610327', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610328', '610300', null, '千阳县', '610328', '610328', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610329', '610300', null, '麟游县', '610329', '610329', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610330', '610300', null, '凤县', '610330', '610330', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610331', '610300', null, '太白县', '610331', '610331', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610400', '610000', null, '咸阳市', '610400', '610400', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610402', '610400', null, '秦都区', '610402', '610402', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610403', '610400', null, '杨陵区', '610403', '610403', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610404', '610400', null, '渭城区', '610404', '610404', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610422', '610400', null, '三原县', '610422', '610422', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610423', '610400', null, '泾阳县', '610423', '610423', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610424', '610400', null, '乾县', '610424', '610424', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610425', '610400', null, '礼泉县', '610425', '610425', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610426', '610400', null, '永寿县', '610426', '610426', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610428', '610400', null, '长武县', '610428', '610428', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610429', '610400', null, '旬邑县', '610429', '610429', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610430', '610400', null, '淳化县', '610430', '610430', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610431', '610400', null, '武功县', '610431', '610431', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610481', '610400', null, '兴平市', '610481', '610481', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610482', '610400', null, '彬州市', '610482', '610482', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610500', '610000', null, '渭南市', '610500', '610500', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610502', '610500', null, '临渭区', '610502', '610502', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610503', '610500', null, '华州区', '610503', '610503', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610522', '610500', null, '潼关县', '610522', '610522', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610523', '610500', null, '大荔县', '610523', '610523', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610524', '610500', null, '合阳县', '610524', '610524', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610525', '610500', null, '澄城县', '610525', '610525', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610526', '610500', null, '蒲城县', '610526', '610526', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610527', '610500', null, '白水县', '610527', '610527', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610528', '610500', null, '富平县', '610528', '610528', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610581', '610500', null, '韩城市', '610581', '610581', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610582', '610500', null, '华阴市', '610582', '610582', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610600', '610000', null, '延安市', '610600', '610600', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610602', '610600', null, '宝塔区', '610602', '610602', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610603', '610600', null, '安塞区', '610603', '610603', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610621', '610600', null, '延长县', '610621', '610621', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610622', '610600', null, '延川县', '610622', '610622', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610623', '610600', null, '子长县', '610623', '610623', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610625', '610600', null, '志丹县', '610625', '610625', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610626', '610600', null, '吴起县', '610626', '610626', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610627', '610600', null, '甘泉县', '610627', '610627', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610628', '610600', null, '富县', '610628', '610628', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610629', '610600', null, '洛川县', '610629', '610629', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610630', '610600', null, '宜川县', '610630', '610630', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610631', '610600', null, '黄龙县', '610631', '610631', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610632', '610600', null, '黄陵县', '610632', '610632', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610700', '610000', null, '汉中市', '610700', '610700', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610702', '610700', null, '汉台区', '610702', '610702', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610703', '610700', null, '南郑区', '610703', '610703', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610722', '610700', null, '城固县', '610722', '610722', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610723', '610700', null, '洋县', '610723', '610723', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610724', '610700', null, '西乡县', '610724', '610724', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610725', '610700', null, '勉县', '610725', '610725', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610726', '610700', null, '宁强县', '610726', '610726', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610727', '610700', null, '略阳县', '610727', '610727', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610728', '610700', null, '镇巴县', '610728', '610728', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610729', '610700', null, '留坝县', '610729', '610729', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610730', '610700', null, '佛坪县', '610730', '610730', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610800', '610000', null, '榆林市', '610800', '610800', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610802', '610800', null, '榆阳区', '610802', '610802', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610803', '610800', null, '横山区', '610803', '610803', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610822', '610800', null, '府谷县', '610822', '610822', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610824', '610800', null, '靖边县', '610824', '610824', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610825', '610800', null, '定边县', '610825', '610825', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610826', '610800', null, '绥德县', '610826', '610826', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610827', '610800', null, '米脂县', '610827', '610827', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610828', '610800', null, '佳县', '610828', '610828', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610829', '610800', null, '吴堡县', '610829', '610829', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610830', '610800', null, '清涧县', '610830', '610830', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610831', '610800', null, '子洲县', '610831', '610831', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610881', '610800', null, '神木市', '610881', '610881', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610900', '610000', null, '安康市', '610900', '610900', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610902', '610900', null, '汉滨区', '610902', '610902', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610921', '610900', null, '汉阴县', '610921', '610921', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610922', '610900', null, '石泉县', '610922', '610922', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610923', '610900', null, '宁陕县', '610923', '610923', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610924', '610900', null, '紫阳县', '610924', '610924', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610925', '610900', null, '岚皋县', '610925', '610925', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610926', '610900', null, '平利县', '610926', '610926', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610927', '610900', null, '镇坪县', '610927', '610927', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610928', '610900', null, '旬阳县', '610928', '610928', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('610929', '610900', null, '白河县', '610929', '610929', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('611000', '610000', null, '商洛市', '611000', '611000', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('611002', '611000', null, '商州区', '611002', '611002', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('611021', '611000', null, '洛南县', '611021', '611021', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('611022', '611000', null, '丹凤县', '611022', '611022', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('611023', '611000', null, '商南县', '611023', '611023', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('611024', '611000', null, '山阳县', '611024', '611024', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('611025', '611000', null, '镇安县', '611025', '611025', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('611026', '611000', null, '柞水县', '611026', '611026', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620000', '000000', null, '甘肃省', '620000', '620000', 'PROVINCE', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620100', '620000', null, '兰州市', '620100', '620100', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620102', '620100', null, '城关区', '620102', '620102', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620103', '620100', null, '七里河区', '620103', '620103', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620104', '620100', null, '西固区', '620104', '620104', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620105', '620100', null, '安宁区', '620105', '620105', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620111', '620100', null, '红古区', '620111', '620111', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620121', '620100', null, '永登县', '620121', '620121', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620122', '620100', null, '皋兰县', '620122', '620122', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620123', '620100', null, '榆中县', '620123', '620123', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620200', '620000', null, '嘉峪关市', '620200', '620200', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620300', '620000', null, '金昌市', '620300', '620300', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620302', '620300', null, '金川区', '620302', '620302', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620321', '620300', null, '永昌县', '620321', '620321', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620400', '620000', null, '白银市', '620400', '620400', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620402', '620400', null, '白银区', '620402', '620402', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620403', '620400', null, '平川区', '620403', '620403', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620421', '620400', null, '靖远县', '620421', '620421', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620422', '620400', null, '会宁县', '620422', '620422', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620423', '620400', null, '景泰县', '620423', '620423', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620500', '620000', null, '天水市', '620500', '620500', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620502', '620500', null, '秦州区', '620502', '620502', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620503', '620500', null, '麦积区', '620503', '620503', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620521', '620500', null, '清水县', '620521', '620521', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620522', '620500', null, '秦安县', '620522', '620522', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620523', '620500', null, '甘谷县', '620523', '620523', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620524', '620500', null, '武山县', '620524', '620524', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620525', '620500', null, '张家川回族自治县', '620525', '620525', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620600', '620000', null, '武威市', '620600', '620600', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620602', '620600', null, '凉州区', '620602', '620602', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620621', '620600', null, '民勤县', '620621', '620621', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620622', '620600', null, '古浪县', '620622', '620622', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620623', '620600', null, '天祝藏族自治县', '620623', '620623', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620700', '620000', null, '张掖市', '620700', '620700', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620702', '620700', null, '甘州区', '620702', '620702', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620721', '620700', null, '肃南裕固族自治县', '620721', '620721', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620722', '620700', null, '民乐县', '620722', '620722', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620723', '620700', null, '临泽县', '620723', '620723', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620724', '620700', null, '高台县', '620724', '620724', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620725', '620700', null, '山丹县', '620725', '620725', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620800', '620000', null, '平凉市', '620800', '620800', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620802', '620800', null, '崆峒区', '620802', '620802', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620821', '620800', null, '泾川县', '620821', '620821', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620822', '620800', null, '灵台县', '620822', '620822', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620823', '620800', null, '崇信县', '620823', '620823', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620824', '620800', null, '华亭县', '620824', '620824', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620825', '620800', null, '庄浪县', '620825', '620825', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620826', '620800', null, '静宁县', '620826', '620826', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620900', '620000', null, '酒泉市', '620900', '620900', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620902', '620900', null, '肃州区', '620902', '620902', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620921', '620900', null, '金塔县', '620921', '620921', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620922', '620900', null, '瓜州县', '620922', '620922', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620923', '620900', null, '肃北蒙古族自治县', '620923', '620923', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620924', '620900', null, '阿克塞哈萨克族自治县', '620924', '620924', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620981', '620900', null, '玉门市', '620981', '620981', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('620982', '620900', null, '敦煌市', '620982', '620982', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621000', '620000', null, '庆阳市', '621000', '621000', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621002', '621000', null, '西峰区', '621002', '621002', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621021', '621000', null, '庆城县', '621021', '621021', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621022', '621000', null, '环县', '621022', '621022', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621023', '621000', null, '华池县', '621023', '621023', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621024', '621000', null, '合水县', '621024', '621024', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621025', '621000', null, '正宁县', '621025', '621025', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621026', '621000', null, '宁县', '621026', '621026', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621027', '621000', null, '镇原县', '621027', '621027', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621100', '620000', null, '定西市', '621100', '621100', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621102', '621100', null, '安定区', '621102', '621102', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621121', '621100', null, '通渭县', '621121', '621121', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621122', '621100', null, '陇西县', '621122', '621122', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621123', '621100', null, '渭源县', '621123', '621123', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621124', '621100', null, '临洮县', '621124', '621124', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621125', '621100', null, '漳县', '621125', '621125', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621126', '621100', null, '岷县', '621126', '621126', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621200', '620000', null, '陇南市', '621200', '621200', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621202', '621200', null, '武都区', '621202', '621202', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621221', '621200', null, '成县', '621221', '621221', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621222', '621200', null, '文县', '621222', '621222', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621223', '621200', null, '宕昌县', '621223', '621223', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621224', '621200', null, '康县', '621224', '621224', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621225', '621200', null, '西和县', '621225', '621225', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621226', '621200', null, '礼县', '621226', '621226', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621227', '621200', null, '徽县', '621227', '621227', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('621228', '621200', null, '两当县', '621228', '621228', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622900', '620000', null, '临夏回族自治州', '622900', '622900', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622901', '622900', null, '临夏市', '622901', '622901', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622921', '622900', null, '临夏县', '622921', '622921', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622922', '622900', null, '康乐县', '622922', '622922', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622923', '622900', null, '永靖县', '622923', '622923', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622924', '622900', null, '广河县', '622924', '622924', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622925', '622900', null, '和政县', '622925', '622925', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622926', '622900', null, '东乡族自治县', '622926', '622926', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('622927', '622900', null, '积石山保安族东乡族撒拉族自治县', '622927', '622927', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623000', '620000', null, '甘南藏族自治州', '623000', '623000', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623001', '623000', null, '合作市', '623001', '623001', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623021', '623000', null, '临潭县', '623021', '623021', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623022', '623000', null, '卓尼县', '623022', '623022', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623023', '623000', null, '舟曲县', '623023', '623023', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623024', '623000', null, '迭部县', '623024', '623024', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623025', '623000', null, '玛曲县', '623025', '623025', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623026', '623000', null, '碌曲县', '623026', '623026', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('623027', '623000', null, '夏河县', '623027', '623027', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630000', '000000', null, '青海省', '630000', '630000', 'PROVINCE', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630100', '630000', null, '西宁市', '630100', '630100', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630102', '630100', null, '城东区', '630102', '630102', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630103', '630100', null, '城中区', '630103', '630103', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630104', '630100', null, '城西区', '630104', '630104', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630105', '630100', null, '城北区', '630105', '630105', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630121', '630100', null, '大通回族土族自治县', '630121', '630121', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630122', '630100', null, '湟中县', '630122', '630122', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630123', '630100', null, '湟源县', '630123', '630123', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630200', '630000', null, '海东市', '630200', '630200', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630202', '630200', null, '乐都区', '630202', '630202', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630203', '630200', null, '平安区', '630203', '630203', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630222', '630200', null, '民和回族土族自治县', '630222', '630222', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630223', '630200', null, '互助土族自治县', '630223', '630223', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630224', '630200', null, '化隆回族自治县', '630224', '630224', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('630225', '630200', null, '循化撒拉族自治县', '630225', '630225', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632200', '630000', null, '海北藏族自治州', '632200', '632200', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632221', '632200', null, '门源回族自治县', '632221', '632221', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632222', '632200', null, '祁连县', '632222', '632222', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632223', '632200', null, '海晏县', '632223', '632223', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632224', '632200', null, '刚察县', '632224', '632224', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632300', '630000', null, '黄南藏族自治州', '632300', '632300', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632321', '632300', null, '同仁县', '632321', '632321', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632322', '632300', null, '尖扎县', '632322', '632322', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632323', '632300', null, '泽库县', '632323', '632323', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632324', '632300', null, '河南蒙古族自治县', '632324', '632324', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632500', '630000', null, '海南藏族自治州', '632500', '632500', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632521', '632500', null, '共和县', '632521', '632521', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632522', '632500', null, '同德县', '632522', '632522', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632523', '632500', null, '贵德县', '632523', '632523', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632524', '632500', null, '兴海县', '632524', '632524', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632525', '632500', null, '贵南县', '632525', '632525', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632600', '630000', null, '果洛藏族自治州', '632600', '632600', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632621', '632600', null, '玛沁县', '632621', '632621', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632622', '632600', null, '班玛县', '632622', '632622', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632623', '632600', null, '甘德县', '632623', '632623', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632624', '632600', null, '达日县', '632624', '632624', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632625', '632600', null, '久治县', '632625', '632625', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632626', '632600', null, '玛多县', '632626', '632626', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632700', '630000', null, '玉树藏族自治州', '632700', '632700', 'CITY', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632701', '632700', null, '玉树市', '632701', '632701', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632722', '632700', null, '杂多县', '632722', '632722', 'TOWN', '2018-09-13 09:32:57', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632723', '632700', null, '称多县', '632723', '632723', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632724', '632700', null, '治多县', '632724', '632724', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632725', '632700', null, '囊谦县', '632725', '632725', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632726', '632700', null, '曲麻莱县', '632726', '632726', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632800', '630000', null, '海西蒙古族藏族自治州', '632800', '632800', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632801', '632800', null, '格尔木市', '632801', '632801', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632802', '632800', null, '德令哈市', '632802', '632802', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632821', '632800', null, '乌兰县', '632821', '632821', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632822', '632800', null, '都兰县', '632822', '632822', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('632823', '632800', null, '天峻县', '632823', '632823', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640000', '000000', null, '宁夏回族自治区', '640000', '640000', 'PROVINCE', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640100', '640000', null, '银川市', '640100', '640100', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640104', '640100', null, '兴庆区', '640104', '640104', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640105', '640100', null, '西夏区', '640105', '640105', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640106', '640100', null, '金凤区', '640106', '640106', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640121', '640100', null, '永宁县', '640121', '640121', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640122', '640100', null, '贺兰县', '640122', '640122', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640181', '640100', null, '灵武市', '640181', '640181', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640200', '640000', null, '石嘴山市', '640200', '640200', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640202', '640200', null, '大武口区', '640202', '640202', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640205', '640200', null, '惠农区', '640205', '640205', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640221', '640200', null, '平罗县', '640221', '640221', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640300', '640000', null, '吴忠市', '640300', '640300', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640302', '640300', null, '利通区', '640302', '640302', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640303', '640300', null, '红寺堡区', '640303', '640303', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640323', '640300', null, '盐池县', '640323', '640323', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640324', '640300', null, '同心县', '640324', '640324', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640381', '640300', null, '青铜峡市', '640381', '640381', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640400', '640000', null, '固原市', '640400', '640400', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640402', '640400', null, '原州区', '640402', '640402', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640422', '640400', null, '西吉县', '640422', '640422', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640423', '640400', null, '隆德县', '640423', '640423', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640424', '640400', null, '泾源县', '640424', '640424', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640425', '640400', null, '彭阳县', '640425', '640425', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640500', '640000', null, '中卫市', '640500', '640500', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640502', '640500', null, '沙坡头区', '640502', '640502', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640521', '640500', null, '中宁县', '640521', '640521', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('640522', '640500', null, '海原县', '640522', '640522', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650000', '000000', null, '新疆维吾尔自治区', '650000', '650000', 'PROVINCE', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650100', '650000', null, '乌鲁木齐市', '650100', '650100', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650102', '650100', null, '天山区', '650102', '650102', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650103', '650100', null, '沙依巴克区', '650103', '650103', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650104', '650100', null, '新市区', '650104', '650104', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650105', '650100', null, '水磨沟区', '650105', '650105', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650106', '650100', null, '头屯河区', '650106', '650106', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650107', '650100', null, '达坂城区', '650107', '650107', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650109', '650100', null, '米东区', '650109', '650109', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650121', '650100', null, '乌鲁木齐县', '650121', '650121', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650200', '650000', null, '克拉玛依市', '650200', '650200', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650202', '650200', null, '独山子区', '650202', '650202', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650203', '650200', null, '克拉玛依区', '650203', '650203', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650204', '650200', null, '白碱滩区', '650204', '650204', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650205', '650200', null, '乌尔禾区', '650205', '650205', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650400', '650000', null, '吐鲁番市', '650400', '650400', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650402', '650400', null, '高昌区', '650402', '650402', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650421', '650400', null, '鄯善县', '650421', '650421', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650422', '650400', null, '托克逊县', '650422', '650422', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650500', '650000', null, '哈密市', '650500', '650500', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650502', '650500', null, '伊州区', '650502', '650502', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650521', '650500', null, '巴里坤哈萨克自治县', '650521', '650521', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('650522', '650500', null, '伊吾县', '650522', '650522', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652300', '650000', null, '昌吉回族自治州', '652300', '652300', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652301', '652300', null, '昌吉市', '652301', '652301', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652302', '652300', null, '阜康市', '652302', '652302', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652323', '652300', null, '呼图壁县', '652323', '652323', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652324', '652300', null, '玛纳斯县', '652324', '652324', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652325', '652300', null, '奇台县', '652325', '652325', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652327', '652300', null, '吉木萨尔县', '652327', '652327', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652328', '652300', null, '木垒哈萨克自治县', '652328', '652328', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652700', '650000', null, '博尔塔拉蒙古自治州', '652700', '652700', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652701', '652700', null, '博乐市', '652701', '652701', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652702', '652700', null, '阿拉山口市', '652702', '652702', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652722', '652700', null, '精河县', '652722', '652722', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652723', '652700', null, '温泉县', '652723', '652723', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652800', '650000', null, '巴音郭楞蒙古自治州', '652800', '652800', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652801', '652800', null, '库尔勒市', '652801', '652801', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652822', '652800', null, '轮台县', '652822', '652822', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652823', '652800', null, '尉犁县', '652823', '652823', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652824', '652800', null, '若羌县', '652824', '652824', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652825', '652800', null, '且末县', '652825', '652825', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652826', '652800', null, '焉耆回族自治县', '652826', '652826', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652827', '652800', null, '和静县', '652827', '652827', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652828', '652800', null, '和硕县', '652828', '652828', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652829', '652800', null, '博湖县', '652829', '652829', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652900', '650000', null, '阿克苏地区', '652900', '652900', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652901', '652900', null, '阿克苏市', '652901', '652901', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652922', '652900', null, '温宿县', '652922', '652922', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652923', '652900', null, '库车县', '652923', '652923', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652924', '652900', null, '沙雅县', '652924', '652924', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652925', '652900', null, '新和县', '652925', '652925', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652926', '652900', null, '拜城县', '652926', '652926', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652927', '652900', null, '乌什县', '652927', '652927', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652928', '652900', null, '阿瓦提县', '652928', '652928', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('652929', '652900', null, '柯坪县', '652929', '652929', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653000', '650000', null, '克孜勒苏柯尔克孜自治州', '653000', '653000', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653001', '653000', null, '阿图什市', '653001', '653001', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653022', '653000', null, '阿克陶县', '653022', '653022', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653023', '653000', null, '阿合奇县', '653023', '653023', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653024', '653000', null, '乌恰县', '653024', '653024', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653100', '650000', null, '喀什地区', '653100', '653100', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653101', '653100', null, '喀什市', '653101', '653101', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653121', '653100', null, '疏附县', '653121', '653121', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653122', '653100', null, '疏勒县', '653122', '653122', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653123', '653100', null, '英吉沙县', '653123', '653123', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653124', '653100', null, '泽普县', '653124', '653124', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653125', '653100', null, '莎车县', '653125', '653125', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653126', '653100', null, '叶城县', '653126', '653126', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653127', '653100', null, '麦盖提县', '653127', '653127', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653128', '653100', null, '岳普湖县', '653128', '653128', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653129', '653100', null, '伽师县', '653129', '653129', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653130', '653100', null, '巴楚县', '653130', '653130', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653131', '653100', null, '塔什库尔干塔吉克自治县', '653131', '653131', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653200', '650000', null, '和田地区', '653200', '653200', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653201', '653200', null, '和田市', '653201', '653201', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653221', '653200', null, '和田县', '653221', '653221', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653222', '653200', null, '墨玉县', '653222', '653222', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653223', '653200', null, '皮山县', '653223', '653223', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653224', '653200', null, '洛浦县', '653224', '653224', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653225', '653200', null, '策勒县', '653225', '653225', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653226', '653200', null, '于田县', '653226', '653226', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('653227', '653200', null, '民丰县', '653227', '653227', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654000', '650000', null, '伊犁哈萨克自治州', '654000', '654000', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654002', '654000', null, '伊宁市', '654002', '654002', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654003', '654000', null, '奎屯市', '654003', '654003', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654004', '654000', null, '霍尔果斯市', '654004', '654004', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654021', '654000', null, '伊宁县', '654021', '654021', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654022', '654000', null, '察布查尔锡伯自治县', '654022', '654022', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654023', '654000', null, '霍城县', '654023', '654023', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654024', '654000', null, '巩留县', '654024', '654024', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654025', '654000', null, '新源县', '654025', '654025', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654026', '654000', null, '昭苏县', '654026', '654026', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654027', '654000', null, '特克斯县', '654027', '654027', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654028', '654000', null, '尼勒克县', '654028', '654028', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654200', '650000', null, '塔城地区', '654200', '654200', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654201', '654200', null, '塔城市', '654201', '654201', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654202', '654200', null, '乌苏市', '654202', '654202', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654221', '654200', null, '额敏县', '654221', '654221', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654223', '654200', null, '沙湾县', '654223', '654223', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654224', '654200', null, '托里县', '654224', '654224', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654225', '654200', null, '裕民县', '654225', '654225', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654226', '654200', null, '和布克赛尔蒙古自治县', '654226', '654226', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654300', '650000', null, '阿勒泰地区', '654300', '654300', 'CITY', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654301', '654300', null, '阿勒泰市', '654301', '654301', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654321', '654300', null, '布尔津县', '654321', '654321', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654322', '654300', null, '富蕴县', '654322', '654322', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654323', '654300', null, '福海县', '654323', '654323', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654324', '654300', null, '哈巴河县', '654324', '654324', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654325', '654300', null, '青河县', '654325', '654325', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('654326', '654300', null, '吉木乃县', '654326', '654326', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659001', '650000\r\n', null, '石河子市', '659001', '659001', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659002', '650000\r\n', null, '阿拉尔市', '659002', '659002', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659003', '650000\r\n', null, '图木舒克市', '659003', '659003', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659004', '650000\r\n', null, '五家渠市', '659004', '659004', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659005', '650000\r\n', null, '北屯市', '659005', '659005', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659006', '650000\r\n', null, '铁门关市', '659006', '659006', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659007', '650000\r\n', null, '双河市', '659007', '659007', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659008', '650000\r\n', null, '可克达拉市', '659008', '659008', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('659009', '650000\r\n', null, '昆玉市', '659009', '659009', 'TOWN', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('710000', '000000', null, '台湾省', '710000', '710000', 'PROVINCE', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('810000', '000000', null, '香港特别行政区', '810000', '810000', 'PROVINCE', '2018-09-13 09:32:58', null, 'NORMAL');
INSERT INTO `sys_area` VALUES ('820000', '000000', null, '澳门特别行政区', '820000', '820000', 'PROVINCE', '2018-09-13 09:32:58', null, 'NORMAL');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL,
  `type_code` varchar(64) NOT NULL,
  `label` varchar(64) NOT NULL,
  `value` varchar(64) NOT NULL,
  `sort` decimal(10,0) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('030bb29ef3f0474e8822be9c82401778', 'PROJECT_TYPE', '项目类型一', '&amp;lt;script&amp;gt;alert(2)&amp;lt;/script&amp;gt;', '1', '2018-09-04 02:59:55', '捐赠项目类型一', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('0384f0ccffee45f49900aabe7e61ca74', 'ROLE_TYPE', '管理员', 'ADMIN', '1', '2018-08-24 08:41:51', '&lt;script&gt;alert(1)&lt;/script&gt;', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('08829044625c43f0a94ff052eff7d6d2', 'PERMISSION', '权限设置', 'PERM', '3', '2018-08-18 07:51:05', '权限设置', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('09896e4dfc45453fbafdfeff5c48895f', 'PERMISSION', '编辑', 'EDIT', '3', '2018-08-17 10:42:55', '编辑', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('0d26fe1fff244137ba1e65444ca6a89d', 'AREA_TYPE', '省级', 'PROVINCE', '2', '2018-08-22 02:27:09', '省级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('0f06dddb71ff485bb2b9a13cdb5d0a1a', 'EDU_SCHOOLEN', '全日制', 'FULL_TIME', '1', '2018-09-03 02:56:40', '全日制', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('10525fbea7234f19a9158c84c14498e9', 'COUNTRY', '中国', 'china', '1', '2018-08-20 06:56:44', '中华人民', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('16d0f0bf7dd54e22a6400ec8fe8ff885', 'MARK_USEABLE', '禁用', 'UNABLE', '2', '2018-09-20 08:25:02', '禁用', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('25a3f860b4bb4377a6a1fc9a29f04b3e', 'ORG_TYPE', '校区', 'SCHOOL_AREA', '2', '2018-08-20 09:08:35', '校区', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('283256ec85e14704979aaf0836c9ab73', 'PERMISSION', '设置标签', 'SETMARK', '6', '2018-09-04 06:18:35', '设置标签', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('2d1c8d6001d840968bacafa2f910ad1e', 'MENU_SHOW', '显示', 'SHOW', '1', '2018-08-24 06:50:10', '显示', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('32bf21d15be444c88f76a1d33d36c183', 'USERTYPE', '在校生', 'zaixiaosheng', '0', '2018-08-20 06:53:14', '拉来来', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('32c0b6558c9d4426b8080481e5c5d30c', 'IS_ADDRESS_POST', '否', 'NO_POST', '2', '2018-08-30 03:17:34', '不是邮寄地址', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('36d12f4ea5044030b289d5dd5494e7d9', 'PERMISSION', '增加', 'ADD', '1', '2018-08-17 10:39:58', '增加', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('3bc317631bc849f682804310f8420617', 'ROLE_TYPE', '游客', 'GUEST', '3', '2018-08-24 08:44:37', '游客', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('3c4e6a673c34436c9173e1a55b55a8d3', 'CARD_STATUS', '正常', 'NORMAL', '1', '2018-09-11 06:18:45', '正常', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('3c6558b7192b41869ca70952169d57fb', 'CARD_TYPE', '普通', 'NORMAL', '2', '2018-08-22 08:09:29', '普通校友卡', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('3d9120341f3941c280dccf1f676cba1d', 'CARD_TYPE', '临时', 'TEMP', '1', '2018-08-22 08:06:41', '临时校友卡', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('3e63cf530e7844328ceae7e033aac377', 'MARK_USEABLE', '启用', 'ABLE', '1', '2018-09-20 08:24:43', '启用', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('40f693c24e5243208a413362c706910c', 'AREA_TYPE', '国家', 'COUNTRY', '1', '2018-08-22 02:26:44', '国家', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('441652cda8c2437a97658d08eff8e42b', 'MENU_TYPE', '权限', 'PERMISSION', '2', '2018-08-24 08:24:04', '权限', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('443b68c260d44962844584aef3459b2f', 'CARD_STATUS', '停用', 'HOLD', '2', '2018-09-11 06:19:09', '停用', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('4458a9451f934c2a8834ea5c2575a558', 'MONEY_TYPE', '美元', 'DOLLER', '2', '2018-09-19 05:55:45', '美元', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('4908bcca663b4522a24003e64765d1f9', 'CONTACT_TYPE', '手机', 'photo', '1', '2018-08-21 03:37:58', '手机', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('4cb953a3019543b7a337b5eb0f21c794', 'EDU_DEGREETYPE', '学士学位', 'BACHELOR', '1', '2018-09-03 02:57:16', '学士学位', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('4da8699884944a0e8eef8c6a2deb9aa2', 'EDU_DEGREETYPE', '硕士学位', 'MASTER', '2', '2018-09-03 02:57:46', '硕士学位', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('4e2b2d221f3e4498bf3aed5304d099d8', 'GRADE', '院级', 'COLLEGE', '2', null, '院级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('505c2fc8deb540fdb561b55230d754aa', 'CARD_STATUS', '禁用', 'DISABLE', '3', '2018-09-11 06:19:24', '禁用', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('5599eb0cb48340c6bdbd5b930abcf9ef', 'NATION', '满族', 'manzu', '2', '2018-08-20 06:55:24', '满族', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('56beb04b4e2943ffb3ea8b0f53ba2b06', 'ORG_USEABLE', '启用', 'ABLE', '1', '2018-08-20 09:11:35', '启用', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('59dfc7c6e8644413bf5e1f078a1f5226', 'POINT_LOGS_TYPE', '增加积分', 'ADD', '1', '2018-09-14 06:44:37', '增加积分', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('5c2e55aa2910434fa69c653b7fe9c355', 'DONATION_TYPE', '微信', 'WEICHAT', '3', '2018-09-04 03:43:00', '微信捐赠', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('5ef4549c392743b09e4ff7239555bfe4', 'ASSOCIATION_TYPE', '行业校友会', 'INDUSTRY_TYPE', '1', '2018-09-04 02:41:40', '行业校友会', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('63048478ecee4ffc96e05fd4fa3f9f97', 'AREA_TYPE', '市级', 'CITY', '3', '2018-08-22 02:27:31', '市级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('674c2b20732b48d5bea318b7a153a078', 'T_TEST', '测试二', 'TEST_2', '2', '2018-08-27 07:23:01', 'TEST_2', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('67c1d09b4664491ab2327449a84155f5', 'PERMISSION', '删除', 'DEL', '1', '2018-08-17 10:42:38', '删除', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('6aecb7b9c87b4a0d8d810bd719f14ab7', 'TestCode', '1', 'TestCode', '11111', '2018-09-19 06:29:28', '', 'DELETE');
INSERT INTO `sys_dict` VALUES ('6b8da5bb9f424afa927a8ace8bea97b8', 'ORG_TYPE', '专业级', 'MAJOR', '5', '2018-08-20 09:10:43', '专业级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('732a8d514557476bb629a3feb382bf8f', 'ORG_TYPE', '系', 'DEPARTMENT', '5', '2018-09-03 02:23:25', '系', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('74d97c251821409dacb5e2f742e264ba', 'BOOLEAN_TYPE', '否', 'NO', '1', '2018-09-04 03:29:24', '布尔类型字段', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('7a38bffd71f247fd8964994b4e7ac75d', 'ROLE_TYPE', '一般用户', 'USER', '2', '2018-08-24 08:44:07', '一般用户', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('7be3b3980277443bbd25310715279af5', 'IDCARD_TYPE', '护照', 'PASSPORT', '2', '2018-08-20 06:56:17', '护照', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('7c00cd0345e54104823dd5fbcabf58ce', 'EDU_SCHOOLEN', '非全日制', 'PART_TIME', '2', '2018-09-03 02:57:02', '非全日制', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('7da6a870b0424443857842d8ad6962cf', 'POINT_LOGS_TYPE', 'CUT', '减少积分', '2', '2018-09-14 06:46:54', '减少积分', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('808ad34ccf404abdb572e8ca684f1971', 'USERTYPE', '毕业生', 'biyesheng', '1', '2018-08-20 06:54:11', '毕业生', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('84878744e106490ea447080a98245e90', 'ORG_TYPE', '书院级', 'BIG_COLLEGE', '3', '2018-08-20 09:09:11', '书院级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('88b89be4865f4c678a605b32f4f2858f', 'ORG_USEABLE', '禁用', 'UNABLE', '2', '2018-08-20 09:12:21', '禁用', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('8f95b3220b8c4b73a3d429287e11f832', 'SEX', '男', '0', '2', null, '男', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('90115ed1f4a84f1aa91ddae2e5e3bbc2', 'USER_TYPE', '超级管理员', 'SUPER_ADMIN', '1', '2018-08-22 07:09:53', '超级管理员', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('91a8c3dacdc0409ba70759f74f0dd405', 'EDU_DEGREE', '本科', 'REGULAR_COLLEGE', '1', '2018-09-03 03:08:07', '本科', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('923c96babd7f409fafc1e7b9eb619a9d', 'PERMISSION', '发卡', 'CARD_ISSUE', '8', '2018-09-10 07:03:43', '发卡', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('92dd5d17c0704e3ab72218c220a75177', 'BOOLEAN_TYPE', '是', 'YES', '2', '2018-09-04 03:29:09', '布尔类型字段', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('93521bdb65a140d9bdfde3ca7cc743bd', 'ORG_TYPE', '学院级', 'COLLEGE', '4', '2018-08-20 09:10:10', '学院级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('935921a575c442c9b97eda31aceb3633', 'ASSOCIATION_TYPE', '地域校友会', 'REGION_TYPE', '2', '2018-09-04 02:41:56', '地域校友会', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('95481e12eba943c98ae032ada68eaf79', 'USER_TYPE', '系统管理员用户', 'SYS_ADMIN', '3', '2018-08-22 07:10:31', '系统管理员用户', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('9aa8c5dafc6b48d6b1072583bceb756b', 'MENUTYPE', '权限', 'PERMISSION', '2', null, '菜单类型----权限', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('9cc396705fac4e128cea270b22de1974', 'DONATION_TYPE', '线下捐赠', 'OFFLINE', '1', '2018-09-04 03:42:22', '线下捐赠', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('a52425a2267f4ee1a3e08e16a5e76e44', 'USER_TYPE', '普通管理员用户', 'NORMAL_ADMIN', '4', '2018-08-22 07:10:45', '普通管理员用户', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('b320512ebca74e7fb253f49099f9a697', 'MENUTYPE', '菜单', 'MENU', '3', null, '菜单类型 ---菜单', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('b83cb40452ee40b2a2a4cc840906e63d', 'MENU_TYPE', '菜单', 'MENU', '3', '2018-08-24 08:25:14', '菜单', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('bdae54ab235a489cb05ce13881e301ca', 'AREA_TYPE', '乡镇级', 'SMALL_COUNTRY', '5', '2018-08-22 02:28:09', '乡镇级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('c311c2e937704c9aa0158fd644ac0901', 'PROJECT_TYPE', '项目类型二', 'PROJECT_TYPE_2', '2', '2018-09-04 03:00:26', '捐赠项目类型二', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('c3391aa8b1cc4469a741ff444330f30d', 'COUNTRY', '美国', 'USA', '2', '2018-08-20 06:57:31', 'USA', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('c83880b7315d4d35bc041ffd53c3b904', 'PERMISSION', '导出', 'EXPORT', '5', '2018-08-30 02:27:31', '导出', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('c92928b77dbe4a148cd6ab397be23bc7', 'GRADE', '校级', 'SCHOOL', '3', null, '校级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('c9e18892d1c94800b8a6cb0e09129947', 'EDU_DEGREE', '大专', 'JUNIOR_COLLEGE', '2', '2018-09-03 03:07:53', '大专', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('d3344a99d12d4a3a9a57005e9787ef37', 'MENU_SHOW', '不显示', 'HIDDEN', '2', '2018-08-24 06:50:25', '不显示', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('d34fb650c0644f989531c2cc6fdd6442', 'ROLETYPE', '管理员', 'REBOOT', '1', '2018-08-18 08:33:14', '管理员', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('d72e827fea5e47448f27e09c3294aa86', 'NATION', '汉族', 'hanzu', '1', '2018-08-20 06:54:44', '汉族', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('dea2364e943b4bbb83deae6ea02db0a5', 'ORG_TYPE', '班级', 'CLASS', '6', '2018-08-20 09:13:16', '班级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('dfd3e8061646422c9223731e9ed73576', 'ROLETYPE', '测试组', 'CIGROUP', '1', '2018-08-18 08:48:34', '角色类型测试组', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('e23e2744ff054683bfd523a7c8d20783', 'SEX', '女', '1', '3', null, 'male', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('e484ada00d1e4c3abb168894100c7ffb', 'AREA_TYPE', '县区级', 'TOWN', '4', '2018-08-22 02:27:49', '县区级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('e9e2f3ec2dfb4e428a1c4e4c21d3ad4b', 'PERMISSION', '审核', 'AUDITING', '10', '2018-09-11 05:37:55', '校友卡审核', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('eb44e67bb5454c0983c04ebac18d377e', 'DONATION_TYPE', '支付宝', 'ALIPAY', '2', '2018-09-04 03:42:40', '支付宝捐赠', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('eb4e15daf68e447fa10e3821a616ffa1', 'MONEY_TYPE', '人民币', 'RMB', '1', '2018-09-19 05:55:24', '人民币', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('ebb011aeeb5645fdb0f979b79709222d', 'USER_TYPE', '一般用户', 'NORMAL', '2', '2018-08-22 07:10:15', '一般用户', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('ed1af1e6240a4eb8bb84481d361c7b71', 'ASSOCIATION_TYPE', '院系校友会', 'COLLEGE_TYPE', '3', '2018-09-04 02:42:14', '院系校友会', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('f09276ba6800471db3a30600f0694a5c', 'PROJECT_TYPE', '项目类型三', 'PROJECT_TYPE_3', '3', '2018-09-04 03:00:56', '捐赠项目类型3', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('f47bb884bb3348daa65b25d83f8a3bd9', 'EDU_DEGREETYPE', '博士学位', 'DOCTOR', '3', '2018-09-03 02:57:58', '博士学位', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('f7181c7563bc4e198defb5faf02ea6a1', 'IDCARD_TYPE', '身份证', 'IDCARD', '1', '2018-08-20 06:56:00', '身份证', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('f74731377d3748859704cde53c858e1e', 'AREA_TYPE', '村落级', 'VILLAGE', '6', '2018-08-22 02:28:35', '村落级', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('f8bdfddafc804e4cae29f960c89748d7', 'CARD_TYPE', 'VIP', 'VIP', '3', '2018-08-22 08:09:54', 'VIP校友卡', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('f9ca0ae7ba53485886c80ce3938745d1', 'IS_ADDRESS_POST', '是', 'IS_POST', '1', '2018-08-30 03:17:06', '邮寄地址', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('fa06088b21ec4b019ab315d83f4e28ea', 'PERMISSION', '导人', 'IMPORT', '6', '2018-08-30 02:28:18', '导人', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('fa944de3b8f94db48aeb268f246bd914', 'LOGS_TYPE', '查询', 'QUERY', '1001', '2018-08-22 02:14:25', '日志查询', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('fef220a2cca14c5ea42ad7f7bce6dae2', 'CONTACT_TYPE', '邮箱', 'emali', '2', '2018-08-21 03:38:24', '邮箱', 'NORMAL');
INSERT INTO `sys_dict` VALUES ('ffe91a5ef19247d4abc53128f72692f1', 'ORG_TYPE', '校级', 'SCHOOL', '1', '2018-08-20 09:04:56', '校级', 'NORMAL');

-- ----------------------------
-- Table structure for sys_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_logs`;
CREATE TABLE `sys_logs` (
  `id` varchar(64) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remote_addr` varchar(256) DEFAULT NULL,
  `user_agent` varchar(256) DEFAULT NULL,
  `request_uri` varchar(256) DEFAULT NULL,
  `method` varchar(256) DEFAULT NULL,
  `params` text,
  `exc_content` text,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_logs
-- ----------------------------
INSERT INTO `sys_logs` VALUES ('002c25f73e7b479fa9f83e1a018100c0', 'QUERY', 'admin', '2018-09-19 06:29:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '4', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('021083b256c94390b23f8630adf6e01f', 'QUERY', 'admin', '2018-09-21 01:45:58', '192.168.140.37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('021f2b15f9db4016acba23775a8301d3', 'QUERY', 'admin', '2018-09-26 09:59:11', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('03f7e48665e447f08344c1aece00a907', 'QUERY', 'admin', '2018-09-19 06:30:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '2', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('11da071fc6744113a2737251c5fac733', 'QUERY', 'admin', '2018-09-26 11:14:34', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '8', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('1457c2963a1849c7b4343a10c7434055', 'QUERY', 'admin', '2018-09-27 05:39:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('1468369c56314317aff8d6e219c9e09b', 'QUERY', 'admin', '2018-09-26 09:23:16', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('184286e663f246f5ad2ce6e3734e71cd', 'QUERY', 'admin', '2018-09-19 08:57:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('1974904dc9b54e5fad0eac07c6eab8d5', 'QUERY', 'admin', '2018-09-19 05:55:25', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('1aeb2db8e2f044218291598965ae9f54', 'QUERY', 'admin', '2018-09-26 09:26:49', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('1d94a5acee214b399a7e8ed8518c5577', 'QUERY', 'admin', '2018-09-19 06:29:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('21304ba9d9774c46bd5d5b260b06ed2a', 'QUERY', 'admin', '2018-09-19 07:13:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('237f101630024f75a0138c3a71a47381', 'QUERY', 'admin', '2018-09-19 06:32:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '3', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('290049e4f6fe4d89a0093a801ec59981', 'QUERY', 'admin', '2018-09-20 08:25:02', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('2cc571cce57d47feafb603f86df8d34a', 'QUERY', 'admin', '2018-09-26 09:55:12', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('303e870a617c44f48a772292a0b944dd', 'QUERY', 'admin', '2018-09-20 08:24:43', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('3172db87c3ef4e408fbe5063497ccfe6', 'QUERY', 'admin', '2018-09-20 08:23:12', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('380f53a427684b9c95a799b6079c2a3d', 'QUERY', 'admin', '2018-09-20 08:23:20', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('4031948f540747e9ab3b41a3c358f9a6', 'QUERY', 'admin', '2018-09-19 06:34:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '3', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('41c01713b56c4090baef28285c4b036d', 'QUERY', 'admin', '2018-09-19 06:29:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('4a6a198926b4460db72e4168bec9526c', 'QUERY', 'admin', '2018-09-26 09:22:34', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('4f335c9f4faa437ba32a2604d597f43f', 'QUERY', 'admin', '2018-09-19 06:29:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '9', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('52559853ee1b4f65a9eb8210248d2c40', 'QUERY', 'admin', '2018-09-20 08:23:23', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('547c9d5ea35049ef8d05228474bf47f4', 'QUERY', 'admin', '2018-09-19 07:21:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('54bae29e983343a58af29c8c96972feb', 'QUERY', 'admin', '2018-09-27 05:39:57', '192.168.140.37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('5c07bde0a7614526a834bb75a8a79712', 'QUERY', 'admin', '2018-09-20 08:22:35', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('5c1ffa8fe6fa4be7b93a51bc258c9968', 'QUERY', 'admin', '2018-09-26 11:14:00', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('5c3bd00d41f54c4c91caadab86d1c1d0', 'QUERY', 'admin', '2018-09-19 06:30:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '3', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('5e4ec6cfe3a54cbda6ea6ff533bc973f', 'QUERY', 'admin', '2018-09-19 06:29:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '7', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('6d56cd547aaf4f17a3937d7eb1c94389', 'QUERY', 'admin', '2018-09-26 11:12:13', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('7700b3da1c914fa9bef402c60a3052ad', 'QUERY', 'admin', '2018-09-19 06:29:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '6', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('7a63fedd87804c3bb87214e0423ff51a', 'QUERY', 'admin', '2018-09-27 08:01:06', '192.168.140.37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('7bd351ea38884776bf34a951784247d7', 'QUERY', 'admin', '2018-09-19 06:29:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '2', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('7bdee80583b6499d82a0d72f96169699', 'QUERY', 'admin', '2018-09-19 07:20:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('7d678216c0c543caa264727c4cfbbd47', 'QUERY', 'admin', '2018-09-27 05:28:26', '192.168.140.37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('80c5f64617c041abbdf5986ae34d8d3a', 'QUERY', 'admin', '2018-09-19 06:34:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('824bd16d864a45d2847914aff03c9b88', 'QUERY', 'admin', '2018-09-18 08:20:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('846e098d60c4417ca58f3ff45801691c', 'QUERY', 'admin', '2018-09-26 11:15:08', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '7', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('876b475427fc4af191d05f65c0fbfdc0', 'QUERY', 'admin', '2018-09-19 05:54:42', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('88e54c0be6dc473caa17ad43f13bb5ae', 'QUERY', 'admin', '2018-09-26 11:14:32', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '9', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('89669bccd11b41d08faedf15554aed9b', 'QUERY', 'admin', '2018-09-19 06:32:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '4', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('8d6a8523fe564179aad4d434ac87dbbd', 'QUERY', 'admin', '2018-09-19 05:55:46', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('8fa700f430d84a7580d837987f52ccb8', 'QUERY', 'admin', '2018-09-19 07:20:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('916c68bb5a8d474b839e24fc4cfa2bbf', 'QUERY', 'admin', '2018-09-19 07:14:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('92b8c8b24377475ca602d5f79ab4518b', 'QUERY', 'admin', '2018-09-19 06:29:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '9', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('9c86db17ca954f27a4b3485d1a607476', 'QUERY', 'admin', '2018-09-19 07:20:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('9d469eb36f7147158fbf48b47de9008c', 'QUERY', 'admin', '2018-09-26 11:14:37', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '6', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('9e23f48ec7334f94b0445140deea09de', 'QUERY', 'admin', '2018-09-19 07:15:29', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('9e7323e3f18146c097face9057a9d72e', 'QUERY', 'admin', '2018-09-19 06:34:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '4', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('a5ca6967cb50431fa01963d92e7c1eef', 'QUERY', 'admin', '2018-09-19 06:29:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '3', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('a84944d7227544a398a076c4c3666aec', 'QUERY', 'admin', '2018-09-19 06:30:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('aa227bb63f064531890c73b9f1135807', 'QUERY', 'admin', '2018-09-26 11:15:10', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '6', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('ab2d3beee35348119be0d0f0430133b0', 'QUERY', 'admin', '2018-09-19 07:15:06', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('b12f062a1e814bc8b9debd0112b7fdbc', 'QUERY', 'admin', '2018-09-19 08:57:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('b4a4c817a3db4203834b96de2eabe179', 'QUERY', 'admin', '2018-09-19 06:31:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('b5435d275897456c8efd58ecbb456577', 'QUERY', 'admin', '2018-09-26 11:12:18', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '2', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('b61d58ca47f748cba48ac88789edc289', 'QUERY', 'admin', '2018-09-19 06:29:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('b874f3f6496b46aea394c8eb064f600e', 'QUERY', 'admin', '2018-09-19 09:22:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('ba290507ce904a7ca9256b51e84900ff', 'QUERY', 'admin', '2018-09-19 07:21:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('be37184f63fd43e1871ebcff381d126f', 'QUERY', 'admin', '2018-09-27 05:46:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('bf83e37709054a409a958f694b2bdd97', 'QUERY', 'admin', '2018-09-19 07:17:05', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('c0f8293ca2cd4a23b9b593fe087e1fe5', 'QUERY', 'admin', '2018-09-20 08:30:42', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('cbb1de89250c4a61ba8ea0c4ff9d0c95', 'QUERY', 'admin', '2018-09-27 03:09:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('d82666c922af4398a5233c44077b3e0c', 'QUERY', 'admin', '2018-09-20 08:31:12', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('d84e39b3d1564306b1ce120b8d3838eb', 'QUERY', 'admin', '2018-09-26 11:14:35', '192.168.140.35', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '7', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('d9c9819fcb9b4e758b4f3af7b3aecedc', 'QUERY', 'admin', '2018-09-19 06:29:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('db9d4550b690489ea83eafc3243ff0fe', 'QUERY', 'admin', '2018-09-19 06:35:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '4', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('dbf7e44689ef43e3bdeef19b2d424b34', 'QUERY', 'admin', '2018-09-19 06:29:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('dcc7b65ae1234fd2a60073ca5fda940b', 'QUERY', 'admin', '2018-09-27 08:03:02', '192.168.140.37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('e11096fe3fd444d1accddebac2b1390d', 'QUERY', 'admin', '2018-09-19 06:32:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('e2ab5dc1651e4f68b1cb0e59cb081f77', 'QUERY', 'admin', '2018-09-19 06:28:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('e42beb2ba6a44783aeacefdb476070a9', 'QUERY', 'admin', '2018-09-19 06:29:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '5', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('e87cd4e6e9b44ae0b2df43f73389cf9e', 'QUERY', 'admin', '2018-09-27 05:39:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('ef5a75f2a89d4e0194e12967917fcaa9', 'QUERY', 'admin', '2018-09-19 06:31:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '4', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('f3fec580b9d14b9cb91e2ecea0855aed', 'QUERY', 'admin', '2018-09-19 06:29:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '8', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('f4e812cfafa6467682f3a9ace0113771', 'QUERY', 'admin', '2018-09-19 06:31:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '3', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('f7652ee59914460a989b1b6190bdce04', 'QUERY', 'admin', '2018-09-19 05:54:52', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('f88fddae96ea49b1ae7cf39a34c50def', 'QUERY', 'admin', '2018-09-19 06:30:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '4', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('f972828746f64c54947994ba327a1a51', 'QUERY', 'admin', '2018-09-19 08:57:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('fdbc75f48b6d4588af6bc023e1c9bf21', 'QUERY', 'admin', '2018-09-17 06:55:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('fe8f8f0f0fcb415aaab1d6b0567238f2', 'OTHER', null, '2018-08-31 01:35:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('ff940533dd1c4dd1ad046743ca1f7f9f', 'QUERY', 'admin', '2018-09-19 05:54:50', '192.168.140.36', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');
INSERT INTO `sys_logs` VALUES ('ffa9fcae19f84bd9a2974b787e00c517', 'QUERY', 'admin', '2018-09-18 06:49:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', '/sys/sysdict/list', '编码查询', '1', null, null, 'NORMAL');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) NOT NULL,
  `parent_ids` varchar(2048) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `href` varchar(1024) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `type` varchar(128) NOT NULL,
  `permission` varchar(128) DEFAULT NULL,
  `operate` varchar(64) DEFAULT NULL,
  `sort` decimal(10,0) NOT NULL,
  `target` varchar(64) DEFAULT NULL,
  `is_show` varchar(64) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('05648d4088694839a70f1bfaf98edac6', '105c8d5f492a440d93da7afd29994966', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966', '区域管理', 'sys_area', 'views/module/system/area/areaList.html', 'layui-icon-website', 'MENU', 'sys:area', '', '90600', '', 'SHOW', '2018-09-27 06:39:21', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('0929eeb44745433eb8c14802e5c808d3', '639c64f13fc34a98aa0eee224afe2735', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,639c64f13fc34a98aa0eee224afe2735', '删除', 'sys_dict_del', '', 'layui-icon-delete', 'PERMISSION', 'sys:dict:del', 'DEL', '90503', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('105c8d5f492a440d93da7afd29994966', 'd6c29be2265c4a05a8b00b105cf7c424', 'd6c29be2265c4a05a8b00b105cf7c424', '系统', 'system', '', '', 'MENU', 'system', '', '90000', '', 'SHOW', '2018-09-27 06:12:57', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('14872b3cd1d04079b8ea658660a4593b', '4f65f6dd22e1478b95a066ac600b1a4a', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,4f65f6dd22e1478b95a066ac600b1a4a', '删除', 'sys_menu_del', '', 'layui-icon-delete', 'PERMISSION', 'sys:menu:del', 'DEL', '90403', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('1f2e2d08a20a489b9858c7345b415e05', '639c64f13fc34a98aa0eee224afe2735', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,639c64f13fc34a98aa0eee224afe2735', '新增', 'sys_dict_add', '', 'layui-icon-add-1', 'PERMISSION', 'sys:dict:add', 'ADD', '90501', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('1fc72610a25f462dabc47c01ced5272f', '105c8d5f492a440d93da7afd29994966', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966', '机构管理', 'sys_org', 'views/module/system/org/orgList.html', 'layui-icon-tree', 'MENU', 'sys:org', '', '90300', '', 'SHOW', '2018-09-27 06:39:20', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('216a8739efca4363b5178205e75846a1', '6506dee426074b3fb43ede08996ae851', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,6506dee426074b3fb43ede08996ae851', '编辑', 'sys_role_edit', '', 'layui-icon-edit', 'PERMISSION', 'sys:role:edit', 'EDIT', '90202', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('2785b45368634f899ece76eb388817b5', '4f65f6dd22e1478b95a066ac600b1a4a', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,4f65f6dd22e1478b95a066ac600b1a4a', '编辑', 'sys_menu_edit', '', 'layui-icon-edit', 'PERMISSION', 'sys:menu:edit', 'EDIT', '90402', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('43fa492c8c8e4259ade4c5e7339a79de', 'a28e6ca9332b45b3ad5f744cbe1432c4', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,a28e6ca9332b45b3ad5f744cbe1432c4', '删除', 'sys_user_del', '', 'layui-icon-delete', 'PERMISSION', 'sys:user:del', 'DEL', '90103', '', 'SHOW', '2018-09-27 07:28:41', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('4f65f6dd22e1478b95a066ac600b1a4a', '105c8d5f492a440d93da7afd29994966', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966', '菜单管理', 'sys_menu', 'views/module/system/menu/menuList.html', 'layui-icon-list', 'MENU', 'sys:menu', '', '90400', '', 'SHOW', '2018-09-27 06:39:21', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('51e8230a2c9346f4b4564aa38b19ad30', '6506dee426074b3fb43ede08996ae851', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,6506dee426074b3fb43ede08996ae851', '新增', 'sys_role_add', '', 'layui-icon-add-1', 'PERMISSION', 'sys:role:add', 'ADD', '90201', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('54e295c8bcfb420fbdb9fe00b71ad53b', '639c64f13fc34a98aa0eee224afe2735', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,639c64f13fc34a98aa0eee224afe2735', '编辑', 'sys_dict_edit', '', 'layui-icon-edit', 'PERMISSION', 'sys:dict:edit', 'EDIT', '90502', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('587cd6f40925412aa545ad654d3e9bdb', '1fc72610a25f462dabc47c01ced5272f', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,1fc72610a25f462dabc47c01ced5272f', '删除', 'sys_org_del', '', 'layui-icon-delete', 'PERMISSION', 'sys:org:del', 'DEL', '90303', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('59a5418182924991be551144e4e7df2c', 'a28e6ca9332b45b3ad5f744cbe1432c4', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,a28e6ca9332b45b3ad5f744cbe1432c4', '编辑', 'sys_user_edit', '', 'layui-icon-edit', 'PERMISSION', 'sys:user:edit', 'EDIT', '90102', '', 'SHOW', '2018-09-27 07:28:41', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('639c64f13fc34a98aa0eee224afe2735', '105c8d5f492a440d93da7afd29994966', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966', '字典管理', 'sys_dict', 'views/module/system/dict/dictList.html', 'layui-icon-read', 'MENU', 'sys:dict', '', '90500', '', 'SHOW', '2018-09-27 06:39:21', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('6506dee426074b3fb43ede08996ae851', '105c8d5f492a440d93da7afd29994966', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966', '角色管理', 'sys_role', 'views/module/system/role/roleList.html', 'layui-icon-username', 'MENU', 'sys:role', '', '90200', '', 'SHOW', '2018-09-27 06:39:20', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('70b9e6624eeb4c62929c35a7283a295f', '6506dee426074b3fb43ede08996ae851', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,6506dee426074b3fb43ede08996ae851', '删除', 'sys_role_del', '', 'layui-icon-delete', 'PERMISSION', 'sys:role:del', 'DEL', '90203', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('767eabfe403e41498deca72cd35222ff', '6506dee426074b3fb43ede08996ae851', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,6506dee426074b3fb43ede08996ae851', '删除', 'sys_role_perm', '', 'layui-icon-auz', 'PERMISSION', 'sys:role:perm', 'PERM', '90204', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('8169715dee0e48ca9511a50d444a9a6c', 'a28e6ca9332b45b3ad5f744cbe1432c4', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,a28e6ca9332b45b3ad5f744cbe1432c4', '新增', 'sys_user_add', '', 'layui-icon-add-1', 'PERMISSION', 'sys:user:add', 'ADD', '90101', '', 'SHOW', '2018-09-27 07:28:41', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('9c890987149f49d3a554ca081478faf0', '05648d4088694839a70f1bfaf98edac6', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,05648d4088694839a70f1bfaf98edac6', '新增', 'sys_area_add', '', 'layui-icon-add-1', 'PERMISSION', 'sys:area:add', 'ADD', '90601', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('9ea5530b0c0143599d4ac95dc7d25934', '4f65f6dd22e1478b95a066ac600b1a4a', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,4f65f6dd22e1478b95a066ac600b1a4a', '新增', 'sys_menu_add', '', 'layui-icon-add-1', 'PERMISSION', 'sys:menu:add', 'ADD', '90401', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('a28e6ca9332b45b3ad5f744cbe1432c4', '105c8d5f492a440d93da7afd29994966', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966', '用户管理', 'sys_user', 'views/module/system/user/userList.html', 'layui-icon-user', 'MENU', 'sys:user', '', '90100', '', 'SHOW', '2018-09-27 06:39:20', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('a29d1d8b029d4d7690f11513c9637fcc', '105c8d5f492a440d93da7afd29994966', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966', '日志管理', 'sys_logs', 'views/module/system/logs/logsList.html', 'layui-icon-survey', 'MENU', 'sys:logs', '', '90700', '', 'SHOW', '2018-09-27 06:39:21', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('a5531ca51c25499bbe16d8908fc62ac9', '1fc72610a25f462dabc47c01ced5272f', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,1fc72610a25f462dabc47c01ced5272f', '编辑', 'sys_org_edit', '', 'layui-icon-edit', 'PERMISSION', 'sys:org:edit', 'EDIT', '90302', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('c12dd173b41944bb99925f3bd97e21ec', '1fc72610a25f462dabc47c01ced5272f', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,1fc72610a25f462dabc47c01ced5272f', '新增', 'sys_org_add', '', 'layui-icon-add-1', 'PERMISSION', 'sys:org:add', 'ADD', '90301', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('d6c29be2265c4a05a8b00b105cf7c424', 'root', 'root', 'XXX系统', 'aio', '', '', 'MENU', 'aio', '', '0', '', 'SHOW', '2018-09-27 06:10:52', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('e928cfc13dd94026907f5c051df40675', '05648d4088694839a70f1bfaf98edac6', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,05648d4088694839a70f1bfaf98edac6', '删除', 'sys_area_del', '', 'layui-icon-delete', 'PERMISSION', 'sys:area:del', 'DEL', '90603', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');
INSERT INTO `sys_menu` VALUES ('f4eddce5d0f0451287590e647bb3e39b', '05648d4088694839a70f1bfaf98edac6', 'd6c29be2265c4a05a8b00b105cf7c424,105c8d5f492a440d93da7afd29994966,05648d4088694839a70f1bfaf98edac6', '编辑', 'sys_area_edit', '', 'layui-icon-edit', 'PERMISSION', 'sys:area:edit', 'EDIT', '90602', '', 'SHOW', '2018-09-27 07:28:42', null, 'NORMAL');

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) NOT NULL,
  `parent_ids` varchar(2048) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `grade` varchar(64) DEFAULT NULL,
  `sort` decimal(10,0) NOT NULL,
  `master` varchar(64) DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `useable` varchar(64) NOT NULL,
  `open_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `close_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('0', 'root', 'root', '长安大学', 'root', 'SCHOOL', null, null, null, '1', '小九', '13729291382', 'ABLE', '1808-08-21 06:37:59', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('0fd58fa4417b4c34a53bbfb671e2454a', '300', '0,300', '电竞学院', '9521', 'COLLEGE', null, null, null, '9521', '张三2', '13123311231', 'ABLE', '2018-08-27 16:40:24', null, '2018-08-27 08:30:48', null, 'DELETE');
INSERT INTO `sys_org` VALUES ('100', '0', 'root,0', '渭水校区', '100', 'SCHOOL_AREA', null, null, null, '100', '小八', '123123123121', 'ABLE', '2018-09-27 16:03:37', '2018-09-20 16:00:00', '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('10001', '100', '0,100', '自定义书院1', '10001', 'BIG_COLLEGE', null, null, null, '10001', '小八八1', '12312312312', 'ABLE', '2018-08-20 17:45:39', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('1000101', '10001', '0,100,10001', '公路学院', '1000101', 'COLLEGE', null, null, null, '1000101', '小八八八1', '12312312312', 'ABLE', '2018-08-20 18:03:54', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('100010101', '1000101', '0,100,10001,1000101', '修路专业', '100010101', 'SPECIALTY', null, null, null, '1', '小三三', '12345612352', 'ABLE', '2018-09-10 16:28:10', null, null, null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('1000102', '10001', '0,100,10001', '经济与管理学院', '1000102', 'COLLEGE', null, null, null, '1000101', '小八八八1', '12312312312', 'ABLE', '2018-08-20 18:03:50', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('1000103', '10001', '0,100,10001', '建筑学院', '1000103', 'COLLEGE', null, null, null, '1000101', '小八八八1', '12312312312', 'ABLE', '2018-08-20 18:03:47', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('1000104', '10001', '0,100,10001', '材料科学与工程学院', '1000104', 'COLLEGE', null, null, null, '1000101', '小八八八1', '12312312312', 'ABLE', '2018-08-20 18:03:43', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('10002', '100', '0,100', '自定义书院2', '10002', 'BIG_COLLEGE', null, null, null, '10001', '小八八2', '12312312312', 'ABLE', '2018-08-20 17:45:45', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('200', '0', 'root,0', '校本部北院教学区1', '200', 'SCHOOL_AREA', null, null, null, '100', '小七', '12312312312', 'ABLE', '2018-09-04 18:22:39', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('29006f90989642869d6d82d72e255b43', '300', '0,300', '测试书院', '40002', 'BIG_COLLEGE', null, null, null, '40002', '锦带', '12312312231', 'ABLE', '2018-08-21 16:13:41', '2018-08-16 00:00:00', '2018-08-21 05:21:52', null, 'DELETE');
INSERT INTO `sys_org` VALUES ('300', '0', 'root,0', '雁塔校区', '300', 'SCHOOL_AREA', null, null, null, '100', '小六', '12212312312', 'ABLE', '2018-09-07 18:10:39', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('400', '0', 'root,0', '小寨校区', '400', 'SCHOOL_AREA', null, null, null, '100', '小寨负责人', '12212312312', 'ABLE', '2018-08-21 14:34:15', null, '2018-08-20 17:21:20', null, 'NORMAL');
INSERT INTO `sys_org` VALUES ('40001', '400', '0,400', '财经学院', '40001', 'COLLEGE', null, null, null, '40001', '小五', '12212312312', 'ABLE', '2018-08-21 09:47:23', null, '2018-08-20 17:21:20', null, 'NORMAL');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '系统管理员', 'admin', 'ADMIN', '2018-09-27 07:47:51', null, 'NORMAL');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL,
  `menu_id` varchar(64) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '05648d4088694839a70f1bfaf98edac6');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '0929eeb44745433eb8c14802e5c808d3');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '105c8d5f492a440d93da7afd29994966');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '14872b3cd1d04079b8ea658660a4593b');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '1f2e2d08a20a489b9858c7345b415e05');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '1fc72610a25f462dabc47c01ced5272f');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '216a8739efca4363b5178205e75846a1');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '2785b45368634f899ece76eb388817b5');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '43fa492c8c8e4259ade4c5e7339a79de');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '4f65f6dd22e1478b95a066ac600b1a4a');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '51e8230a2c9346f4b4564aa38b19ad30');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '54e295c8bcfb420fbdb9fe00b71ad53b');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '587cd6f40925412aa545ad654d3e9bdb');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '59a5418182924991be551144e4e7df2c');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '639c64f13fc34a98aa0eee224afe2735');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '6506dee426074b3fb43ede08996ae851');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '70b9e6624eeb4c62929c35a7283a295f');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '767eabfe403e41498deca72cd35222ff');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '8169715dee0e48ca9511a50d444a9a6c');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '9c890987149f49d3a554ca081478faf0');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', '9ea5530b0c0143599d4ac95dc7d25934');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', 'a28e6ca9332b45b3ad5f744cbe1432c4');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', 'a29d1d8b029d4d7690f11513c9637fcc');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', 'a5531ca51c25499bbe16d8908fc62ac9');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', 'c12dd173b41944bb99925f3bd97e21ec');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', 'd6c29be2265c4a05a8b00b105cf7c424');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', 'e928cfc13dd94026907f5c051df40675');
INSERT INTO `sys_role_menu` VALUES ('397c3cb5cfbe4da49bd97db3b9f9a28a', 'f4eddce5d0f0451287590e647bb3e39b');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL,
  `org_id` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `safecode` varchar(64) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `idcard` varchar(18) DEFAULT NULL,
  `photo` varchar(1024) DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('660975ffd3624abe92237aaf3ede3294', '0', 'admin', 'a3768205a13e3e10cce21544e8f6ed57', '5eb90767cacd4ed1aff5002c6599d6f7', '超级管理员', '999999999', '', '10000', 'admin@163.com', 'SUPER_ADMIN', '2018-09-27 15:58:47', 'nothing', 'NORMAL');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('660975ffd3624abe92237aaf3ede3294', '397c3cb5cfbe4da49bd97db3b9f9a28a');

-- ----------------------------
-- Procedure structure for test_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_insert`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_insert`()
BEGIN

DECLARE y INT DEFAULT 1 ;
WHILE y < 10 DO
	INSERT INTO sys_area (
		`id`,
		`parent_id`,
		`parent_ids`,
		`name`,
		`sort`,
		`code`,
		`type`,
		`create_date`,
		`remark`,
		`flag`
	)
VALUES
	(
		y,
		y,
		y,
		CONCAT('area',y),
		y,
		100 + y,
		1,
		NULL,
		CONCAT('remark',y),
		'NORMAL'
	) ;
SET y = y + 1 ;
END
WHILE ; COMMIT ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_mager
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_mager`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_mager`()
BEGIN

  #定义变量
	DECLARE no_found int DEFAULT 0; 
  DECLARE sys_user_id VARCHAR(64) ;
	DECLARE sys_username VARCHAR(64) ;
	DECLARE sys_usertemp_id  VARCHAR(64) ;
  DECLARE sm_name  VARCHAR(64) ;
  DECLARE workplace  VARCHAR(64) ;
  DECLARE tempid  VARCHAR(64) ;


	DECLARE user_id_cursor CURSOR for(
			SELECT
				ab.id ,sm_schoolmate_temp.id, ab.username, ab.name, sm_schoolmate_temp.workplace
			FROM
				(
					SELECT
				sm.*, edu.school,edu.college,edu.academy,edu.series,edu.specialty,edu.class_name,edu.degree,edu.degreetype,edu.studentid,edu.startdate
					FROM
						sm_schoolmate sm, sm_education edu
					WHERE
						sm.sys_user_id = edu.sys_user_id
				) ab,sm_schoolmate_temp	
			WHERE   ab.NAME = sm_schoolmate_temp. NAME );

		DECLARE CONTINUE HANDLER for not FOUND set no_found=1;

			OPEN user_id_cursor;
			WHILE no_found!=1 
			DO      
       FETCH NEXT FROM user_id_cursor INTO  sys_user_id, sys_usertemp_id,sys_username,sm_name,workplace,tempid ;  #拿下一行的数据
       #进行逻辑数据更新合并
     # IF sys_user_id!=""
			#	UPDATE sm_schoolmate SET sm_schoolmate.name=sm_name  WHERE sm_schoolmate.sys_user_id= sys_user_id ;
      #ELSE
			#	INSERT INTO sm_schoolmate (列1, 列2,...) VALUES (值1, 值2,....);
			#	INSERT INTO sm_education (列1, 列2,...) VALUES (值1, 值2,....);

			# INSERT INTO sm_education (id, sys_user_id,sys_username, ) VALUES ('1212313123', sys_user_id, sys_username,);
			# INSERT INTO sm_profession (id, sys_user_id,username, workplace ) VALUES ('1212313123', sys_user_id, sys_username,workplace);
			# INSERT INTO sm_contact (id, sys_user_id,sys_username, ) VALUES ('1212313123', sys_user_id, sys_username,);
			# INSERT INTO sm_contact (id, sys_user_id,sys_username, ) VALUES ('1212313123', sys_user_id, sys_username,);
          
       DELETE  FROM sm_schoolmate_temp WHERE sm_schoolmate_temp.id = @sys_user_id ;

	      
			END WHILE ;#(@@fetch_status=0) ;

      CLOSE user_id_cursor;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for 111
-- ----------------------------
DROP EVENT IF EXISTS `111`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `111` ON SCHEDULE EVERY 1 DAY STARTS '2018-08-31 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL test_mager()
;;
DELIMITER ;
