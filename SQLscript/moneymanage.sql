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
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (14, '信诚薪金宝', '200.0', '2.87', 31, 8);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (15, '国寿光源180', '200.0', '2.64', 31, 8);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (16, '平安享赢368', '400.0', '4.50', 30, 7);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (17, '广发聚荣', '300.0', '5.31', 30, 7);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (18, '汇添富', '300.0', '3.66', 27, 7);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (19, '鹏华招华', '200.0', '5.09', 27, 7);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (20, 'licai', '100.0', '3', 1, NULL);
INSERT INTO `moneymanage` (`id`, `name`, `money`, `rate`, `userid`, `houseid`) VALUES (22, '产品1', '10000.0', '0.05', 53, 24);
COMMIT;
