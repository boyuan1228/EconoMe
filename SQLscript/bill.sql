SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userid` int DEFAULT NULL COMMENT 'User ID',
  `money` float(10,2) DEFAULT NULL COMMENT 'Amount',
  `typeid` int NOT NULL COMMENT 'Type: 1 for income, 2 for expenditure',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Remarks',
  `paywayid` int DEFAULT NULL COMMENT 'Payment Method',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Transaction Time',
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
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (309, 'Salary Income', 65, 12.00, 2, '', 1, '2023-03-17 01:30:10');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (310, 'Operational Income', 65, 12.00, 2, '', 2, '2023-03-17 01:30:17');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (311, 'Transfer Income', 65, 34.00, 2, '', 5, '2023-03-17 01:30:25');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (312, 'Property Income', 65, 213.00, 2, '', 3, '2023-03-17 01:30:31');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (313, 'Residence', 65, 123.00, 1, '', 2, '2023-03-17 01:30:39');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (314, 'Residence', 65, 123.00, 1, '', 4, '2023-03-17 01:30:45');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (315, 'Salary Income', 68, 123.00, 2, '', 2, '2023-03-17 01:31:38');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (316, 'Property Income', 68, 124.00, 2, '', 3, '2023-03-17 01:31:44');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (317, 'Residence', 68, 12.00, 1, '', 3, '2023-03-17 01:32:15');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (318, 'Food', 1, 111.00, 1, '', 1, '2023-03-26 14:36:48');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (319, 'Food', 1, 111.00, 1, '', 2, '2023-03-26 14:37:00');
INSERT INTO `bill` (`id`, `title`, `userid`, `money`, `typeid`, `remark`, `paywayid`, `time`) VALUES (320, 'Food', 1, 222.00, 1, '', 3, '2023-03-26 14:37:13');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
