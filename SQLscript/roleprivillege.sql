-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`roleid`, `rolename`) VALUES (1, 'Admin');
INSERT INTO `role` (`roleid`, `rolename`) VALUES (3, 'Member');
COMMIT;

-- ----------------------------
-- Table structure for roleprivilieges
-- ----------------------------
DROP TABLE IF EXISTS `roleprivilieges`;
CREATE TABLE `roleprivilieges` (
  `ID` int NOT NULL AUTO_INCREMENT ,
  `roleID` int DEFAULT NULL COMMENT ,
  `privilegeID` int DEFAULT NULL COMMENT ,
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