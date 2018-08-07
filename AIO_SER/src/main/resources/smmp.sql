/*
Navicat MySQL Data Transfer

Source Server         : smpp
Source Server Version : 50722
Source Host           : 192.168.140.36:3306
Source Database       : smmp

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-03 18:56:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL,
  `parent_id` varchar(64) NOT NULL,
  `parent_ids` varchar(2048) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sort` decimal(10,0) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `type` char(1) NOT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('0010d52ef2004088a6744d0f324acb0c', 'pareentid2', 'parentIds2', 'name2', '0', 'af9434401e7f4a74af615505547fe1af', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('14786489e73c47e9a261507c1ddfa220', 'pareentid0', 'parentIds0', 'name0', '0', '80b640f21d53436c9401063cb67fdc86', '0', 'reark', '0');
INSERT INTO `sys_area` VALUES ('327a98e4bdb9455dacf12d94b811d11b', 'pareentid16', 'parentIds16', 'name16', '0', '826e1e84e0e34ec6b3c49190a9d2020a', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('3305c35abda1401aa3a6faacf5a4d73b', 'pareentid7', 'parentIds7', 'name7', '0', 'd71cb2ef05464749b5a2e8b0c3213e73', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('382da12e77dd4714919415eafde4575f', 'pareentid24', 'parentIds24', 'name24', '0', 'e66cd300ad514ce3a90f5b07f2fc712f', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('44afc231a75346ce986e0aa6a777d824', 'pareentid10', 'parentIds10', 'name10', '0', 'aa9f22e7f174404388aba3f2472d6ec8', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('513c7f3d5d954f4d8429e4932e7e0621', 'pareentid3', 'parentIds3', 'name3', '0', '8bce6df7e3fe408590c74e232b9c2a1c', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('5d5b0bc16564495eaec957e80eabafa6', 'pareentid8', 'parentIds8', 'name8', '0', 'f1333a4dbdd843d999263ad5e10e31d0', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('5efc6e50eec64db4bddaed65e24eb0df', 'pareentid22', 'parentIds22', 'name22', '0', '3275c8097e734c4baabc4cac87cc44cd', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('64185c16f2894915ac4d9004e7ecc475', 'pareentid27', 'parentIds27', 'name27', '0', '826fe69bb28a47e58a78bf0265ecad66', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('677d44241bcb420396d2eb992546854a', 'pareentid5', 'parentIds5', 'name5', '0', 'a94cad7b433f41b797038a0e08a713df', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('6e7c8ae59d754e7f914ab686189caac9', 'pareentid25', 'parentIds25', 'name25', '0', 'efc4ab4ab6c948c4b7b71d3140684647', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('6f16887abebf4b26b69ed29b77c04545', 'pareentid4', 'parentIds4', 'name4', '0', 'ad05d24442484b4d98c449fd19d4867b', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('73e6d1bd0c9246c18105fcb8440fd7a9', 'pareentid23', 'parentIds23', 'name23', '0', 'bdb72d12b18b4899b14e995a42bd51c7', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('7675e61dd06145de9181efeecf69aa1d', 'pareentid12', 'parentIds12', 'name12', '0', '3347be01ba4a4a93aadc35d1f4a9190b', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('7ba8ac3be7934499828dc9d665f740ac', 'pareentid14', 'parentIds14', 'name14', '0', 'ac61712605c3450fa9cf3b5dffd1a623', '1', 'reark', '1');
INSERT INTO `sys_area` VALUES ('85b90edcfc934433bcf2a1fd98121c53', 'pareentid20', 'parentIds20', 'name20', '0', '72b6559becc441469d893532c6b3f511', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('93f58192ee2a49269b65dcece48dacee', 'pareentid6', 'parentIds6', 'name6', '0', 'e22cabd36c2c46a28646919236729c2f', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('9ac9b104e7f343b69faf2052c761fe1b', 'pareentid9', 'parentIds9', 'name9', '0', '4639090eff414cb087bd8bbd378d6cc0', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('9c4a7d44f5a54f37a60e85c2de43ef25', 'pareentid26', 'parentIds26', 'name26', '0', 'e2d4976bdf5e40af8a834e8d8c56b198', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('9fd7d2171dc34a7b85c815c750501870', 'pareentid15', 'parentIds15', 'name15', '0', 'a2e573da5e0f48faa910ffabb4ef4f5e', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('a6d0c577b7744547b6b9d6ba898d3bb8', 'pareentid0', 'parentIds0', 'name0', '0', 'cedbac33a77b47509f1ae0ffbb28f99f', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('da62741ac1de46a79191f093edfd00f3', 'pareentid1', 'parentIds1', 'name1', '0', '77de6205d458478bbfb7a1d30d996a23', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('e4f4f725d9984d6d9464aa09c07254ea', 'pareentid19', 'parentIds19', 'name19', '0', 'b31538e3b929453a89e1af5ed27df851', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('e9d085defa8c45958f29ceeda08d0e0c', 'pareentid18', 'parentIds18', 'name18', '0', 'bfadab3a79fe4fa4b758f873687d9855', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('edcc2f0a54b14f6e8b1b5de7022a2ff9', 'pareentid13', 'parentIds13', 'name13', '0', '9155826c36d0494daaffda8610139801', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('ef4da3c2377945758145129319e7271b', 'pareentid30', 'parentIds30', 'name30', '0', 'cf170550a88842959d13ae75c6ff5c6a', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('f1c1a39b33b34937bc4d14d6864c3b4c', 'pareentid11', 'parentIds11', 'name11', '0', 'ee2294b1bb624220aa1b0d340eb03893', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('f42af6ac63d1427080b05a1b41d914f5', 'pareentid28', 'parentIds28', 'name28', '0', 'a54f0d0de3924624a7a9e2d044613b95', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('f61ded8b8a1e403c86c06e57162ce06a', 'pareentid17', 'parentIds17', 'name17', '0', 'e76023a7153844eb99bdee29199256d9', '1', 'reark', '0');
INSERT INTO `sys_area` VALUES ('fbd7390e36d04055a98de6b2e49612cf', 'pareentid21', 'parentIds21', 'name21', '0', '89709ac9f19f4280bbcaef56f160f318', '1', 'reark', '0');

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
  `remark` varchar(512) DEFAULT NULL,
  `flag` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1e790d1e9ceb4425bbbca422fbd5836a', 'A8', 'label8', 'value8', '1', 'remark8', '0');
INSERT INTO `sys_dict` VALUES ('6c93ebdb114a42c091bb5d0f8918713c', 'A7', 'label7', 'value7', '1', 'remark7', '0');
INSERT INTO `sys_dict` VALUES ('6fcac6beaabc46e1a8c3729d53827fc4', 'A3', 'label3', 'value3', null, 'remark3', '1');
INSERT INTO `sys_dict` VALUES ('77717f621e9c4ad694020d9ad86e3e2b', 'A10', 'label10', 'value10', '1', 'remark10', '0');
INSERT INTO `sys_dict` VALUES ('7fd36a58332944ad823f96f5cdbcbbac', 'A4', 'label4', 'value4', '1', 'remark4', '0');
INSERT INTO `sys_dict` VALUES ('901298829a96445eb28ddb8593d589ba', 'A1', 'label1', 'value1', '1', 'remark1', '0');
INSERT INTO `sys_dict` VALUES ('940b8b6451524dbcacd533e464b993cd', 'B9', 'B9', 'B9', '1', 'B9', '0');
INSERT INTO `sys_dict` VALUES ('99895a55e1e04a12a247385205f94792', 'A2', 'B9', 'value2', '1', 'remark2', '0');
INSERT INTO `sys_dict` VALUES ('a7b205eb09bd4361b84d838da2b24fa1', 'A6', 'label6', 'value6', '1', 'remark6', '0');
INSERT INTO `sys_dict` VALUES ('e7d2504a5ce2407297756341fb3a6b47', 'A0', 'label0', 'value0', '1', 'remark0', '0');
INSERT INTO `sys_dict` VALUES ('fd87ebd376d74c5b92355742d2a60f11', 'A5', 'label5', 'value5', '1', 'remark5', '0');

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
  `sort` decimal(10,0) NOT NULL,
  `target` char(1) DEFAULT NULL,
  `is_show` char(1) NOT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '1', '1', '1', '1', null, '1', 'sys:add', '0', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '0', '1', '1', '1', '1', null, '1', 'sys:edit', '0', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('3', '0', '1', '1', '1', '1', null, '1', '11', '0', null, '1', null, '0');
INSERT INTO `sys_menu` VALUES ('4', '0', '4', '4', '4', null, '4', '4', 'sys:del', '4', null, '1', null, '0');

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
  `type` char(1) NOT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `grade` char(1) DEFAULT NULL,
  `sort` decimal(10,0) NOT NULL,
  `master` varchar(64) DEFAULT NULL,
  `mobile` varchar(16) DEFAULT NULL,
  `useable` char(1) NOT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) DEFAULT NULL,
  `type` char(1) NOT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '11', '111', '1', '1', '0');
INSERT INTO `sys_role` VALUES ('2', '22', '222', '2', '2', '0');

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
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');

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
  `type` char(1) NOT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `flag` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('04bc3402c74e4e3c87e2e27b50a98a2e', '0', 'test6', '45e1473b4ba52bbe9d5215ee5163e86a', '6e6821dd960d4b78bd2d7381aad26a69', 'test6', '6', '', '610000', '6@123.com', '0', 'nothing6', '0');
INSERT INTO `sys_user` VALUES ('0bd4ad9ee64b4b73bbfb9b7dbba6ba41', '0', 'test3', '846f739a4d88f8ca258646fa745ecc9d', 'c6f08617595940e98a257bcf176817fc', 'test3', '3', '', '310000', '3@123.com', '0', 'nothing3', '0');
INSERT INTO `sys_user` VALUES ('0e207e95eb9d4f3985120ec7d5528013', '0', 'test1', 'b265f5fb1d15481d121b6eaa7145b5bb', '3a9388238ec3416f805da89940ff4dae', 'test1', '1', '', '110000', '1@123.com', '0', 'nothing1', '0');
INSERT INTO `sys_user` VALUES ('0f53c59c7fa24c9d8534411edc9f52c2', '0', 'test13', 'ab92a07803058aec7f97d9e659bed98a', '3e72ffc3cf7549e6855db1751d7aa7b7', 'test13', '13', '', '1310000', '13@123.com', '0', 'nothing13', '0');
INSERT INTO `sys_user` VALUES ('133ab8e0ce0a45a38070140dbcf2f25a', '0', 'test4', '12ddd0c4d1f018df1a26799b3a7b2a0a', 'ed71747394a44ae7a1b2f838b84a8718', 'test4', '4', '', '410000', '4@123.com', '0', 'nothing4', '0');
INSERT INTO `sys_user` VALUES ('230f2f0df45344fd8826c8ab1eae447e', '0', 'test11', '890103597e94bb506548c5c4117cfd19', '43508530a6ff4ceda6e2eebe6974ffe8', 'test11', '11', '', '1110000', '11@123.com', '0', 'nothing11', '0');
INSERT INTO `sys_user` VALUES ('3f1f44da3abd426db2258ad657919df1', '0', 'test5', '7f4b67199c2be6011c2900f88755e2e9', '01a648817342490089f02dc9db415bee', 'test5', '5', '', '510000', '5@123.com', '0', 'nothing5', '0');
INSERT INTO `sys_user` VALUES ('407ef1dca9a840f38d5732aa45a3a729', '0', 'test2', '5776054a8d86536011d83632166c86c2', 'aabb5a7e22c14a01beb521bc9829f2dd', 'test2', '2', '', '210000', '2@123.com', '0', 'nothing2', '0');
INSERT INTO `sys_user` VALUES ('8535c962d4724f8c96e2dd2d787dbfcc', '0', 'test10', '3cdc69bda8e5125a661a630b682c5b71', 'c096b57b9e2c4bf7b56a81476c944092', 'test10', '10', '', '1010000', '10@123.com', '0', 'nothing10', '0');
INSERT INTO `sys_user` VALUES ('a67fcebdd1b24c47adafe3f33adce11e', '0', 'test0', '0113a875c98860db677d4020b5e0e328', '177d9a9da4ee408d9f351cbbfa2905c5', 'test0', '0', '', '010000', '0@123.com', '0', 'nothing0', '0');
INSERT INTO `sys_user` VALUES ('cd6635a2cd8c490e9eb7eab371f14f20', '0', 'test12', '5b2428d58001ee2f3a4efac2c6ee6b8f', 'c5966db0dcb64f7ebdb78bb691a09436', 'test12', '12', '', '1210000', '12@123.com', '0', 'nothing12', '0');
INSERT INTO `sys_user` VALUES ('dc6d238e51694f3da92fda3b9cd09659', '0', 'test9', '18e4a46766e4583c9926ea2aa0185e46', 'a1d24d4a053c49d799f6251c5364b14a', 'test9', '9', '', '910000', '9@123.com', '0', 'nothing9', '0');
INSERT INTO `sys_user` VALUES ('e34790f9c3ca4c39841b781cf80e0a42', '0', 'test7', '165f20a0dc91c25031da203fb075af34', 'f4666d1b7c3e45d494da3fa55cc18d33', 'test7', '7', '', '710000', '7@123.com', '0', 'nothing7', '0');
INSERT INTO `sys_user` VALUES ('eadf4b92771441f98a01dd02687df8f2', '0', 'test8', '3b9db5fd1fc986cd02b3e8051821ac9d', '8532b2af06f146598b7f2291ea034144', 'test8', '8', '', '810000', '8@123.com', '0', 'nothing8', '0');

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
INSERT INTO `sys_user_role` VALUES ('0e207e95eb9d4f3985120ec7d5528013', '1');
INSERT INTO `sys_user_role` VALUES ('0e207e95eb9d4f3985120ec7d5528013', '2');
