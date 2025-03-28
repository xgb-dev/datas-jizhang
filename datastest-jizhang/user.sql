/*
 Navicat Premium Data Transfer

 Source Server         : 122.51.255.60-yy
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : user

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 16/11/2022 15:01:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(20) NOT NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES (1, 'ok', 'warning', 2, '2019-08-01 16:41:00');
INSERT INTO `label` VALUES (2, '紧急', 'success', 2, '2019-08-01 16:29:28');
INSERT INTO `label` VALUES (3, '123', 'info', 2, '2019-08-05 18:44:50');
INSERT INTO `label` VALUES (4, 'oks', 'default', 2, '2019-08-07 16:26:01');
INSERT INTO `label` VALUES (5, 'ops', 'default', 2, '2019-08-07 16:29:11');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime NULL DEFAULT NULL,
  `is_vip` int(1) NOT NULL,
  `default_show` int(1) NOT NULL,
  `groups` int(10) NOT NULL,
  `icon` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '所有', 'all', '2019-06-28 13:25:02', 0, 0, 1, 'el-icon-takeaway-box');
INSERT INTO `menu` VALUES (2, '今天', 'today', '2019-06-28 13:18:59', 0, 1, 1, 'el-icon-sunny');
INSERT INTO `menu` VALUES (3, '七天', 'week', '2019-06-28 13:22:51', 0, 1, 1, 'el-icon-date');
INSERT INTO `menu` VALUES (4, '分配给我', 'tome', '2019-06-28 13:27:23', 0, 0, 1, 'el-icon-view');
INSERT INTO `menu` VALUES (5, '日历', 'calendar', '2019-06-28 13:27:45', 1, 1, 1, 'el-icon-date');
INSERT INTO `menu` VALUES (6, '收集箱', 'inbox', '2019-06-28 13:23:10', 0, 1, 1, 'el-icon-files');
INSERT INTO `menu` VALUES (7, '已完成', 'complete', '2019-06-28 13:23:41', 0, 1, 2, 'el-icon-finished');
INSERT INTO `menu` VALUES (8, '垃圾桶', 'trash', '2019-06-28 13:23:58', 0, 1, 2, 'el-icon-delete');
INSERT INTO `menu` VALUES (9, '摘要', 'abstract', '2019-07-01 15:48:26', 1, 1, 3, 'el-icon-document');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime NULL DEFAULT NULL,
  `uid` int(20) NOT NULL,
  `theme` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `display` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES (2, '生活1', '2019-06-18 16:05:30', 3, 'primary', 0);
INSERT INTO `orderlist` VALUES (3, '必须的', '2019-06-18 16:07:07', 2, 'primary', 0);
INSERT INTO `orderlist` VALUES (6, '不紧急的', '2019-06-18 16:16:16', 2, 'primary', 0);
INSERT INTO `orderlist` VALUES (7, '不重要', '2019-06-24 11:03:00', 2, 'primary', 0);
INSERT INTO `orderlist` VALUES (8, '生活1', '2019-07-02 11:18:20', 1, 'primary', 0);
INSERT INTO `orderlist` VALUES (9, '下月的', '2019-07-03 17:26:17', 2, 'danger', 0);
INSERT INTO `orderlist` VALUES (10, '2018年', '2019-07-31 17:51:53', 2, 'danger', 0);
INSERT INTO `orderlist` VALUES (11, '2019年', '2019-08-01 10:49:12', 2, 'success', 0);
INSERT INTO `orderlist` VALUES (12, '2020年', '2019-08-01 10:50:09', 2, 'warning', 0);
INSERT INTO `orderlist` VALUES (13, '1', '2019-08-01 10:59:45', 2, 'danger', 1);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `orderid` int(20) NULL DEFAULT NULL,
  `labelid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `plantime` date NULL DEFAULT NULL,
  `edittime` datetime NULL DEFAULT NULL,
  `completetime` date NULL DEFAULT NULL,
  `uid` int(20) NOT NULL,
  `level` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '0.无优先级1.低优先级2.中优先级3.高优先级',
  `delstatus` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0,
  `status` int(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0 COMMENT '0代表未完成，1代表完成',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, '123收集箱', '1231232123112', NULL, NULL, '2019-06-21 16:06:54', '2019-06-07', '2019-06-25 18:23:15', '2019-06-25', 1, 1, 0, 1);
INSERT INTO `task` VALUES (2, '1234收', '123123212311212121eqw', NULL, NULL, '2019-06-21 16:06:41', '2019-06-08', '2019-06-25 18:53:16', '2019-06-25', 1, 2, 0, 1);
INSERT INTO `task` VALUES (3, 'ewqeq', '12312321231qw123333333', NULL, '1,5,3', '2019-06-21 16:05:22', '2019-08-10', '2019-08-07 16:25:19', NULL, 2, 3, 0, 0);
INSERT INTO `task` VALUES (9, '123100000', NULL, 6, NULL, '2019-06-21 15:59:28', '2019-06-15', NULL, '2019-07-30', 2, 2, 0, 1);
INSERT INTO `task` VALUES (10, 'dasdas', '<p>1231231</p>', 3, '1,2,3,5', '2019-06-20 10:47:21', '2019-08-08', '2019-08-07 16:34:51', '2019-08-05', 2, 3, 0, 0);
INSERT INTO `task` VALUES (11, '1111', '123', 4, NULL, '2019-06-20 10:47:30', '2019-08-08', '2019-07-09 17:13:11', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (12, '今天的count', '<p>123222</p>', NULL, NULL, '2019-06-24 10:55:42', '2019-08-08', '2020-01-07 16:23:25', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (13, 'eee7887878', '123112312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312312323123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123', NULL, NULL, '2019-06-24 10:56:19', '2019-07-10', '2019-07-16 11:05:21', '2019-07-22', 2, 2, 0, 1);
INSERT INTO `task` VALUES (14, 'www', '123', NULL, NULL, '2019-06-27 08:30:30', NULL, NULL, NULL, 3, 0, 0, 0);
INSERT INTO `task` VALUES (15, '1231', '123', 0, NULL, '2019-06-27 12:50:05', NULL, '2019-06-27 12:50:05', NULL, 3, 0, 0, 0);
INSERT INTO `task` VALUES (16, '1231231', '213', 0, NULL, '2019-06-27 12:54:30', NULL, '2019-06-27 12:54:30', '2019-06-27', 3, 0, 0, 0);
INSERT INTO `task` VALUES (17, '收集箱', '123', 0, NULL, '2019-06-27 12:57:34', NULL, '2019-06-27 12:57:34', '2019-06-27', 3, 0, 0, 0);
INSERT INTO `task` VALUES (18, '222', '123', 0, NULL, '2019-06-27 13:00:31', NULL, '2019-06-27 13:00:31', '2019-06-27', 3, 0, 0, 0);
INSERT INTO `task` VALUES (19, '123123123131', NULL, 0, NULL, '2019-06-27 13:03:55', NULL, '2019-06-27 13:03:55', '2019-06-27', 3, 0, 0, 1);
INSERT INTO `task` VALUES (20, 'eee', '31231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121312312312131231231213123123121', 0, NULL, '2019-06-27 13:08:39', '2019-06-28', '2019-06-27 16:22:37', '2019-06-27', 3, 1, 0, 1);
INSERT INTO `task` VALUES (21, 'qqq', NULL, NULL, NULL, '2019-06-27 13:12:26', NULL, '2019-06-27 13:12:26', '2019-06-27', 3, 0, 0, 1);
INSERT INTO `task` VALUES (22, '一周', '1231', NULL, NULL, '2019-07-03 16:13:16', '2019-07-06', '2019-07-09 17:08:04', '2019-08-06', 2, 0, 0, 1);
INSERT INTO `task` VALUES (26, '444', '<p>qqq</p>', 3, NULL, '2019-07-04 13:53:04', NULL, '2019-07-30 09:44:53', '2019-08-05', 2, 0, 1, 1);
INSERT INTO `task` VALUES (27, '1231231', 'wqeqw', 3, NULL, '2019-07-08 17:16:41', NULL, '2019-07-11 16:06:59', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (28, '1231', '<p>dasda</p>', 3, NULL, '2019-07-08 17:20:03', NULL, '2019-07-24 17:41:50', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (29, 'q', NULL, 3, NULL, '2019-07-08 17:20:34', NULL, '2019-07-08 17:20:34', '2019-07-30', 2, 0, 0, 1);
INSERT INTO `task` VALUES (31, '1', NULL, NULL, NULL, '2019-07-08 17:23:36', '2019-08-05', '2019-07-08 17:23:36', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (32, '22', NULL, 3, NULL, '2019-07-08 17:23:41', NULL, '2019-07-08 17:23:41', '2019-07-30', 2, 0, 0, 1);
INSERT INTO `task` VALUES (33, '1212', '<p>121212334535</p>', NULL, NULL, '2019-07-08 17:23:46', '2019-08-08', '2019-08-08 14:45:43', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (34, '333', '<p>大青蛙大全</p>', NULL, NULL, '2019-07-08 17:24:12', NULL, '2019-08-08 14:45:49', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (35, '2342', '<p>完全的我的钱</p>', NULL, NULL, '2019-07-08 17:26:18', NULL, '2019-08-08 14:46:08', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (36, '123', NULL, NULL, NULL, '2019-07-08 17:29:09', '2019-07-10', '2019-07-08 17:29:09', '2019-07-23', 2, 3, 0, 1);
INSERT INTO `task` VALUES (37, '1234', NULL, NULL, NULL, '2019-07-08 17:32:48', '2019-07-08', '2019-07-08 17:32:48', '2019-07-23', 2, 0, 0, 1);
INSERT INTO `task` VALUES (38, '12345', NULL, NULL, NULL, '2019-07-08 17:33:49', '2019-07-08', '2019-07-08 17:33:49', '2019-07-23', 2, 0, 0, 1);
INSERT INTO `task` VALUES (39, '今天务必完成', '<p>入库操作</p>', NULL, NULL, '2019-07-08 17:35:02', '2019-08-05', '2019-08-01 15:39:22', '2019-08-08', 2, 1, 0, 1);
INSERT INTO `task` VALUES (40, '1234567', '<p>111</p>', NULL, '6', '2019-07-08 17:35:14', '2019-08-09', '2019-08-15 17:14:46', NULL, 2, 2, 0, 0);
INSERT INTO `task` VALUES (41, '今天的', '<p>dasda</p>', NULL, NULL, '2019-07-08 17:36:17', '2019-08-09', '2019-07-25 16:52:13', NULL, 2, 2, 0, 0);
INSERT INTO `task` VALUES (42, '123', NULL, 3, NULL, '2019-07-08 17:48:11', '2019-08-06', '2019-07-30 13:19:03', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (43, '1231', NULL, 5, NULL, '2019-07-10 16:46:57', NULL, '2019-07-10 16:46:57', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (44, 'aaa', NULL, NULL, NULL, '2019-07-30 09:27:14', NULL, '2019-07-30 09:27:14', NULL, 2, 0, 1, 0);
INSERT INTO `task` VALUES (45, 'bbb', NULL, NULL, NULL, '2019-07-30 09:28:25', '2019-08-29', '2019-07-30 09:28:25', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (46, 'www', NULL, 3, NULL, '2019-07-30 09:43:43', '2020-02-15', '2019-07-30 09:43:43', NULL, 2, 0, 1, 0);
INSERT INTO `task` VALUES (47, 'eee1', '<p>12345</p>', 3, NULL, '2019-07-30 10:21:35', '2019-08-22', '2019-08-01 14:10:45', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (48, 'aaa', NULL, NULL, NULL, '2019-07-31 13:30:08', '2019-08-19', '2019-07-31 13:30:08', NULL, 2, 3, 0, 0);
INSERT INTO `task` VALUES (49, '111', '<p>2131qq</p>', NULL, NULL, '2019-07-31 13:54:59', '2019-08-06', '2020-06-17 12:45:33', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (50, '123刚', '<p>211121</p>', NULL, NULL, '2019-08-05 18:20:32', NULL, '2019-08-05 18:23:41', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (51, '2910-8-8', NULL, NULL, NULL, '2019-08-08 11:24:45', NULL, '2019-08-08 11:24:45', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (52, '2019-8-8', NULL, NULL, NULL, '2019-08-08 11:27:13', NULL, '2019-08-08 11:27:13', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (53, '朱', NULL, NULL, NULL, '2019-08-08 14:46:33', NULL, '2019-08-08 14:46:33', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (54, '正', NULL, NULL, NULL, '2019-08-08 14:47:56', NULL, '2019-08-08 14:47:56', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (55, '雷', NULL, NULL, NULL, '2019-08-08 14:49:01', NULL, '2019-08-08 14:49:01', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (56, '朱1', NULL, NULL, NULL, '2019-08-08 14:50:04', NULL, '2019-08-08 14:50:04', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (57, '正1', NULL, NULL, NULL, '2019-08-08 14:51:03', NULL, '2019-08-08 14:51:03', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (58, '雷1', NULL, NULL, NULL, '2019-08-08 14:52:01', NULL, '2019-08-08 14:52:01', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (59, '朱2', NULL, NULL, NULL, '2019-08-08 14:53:22', NULL, '2019-08-08 14:53:22', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (60, '正2', NULL, NULL, NULL, '2019-08-08 14:53:49', NULL, '2019-08-08 14:53:49', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (61, '雷2', NULL, NULL, NULL, '2019-08-08 14:54:31', NULL, '2019-08-08 14:54:31', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (62, '朱3', NULL, NULL, NULL, '2019-08-08 14:56:31', NULL, '2019-08-08 14:56:31', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (63, '正3', NULL, NULL, NULL, '2019-08-08 14:57:14', NULL, '2019-08-08 14:57:14', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (64, '雷3', NULL, NULL, NULL, '2019-08-08 14:59:30', NULL, '2019-08-08 14:59:30', '2019-08-08', 2, 0, 0, 1);
INSERT INTO `task` VALUES (65, '朱4', NULL, NULL, NULL, '2019-08-08 15:01:19', '2019-08-08', '2019-08-08 15:01:19', '2019-08-08', 2, 0, 0, 0);
INSERT INTO `task` VALUES (66, '正4', NULL, NULL, NULL, '2019-08-08 15:09:25', NULL, '2019-08-08 15:09:25', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (67, '雷4', '<p>123</p>', NULL, NULL, '2019-08-08 15:10:28', NULL, '2019-12-25 15:43:36', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (68, 'qqq', NULL, NULL, NULL, '2019-08-08 15:11:51', NULL, '2019-08-08 15:11:51', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (69, '1111111111111111111111111', NULL, NULL, NULL, '2019-08-08 15:13:24', '2019-08-09', '2019-08-08 15:13:24', '2019-08-08', 2, 0, 0, 0);
INSERT INTO `task` VALUES (70, '222222222222222222', NULL, 2, NULL, '2019-08-08 18:45:45', NULL, '2019-08-08 18:45:45', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (71, '22222', NULL, NULL, NULL, '2019-08-08 18:47:10', NULL, '2019-08-08 18:47:10', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (72, '22222', NULL, NULL, NULL, '2019-08-08 18:51:52', '2019-08-08', '2019-08-08 18:51:52', NULL, 2, 1, 0, 0);
INSERT INTO `task` VALUES (73, '333333', NULL, NULL, NULL, '2019-08-08 18:54:12', NULL, '2019-08-08 18:54:12', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (74, '44444444', NULL, NULL, NULL, '2019-08-08 18:58:34', NULL, '2019-08-08 18:58:34', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (75, '5555555', NULL, NULL, NULL, '2019-08-09 09:36:56', NULL, '2019-08-09 09:36:56', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (76, '666666', NULL, NULL, NULL, '2019-08-09 09:38:11', NULL, '2019-08-09 09:38:11', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (77, '77777', NULL, NULL, NULL, '2019-08-09 09:39:35', NULL, '2019-08-09 09:39:35', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (78, '888888', NULL, NULL, NULL, '2019-08-09 09:41:35', NULL, '2019-08-09 09:41:35', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (79, '9999999', NULL, NULL, NULL, '2019-08-09 09:50:02', NULL, '2019-08-09 09:50:02', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (80, 'qwqwqw', NULL, 1, NULL, '2019-08-09 10:27:05', NULL, '2019-08-09 10:27:05', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (81, '中', NULL, NULL, NULL, '2019-08-09 10:28:38', NULL, '2019-08-09 10:28:38', '1970-01-01', 2, 0, 0, 0);
INSERT INTO `task` VALUES (82, '中', NULL, NULL, NULL, '2019-08-09 10:28:48', NULL, '2019-08-09 10:28:48', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (83, '中1', NULL, NULL, NULL, '2019-08-09 10:31:56', NULL, '2019-08-09 10:31:56', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (84, '中2', NULL, NULL, NULL, '2019-08-09 10:32:56', NULL, '2019-08-09 10:32:56', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (85, '23232322323', NULL, NULL, NULL, '2019-08-09 10:33:32', NULL, '2019-08-09 10:33:32', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (86, '12121', NULL, NULL, NULL, '2019-08-09 10:34:07', NULL, '2019-08-09 10:34:07', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (87, '5555555', NULL, NULL, NULL, '2019-08-09 10:36:26', NULL, '2019-08-09 10:36:26', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (88, '66666', NULL, NULL, NULL, '2019-08-09 10:38:35', NULL, '2019-08-09 10:38:35', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (89, '1231231', NULL, NULL, NULL, '2019-08-09 10:40:29', NULL, '2019-08-09 10:40:29', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (90, '2323', NULL, NULL, NULL, '2019-08-09 10:40:36', NULL, '2019-08-09 10:40:36', NULL, 2, 0, 0, 0);
INSERT INTO `task` VALUES (91, '123123', '<p>wqewe</p>', 8, NULL, '2019-11-14 13:10:44', '2019-11-14', '2019-11-14 13:11:29', NULL, 1, 0, 0, 0);
INSERT INTO `task` VALUES (92, 'wqe', NULL, 10, NULL, '2020-01-15 17:04:05', NULL, '2020-01-15 17:04:05', NULL, 2, 0, 0, 0);

-- ----------------------------
-- Table structure for taskimg
-- ----------------------------
DROP TABLE IF EXISTS `taskimg`;
CREATE TABLE `taskimg`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `taskid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of taskimg
-- ----------------------------
INSERT INTO `taskimg` VALUES (1, 12, 2, 'image_2020_01_2_16_23.png');
INSERT INTO `taskimg` VALUES (2, 72, 2, 'image_2020_01_3_17_0.png');
INSERT INTO `taskimg` VALUES (4, 49, 2, 'image_2020_11_5_15_25.png');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pw` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `theme` int(2) NULL DEFAULT NULL,
  `is_vip` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, 'zhu', 'zhuZHU1989~', 'abc', NULL, NULL, 0);
INSERT INTO `user` VALUES (3, 'zhus', '1234', 'abc', '', NULL, 0);

-- ----------------------------
-- Table structure for usermenu
-- ----------------------------
DROP TABLE IF EXISTS `usermenu`;
CREATE TABLE `usermenu`  (
  `uid` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `is_show` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`, `uid`) USING BTREE,
  INDEX `primary_key`(`uid`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usermenu
-- ----------------------------
INSERT INTO `usermenu` VALUES (1, 1, 0);
INSERT INTO `usermenu` VALUES (2, 1, 0);
INSERT INTO `usermenu` VALUES (6, 1, 0);
INSERT INTO `usermenu` VALUES (8, 1, 0);
INSERT INTO `usermenu` VALUES (1, 2, 1);
INSERT INTO `usermenu` VALUES (2, 2, 1);
INSERT INTO `usermenu` VALUES (6, 2, 1);
INSERT INTO `usermenu` VALUES (8, 2, 1);
INSERT INTO `usermenu` VALUES (1, 3, 1);
INSERT INTO `usermenu` VALUES (2, 3, 1);
INSERT INTO `usermenu` VALUES (6, 3, 1);
INSERT INTO `usermenu` VALUES (8, 3, 1);
INSERT INTO `usermenu` VALUES (1, 4, 0);
INSERT INTO `usermenu` VALUES (2, 4, 0);
INSERT INTO `usermenu` VALUES (6, 4, 0);
INSERT INTO `usermenu` VALUES (8, 4, 0);
INSERT INTO `usermenu` VALUES (1, 5, 1);
INSERT INTO `usermenu` VALUES (2, 5, 1);
INSERT INTO `usermenu` VALUES (6, 5, 1);
INSERT INTO `usermenu` VALUES (8, 5, 1);
INSERT INTO `usermenu` VALUES (1, 6, 1);
INSERT INTO `usermenu` VALUES (2, 6, 1);
INSERT INTO `usermenu` VALUES (6, 6, 1);
INSERT INTO `usermenu` VALUES (8, 6, 1);
INSERT INTO `usermenu` VALUES (1, 7, 1);
INSERT INTO `usermenu` VALUES (2, 7, 1);
INSERT INTO `usermenu` VALUES (6, 7, 1);
INSERT INTO `usermenu` VALUES (8, 7, 1);
INSERT INTO `usermenu` VALUES (1, 8, 1);
INSERT INTO `usermenu` VALUES (2, 8, 1);
INSERT INTO `usermenu` VALUES (6, 8, 1);
INSERT INTO `usermenu` VALUES (8, 8, 1);
INSERT INTO `usermenu` VALUES (1, 9, 1);
INSERT INTO `usermenu` VALUES (2, 9, 1);
INSERT INTO `usermenu` VALUES (6, 9, 1);
INSERT INTO `usermenu` VALUES (8, 9, 1);

SET FOREIGN_KEY_CHECKS = 1;
