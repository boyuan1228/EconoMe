-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `privilegeNumber` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Privilege number',
  `privilegeName` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Privilege name',
  `privilegeTipflag` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Menu level',
  `privilegeTypeflag` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1 for enabled, 0 for disabled',
  `privilegeUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Privilege URL',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Icon',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of privilege
-- ----------------------------
BEGIN;
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (62, '001', 'Income and Expenditure Management', '0', '1', '', '&#xe698;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (63, '001002', 'Expenditure Details', '1', '1', 'pay_details', '&#xe698;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (64, '002', 'Account Overview', '0', '1', NULL, '&#xe702;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (65, '001001', 'Income Details', '1', '1', 'income_details', '&#xe698;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (66, '003', 'Statistical Reports', '0', '1', NULL, '&#xe757;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (67, '003001', 'Statistical Reports', '1', '1', 'chart_line', '&#xe757;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (68, '004', 'Family Member Management', '0', '1', NULL, '&#xe726;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (69, '005', 'System Management', '0', '1', '', '&#xe696;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (70, '005001', 'User Management', '1', '1', 'sys_users', '&#xe6b8;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (71, '005002', 'Role Management', '1', '1', 'sys_roles', '&#xe70b;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (74, '004001', 'Family Member Information', '1', '1', 'sys_users', '&#xe726;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (75, '002002', 'Financial Management Details', '1', '1', 'asset_moneymanage_details', '&#xe702;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (76, '002001', 'Current Assets', '1', '1', 'asset_account_details', '&#xe702;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (77, '002003', 'Debt Details', '1', '1', 'asset_debt_details', '&#xe702;');
INSERT INTO `privilege` (`ID`, `privilegeNumber`, `privilegeName`, `privilegeTipflag`, `privilegeTypeflag`, `privilegeUrl`, `icon`) VALUES (78, '002004', 'Financial Product Recommendations', '1', '1', 'asset_product_details', '&#xe702;');
COMMIT;