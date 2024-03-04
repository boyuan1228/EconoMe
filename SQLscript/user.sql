-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Username',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Password',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Real name',
  `roleid` int NOT NULL DEFAULT '3' COMMENT 'Role ID',
  `houseid` int DEFAULT NULL COMMENT 'Household ID',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'User photo',
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
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (1, 'admin', '19223a7bbd7325516f069df18b50', 'Administrator', 1, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (62, 'test', '19223a7bbd7325516f069df18b50', 'Test User', 1, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (65, 'jz', '19223a7bbd7325516f069df18b50', 'Head of Household', 1, 29, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (66, 'father', '19223a7bbd7325516f069df18b50', 'Father', 3, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (67, 'mother', 'c289ffe12a30c94530b7fc4e532e2f42', 'Mother', 3, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (68, 'son', '19223a7bbd7325516f069df18b50', 'Son', 3, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `realname`, `roleid`, `houseid`, `photo`) VALUES (70, '001', 'e1adc3949ba59abbe56e057f2f883e', 'User 001', 3, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;