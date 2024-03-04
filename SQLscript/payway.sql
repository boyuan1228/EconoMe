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
