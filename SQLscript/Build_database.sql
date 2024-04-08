

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userid` int DEFAULT NULL COMMENT '用户id',
  `money` float(10,2) DEFAULT NULL COMMENT '金额',
  `typeid` int NOT NULL COMMENT '类型 1 收入 2 支出',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `paywayid` int DEFAULT NULL COMMENT '支付方式',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`userid`) USING BTREE,
  KEY `type` (`typeid`) USING BTREE,
  KEY `payway` (`paywayid`) USING BTREE,
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`typeid`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bill_ibfk_3` FOREIGN KEY (`paywayid`) REFERENCES `payway` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bill
-- ----------------------------
BEGIN;
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (309, '工资收入', 65, 12.00, 2, '', 1, '2023-03-17 01:30:10');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (310, '经营性收入', 65, 12.00, 2, '', 2, '2023-03-17 01:30:17');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (311, '转移性收入', 65, 34.00, 2, '', 5, '2023-03-17 01:30:25');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (312, '财产性收入', 65, 213.00, 2, '', 3, '2023-03-17 01:30:31');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (313, '居住', 65, 123.00, 1, '', 2, '2023-03-17 01:30:39');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (314, '居住', 65, 123.00, 1, '', 4, '2023-03-17 01:30:45');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (315, '工资收入', 68, 123.00, 2, '', 2, '2023-03-17 01:31:38');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (316, '财产性收入', 68, 124.00, 2, '', 3, '2023-03-17 01:31:44');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (317, '居住', 68, 12.00, 1, '', 3, '2023-03-17 01:32:15');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (318, '食品', 1, 111.00, 1, '', 1, '2023-03-26 14:36:48');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (319, '食品', 1, 111.00, 1, '', 1, '2023-03-26 14:36:57');
COMMIT;

-- ----------------------------
-- Table structure for curaccount
-- ----------------------------
DROP TABLE IF EXISTS `curaccount`;
CREATE TABLE `curaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `houseid` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `money` float(255,0) DEFAULT NULL,
  `paywayid` int DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `typeid_id` (`houseid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of curaccount
-- ----------------------------
BEGIN;
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (37, 1, NULL, '家庭资产', 135661, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (38, 50, NULL, '家庭资产', 123, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (39, 56, NULL, '家庭资产', 0, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (40, 57, 26, '家庭资产', 6700, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (41, 60, 26, '家庭资产', -1390, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (42, 59, 26, '家庭资产', -850, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (43, 58, 26, '家庭资产', 19000, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (44, 63, NULL, '家庭资产', 1101, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (45, 65, 29, '家庭资产', 25, NULL, '无');
INSERT INTO `curaccount` (`id`, `userid`, `houseid`, `name`, `money`, `paywayid`, `remark`) VALUES (46, 68, NULL, '家庭资产', 235, NULL, '无');
COMMIT;

-- ----------------------------
-- Table structure for debt
-- ----------------------------
DROP TABLE IF EXISTS `debt`;
CREATE TABLE `debt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `houseid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `residue` float(255,2) DEFAULT NULL,
  `curperiod` float(255,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of debt
-- ----------------------------
BEGIN;
INSERT INTO `debt` (`id`, `userid`, `houseid`, `name`, `residue`, `curperiod`) VALUES (8, 1, NULL, 'Home Loan', 11111.00, 11.00);
INSERT INTO `debt` (`id`, `userid`, `houseid`, `name`, `residue`, `curperiod`) VALUES (9, 1, NULL, '1', 1.00, 1.00);
COMMIT;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerid` int NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `holderid` (`ownerid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of house
-- ----------------------------
BEGIN;
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (1, 3, '');
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (3, 20, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (4, 21, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (5, 25, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (6, 26, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (7, 27, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (8, 29, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (9, 34, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (10, 35, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (11, 36, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (12, 38, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (13, 39, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (14, 40, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (15, 41, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (16, 42, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (17, 43, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (18, 44, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (19, 45, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (20, 46, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (21, 48, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (22, 49, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (23, 51, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (24, 53, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (25, 55, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (26, 57, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (27, 61, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (28, 64, NULL);
INSERT INTO `house` (`id`, `ownerid`, `address`) VALUES (29, 65, NULL);
COMMIT;

-- ----------------------------
-- Table structure for moneymanage
-- ----------------------------
DROP TABLE IF EXISTS `moneymanage`;
CREATE TABLE `moneymanage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `houseid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of moneymanage
-- ----------------------------
BEGIN;
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (14, 'product1', '200.0', '2.87', 31, 8);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (15, 'product2', '200.0', '2.64', 31, 8);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (16, 'product3', '400.0', '4.50', 30, 7);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (17, 'product4', '300.0', '5.31', 30, 7);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (18, 'product5', '300.0', '3.66', 27, 7);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (19, 'product6', '200.0', '5.09', 27, 7);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (20, 'product7', '100.0', '3', 1, NULL);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (22, 'product8', '10000.0', '0.05', 53, 24);
COMMIT;

-- ----------------------------
-- Table structure for payway
-- ----------------------------
DROP TABLE IF EXISTS `payway`;
CREATE TABLE `payway` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payway` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of payway
-- ----------------------------
BEGIN;
INSERT INTO `payway` (`id`, `payway`, `extra`) VALUES (1, 'Alipay', NULL);
INSERT INTO `payway` (`id`, `payway`, `extra`) VALUES (2, 'Wechat', NULL);
INSERT INTO `payway` (`id`, `payway`, `extra`) VALUES (3, 'Visa', NULL);
INSERT INTO `payway` (`id`, `payway`, `extra`) VALUES (4, 'Cash', NULL);
INSERT INTO `payway` (`id`, `payway`, `extra`) VALUES (5, 'Other', NULL);
COMMIT;

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `privilegeNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `privilegeName` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `privilegeTipflag` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `privilegeTypeflag` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1open 0close',
  `privilegeUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL ,
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of privilege
-- ----------------------------
BEGIN;
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (62, '001', '收支管理', '0', '1', '', '&#xe698;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (63, '001002', '支出详情', '1', '1', 'pay_details', '&#xe698;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (64, '002', '账户总览', '0', '1', NULL, '&#xe702;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (65, '001001', '收入详情', '1', '1', 'income_details', '&#xe698;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (66, '003', '统计报表', '0', '1', NULL, '&#xe757;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (67, '003001', '统计报表', '1', '1', 'chart_line', '&#xe757;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (68, '004', '家庭成员管理', '0', '1', NULL, '&#xe726;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (69, '005', '系统管理', '0', '1', '', '&#xe696;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (70, '005001', '用户管理', '1', '1', 'sys_users', '&#xe6b8;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (71, '005002', '角色管理', '1', '1', 'sys_roles', '&#xe70b;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (74, '004001', '家庭成员信息', '1', '1', 'sys_users', '&#xe726;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (75, '002002', '理财详情', '1', '1', 'asset_moneymanage_details', '&#xe702;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (76, '002001', '活期资产', '1', '1', 'asset_account_details', '&#xe702;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (77, '002003', '负债详情', '1', '1', 'asset_debt_details', '&#xe702;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (78, '002004', '理财推荐', '1', '1', 'asset_product_details', '&#xe702;');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Risk Level',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Risk Describe',
  `loss` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Risk Posibility',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (1, 'Government Bonds', 'R1', 'Conservative, Low Risk', 'Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (2, 'Deposit Products', 'R1', 'Conservative, Low Risk', 'Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (3, 'Guaranteed Principal and Return Products', 'R1', 'Conservative, Low Risk', 'Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (4, 'Guaranteed Principal with Floating Return Products', 'R1', 'Conservative, Low Risk', 'Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (5, 'Interbank Market Bonds', 'R2', 'Moderate, Low to Medium Risk', 'Near Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (6, 'Exchange Market Bonds', 'R2', 'Moderate, Low to Medium Risk', 'Near Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (7, 'Funds Lending', 'R2', 'Moderate, Low to Medium Risk', 'Near Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (8, 'Trust Plans', 'R2', 'Moderate, Low to Medium Risk', 'Near Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (9, 'Other Financial Assets', 'R2', 'Moderate, Low to Medium Risk', 'Near Zero');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (10, 'Bonds', 'R3', 'Balanced, Medium Risk', 'Lower');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (11, 'Interbank Deposits', 'R3', 'Balanced, Medium Risk', 'Lower');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (12, 'Stocks', 'R3', 'Balanced, Medium Risk', 'Lower');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (13, 'Commodities', 'R3', 'Balanced, Medium Risk', 'Lower');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (14, 'Foreign Exchange', 'R3', 'Balanced, Medium Risk', 'Lower');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (15, 'Net Value Wealth Management', 'R3', 'Balanced, Medium Risk', 'Lower');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (16, 'Mixed Funds', 'R3', 'Balanced, Medium Risk', 'Lower');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (17, 'Private Equity Funds', 'R4', 'Aggressive, Medium to High Risk', 'Higher');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (18, 'Trust Products', 'R4', 'Aggressive, Medium to High Risk', 'Higher');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (19, 'Stock Funds', 'R4', 'Aggressive, Medium to High Risk', 'Higher');
INSERT INTO `product` (`id`, `name`, `level`, `remark`, `loss`) VALUES (20, 'Index Funds', 'R4', 'Aggressive, Medium to High Risk', 'Higher');
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` int NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'RoleName',
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`roleid`, `rolename`) VALUES (1, 'administrator');
INSERT INTO `role` (`roleid`, `rolename`) VALUES (2, 'normal_user');
INSERT INTO `role` (`roleid`, `rolename`) VALUES (3, 'vip_user');
COMMIT;

-- ----------------------------
-- Table structure for roleprivilieges
-- ----------------------------
DROP TABLE IF EXISTS `roleprivilieges`;
CREATE TABLE `roleprivilieges` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleID` int DEFAULT NULL COMMENT '角色维护表主键',
  `privilegeID` int DEFAULT NULL COMMENT '权限维护表主键',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `roleID` (`roleID`) USING BTREE,
  KEY `privilegeID` (`privilegeID`) USING BTREE,
  CONSTRAINT `roleprivilieges_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `roleprivilieges_ibfk_2` FOREIGN KEY (`privilegeID`) REFERENCES `privilege` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=948 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of roleprivilieges
-- ----------------------------
BEGIN;
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (925, 3, 65);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (926, 3, 63);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (927, 3, 67);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (928, 3, 62);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (929, 3, 66);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (933, 1, 65);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (934, 1, 63);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (935, 1, 75);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (936, 1, 76);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (937, 1, 77);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (938, 1, 78);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (939, 1, 67);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (940, 1, 74);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (941, 1, 70);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (942, 1, 71);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (943, 1, 62);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (944, 1, 64);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (945, 1, 66);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (946, 1, 68);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (947, 1, 69);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (925, 2, 65);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (926, 2, 63);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (927, 2, 67);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (928, 2, 62);
INSERT INTO `roleprivilieges` (`ID`, `roleID`, `privilegeID`) VALUES (929, 2, 66);
COMMIT;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
BEGIN;
INSERT INTO `type` (`id`, `name`) VALUES (1, 'Outcome');
INSERT INTO `type` (`id`, `name`) VALUES (2, 'Income');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Account',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Password',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'TrueName',
  `roleid` int NOT NULL DEFAULT '3' COMMENT 'RoleID',
  `houseid` int DEFAULT NULL COMMENT 'HouseID',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'UserPhoto',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `houseid` (`houseid`) USING BTREE,
  KEY `roleid` (`roleid`) USING BTREE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`houseid`) REFERENCES `house` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (1, 'admin', '19223a7bbd7325516f069df18b50', '管理员', 1, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (62, 'test', '19223a7bbd7325516f069df18b50', '管理员', 1, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (65, 'jz', '19223a7bbd7325516f069df18b50', '家主', 1, 29, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (66, 'father', '19223a7bbd7325516f069df18b50', '父亲', 3, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (67, 'mother', 'c289ffe12a30c94530b7fc4e532e2f42', '母亲', 3, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (68, 'son', '19223a7bbd7325516f069df18b50', '儿子', 3, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (70, '001', 'e1adc3949ba59abbe56e057f2f883e', '001', 3, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
