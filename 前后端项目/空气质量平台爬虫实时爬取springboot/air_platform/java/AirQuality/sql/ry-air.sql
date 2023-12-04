/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : localhost:3306
 Source Schema         : ry-air

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 29/10/2023 22:05:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for air_data
-- ----------------------------
DROP TABLE IF EXISTS `air_data`;
CREATE TABLE `air_data`  (
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监测点',
  `aqi` int(11) NULL DEFAULT NULL COMMENT 'AQI指数',
  `quality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空气质量状况',
  `pm25` float NULL DEFAULT NULL COMMENT 'PM2.5',
  `pm10` float NULL DEFAULT NULL COMMENT 'PM10',
  `co` float NULL DEFAULT NULL COMMENT 'Co',
  `no2` float NULL DEFAULT NULL COMMENT 'No2',
  `so2` float NULL DEFAULT NULL COMMENT 'So2',
  `o3` float NULL DEFAULT NULL COMMENT 'O3',
  `update_time` datetime NULL DEFAULT NULL COMMENT '数据更新时间',
  `update_slot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凌晨 上午 下午 晚上',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_flag` tinyint(4) NOT NULL COMMENT '是否是市总体数据。1：是；0：否',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_province_city_point_time`(`province`, `city`, `point`, `update_time`) USING BTREE COMMENT '省-市-点 联合索引'
) ENGINE = InnoDB AUTO_INCREMENT = 516 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '空气质量数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of air_data
-- ----------------------------
INSERT INTO `air_data` VALUES ('海南省', '海口市', '海口市', 33, '严重污染', 18, 30, 0.4, 6, 6, 105, '2023-10-29 16:00:00', '下午', 286, 1);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '东寨港', 0, '优级', 0, 0, 0, 0, 0, 0, '2023-10-29 16:00:00', '下午', 287, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '海南大学', 35, '严重污染', 21, 28, 0.4, 7, 111, 7, '2023-10-29 16:00:00', '下午', 288, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '秀英海南医院', 32, '严重污染', 17, 29, 0.4, 5, 102, 7, '2023-10-29 16:00:00', '下午', 289, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '海南师范大学', 31, '严重污染', 18, 29, 0.5, 6, 98, 5, '2023-10-29 16:00:00', '下午', 290, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '龙华路环保局宿舍', 35, '严重污染', 17, 28, 0.3, 6, 111, 8, '2023-10-29 16:00:00', '下午', 291, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '桂林洋子站', 34, '严重污染', 15, 34, 0.3, 5, 103, 4, '2023-10-29 16:00:00', '下午', 292, 0);
INSERT INTO `air_data` VALUES ('海南省', '三亚市', '三亚市', 23, '优级', 10, 23, 0.3, 3, 3, 68, '2023-10-29 16:00:00', '下午', 293, 1);
INSERT INTO `air_data` VALUES ('海南省', '三亚市', '河东子站', 0, '优级', 11, 19, 0.3, 3, 0, 4, '2023-10-29 16:00:00', '下午', 294, 0);
INSERT INTO `air_data` VALUES ('海南省', '三亚市', '河西子站', 23, '优级', 10, 23, 0.2, 4, 61, 3, '2023-10-29 16:00:00', '下午', 295, 0);
INSERT INTO `air_data` VALUES ('海南省', '三亚市', '君悦子站', 27, '优级', 10, 27, 0.3, 2, 74, 3, '2023-10-29 16:00:00', '下午', 296, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '乌鲁木齐市', 73, '严重污染', 34, 95, 0.5, 29, 9, 46, '2023-10-29 16:00:00', '下午', 297, 1);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '监测站', 76, '严重污染', 46, 102, 0.6, 32, 30, 9, '2023-10-29 16:00:00', '下午', 298, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '收费所', 87, '严重污染', 53, 124, 0.6, 48, 21, 7, '2023-10-29 16:00:00', '下午', 299, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '新疆农科院农场', 96, '严重污染', 35, 142, 0.5, 21, 35, 6, '2023-10-29 16:00:00', '下午', 300, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '铁路局', 72, '严重污染', 36, 93, 0.6, 28, 36, 8, '2023-10-29 16:00:00', '下午', 301, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '三十一中学', 77, '严重污染', 46, 103, 0.4, 40, 23, 5, '2023-10-29 16:00:00', '下午', 302, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '米东区环保局', 69, '严重污染', 29, 88, 0.6, 14, 45, 27, '2023-10-29 16:00:00', '下午', 303, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '培训基地', 59, '严重污染', 9, 68, 0.5, 7, 93, 2, '2023-10-29 16:00:00', '下午', 304, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '达坂城区环保局', 60, '严重污染', 17, 70, 0.3, 11, 102, 7, '2023-10-29 16:00:00', '下午', 305, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '红光山片区', 75, '严重污染', 33, 99, 0.5, 32, 38, 5, '2023-10-29 16:00:00', '下午', 306, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '新师大温泉校区', 82, '严重污染', 42, 114, 0.5, 50, 33, 7, '2023-10-29 16:00:00', '下午', 307, 0);
INSERT INTO `air_data` VALUES ('新疆维吾尔自治区', '乌鲁木齐市', '大绿谷', 72, '严重污染', 28, 93, 0.6, 25, 36, 13, '2023-10-29 16:00:00', '下午', 308, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '海口市', 36, '严重污染', 18, 30, 0.4, 7, 6, 113, '2023-10-29 17:00:00', '晚上', 309, 1);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '东寨港', 0, '优级', 0, 0, 0, 0, 0, 0, '2023-10-29 17:00:00', '晚上', 310, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '海南大学', 38, '严重污染', 21, 29, 0.4, 6, 121, 7, '2023-10-29 17:00:00', '晚上', 311, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '秀英海南医院', 36, '严重污染', 18, 29, 0.5, 7, 114, 7, '2023-10-29 17:00:00', '晚上', 312, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '海南师范大学', 34, '严重污染', 19, 30, 0.5, 7, 108, 5, '2023-10-29 17:00:00', '晚上', 313, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '龙华路环保局宿舍', 37, '严重污染', 17, 29, 0.3, 8, 117, 8, '2023-10-29 17:00:00', '晚上', 314, 0);
INSERT INTO `air_data` VALUES ('海南省', '海口市', '桂林洋子站', 34, '严重污染', 14, 32, 0.4, 5, 106, 4, '2023-10-29 17:00:00', '晚上', 315, 0);
INSERT INTO `air_data` VALUES ('海南省', '三亚市', '三亚市', 22, '优级', 10, 22, 0.3, 3, 3, 67, '2023-10-29 17:00:00', '晚上', 316, 1);
INSERT INTO `air_data` VALUES ('海南省', '三亚市', '河东子站', 0, '优级', 11, 16, 0.3, 4, 0, 3, '2023-10-29 17:00:00', '晚上', 317, 0);
INSERT INTO `air_data` VALUES ('海南省', '三亚市', '河西子站', 25, '优级', 10, 25, 0.2, 3, 60, 3, '2023-10-29 17:00:00', '晚上', 318, 0);
INSERT INTO `air_data` VALUES ('海南省', '三亚市', '君悦子站', 26, '优级', 10, 26, 0.3, 2, 74, 3, '2023-10-29 17:00:00', '晚上', 319, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '郑州市', 56, '严重污染', 23, 62, 0.5, 33, 9, 101, '2023-10-29 19:00:00', '晚上', 320, 1);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '烟厂', 55, '严重污染', 24, 60, 0.5, 30, 106, 8, '2023-10-29 19:00:00', '晚上', 321, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '郑纺机', 63, '严重污染', 21, 75, 0.6, 48, 83, 9, '2023-10-29 19:00:00', '晚上', 322, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '银行学校', 0, '优级', 18, 63, 0, 27, 100, 8, '2023-10-29 19:00:00', '晚上', 323, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '供水公司', 45, '严重污染', 20, 45, 0.6, 44, 86, 4, '2023-10-29 19:00:00', '晚上', 324, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '经开区管委', 60, '严重污染', 28, 70, 0.6, 36, 104, 10, '2023-10-29 19:00:00', '晚上', 325, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '四十七中', 55, '严重污染', 21, 59, 0.5, 35, 113, 8, '2023-10-29 19:00:00', '晚上', 326, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '市监测站', 61, '严重污染', 25, 71, 0.4, 41, 95, 11, '2023-10-29 19:00:00', '晚上', 327, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '河医大', 57, '严重污染', 25, 64, 0.6, 26, 102, 12, '2023-10-29 19:00:00', '晚上', 328, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '岗李水库', 0, '优级', 0, 0, 0, 0, 0, 0, '2023-10-29 19:00:00', '晚上', 329, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '惠济区政府', 57, '严重污染', 22, 63, 0.5, 31, 100, 10, '2023-10-29 19:00:00', '晚上', 330, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '北区建设指挥部', 60, '严重污染', 29, 69, 0.5, 33, 100, 12, '2023-10-29 19:00:00', '晚上', 331, 0);
INSERT INTO `air_data` VALUES ('河南省', '郑州市', '上街区政府', 45, '严重污染', 23, 45, 0.6, 12, 127, 11, '2023-10-29 19:00:00', '晚上', 332, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '洛阳市', 62, '严重污染', 30, 73, 0.5, 40, 13, 101, '2023-10-29 19:00:00', '晚上', 333, 1);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '市委党校', 62, '严重污染', 30, 73, 0.5, 34, 114, 20, '2023-10-29 19:00:00', '晚上', 334, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '豫西宾馆', 62, '严重污染', 31, 73, 0.6, 42, 100, 12, '2023-10-29 19:00:00', '晚上', 335, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '河南林校', 63, '严重污染', 29, 75, 0.5, 47, 79, 6, '2023-10-29 19:00:00', '晚上', 336, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '开发区管委会', 60, '严重污染', 32, 69, 0.5, 41, 102, 15, '2023-10-29 19:00:00', '晚上', 337, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '市委新办公区', 62, '严重污染', 34, 73, 0.5, 28, 121, 20, '2023-10-29 19:00:00', '晚上', 338, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '伊滨', 56, '严重污染', 26, 61, 0.4, 41, 88, 10, '2023-10-29 19:00:00', '晚上', 339, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '中移产业园', 62, '严重污染', 32, 73, 0.6, 33, 117, 12, '2023-10-29 19:00:00', '晚上', 340, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '吉利监测站', 69, '严重污染', 24, 88, 0.3, 52, 72, 4, '2023-10-29 19:00:00', '晚上', 341, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '河科大西苑校区', 66, '严重污染', 28, 81, 0.5, 40, 105, 13, '2023-10-29 19:00:00', '晚上', 342, 0);
INSERT INTO `air_data` VALUES ('河南省', '洛阳市', '英才小学', 58, '严重污染', 32, 66, 0.6, 37, 108, 16, '2023-10-29 19:00:00', '晚上', 343, 0);
INSERT INTO `air_data` VALUES ('河南省', '平顶山市', '平顶山市', 65, '严重污染', 37, 79, 0.7, 36, 7, 86, '2023-10-29 19:00:00', '晚上', 344, 1);
INSERT INTO `air_data` VALUES ('河南省', '平顶山市', '新华旅馆', 67, '严重污染', 45, 84, 0.8, 39, 73, 6, '2023-10-29 19:00:00', '晚上', 345, 0);
INSERT INTO `air_data` VALUES ('河南省', '平顶山市', '规划设计院', 67, '严重污染', 39, 83, 0.6, 41, 77, 8, '2023-10-29 19:00:00', '晚上', 346, 0);
INSERT INTO `air_data` VALUES ('河南省', '平顶山市', '平顶山工学院', 56, '严重污染', 24, 61, 0.4, 25, 100, 5, '2023-10-29 19:00:00', '晚上', 347, 0);
INSERT INTO `air_data` VALUES ('河南省', '平顶山市', '规划局', 73, '严重污染', 37, 95, 0.9, 40, 71, 8, '2023-10-29 19:00:00', '晚上', 348, 0);
INSERT INTO `air_data` VALUES ('河南省', '平顶山市', '石龙区', 61, '严重污染', 38, 72, 0.7, 34, 108, 7, '2023-10-29 19:00:00', '晚上', 349, 0);
INSERT INTO `air_data` VALUES ('河南省', '鹤壁市', '鹤壁市', 70, '严重污染', 41, 90, 0.6, 47, 8, 96, '2023-10-29 19:00:00', '晚上', 350, 1);
INSERT INTO `air_data` VALUES ('河南省', '鹤壁市', '市监测站', 73, '严重污染', 53, 85, 0.7, 46, 127, 8, '2023-10-29 19:00:00', '晚上', 351, 0);
INSERT INTO `air_data` VALUES ('河南省', '鹤壁市', '市交警支队', 63, '严重污染', 29, 75, 0.5, 45, 89, 4, '2023-10-29 19:00:00', '晚上', 352, 0);
INSERT INTO `air_data` VALUES ('河南省', '鹤壁市', '迎宾馆', 67, '严重污染', 41, 83, 0.5, 45, 92, 8, '2023-10-29 19:00:00', '晚上', 353, 0);
INSERT INTO `air_data` VALUES ('河南省', '鹤壁市', '大新区', 70, '严重污染', 30, 90, 0.7, 63, 60, 6, '2023-10-29 19:00:00', '晚上', 354, 0);
INSERT INTO `air_data` VALUES ('河南省', '鹤壁市', '南山宾馆', 83, '严重污染', 50, 116, 0.5, 38, 110, 12, '2023-10-29 19:00:00', '晚上', 355, 0);
INSERT INTO `air_data` VALUES ('河南省', '焦作市', '焦作市', 84, '严重污染', 42, 118, 0.6, 58, 13, 82, '2023-10-29 19:00:00', '晚上', 356, 1);
INSERT INTO `air_data` VALUES ('河南省', '焦作市', '市环保局', 102, '严重污染', 47, 153, 0.6, 62, 67, 16, '2023-10-29 19:00:00', '晚上', 357, 0);
INSERT INTO `air_data` VALUES ('河南省', '焦作市', '影视城', 0, '优级', 0, 0, 0, 0, 0, 0, '2023-10-29 19:00:00', '晚上', 358, 0);
INSERT INTO `air_data` VALUES ('河南省', '焦作市', '太极体育中心', 84, '严重污染', 33, 118, 0.6, 47, 96, 8, '2023-10-29 19:00:00', '晚上', 359, 0);
INSERT INTO `air_data` VALUES ('河南省', '焦作市', '马村街道办', 82, '严重污染', 50, 113, 0.5, 55, 96, 12, '2023-10-29 19:00:00', '晚上', 360, 0);
INSERT INTO `air_data` VALUES ('河南省', '焦作市', '焦作技师学院', 87, '严重污染', 56, 124, 0.9, 76, 62, 17, '2023-10-29 19:00:00', '晚上', 361, 0);
INSERT INTO `air_data` VALUES ('河南省', '焦作市', '中站许衡医院', 80, '严重污染', 44, 109, 0.6, 49, 101, 16, '2023-10-29 19:00:00', '晚上', 362, 0);
INSERT INTO `air_data` VALUES ('河南省', '焦作市', '原李万街道办', 72, '严重污染', 19, 94, 0.5, 56, 70, 11, '2023-10-29 19:00:00', '晚上', 363, 0);
INSERT INTO `air_data` VALUES ('河南省', '漯河市', '漯河市', 69, '严重污染', 33, 87, 0.6, 50, 7, 69, '2023-10-29 19:00:00', '晚上', 364, 1);
INSERT INTO `air_data` VALUES ('河南省', '漯河市', '三五一五工厂', 83, '严重污染', 41, 115, 0.6, 64, 55, 9, '2023-10-29 19:00:00', '晚上', 365, 0);
INSERT INTO `air_data` VALUES ('河南省', '漯河市', '漯河大学', 70, '严重污染', 31, 90, 0.7, 73, 53, 9, '2023-10-29 19:00:00', '晚上', 366, 0);
INSERT INTO `air_data` VALUES ('河南省', '漯河市', '市水利局', 71, '严重污染', 36, 92, 0.4, 58, 57, 8, '2023-10-29 19:00:00', '晚上', 367, 0);
INSERT INTO `air_data` VALUES ('河南省', '漯河市', '市广电局', 69, '严重污染', 34, 88, 0.6, 34, 80, 4, '2023-10-29 19:00:00', '晚上', 368, 0);
INSERT INTO `air_data` VALUES ('河南省', '漯河市', '市图书馆', 64, '严重污染', 33, 78, 0.7, 44, 77, 6, '2023-10-29 19:00:00', '晚上', 369, 0);
INSERT INTO `air_data` VALUES ('河南省', '漯河市', '召陵区卫健委', 56, '严重污染', 22, 61, 0.5, 27, 90, 8, '2023-10-29 19:00:00', '晚上', 370, 0);
INSERT INTO `air_data` VALUES ('河南省', '三门峡市', '三门峡市', 72, '严重污染', 48, 94, 1.2, 86, 11, 39, '2023-10-29 19:00:00', '晚上', 371, 1);
INSERT INTO `air_data` VALUES ('河南省', '三门峡市', '市政府', 72, '严重污染', 45, 94, 1.6, 118, 6, 10, '2023-10-29 19:00:00', '晚上', 372, 0);
INSERT INTO `air_data` VALUES ('河南省', '三门峡市', '开发区', 72, '严重污染', 52, 93, 0.7, 57, 64, 9, '2023-10-29 19:00:00', '晚上', 373, 0);
INSERT INTO `air_data` VALUES ('河南省', '三门峡市', '风景区', 0, '优级', 0, 0, 0, 0, 0, 0, '2023-10-29 19:00:00', '晚上', 374, 0);
INSERT INTO `air_data` VALUES ('河南省', '三门峡市', '三门峡市第一小学', 78, '严重污染', 42, 106, 1.6, 116, 20, 12, '2023-10-29 19:00:00', '晚上', 375, 0);
INSERT INTO `air_data` VALUES ('河南省', '三门峡市', '富达温泉假日酒店', 70, '严重污染', 51, 83, 0.9, 51, 66, 14, '2023-10-29 19:00:00', '晚上', 376, 0);
INSERT INTO `air_data` VALUES ('河南省', '南阳市', '南阳市', 60, '严重污染', 29, 70, 0.6, 57, 6, 47, '2023-10-29 19:00:00', '晚上', 377, 1);
INSERT INTO `air_data` VALUES ('河南省', '南阳市', '瓦房庄', 60, '严重污染', 32, 69, 0.8, 60, 46, 7, '2023-10-29 19:00:00', '晚上', 378, 0);
INSERT INTO `air_data` VALUES ('河南省', '南阳市', '汉画馆', 61, '严重污染', 23, 71, 0.7, 49, 40, 5, '2023-10-29 19:00:00', '晚上', 379, 0);
INSERT INTO `air_data` VALUES ('河南省', '南阳市', '气象站', 54, '严重污染', 29, 57, 0.5, 56, 55, 5, '2023-10-29 19:00:00', '晚上', 380, 0);
INSERT INTO `air_data` VALUES ('河南省', '南阳市', '理工学院', 65, '严重污染', 34, 79, 0.5, 56, 52, 5, '2023-10-29 19:00:00', '晚上', 381, 0);
INSERT INTO `air_data` VALUES ('河南省', '南阳市', '卧龙区政府', 0, '优级', 28, 73, 0.6, 66, 42, 0, '2023-10-29 19:00:00', '晚上', 382, 0);
INSERT INTO `air_data` VALUES ('河南省', '商丘市', '商丘市', 113, '严重污染', 85, 114, 0.6, 29, 8, 129, '2023-10-29 19:00:00', '晚上', 383, 1);
INSERT INTO `air_data` VALUES ('河南省', '商丘市', '环境监测站', 99, '严重污染', 74, 100, 0.6, 32, 123, 8, '2023-10-29 19:00:00', '晚上', 384, 0);
INSERT INTO `air_data` VALUES ('河南省', '商丘市', '粮食局', 109, '严重污染', 82, 121, 0.7, 30, 128, 6, '2023-10-29 19:00:00', '晚上', 385, 0);
INSERT INTO `air_data` VALUES ('河南省', '商丘市', '睢阳区环保局', 112, '严重污染', 84, 125, 0.6, 24, 130, 7, '2023-10-29 19:00:00', '晚上', 386, 0);
INSERT INTO `air_data` VALUES ('河南省', '商丘市', '梁园区档案局', 130, '严重污染', 99, 108, 0.6, 29, 135, 10, '2023-10-29 19:00:00', '晚上', 387, 0);
INSERT INTO `air_data` VALUES ('河南省', '信阳市', '信阳市', 53, '严重污染', 29, 56, 0.7, 26, 4, 101, '2023-10-29 19:00:00', '晚上', 388, 1);
INSERT INTO `air_data` VALUES ('河南省', '信阳市', '平桥分局', 52, '严重污染', 34, 54, 0.7, 37, 88, 3, '2023-10-29 19:00:00', '晚上', 389, 0);
INSERT INTO `air_data` VALUES ('河南省', '信阳市', '南湾水厂', 0, '优级', 19, 44, 0.7, 14, 0, 4, '2023-10-29 19:00:00', '晚上', 390, 0);
INSERT INTO `air_data` VALUES ('河南省', '信阳市', '市酿酒公司', 64, '严重污染', 33, 77, 0.8, 30, 95, 3, '2023-10-29 19:00:00', '晚上', 391, 0);
INSERT INTO `air_data` VALUES ('河南省', '信阳市', '审计局', 48, '严重污染', 31, 48, 0.6, 21, 119, 5, '2023-10-29 19:00:00', '晚上', 392, 0);
INSERT INTO `air_data` VALUES ('河南省', '周口市', '周口市', 55, '严重污染', 36, 60, 0.6, 42, 7, 100, '2023-10-29 19:00:00', '晚上', 393, 1);
INSERT INTO `air_data` VALUES ('河南省', '周口市', '市环境监测站', 56, '严重污染', 37, 61, 0.5, 61, 80, 9, '2023-10-29 19:00:00', '晚上', 394, 0);
INSERT INTO `air_data` VALUES ('河南省', '周口市', '周口师范', 51, '严重污染', 31, 52, 0.5, 45, 98, 6, '2023-10-29 19:00:00', '晚上', 395, 0);
INSERT INTO `air_data` VALUES ('河南省', '周口市', '市运管处', 54, '严重污染', 38, 54, 0.6, 27, 117, 5, '2023-10-29 19:00:00', '晚上', 396, 0);
INSERT INTO `air_data` VALUES ('河南省', '周口市', '川汇区环保局', 62, '严重污染', 40, 73, 0.7, 33, 104, 8, '2023-10-29 19:00:00', '晚上', 397, 0);
INSERT INTO `air_data` VALUES ('河南省', '驻马店市', '驻马店市', 64, '严重污染', 34, 77, 0.5, 46, 8, 78, '2023-10-29 19:00:00', '晚上', 398, 1);
INSERT INTO `air_data` VALUES ('河南省', '驻马店市', '市一纸厂', 61, '严重污染', 28, 72, 0.6, 48, 66, 9, '2023-10-29 19:00:00', '晚上', 399, 0);
INSERT INTO `air_data` VALUES ('河南省', '驻马店市', '市彩印厂', 61, '严重污染', 29, 71, 0.4, 25, 98, 8, '2023-10-29 19:00:00', '晚上', 400, 0);
INSERT INTO `air_data` VALUES ('河南省', '驻马店市', '天方二分厂', 67, '严重污染', 34, 83, 0.7, 49, 74, 7, '2023-10-29 19:00:00', '晚上', 401, 0);
INSERT INTO `air_data` VALUES ('河南省', '驻马店市', '小管楼', 66, '严重污染', 46, 81, 0.4, 61, 72, 7, '2023-10-29 19:00:00', '晚上', 402, 0);
INSERT INTO `air_data` VALUES ('河南省', '安阳市', '安阳市', 70, '严重污染', 35, 90, 0.9, 28, 12, 115, '2023-10-29 19:00:00', '晚上', 403, 1);
INSERT INTO `air_data` VALUES ('河南省', '安阳市', '棉研所', 0, '优级', 0, 0, 0, 0, 0, 0, '2023-10-29 19:00:00', '晚上', 404, 0);
INSERT INTO `air_data` VALUES ('河南省', '安阳市', '红庙街', 76, '严重污染', 44, 102, 1.5, 31, 118, 12, '2023-10-29 19:00:00', '晚上', 405, 0);
INSERT INTO `air_data` VALUES ('河南省', '安阳市', '银杏小区', 0, '优级', 37, 71, 0, 29, 112, 11, '2023-10-29 19:00:00', '晚上', 406, 0);
INSERT INTO `air_data` VALUES ('河南省', '安阳市', '信访局', 67, '严重污染', 24, 84, 0.8, 26, 126, 10, '2023-10-29 19:00:00', '晚上', 407, 0);
INSERT INTO `air_data` VALUES ('河南省', '安阳市', '左辅环卫站', 74, '严重污染', 37, 97, 0.4, 30, 97, 8, '2023-10-29 19:00:00', '晚上', 408, 0);
INSERT INTO `air_data` VALUES ('河南省', '安阳市', '安钢职工学校', 73, '严重污染', 35, 96, 1, 24, 120, 20, '2023-10-29 19:00:00', '晚上', 409, 0);
INSERT INTO `air_data` VALUES ('河南省', '开封市', '开封市', 63, '严重污染', 26, 76, 0.7, 34, 4, 86, '2023-10-29 19:00:00', '晚上', 410, 1);
INSERT INTO `air_data` VALUES ('河南省', '开封市', '肿瘤医院', 69, '严重污染', 33, 87, 0.7, 30, 82, 2, '2023-10-29 19:00:00', '晚上', 411, 0);
INSERT INTO `air_data` VALUES ('河南省', '开封市', '世纪星幼儿园', 65, '严重污染', 25, 79, 0.6, 34, 77, 7, '2023-10-29 19:00:00', '晚上', 412, 0);
INSERT INTO `air_data` VALUES ('河南省', '开封市', '龙亭公园', 0, '优级', 22, 79, 0.9, 0, 93, 0, '2023-10-29 19:00:00', '晚上', 413, 0);
INSERT INTO `air_data` VALUES ('河南省', '开封市', '汴京公园', 64, '严重污染', 27, 77, 0.6, 34, 81, 4, '2023-10-29 19:00:00', '晚上', 414, 0);
INSERT INTO `air_data` VALUES ('河南省', '开封市', '技师学院', 55, '严重污染', 20, 59, 0.8, 26, 102, 5, '2023-10-29 19:00:00', '晚上', 415, 0);
INSERT INTO `air_data` VALUES ('河南省', '开封市', '祥符区生态环境局', 63, '严重污染', 29, 75, 0.7, 44, 84, 3, '2023-10-29 19:00:00', '晚上', 416, 0);
INSERT INTO `air_data` VALUES ('河南省', '濮阳市', '濮阳市', 49, '严重污染', 12, 49, 0.5, 17, 6, 92, '2023-10-29 19:00:00', '晚上', 417, 1);
INSERT INTO `air_data` VALUES ('河南省', '濮阳市', '环保局', 45, '严重污染', 6, 45, 0.5, 14, 98, 5, '2023-10-29 19:00:00', '晚上', 418, 0);
INSERT INTO `air_data` VALUES ('河南省', '濮阳市', '油田运输公司', 44, '严重污染', 10, 44, 0.5, 24, 90, 5, '2023-10-29 19:00:00', '晚上', 419, 0);
INSERT INTO `air_data` VALUES ('河南省', '濮阳市', '油田物探公司', 44, '严重污染', 18, 44, 0.5, 14, 92, 6, '2023-10-29 19:00:00', '晚上', 420, 0);
INSERT INTO `air_data` VALUES ('河南省', '濮阳市', '濮水河管理处', 57, '严重污染', 12, 64, 0.5, 17, 90, 6, '2023-10-29 19:00:00', '晚上', 421, 0);
INSERT INTO `air_data` VALUES ('河南省', '许昌市', '许昌市', 55, '严重污染', 24, 60, 0.5, 30, 6, 95, '2023-10-29 19:00:00', '晚上', 422, 1);
INSERT INTO `air_data` VALUES ('河南省', '许昌市', '监测站', 60, '严重污染', 28, 70, 0.6, 44, 81, 6, '2023-10-29 19:00:00', '晚上', 423, 0);
INSERT INTO `air_data` VALUES ('河南省', '许昌市', '开发区', 53, '严重污染', 26, 55, 0.6, 31, 76, 4, '2023-10-29 19:00:00', '晚上', 424, 0);
INSERT INTO `air_data` VALUES ('河南省', '许昌市', '市一中', 49, '严重污染', 26, 49, 0.6, 26, 97, 4, '2023-10-29 19:00:00', '晚上', 425, 0);
INSERT INTO `air_data` VALUES ('河南省', '许昌市', '许昌学院', 59, '严重污染', 21, 68, 0.5, 38, 106, 10, '2023-10-29 19:00:00', '晚上', 426, 0);
INSERT INTO `air_data` VALUES ('河南省', '许昌市', '芙蓉广场', 54, '严重污染', 22, 57, 0.5, 23, 105, 7, '2023-10-29 19:00:00', '晚上', 427, 0);
INSERT INTO `air_data` VALUES ('河南省', '许昌市', '建安区兴业大厦', 55, '严重污染', 21, 60, 0.2, 19, 105, 8, '2023-10-29 19:00:00', '晚上', 428, 0);
INSERT INTO `air_data` VALUES ('河南省', '新乡市', '新乡市', 63, '严重污染', 35, 76, 0.6, 53, 10, 80, '2023-10-29 19:00:00', '晚上', 429, 1);
INSERT INTO `air_data` VALUES ('河南省', '新乡市', '环保西院', 61, '严重污染', 35, 71, 0.8, 61, 72, 13, '2023-10-29 19:00:00', '晚上', 430, 0);
INSERT INTO `air_data` VALUES ('河南省', '新乡市', '开发区', 56, '严重污染', 36, 61, 0.7, 40, 88, 9, '2023-10-29 19:00:00', '晚上', 431, 0);
INSERT INTO `air_data` VALUES ('河南省', '新乡市', '环保东院', 68, '严重污染', 36, 85, 0.7, 48, 76, 11, '2023-10-29 19:00:00', '晚上', 432, 0);
INSERT INTO `air_data` VALUES ('河南省', '新乡市', '市委党校', 62, '严重污染', 36, 73, 0.5, 44, 88, 6, '2023-10-29 19:00:00', '晚上', 433, 0);
INSERT INTO `air_data` VALUES ('河南省', '新乡市', '市政府', 55, '严重污染', 27, 60, 0.4, 38, 94, 7, '2023-10-29 19:00:00', '晚上', 434, 0);
INSERT INTO `air_data` VALUES ('河南省', '新乡市', '河师大', 68, '严重污染', 34, 86, 0.7, 30, 104, 11, '2023-10-29 19:00:00', '晚上', 435, 0);
INSERT INTO `air_data` VALUES ('河南省', '新乡市', '行政服务中心', 74, '严重污染', 43, 98, 0.6, 108, 36, 11, '2023-10-29 19:00:00', '晚上', 436, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '哈尔滨市', 159, '严重污染', 121, 174, 1, 36, 14, 122, '2023-10-29 20:00:00', '晚上', 437, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '岭北', 142, '严重污染', 108, 180, 1.1, 25, 129, 21, '2023-10-29 20:00:00', '晚上', 438, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '松北商大', 127, '严重污染', 96, 150, 1, 26, 128, 13, '2023-10-29 20:00:00', '晚上', 439, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '阿城会宁', 292, '严重污染', 242, 302, 1.5, 38, 112, 17, '2023-10-29 20:00:00', '晚上', 440, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '南岗学府路', 135, '严重污染', 103, 174, 0.8, 28, 125, 12, '2023-10-29 20:00:00', '晚上', 441, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '太平宏伟公园', 144, '严重污染', 110, 162, 0.8, 38, 105, 15, '2023-10-29 20:00:00', '晚上', 442, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '道外承德广场', 135, '严重污染', 103, 172, 0.9, 35, 123, 10, '2023-10-29 20:00:00', '晚上', 443, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '香坊红旗大街', 168, '严重污染', 127, 164, 1, 53, 106, 15, '2023-10-29 20:00:00', '晚上', 444, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '动力和平路', 135, '严重污染', 103, 166, 1, 48, 107, 15, '2023-10-29 20:00:00', '晚上', 445, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '道里建国路', 135, '严重污染', 103, 162, 1.1, 28, 135, 14, '2023-10-29 20:00:00', '晚上', 446, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '平房东轻厂', 152, '严重污染', 116, 153, 0.7, 23, 131, 14, '2023-10-29 20:00:00', '晚上', 447, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '呼兰师专', 158, '严重污染', 120, 148, 1, 33, 138, 17, '2023-10-29 20:00:00', '晚上', 448, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '哈尔滨市', '省农科院', 139, '严重污染', 106, 160, 0.9, 42, 128, 11, '2023-10-29 20:00:00', '晚上', 449, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '齐齐哈尔市', '齐齐哈尔市', 142, '严重污染', 108, 203, 1.3, 95, 10, 26, '2023-10-29 20:00:00', '晚上', 450, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '齐齐哈尔市', '安居小区', 133, '严重污染', 94, 215, 1, 103, 20, 11, '2023-10-29 20:00:00', '晚上', 451, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '齐齐哈尔市', '中心广场', 176, '严重污染', 133, 238, 2.2, 124, 13, 9, '2023-10-29 20:00:00', '晚上', 452, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '齐齐哈尔市', '农牧车辆厂', 138, '严重污染', 105, 171, 1.3, 100, 24, 13, '2023-10-29 20:00:00', '晚上', 453, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '齐齐哈尔市', '市环境监测站', 152, '严重污染', 116, 213, 1.2, 120, 11, 10, '2023-10-29 20:00:00', '晚上', 454, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '齐齐哈尔市', '富区青少年活动中心', 124, '严重污染', 94, 178, 0.8, 30, 61, 7, '2023-10-29 20:00:00', '晚上', 455, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '鸡西市', '鸡西市', 65, '严重污染', 40, 80, 0.7, 42, 8, 24, '2023-10-29 20:00:00', '晚上', 456, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '鸡西市', '环保局', 63, '严重污染', 28, 76, 0.6, 41, 29, 8, '2023-10-29 20:00:00', '晚上', 457, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '鸡西市', '第一中学', 62, '严重污染', 37, 74, 0.4, 30, 43, 12, '2023-10-29 20:00:00', '晚上', 458, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '鸡西市', '欧美日汽修厂', 71, '严重污染', 49, 91, 0.8, 45, 16, 9, '2023-10-29 20:00:00', '晚上', 459, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '鸡西市', '市政设施管理处', 64, '严重污染', 46, 77, 0.9, 50, 8, 4, '2023-10-29 20:00:00', '晚上', 460, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '鹤岗市', '鹤岗市', 69, '严重污染', 50, 87, 1, 41, 15, 26, '2023-10-29 20:00:00', '晚上', 461, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '鹤岗市', '哈啤分公司', 58, '严重污染', 34, 66, 0.5, 29, 36, 15, '2023-10-29 20:00:00', '晚上', 462, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '鹤岗市', '斯达机电', 79, '严重污染', 40, 108, 0.7, 42, 31, 17, '2023-10-29 20:00:00', '晚上', 463, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '鹤岗市', '东山纸板厂', 0, '优级', 75, 0, 1.8, 51, 12, 14, '2023-10-29 20:00:00', '晚上', 464, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '鹤岗市', '五号水库', 50, '严重污染', 22, 50, 0.4, 34, 24, 11, '2023-10-29 20:00:00', '晚上', 465, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '双鸭山市', '双鸭山市', 58, '严重污染', 31, 66, 0.5, 29, 9, 43, '2023-10-29 20:00:00', '晚上', 466, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '双鸭山市', '双合村', 75, '严重污染', 21, 99, 0.6, 30, 41, 11, '2023-10-29 20:00:00', '晚上', 467, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '双鸭山市', '南小市', 54, '严重污染', 38, 58, 0.5, 39, 32, 9, '2023-10-29 20:00:00', '晚上', 468, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '双鸭山市', '环保局', 49, '严重污染', 34, 40, 0.5, 17, 57, 8, '2023-10-29 20:00:00', '晚上', 469, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '双鸭山市', '苗圃', 46, '严重污染', 22, 46, 0.3, 11, 68, 4, '2023-10-29 20:00:00', '晚上', 470, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '大庆市', '大庆市', 120, '严重污染', 91, 163, 1.2, 45, 20, 65, '2023-10-29 20:00:00', '晚上', 471, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '大庆市', '大同区', 135, '严重污染', 103, 182, 1.3, 28, 76, 11, '2023-10-29 20:00:00', '晚上', 472, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '大庆市', '龙凤区', 128, '严重污染', 97, 143, 1.1, 36, 64, 75, '2023-10-29 20:00:00', '晚上', 473, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '大庆市', '红岗区', 109, '严重污染', 82, 140, 1.2, 49, 65, 6, '2023-10-29 20:00:00', '晚上', 474, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '大庆市', '萨尔图区', 119, '严重污染', 89, 188, 1, 40, 72, 10, '2023-10-29 20:00:00', '晚上', 475, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '大庆市', '让胡路区', 113, '严重污染', 75, 175, 1.2, 76, 36, 8, '2023-10-29 20:00:00', '晚上', 476, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '大庆市', '萨区政府监测点', 130, '严重污染', 99, 150, 1.2, 40, 77, 11, '2023-10-29 20:00:00', '晚上', 477, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '佳木斯市', '佳木斯市', 78, '严重污染', 48, 106, 1.6, 68, 12, 10, '2023-10-29 20:00:00', '晚上', 478, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '佳木斯市', '佳纺', 114, '严重污染', 62, 178, 1.4, 65, 14, 13, '2023-10-29 20:00:00', '晚上', 479, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '佳木斯市', '发电厂', 63, '严重污染', 33, 76, 1.1, 50, 5, 11, '2023-10-29 20:00:00', '晚上', 480, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '佳木斯市', '环保局', 59, '严重污染', 26, 67, 1.7, 76, 8, 12, '2023-10-29 20:00:00', '晚上', 481, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '佳木斯市', '十一中', 94, '严重污染', 70, 101, 2.2, 80, 14, 13, '2023-10-29 20:00:00', '晚上', 482, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '佳木斯市', '四丰', 35, '严重污染', 15, 35, 0.4, 18, 56, 1, '2023-10-29 20:00:00', '晚上', 483, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '七台河市', '七台河市', 56, '严重污染', 31, 61, 0.9, 46, 12, 31, '2023-10-29 20:00:00', '晚上', 484, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '七台河市', '新一中', 46, '严重污染', 21, 46, 0.7, 15, 68, 13, '2023-10-29 20:00:00', '晚上', 485, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '七台河市', '中波台', 43, '严重污染', 22, 43, 1, 25, 49, 6, '2023-10-29 20:00:00', '晚上', 486, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '七台河市', '人民广场', 60, '严重污染', 43, 62, 0.7, 42, 35, 10, '2023-10-29 20:00:00', '晚上', 487, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '七台河市', '新建矿广场', 64, '严重污染', 29, 78, 0.9, 70, 8, 20, '2023-10-29 20:00:00', '晚上', 488, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '牡丹江市', '牡丹江市', 82, '严重污染', 57, 114, 1.1, 62, 13, 8, '2023-10-29 20:00:00', '晚上', 489, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '牡丹江市', '环保大楼', 99, '严重污染', 52, 147, 1.4, 66, 7, 11, '2023-10-29 20:00:00', '晚上', 490, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '牡丹江市', '文化广场', 113, '严重污染', 85, 153, 1.6, 72, 7, 22, '2023-10-29 20:00:00', '晚上', 491, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '牡丹江市', '第一医院', 84, '严重污染', 62, 97, 1.1, 63, 10, 14, '2023-10-29 20:00:00', '晚上', 492, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '牡丹江市', '机车工厂', 71, '严重污染', 40, 92, 0.8, 51, 14, 8, '2023-10-29 20:00:00', '晚上', 493, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '牡丹江市', '第一中学', 67, '严重污染', 47, 83, 0.8, 58, 4, 11, '2023-10-29 20:00:00', '晚上', 494, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '黑河市', '黑河市', 118, '严重污染', 89, 127, 0.9, 50, 13, 24, '2023-10-29 20:00:00', '晚上', 495, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '黑河市', '交通局', 130, '严重污染', 99, 160, 1, 60, 11, 16, '2023-10-29 20:00:00', '晚上', 496, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '黑河市', '环保局', 105, '严重污染', 79, 94, 0.8, 41, 37, 10, '2023-10-29 20:00:00', '晚上', 497, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '黑河市', '大黑河岛', 0, '优级', 60, 99, 0, 2, 0, 17, '2023-10-29 20:00:00', '晚上', 498, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '绥化市', '绥化市', 84, '严重污染', 62, 110, 0.7, 29, 8, 72, '2023-10-29 20:00:00', '晚上', 499, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '绥化市', '人和东街', 77, '严重污染', 56, 102, 0.7, 31, 63, 5, '2023-10-29 20:00:00', '晚上', 500, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '绥化市', '党政办公中心', 93, '严重污染', 69, 118, 0.7, 27, 82, 10, '2023-10-29 20:00:00', '晚上', 501, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '大兴安岭市', '大兴安岭市', 65, '严重污染', 47, 80, 0.4, 26, 8, 38, '2023-10-29 20:00:00', '晚上', 502, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '大兴安岭市', '科技局', 58, '严重污染', 39, 66, 0.4, 15, 51, 7, '2023-10-29 20:00:00', '晚上', 503, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '大兴安岭市', '红旗社区', 75, '严重污染', 55, 95, 0.5, 37, 25, 9, '2023-10-29 20:00:00', '晚上', 504, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '伊春市', '伊春市', 28, '优级', 19, 26, 0.6, 20, 8, 48, '2023-10-29 20:00:00', '晚上', 505, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '伊春市', '环保局', 23, '优级', 16, 17, 0.5, 12, 60, 6, '2023-10-29 20:00:00', '晚上', 506, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '伊春市', '电力嘉园', 25, '优级', 8, 25, 0.3, 9, 65, 4, '2023-10-29 20:00:00', '晚上', 507, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '伊春市', '汤旺河国家公园', 34, '严重污染', 18, 34, 0.2, 8, 30, 4, '2023-10-29 20:00:00', '晚上', 508, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '伊春市', '中心小学', 40, '严重污染', 28, 40, 0.8, 25, 38, 7, '2023-10-29 20:00:00', '晚上', 509, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '伊春市', '检察院', 0, '优级', 46, 0, 1.2, 44, 1, 13, '2023-10-29 20:00:00', '晚上', 510, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '伊春市', '双子河社区', 29, '优级', 13, 29, 0.5, 11, 66, 7, '2023-10-29 20:00:00', '晚上', 511, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '伊春市', '美溪镇', 21, '优级', 5, 21, 0.3, 19, 57, 13, '2023-10-29 20:00:00', '晚上', 512, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '甘南市', '甘南市', 33, '严重污染', 12, 10, 0.4, 66, 8, 8, '2023-10-29 20:00:00', '晚上', 513, 1);
INSERT INTO `air_data` VALUES ('黑龙江省', '甘南市', '州政府', 0, '优级', 0, 0, 0, 0, 0, 0, '2023-10-29 20:00:00', '晚上', 514, 0);
INSERT INTO `air_data` VALUES ('黑龙江省', '甘南市', '甘肃民族师范学院', 33, '严重污染', 12, 0, 0.4, 66, 8, 8, '2023-10-29 20:00:00', '晚上', 515, 0);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'air_data', '空气质量数据', NULL, NULL, 'AirData', 'crud', 'com.ruoyi.air', 'air', 'air', '空气质量数据', 'ruoyi', '0', '/', '{\"parentMenuId\":\"1061\"}', 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'province', '省', 'varchar(255)', 'String', 'province', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'air_province', 1, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (2, 1, 'city', '市', 'varchar(255)', 'String', 'city', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_show_hide', 2, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (3, 1, 'point', '监测点', 'varchar(255)', 'String', 'point', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (4, 1, 'aqi', 'AQI指数', 'int(11)', 'Long', 'aqi', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (5, 1, 'quality', '空气质量状况', 'varchar(255)', 'String', 'quality', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (6, 1, 'pm25', 'PM2.5', 'float', 'Long', 'pm25', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (7, 1, 'pm10', 'PM10', 'float', 'Long', 'pm10', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (8, 1, 'co', 'Co', 'float', 'Long', 'co', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (9, 1, 'no2', 'No2', 'float', 'Long', 'no2', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (10, 1, 'so2', 'So2', 'float', 'Long', 'so2', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (11, 1, 'o3', 'O3', 'float', 'Long', 'o3', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (12, 1, 'update_time', '数据更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (13, 1, 'update_slot', '数据更新时间段', 'varchar(255)', 'String', 'updateSlot', '0', '0', NULL, '1', '1', '1', '0', 'EQ', 'input', '', 13, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');
INSERT INTO `gen_table_column` VALUES (14, 1, 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2023-10-28 12:37:34', '', '2023-10-28 13:36:27');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-10-27 23:39:43', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-10-27 23:39:43', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-10-27 23:39:43', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-10-27 23:39:43', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-10-27 23:39:43', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-10-27 23:39:43', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, '北京市', '1', 'air_province', NULL, 'default', 'N', '1', 'admin', '2023-10-28 13:34:15', 'admin', '2023-10-29 17:05:59', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, '天津市', '2', 'air_province', NULL, 'default', 'N', '1', 'admin', '2023-10-28 13:34:15', 'admin', '2023-10-29 17:06:02', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 3, '上海市', '3', 'air_province', NULL, 'default', 'N', '1', 'admin', '2023-10-28 13:34:15', 'admin', '2023-10-29 17:06:06', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 4, '重庆市', '4', 'air_province', NULL, 'default', 'N', '1', 'admin', '2023-10-28 13:34:15', 'admin', '2023-10-29 17:06:09', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 5, '河北省', '5', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 6, '山西省', '6', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 7, '内蒙古自治区', '7', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 8, '辽宁省', '8', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 9, '吉林省', '9', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 10, '黑龙江省', '10', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 11, '江苏省', '11', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 12, '浙江省', '12', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (42, 13, '安徽省', '13', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (43, 14, '福建省', '14', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (44, 15, '江西省', '15', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (45, 16, '山东省', '16', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (46, 17, '河南省', '17', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (47, 18, '湖北省', '18', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (48, 19, '湖南省', '19', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 20, '广东省', '20', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (50, 21, '广西壮族自治区', '21', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (51, 22, '海南省', '22', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (52, 23, '四川省', '23', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (53, 24, '贵州省', '24', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (54, 25, '云南省', '25', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (55, 26, '西藏自治区', '26', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (56, 27, '陕西省', '27', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (57, 28, '甘肃省', '28', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (58, 29, '青海省', '29', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (59, 30, '宁夏回族自治区', '30', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (60, 31, '新疆维吾尔自治区', '31', 'air_province', NULL, 'default', 'N', '0', 'admin', '2023-10-28 13:34:15', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '省', 'air_province', '0', 'admin', '2023-10-28 13:33:27', 'admin', '2023-10-28 13:33:42', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-10-27 23:39:43', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-28 13:13:46');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-28 13:52:15');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-28 13:52:20');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-28 14:00:07');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-28 14:00:10');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-28 15:15:37');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-28 22:34:03');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-28 23:28:36');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 01:20:39');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 13:58:43');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 18:08:30');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-10-29 18:40:53');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 18:40:56');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 21:02:38');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-29 21:15:29');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 21:15:38');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-29 21:55:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1069 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-10-27 23:39:43', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-10-27 23:39:43', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-10-27 23:39:43', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '1', '', 'guide', 'admin', '2023-10-27 23:39:43', 'admin', '2023-10-29 20:34:17', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-10-27 23:39:43', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-10-27 23:39:43', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-10-27 23:39:43', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-10-27 23:39:43', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-10-27 23:39:43', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-10-27 23:39:43', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-10-27 23:39:43', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-10-27 23:39:43', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-10-27 23:39:43', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-10-27 23:39:43', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-10-27 23:39:43', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-10-27 23:39:43', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-10-27 23:39:43', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-10-27 23:39:43', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-10-27 23:39:43', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-10-27 23:39:43', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-10-27 23:39:43', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-10-27 23:39:43', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-10-27 23:39:43', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-10-27 23:39:43', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '空气数据管理', 0, 0, 'air', NULL, NULL, 1, 0, 'M', '0', '0', '', 'build', 'admin', '2023-10-28 12:43:58', 'admin', '2023-10-28 14:04:52', '');
INSERT INTO `sys_menu` VALUES (1062, '空气数据列表', 1061, 1, 'air', 'air/air/index', NULL, 1, 0, 'C', '0', '0', 'air:air:list', 'tab', 'admin', '2023-10-28 13:22:32', 'admin', '2023-10-28 14:10:30', '空气质量数据菜单');
INSERT INTO `sys_menu` VALUES (1063, '空气质量数据查询', 1062, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'air:air:query', '#', 'admin', '2023-10-28 13:22:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '空气质量数据新增', 1062, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'air:air:add', '#', 'admin', '2023-10-28 13:22:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '空气质量数据修改', 1062, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'air:air:edit', '#', 'admin', '2023-10-28 13:22:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '空气质量数据删除', 1062, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'air:air:remove', '#', 'admin', '2023-10-28 13:22:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1067, '空气质量数据导出', 1062, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'air:air:export', '#', 'admin', '2023-10-28 13:22:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, '空气数据可视化', 1061, 2, 'echarts', 'air/echarts/index', NULL, 1, 0, 'C', '0', '0', '', 'chart', 'admin', '2023-10-28 14:07:31', 'admin', '2023-10-28 14:14:27', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-10-27 23:39:43', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-10-27 23:39:43', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"air_data\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 12:37:34', 87);
INSERT INTO `sys_oper_log` VALUES (2, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"air\",\"className\":\"AirData\",\"columns\":[{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":1,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"province\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"City\",\"columnComment\":\"市\",\"columnId\":2,\"columnName\":\"city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"city\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Point\",\"columnComment\":\"监测点\",\"columnId\":3,\"columnName\":\"point\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"point\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Aqi\",\"columnComment\":\"AQI指数\",\"columnId\":4,\"columnName\":\"aqi\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"aqi\",\"javaType\":\"Long\",\"list\":true,\"params\":{', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 12:40:41', 53);
INSERT INTO `sys_oper_log` VALUES (3, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"air\",\"className\":\"AirData\",\"columns\":[{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":1,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"province\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 12:40:40\",\"usableColumn\":false},{\"capJavaField\":\"City\",\"columnComment\":\"市\",\"columnId\":2,\"columnName\":\"city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"city\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 12:40:40\",\"usableColumn\":false},{\"capJavaField\":\"Point\",\"columnComment\":\"监测点\",\"columnId\":3,\"columnName\":\"point\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"point\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 12:40:40\",\"usableColumn\":false},{\"capJavaField\":\"Aqi\",\"columnComment\":\"AQI指数\",\"columnId\":4,\"columnName\":\"aqi\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isIns', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 12:41:34', 41);
INSERT INTO `sys_oper_log` VALUES (4, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"爬取空气数据\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"air\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 12:43:58', 15);
INSERT INTO `sys_oper_log` VALUES (5, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"air\",\"className\":\"AirData\",\"columns\":[{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":1,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"province\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 12:41:34\",\"usableColumn\":false},{\"capJavaField\":\"City\",\"columnComment\":\"市\",\"columnId\":2,\"columnName\":\"city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"city\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 12:41:34\",\"usableColumn\":false},{\"capJavaField\":\"Point\",\"columnComment\":\"监测点\",\"columnId\":3,\"columnName\":\"point\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"point\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 12:41:34\",\"usableColumn\":false},{\"capJavaField\":\"Aqi\",\"columnComment\":\"AQI指数\",\"columnId\":4,\"columnName\":\"aqi\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isIns', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:13:57', 31);
INSERT INTO `sys_oper_log` VALUES (6, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"air_data\"}', NULL, 0, NULL, '2023-10-28 13:13:59', 81);
INSERT INTO `sys_oper_log` VALUES (7, '空气质量数据', 5, 'com.ruoyi.air.controller.AirDataController.export()', 'POST', 1, 'admin', NULL, '/air/air/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"20\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-28 13:27:06', 483);
INSERT INTO `sys_oper_log` VALUES (8, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"air\",\"className\":\"AirData\",\"columns\":[{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":1,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"province\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:13:57\",\"usableColumn\":false},{\"capJavaField\":\"City\",\"columnComment\":\"市\",\"columnId\":2,\"columnName\":\"city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"city\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:13:57\",\"usableColumn\":false},{\"capJavaField\":\"Point\",\"columnComment\":\"监测点\",\"columnId\":3,\"columnName\":\"point\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"point\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:13:57\",\"usableColumn\":false},{\"capJavaField\":\"Aqi\",\"columnComment\":\"AQI指数\",\"columnId\":4,\"columnName\":\"aqi\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInse', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:29:00', 51);
INSERT INTO `sys_oper_log` VALUES (9, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"air\",\"className\":\"AirData\",\"columns\":[{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":1,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"sys_show_hide\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"province\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:29:00\",\"usableColumn\":false},{\"capJavaField\":\"City\",\"columnComment\":\"市\",\"columnId\":2,\"columnName\":\"city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"city\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:29:00\",\"usableColumn\":false},{\"capJavaField\":\"Point\",\"columnComment\":\"监测点\",\"columnId\":3,\"columnName\":\"point\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"point\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:29:00\",\"usableColumn\":false},{\"capJavaField\":\"Aqi\",\"columnComment\":\"AQI指数\",\"columnId\":4,\"columnName\":\"aqi\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:30:41', 40);
INSERT INTO `sys_oper_log` VALUES (10, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"air\",\"className\":\"AirData\",\"columns\":[{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":1,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"sys_show_hide\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"province\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:30:41\",\"usableColumn\":false},{\"capJavaField\":\"City\",\"columnComment\":\"市\",\"columnId\":2,\"columnName\":\"city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"sys_show_hide\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"city\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:30:41\",\"usableColumn\":false},{\"capJavaField\":\"Point\",\"columnComment\":\"监测点\",\"columnId\":3,\"columnName\":\"point\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"point\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:30:41\",\"usableColumn\":false},{\"capJavaField\":\"Aqi\",\"columnComment\":\"AQI指数\",\"columnId\":4,\"columnName\":\"aqi\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:32:14', 34);
INSERT INTO `sys_oper_log` VALUES (11, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"省\",\"dictType\":\"province\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:33:27', 11);
INSERT INTO `sys_oper_log` VALUES (12, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-28 13:33:27\",\"dictId\":11,\"dictName\":\"省\",\"dictType\":\"air_province\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:33:42', 16);
INSERT INTO `sys_oper_log` VALUES (13, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"北京市\",\"dictSort\":0,\"dictType\":\"air_province\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:34:15', 10);
INSERT INTO `sys_oper_log` VALUES (14, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"air\",\"className\":\"AirData\",\"columns\":[{\"capJavaField\":\"Province\",\"columnComment\":\"省\",\"columnId\":1,\"columnName\":\"province\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"air_province\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"province\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:32:14\",\"usableColumn\":false},{\"capJavaField\":\"City\",\"columnComment\":\"市\",\"columnId\":2,\"columnName\":\"city\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"sys_show_hide\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"city\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:32:14\",\"usableColumn\":false},{\"capJavaField\":\"Point\",\"columnComment\":\"监测点\",\"columnId\":3,\"columnName\":\"point\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"point\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:32:14\",\"usableColumn\":false},{\"capJavaField\":\"Aqi\",\"columnComment\":\"AQI指数\",\"columnId\":4,\"columnName\":\"aqi\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 12:37:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:36:27', 25);
INSERT INTO `sys_oper_log` VALUES (15, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-28 13:34:15\",\"default\":false,\"dictCode\":30,\"dictLabel\":\"北京市\",\"dictSort\":1,\"dictType\":\"air_province\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:53:14', 6);
INSERT INTO `sys_oper_log` VALUES (16, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-28 12:43:58\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"空气数据列表\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"air\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:02:25', 12);
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-28 12:43:58\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"空气数据管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"air\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:04:52', 8);
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"air/air/index\",\"createTime\":\"2023-10-28 13:22:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"空气数据列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"air\",\"perms\":\"air:air:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:05:45', 6);
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"air/air/echarts\",\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"空气数据可视化\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"air\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:07:31', 10);
INSERT INTO `sys_oper_log` VALUES (20, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"air/air/index\",\"createTime\":\"2023-10-28 13:22:32\",\"icon\":\"tab\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"空气数据列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"air\",\"perms\":\"air:air:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:10:30', 6);
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"air/echarts/index\",\"createTime\":\"2023-10-28 14:07:31\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1068,\"menuName\":\"空气数据可视化\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"air\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:13:38', 5);
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"air/echarts/index\",\"createTime\":\"2023-10-28 14:07:31\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1068,\"menuName\":\"空气数据可视化\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"echarts\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:14:28', 5);
INSERT INTO `sys_oper_log` VALUES (23, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-28 13:34:15\",\"default\":false,\"dictCode\":30,\"dictLabel\":\"北京市\",\"dictSort\":1,\"dictType\":\"air_province\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 17:05:59', 14);
INSERT INTO `sys_oper_log` VALUES (24, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-28 13:34:15\",\"default\":false,\"dictCode\":31,\"dictLabel\":\"天津市\",\"dictSort\":2,\"dictType\":\"air_province\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 17:06:02', 5);
INSERT INTO `sys_oper_log` VALUES (25, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-28 13:34:15\",\"default\":false,\"dictCode\":32,\"dictLabel\":\"上海市\",\"dictSort\":3,\"dictType\":\"air_province\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 17:06:06', 8);
INSERT INTO `sys_oper_log` VALUES (26, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-28 13:34:15\",\"default\":false,\"dictCode\":33,\"dictLabel\":\"重庆市\",\"dictSort\":4,\"dictType\":\"air_province\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 17:06:09', 6);
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-27 23:39:43\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-29 20:34:17', 23);
INSERT INTO `sys_oper_log` VALUES (28, '空气质量数据', 5, 'com.ruoyi.air.controller.AirDataController.export()', 'POST', 1, 'admin', NULL, '/air/air/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-29 21:15:49', 433);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-10-27 23:39:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-10-27 23:39:43', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-10-27 23:39:43', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-10-29 21:55:37', 'admin', '2023-10-27 23:39:43', '', '2023-10-29 21:55:36', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-10-27 23:39:43', 'admin', '2023-10-27 23:39:43', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
