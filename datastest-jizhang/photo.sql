/*
 Navicat Premium Data Transfer

 Source Server         : 122.51.255.60-yy
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : photo

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 16/11/2022 15:00:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo_description` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo_size` double(10, 0) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES (10, '不知道什么花', '非常好看', NULL, '1621951133783_DSC00947.jpg', NULL);
INSERT INTO `photo` VALUES (11, '啥子树的种子啊？有谁知道吗', '一坠一坠的，看的好爽', NULL, '1621951133792_DSC00978.jpg', NULL);
INSERT INTO `photo` VALUES (12, '电车', '电车还是很便宜的，才2元，我坐了全程', NULL, '1621951133794_DSC00982.jpg', NULL);
INSERT INTO `photo` VALUES (15, '万绿丛中一支红', '红枫', NULL, '1621951133788_DSC00962.jpg', NULL);
INSERT INTO `photo` VALUES (19, '早晨上班的路上，苏州长江路', '烟囱还冒着白烟', NULL, '1622717501005_62930da9-27a6-4b47-a283-f26c611597f5.jpg', NULL);
INSERT INTO `photo` VALUES (26, '', NULL, NULL, '1621951133802_未标题-4.jpg', NULL);
INSERT INTO `photo` VALUES (27, '', NULL, NULL, '1621951133801_未标题-3.jpg', NULL);
INSERT INTO `photo` VALUES (28, '', NULL, NULL, '1621951133801_未标题-3.jpg', NULL);
INSERT INTO `photo` VALUES (29, '', NULL, NULL, '1621951133802_未标题-4.jpg', NULL);
INSERT INTO `photo` VALUES (30, '', NULL, NULL, '1621951133797_未标题-2.jpg', NULL);
INSERT INTO `photo` VALUES (31, '', NULL, NULL, '1621951133797_未标题-1.jpg', NULL);
INSERT INTO `photo` VALUES (33, 'undefined', 'undefined', NULL, '1625040404838_0a5e8cdc-5cbb-49a2-9c39-ee73743b35d7.jpg', NULL);
INSERT INTO `photo` VALUES (34, 'undefined', 'undefined', NULL, '1625040422322_9d3e3e88-48db-49f7-9b60-34899cdbcdcb.jpg', NULL);
INSERT INTO `photo` VALUES (35, 'undefined', 'undefined', NULL, '1625040435197_09194ed4-f004-4f3f-80e6-95bcc92c52e2.jpg', NULL);
INSERT INTO `photo` VALUES (36, 'undefined', 'undefined', NULL, '1625040447099_4b665703-deda-4d32-b1bf-70f24e3f2f51.jpg', NULL);
INSERT INTO `photo` VALUES (37, 'undefined', 'undefined', NULL, '1625040456789_80357afb-48a2-4c3d-b84c-2769c8df2048.jpg', NULL);
INSERT INTO `photo` VALUES (38, 'undefined', 'undefined', NULL, '1625040775471_e043dd55-c48e-451a-b443-f24ad989e9a4.jpg', NULL);
INSERT INTO `photo` VALUES (39, 'undefined', 'undefined', NULL, '1625040794036_cb13bea4-ca0b-42dc-bf8b-fc4a7a45769f.jpg', NULL);
INSERT INTO `photo` VALUES (40, 'undefined', 'undefined', NULL, '1625040814593_29b201d4-4717-48a4-8f9b-27211dac947a.jpg', NULL);
INSERT INTO `photo` VALUES (41, 'undefined', 'undefined', NULL, '1625040858772_2b47540e-3368-4f61-8daf-b7ac61a712e8.jpg', NULL);
INSERT INTO `photo` VALUES (42, 'undefined', 'undefined', NULL, '1625040870360_9a42f576-0259-44e3-b5ce-18d312754295.jpg', NULL);
INSERT INTO `photo` VALUES (43, 'undefined', 'undefined', NULL, '1625040883557_46b0d055-02bf-415d-af84-4339abf2941d.jpg', NULL);
INSERT INTO `photo` VALUES (44, 'undefined', 'undefined', NULL, '1630917098814_8A863A52-33DA-42CE-B5EA-7D81C51EBDC9.jpeg', NULL);
INSERT INTO `photo` VALUES (45, 'undefined', 'undefined', NULL, '1630917121778_938AFCCB-3AB7-413D-9EFD-D2D5C2EBD61F.jpeg', NULL);
INSERT INTO `photo` VALUES (46, 'undefined', 'undefined', NULL, '1630917142833_7B0FBE5E-77FB-41FC-BB4F-C1E1E61A37F7.jpeg', NULL);
INSERT INTO `photo` VALUES (47, 'undefined', 'undefined', NULL, '1630917170789_B3F78516-C893-4607-86D3-7080AA0E70C4.jpeg', NULL);
INSERT INTO `photo` VALUES (48, 'undefined', 'undefined', NULL, '1630917201903_78A39C57-34D8-46ED-A801-5EBF6395B60E.jpeg', NULL);
INSERT INTO `photo` VALUES (49, 'undefined', 'undefined', NULL, '1630917216090_9E983D34-4836-45DB-8C1D-AE81EDB02167.jpeg', NULL);
INSERT INTO `photo` VALUES (50, 'undefined', 'undefined', NULL, '1630917232212_230F8B13-EA1E-4387-86AF-24ED0B8C3BA0.jpeg', NULL);

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `theme_id` int(10) NOT NULL AUTO_INCREMENT,
  `theme_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `theme_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `theme_position` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `theme_position_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `theme_date` datetime NULL DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `delete_date` datetime NULL DEFAULT NULL,
  `is_delete` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `theme_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`theme_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (1, '五一尾巴太湖边遛弯', '<p>五一躺家里四天，毫无生机，最后一天决定骑小车遛弯，天气凉爽，非常舒适</p><p><br></p><p><img src=\"http://cdn.youlaji.com/1621951133783_DSC00947.jpg\" alt=\"\"></p><p><br></p><p><span style=\"color: rgb(102, 102, 102);\">非常好看</span></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1621951133792_DSC00978.jpg\" alt=\"\"></p><p><br></p><p><span style=\"color: rgb(102, 102, 102);\">一坠一坠的，看的好爽</span></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1621951133794_DSC00982.jpg\" alt=\"\"></p><p><br></p><p><span style=\"color: rgb(102, 102, 102);\">电车还是很便宜的，才2元，我坐了全程</span></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1621951133801_未标题-3.jpg\" alt=\"\"></p><p><br></p><p><span style=\"color: rgb(102, 102, 102);\">错过了花海，就来一张柏油马路吧</span></p><p><br></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1621951133802_未标题-4.jpg\" alt=\"\"></p><p><br></p><p><span style=\"color: rgb(102, 102, 102);\">这个时期还是要戴口罩的</span></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1621951133788_DSC00962.jpg\" alt=\"\"></p><p><br></p><p>红枫</p>', '江苏 苏州', '太湖边', '2021-05-05 09:00:00', '2021-05-25 17:46:19', NULL, '0', '10,11,12,15,26,27', '1621951133783_DSC00947.jpg');
INSERT INTO `theme` VALUES (2, '长江路的早晨', '<p><br></p><p>菜市场人来人往</p><p><br></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1622717501005_62930da9-27a6-4b47-a283-f26c611597f5.jpg\" alt=\"\"></p>', '江苏 苏州', '石湖公园', '2021-06-03 07:00:00', '2021-06-03 18:50:38', NULL, '0', '19', '1622717501005_62930da9-27a6-4b47-a283-f26c611597f5.jpg');
INSERT INTO `theme` VALUES (3, '测试一条', '学生时期去的', '江西 景德镇', '婺源', '2021-06-08 18:06:59', '2021-06-08 18:07:28', NULL, '1', '', '');
INSERT INTO `theme` VALUES (4, '2021-端午节', '<p>早上忙着吃，中午也忙着吃</p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040404838_0a5e8cdc-5cbb-49a2-9c39-ee73743b35d7.jpg\"></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040422322_9d3e3e88-48db-49f7-9b60-34899cdbcdcb.jpg\"></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040435197_09194ed4-f004-4f3f-80e6-95bcc92c52e2.jpg\"></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040447099_4b665703-deda-4d32-b1bf-70f24e3f2f51.jpg\"></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040456789_80357afb-48a2-4c3d-b84c-2769c8df2048.jpg\"></p><p><br></p><p>中午的小龙虾真是很费劲啊，弄着真累，吃着真香 哈哈哈</p><p><br></p><p><br></p>', '江苏 苏州', '家里面', '2021-06-14 09:39:59', '2021-06-30 15:13:44', NULL, '0', '33,34,35,36,37', '1625040521415_09194ed4-f004-4f3f-80e6-95bcc92c52e2.jpg');
INSERT INTO `theme` VALUES (5, '六月-闷热的江南', '<h3 class=\"ql-align-center\">沧浪亭一游</h3><p class=\"ql-align-center\"><br></p><p>拍婚纱照的络绎不绝，民国风水乡江南，很唯美</p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040775471_e043dd55-c48e-451a-b443-f24ad989e9a4.jpg\"></p><p><br></p><p><br></p><p>著名的沧浪亭就是长这个样子，古人享乐之所</p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040794036_cb13bea4-ca0b-42dc-bf8b-fc4a7a45769f.jpg\"></p><p><br></p><p>小荷才露尖尖角</p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040814593_29b201d4-4717-48a4-8f9b-27211dac947a.jpg\"></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040858772_2b47540e-3368-4f61-8daf-b7ac61a712e8.jpg\"></p><p><br></p><p>来一张调皮的我</p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040870360_9a42f576-0259-44e3-b5ce-18d312754295.jpg\"></p><p><br></p><p><img src=\"http://cdn.youlaji.com/1625040883557_46b0d055-02bf-415d-af84-4339abf2941d.jpg\"></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', '江苏 苏州', '姑苏区-沧浪亭', '2021-06-26 14:00:00', '2021-06-30 16:11:05', NULL, '0', '38,39,40,41,42,43', '1625040665192_230817f8-6e34-4924-bede-53b7a1b9c52c.jpg');
INSERT INTO `theme` VALUES (6, '我的爱车', '<p class=\"ql-align-center\"><br></p><h3 class=\"ql-align-center\">我的爱车<strong style=\"color: rgb(51, 51, 51);\"><img src=\"https://gsp0.baidu.com/5aAHeD3nKhI2p27j8IqW0jdnxx1xbK/tb/editor/images/client/image_emoticon22.png\" height=\"30\" width=\"30\"><img src=\"https://gsp0.baidu.com/5aAHeD3nKhI2p27j8IqW0jdnxx1xbK/tb/editor/images/client/image_emoticon22.png\" height=\"30\" width=\"30\"></strong></h3><p class=\"ql-align-center\"><br></p><p>2019年的时候，看了 <a href=\"http://bbs.77bike.com/\" rel=\"noopener noreferrer\" target=\"_blank\">77bike</a> 种草了折叠自行车，加上电动车管理的比较严格，果断拔草，其实平时骑得非常少，哈哈哈</p><p><br></p><h3>这一款是组装车，风行蚂蚁腿车架FGC1609钢架，其他配件</h3><p><br></p><p><strong>fnhon风行折叠车16寸FGC1609-349 SP9相关参数</strong></p><p>车架长度：79cm（车架头管“碗组”中心至后轮组中心）</p><p>后叉长度：33.5cm（五通中轴至后轮轴心）</p><p>轴距长度：91cm（前后轮花鼓轴心之间）</p><p>整车长度：132.6cm（前后轮外胎外侧之间）</p><p>五通高度：29.3cm（地面到中轴轴心垂直高度）</p><p>车把高度：90.8cm（地面到车把顶端垂直高度 头管采用35cm）<strong>备注:</strong>个子高的部分骑友可以增加头管高度</p><p>车架重量：2350克左右，前叉重量：570克</p><p>整车重量：8.5公斤左右（不含脚踏）</p><p>折叠后尺寸：<span style=\"background-color: rgb(251, 251, 251); color: rgb(51, 51, 51);\">68cm（长）X63（高）X33（宽）</span></p><p><span style=\"background-color: rgb(251, 251, 251);\">备注：不适合安装脚撑</span></p><p> </p><p><strong style=\"color: rgb(255, 0, 0); background-color: rgb(251, 251, 251);\">基本配置9速：</strong></p><p>车架：fnhon16寸铬钼钢FGC1609</p><p>头管：fnhon一体头管35CM/37CM/40CM</p><p>碗组：LP培林碗组</p><p>牙盘：fnhon或Litepro中空一体牙盘53T</p><p>中轴：一体BB中轴</p><p>坐管：fnhon或Litepro超轻CNC坐管</p><p>车把：fnhon或Litepro铝合金</p><p>刹把：AVID FR5</p><p>刹车：AVID SD3</p><p>指拔：SHIMANO M4000 9速</p><p>后拔：SHIMANO TIAGRA 4601短腿</p><p>飞轮：SHIMANO HG50-9</p><p>链条：SHIMANO HG53-9或KMC X9</p><p>轮组：AIRUESS星芒四培林超轻轮组</p><p>脚踏：wellgo铝合金培林</p><p>坐垫：SR坐垫或中空舒适</p><p>轮胎：KENDA或CST 16X1.35或1.50</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><strong style=\"color: rgb(51, 51, 51);\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=75b37575536034a829e2b889fb1249d9/348315dfa9ec8a138fb1ab94f803918fa1ecc04f.jpg\" height=\"420\" width=\"560\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=97af1c268a35e5dd902ca5d746c7a7f5/e4aea58b87d6277f4642ce4c27381f30e824fca6.jpg\" height=\"746\" width=\"560\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=ca46a766404a20a4311e3ccfa0539847/aebe768b4710b91241ac098accfdfc0393452280.jpg\" height=\"746\" width=\"560\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=3c635aab79c6a7efb926a82ecdfbafe9/fd80030828381f30325672dda6014c086f06f0a3.jpg\" height=\"746\" width=\"560\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=006d2f8974899e51788e3a1c72a6d990/b30d08f431adcbef439e8272a3af2edda2cc9f4f.jpg\" height=\"420\" width=\"560\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=9cd13b5bb1096b6381195e583c328733/c76d791ed21b0ef48d42642ad2c451da80cb3e4f.jpg\" height=\"420\" width=\"560\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=d0b106b811178a82ce3c7fa8c602737f/adb49916fdfaaf51a1497dcb835494eef11f7a4f.jpg\" height=\"420\" width=\"560\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=3f8d2d559fef76c6d0d2fb23ad17fdf6/44d09a2f07082838c5602360b799a9014d08f181.jpg\" height=\"420\" width=\"560\"><img src=\"https://imgsa.baidu.com/forum/w%3D580/sign=32ab48cfa91ea8d38a22740ca70b30cf/f3fd9c22720e0cf3d69bb18f0546f21fbf09aa81.jpg\" height=\"746\" width=\"560\"></strong></p>', '江苏 苏州', '虎丘区', '2019-10-30 00:00:00', '2021-07-01 17:37:58', NULL, '0', '', '1625132277945_fengxing.jpg');
INSERT INTO `theme` VALUES (7, '常熟去收车，刚好去了当地的景点', '<p><img src=\"http://cdn.youlaji.com/1630917098814_8A863A52-33DA-42CE-B5EA-7D81C51EBDC9.jpeg\"><img src=\"http://cdn.youlaji.com/1630917121778_938AFCCB-3AB7-413D-9EFD-D2D5C2EBD61F.jpeg\"><img src=\"http://cdn.youlaji.com/1630917142833_7B0FBE5E-77FB-41FC-BB4F-C1E1E61A37F7.jpeg\"><img src=\"http://cdn.youlaji.com/1630917170789_B3F78516-C893-4607-86D3-7080AA0E70C4.jpeg\"><img src=\"http://cdn.youlaji.com/1630917201903_78A39C57-34D8-46ED-A801-5EBF6395B60E.jpeg\"><img src=\"http://cdn.youlaji.com/1630917216090_9E983D34-4836-45DB-8C1D-AE81EDB02167.jpeg\"><img src=\"http://cdn.youlaji.com/1630917232212_230F8B13-EA1E-4387-86AF-24ED0B8C3BA0.jpeg\">不容易啊，手都整黑了，哈哈哈</p>', '江苏 苏州', '常熟市虞山', '2021-09-04 10:00:00', '2021-09-06 15:59:11', NULL, '0', '44,45,46,47,48,49,50', '1630915148894_56724E08-CE7C-45D3-9FCF-E156C0059EF1.jpeg');

SET FOREIGN_KEY_CHECKS = 1;
