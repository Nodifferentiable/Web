/*
 Navicat Premium Data Transfer

 Source Server         : root@localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : news

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 11/09/2023 16:26:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '发布用户',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '栏目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '财经', '2022-07-31 13:55:40', '2023-02-21 11:31:24', 0, NULL, NULL);
INSERT INTO `category` VALUES (2, '科技', '2022-08-01 19:12:20', '2023-02-21 11:34:49', 0, NULL, NULL);
INSERT INTO `category` VALUES (3, '热点', '2022-07-31 13:55:40', '2023-02-21 11:34:25', 0, NULL, NULL);
INSERT INTO `category` VALUES (4, '军事', '2022-07-31 13:55:40', '2023-02-21 11:34:31', 0, NULL, NULL);
INSERT INTO `category` VALUES (5, '蔬菜蛋品', '2022-07-31 13:55:40', '2023-02-21 11:34:15', 0, NULL, NULL);
INSERT INTO `category` VALUES (6, '体育', '2022-07-31 13:55:40', '2023-03-03 15:48:27', 0, NULL, NULL);
INSERT INTO `category` VALUES (7, '娱乐', '2022-07-31 13:55:40', '2023-02-24 08:13:34', 0, NULL, NULL);
INSERT INTO `category` VALUES (8, '数码', '2023-09-08 07:15:04', '2023-09-08 07:15:04', 0, NULL, NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '新增用户id',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新用户id',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评论管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '挺不错', '2023-09-11 05:57:59', '2023-09-11 05:57:59', 0, 13, NULL, NULL, 10, 'admin');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品内容',
  `category_id` int(2) NULL DEFAULT NULL COMMENT '所属栏目',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '发布用户',
  `views` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态/已发布/取消发布',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新用户',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `category_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 1, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (2, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 2, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (3, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 3, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (4, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 4, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (5, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 5, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (6, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 6, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (7, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 1, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (8, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 2, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (9, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 3, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (10, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 4, 13, 4, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (11, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 5, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (12, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 6, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (13, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 8, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (20, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 8, 13, 4, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (21, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 8, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');
INSERT INTO `goods` VALUES (22, 'iPhone 15周三发布 产业链加速增产 有工厂新增4万人', '<h1 style=\"text-align: start;\"></h1><p style=\"text-align: justify;\">手机中国新闻】北京时间9月13日凌晨1点，苹果的秋季发布会将如期举行。大家期待已久的iPhone 15系列等新品将发布。据了解，当前A股苹果产业链企业正在加速招工增产。有上市公司的工厂总人数已经从年初的10万人增加到目前的14万人。此外，富士康在郑州、深圳、成都等地也在加紧招聘苹果手机、手表等相关普工，时薪最高达到32元。<img src=\"https://p3-sign.toutiaoimg.com/tos-cn-i-tjoges91tu/2bd64d13ab725edeb624f38d613c90ff~tplv-tt-origin-asy2:5aS05p2hQOaJi-acuuS4reWbvQ==.image?_iz=58558&amp;from=article.pc_detail&amp;x-expires=1695014299&amp;x-signature=1uCZsoJqPU5%2B%2FFpFspp4wMzjCVY%3D\" alt=\"\" data-href=\"\" style=\"height: auto;\"></p><p style=\"text-align: justify;\">苹果iPhone 15 Pro假想图</p><p style=\"text-align: justify;\">手机中国了解到，9月8日，富士康最新发布的郑州工厂招工信息显示，富士康郑州iPEBG事业群正在招工，该事业群主要负责苹果手机零配件生产等工作，薪资待遇为23.5元/小时。与此同时，成都富士康多个事业群也在加紧招工，工作内容涉及生产手机、平板等电子产品的触摸屏和显示模组，以及手机面板玻璃、触控发传感器和液晶显示器模块等。</p><p style=\"text-align: justify;\">基本可以确定的是，苹果计划在此次秋季发布会上推出四款新机，预计分别是iPhone 15、iPhone 15 Plus，以及iPhone 15 Pro和iPhone 15 Pro Max。这些新机的发布无疑将进一步推动苹果在全球市场的影响力增长。</p><p style=\"text-align: justify;\">苹果的秋季发布会将为我们揭示更多关于新产品的信息，无疑也将对全球智能手机市场产生重要影响。手机中国将对发布会进行直播和跟进报道，敬请期待。</p>', 8, 13, 3, '2023-09-09 06:18:44', '2023-09-11 05:19:29', NULL, 13, NULL, '数码');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `motto` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '座右铭',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `role_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色类型',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 已封禁/已删除/正常',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '发布用户',
  `update_user_id` int(11) NULL DEFAULT NULL COMMENT '更新用户',
  `age_group` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄段，例如90后，95后，00后',
  `gender` int(1) NULL DEFAULT NULL COMMENT '0男。1女',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'adminadmin', '好好学习，天天向上123', '231@qq.com', '15587878787', '', 'ROLE_ADMIN', '2023-02-21 11:24:56', '2023-08-14 08:51:30', 1, NULL, 1, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 'user', 'useruser', '好好学习，天天向上123', '', '12345678999', '', 'ROLE_USER', '2023-02-21 11:24:56', '2023-08-14 08:51:30', 1, NULL, 1, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
