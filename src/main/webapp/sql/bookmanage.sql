/*
Navicat MySQL Data Transfer

Source Server         : 测试
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : bookmanage

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2018-05-11 16:27:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_book`
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `bookid` int(8) NOT NULL AUTO_INCREMENT COMMENT '键主，自增长',
  `bookname` varchar(100) NOT NULL COMMENT '图书名称',
  `author` varchar(200) NOT NULL COMMENT '作者',
  `press` int(5) NOT NULL COMMENT '出版社',
  `typeid` int(5) NOT NULL COMMENT '图书分类',
  `price` varchar(10) DEFAULT NULL COMMENT '价格',
  `content` varchar(500) DEFAULT NULL COMMENT '简介',
  `keyword` varchar(100) DEFAULT NULL COMMENT '键词关',
  `evaluateid` int(9) DEFAULT NULL COMMENT '书图评价编号',
  `imageUrl` varchar(200) DEFAULT NULL COMMENT '图片路径',
  `score` varchar(10) DEFAULT NULL COMMENT '综合评分',
  `number` int(8) DEFAULT NULL COMMENT '点赞人数',
  `times` int(8) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('18', '巴菲特致股东的信', '巴菲特', '2', '2', '38', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/36a5fde5-ffc2-45c8-ab65-685238c68ac0.jpg', '4.8', '0', '0', '2018-04-11');
INSERT INTO `t_book` VALUES ('19', '刺杀骑士团长', '村上春树', '2', '7', '98', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/da6ae536-b60e-45fb-9391-7670e675a98f.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('20', '丁丁在刚果', '（比）埃尔热', '2', '6', '20', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/95086a10-4ec4-4b38-b674-fe853be901f3.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('21', '该我开枪了', '马克·哈登  ', '2', '7', '67', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/9cebf5bc-bb5c-4573-b904-5c3ef8179382.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('22', '高兴死了', '珍妮·罗森 (Jenny Lawson)', '2', '7', '97', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/774339af-b289-4177-9211-bda01ae20cb2.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('23', '海边兔子有所思', '张炜 ', '2', '7', '67', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/0d24f233-ece6-4de0-8ca4-bfcb812da1b7.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('24', '黑猫侦探', '胡安•迪亚兹•卡纳莱斯 (编剧), 胡安霍•瓜尔尼多 (绘画)', '2', '6', '89', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/b590ae48-21f3-4ab6-97a9-195d8954b666.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('25', '货币战争', '宋鸿兵', '2', '5', '38', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/d245c27e-c969-4d1d-8923-625afe682aa3.jpg', '4.8', '56', '1', '2018-04-11');
INSERT INTO `t_book` VALUES ('26', '极简思考', '[美] 迈克·费廖洛 ', '2', '2', '43', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/7323f9a4-0315-4775-80a0-38400063d444.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('27', '金锁记', '张爱玲', '2', '7', '56', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/315bc6a9-d6cf-45b2-963b-8afbc7910fcf.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('28', '黎明之街', '东野圭吾', '2', '7', '89', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/f57bd377-3a5d-4f26-a070-142fedd07ba0.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('29', '历史的荷尔蒙', '历史的囚徒', '2', '7', '98', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/43e0aee8-ae37-48b1-97f2-3bdcab54e98f.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('30', '明朝那些事儿', '当年明月', '2', '16', '67', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/6f7974ae-1de7-4f88-85b1-8a15867b3c92.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('31', '启示录', '约翰', '2', '1', '56', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/97ebbf04-09e6-40e9-86d3-989067854208.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('32', '人类“吸猫”小史', '艾比盖尔·塔克', '2', '2', '56', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/3b291d4e-5500-4bf2-8d30-55c8504a2876.jpg', '4.8', '0', '1', '2018-04-11');
INSERT INTO `t_book` VALUES ('33', '人文精神的伟大冒险', '菲利普·E. 毕肖普 ', '2', '2', '98', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/80890a5f-b426-4578-beff-34fe2e91024f.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('34', '三国演义', '罗贯中', '2', '17', '67', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/9b51ef48-fda1-402b-8eb4-6479c88987cb.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('35', '山茶文具店', '小川糸', '4', '7', '45', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/54c44901-1a12-4206-b73b-58c43d37f82b.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('36', '神迹', '阿木', '2', '16', '34', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/b3d9f03a-1c56-4fc7-835d-8ffacce2492d.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('37', '私人岛屿', '盛可以', '7', '7', '67', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/0f438fc4-b3d1-4609-b16e-77e5914aa01e.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('38', '我在未来等你', '刘同', '14', '16', '42', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/33dec4f1-2b43-45a1-b27f-b6d56aad9be4.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('39', '我知道你们又来这一套', '罗杰.伊伯特', '2', '18', '28.5', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/ffa05a2f-c2d2-4855-9be6-7b83787aecc2.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('40', '岩石堡风景', ' [加]艾丽丝·门罗 ', '2', '17', '68', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/6320074c-cda6-404b-9a4e-a17035ee9e5a.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('41', '艺术博物馆', '（英国）费顿出版社', '3', '18', '114', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/e132beee-b9b2-427b-b328-c188e593dd4d.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('42', '战地厨师', '[日] 深绿野分', '2', '18', '36', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/b88fe492-c1e7-40f0-9abf-943456115dd0.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('43', '长乐路', 'STREET OF ETERNAL HAPPINESS', '3', '18', '48', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/ee4633a2-11d3-49bb-af7b-05a966ba2456.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('44', '哲学科学常识', '陈嘉映 ', '5', '1', '32', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/8801c675-a708-477c-ac8c-2f2cee34d7c0.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('45', '朝花夕拾', '鲁迅', '2', '17', '78', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/62a9321f-cdef-4a13-bb30-d8f053f964b0.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('46', '福尔摩斯', '阿瑟·柯南道尔', '2', '17', '99', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/3767a8a8-3f19-4a66-a1b6-929336a45434.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('47', '钢铁是怎样炼成的', '【前苏联】尼古拉·奥斯特洛夫斯基', '2', '17', '110', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/9a2f4acf-3cf6-41aa-87d6-fd83811020fa.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('48', '红与黑', '【法】司汤达', '2', '17', '88', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/db105229-d457-48df-a03e-2c92e63ae400.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('49', '老人与海', '【美】欧内斯特·米勒尔·海明威', '2', '17', '99', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/6333a094-346c-42ae-90c3-75374f8588b8.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('50', '骆驼祥子', '老舍', '2', '17', '89', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/650ef5b3-8e57-44fd-8977-51c4308be85e.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('51', 'javascript编程指南', 'Stoyan Stefanov', '2', '15', '89', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/e5b41a1a-575e-4224-a1a3-60c80aa2ceb4.jpg', '4.8', '56', '2', '2018-04-11');
INSERT INTO `t_book` VALUES ('52', 'javascript高级程序设计', '泽卡斯 (Zakas. Nicholas C.)', '2', '15', '99', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/a5d7aaa5-a209-4710-9acd-2f9654751fe4.jpg', '4.8', '56', '1', '2018-04-11');
INSERT INTO `t_book` VALUES ('53', 'Java安全编码标准', 'Fred Long', '4', '15', '78', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/a95a8577-67d6-49fd-85f3-b221e2bd03d0.jpg', '4.8', '1', '0', '2018-04-11');
INSERT INTO `t_book` VALUES ('54', 'Java编程思想', '', '4', '15', '99', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/b2d588f7-8066-4112-ae12-272c57738195.jpg', '4.8', '56', '14', '2018-04-11');
INSERT INTO `t_book` VALUES ('55', 'Java从入门到精通', '国家863中部软件孵化器', '5', '18', '98', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/d00bf354-f302-4a1e-ad78-564d96551e3b.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('56', 'Java核心技术卷1', 'Cay S.Horstmann', '5', '15', '99', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/833cd1ea-5ec1-4ac2-a211-be2c062df777.jpg', '4.8', '56', '3', '2018-04-11');
INSERT INTO `t_book` VALUES ('57', '利用Python进行数据分析', 'WesMcKinney', '4', '15', '89', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/f276aece-5eea-4ff5-8095-41267970bad2.jpg', '4.8', '1', '4', '2018-04-11');
INSERT INTO `t_book` VALUES ('58', '区块链开发指南', '申屠青春', '4', '15', '59', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/90cbbe10-84a8-4b38-88bf-f855e671bc04.jpg', '4.8', '56', '2', '2018-04-11');
INSERT INTO `t_book` VALUES ('59', '深入理解Java虚拟机', '周志明 ', '4', '18', '69', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/efadabbb-01dd-47b6-b33e-36bce61a3f2d.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('60', '算法导论', 'Thomas H.Cormen、Charles E.Leiserson等', '4', '15', '99', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/51f79a32-eb4b-44fd-9d58-4dd937b1a8d2.jpg', '4.8', '1', '0', '2018-04-11');
INSERT INTO `t_book` VALUES ('61', '算法心得', '（美）HenryS. Warren, Jr. ', '4', '15', '89', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '11', null, 'book/9ae190af-47b8-462c-96ca-80b116687e41.jpg', '4.8', '56', null, '2018-04-11');
INSERT INTO `t_book` VALUES ('62', '小岛经济学', '[美]彼得·希夫 / [美]安德鲁·希夫 ', '4', '5', '59', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/87f4499d-d4db-450d-8871-41a46d2da28d.jpg', '4.8', '0', '0', '2018-04-11');
INSERT INTO `t_book` VALUES ('63', '产品经理必懂的技术那点事儿', '唐韧 ', '8', '5', '67', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/e157b432-a618-4c8a-b1fd-ca8c7277b6da.jpg', '4.8', '0', '0', '2018-04-11');
INSERT INTO `t_book` VALUES ('64', '冲突', '叶茂中', '4', '5', '85.3', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/eecd69c4-c0ec-4832-839a-dc988d92478e.jpg', '4.8', '56', '6', '2018-04-11');
INSERT INTO `t_book` VALUES ('65', '激荡四十年', '吴晓波', '3', '5', '313.2', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/ef31dcb2-816a-4b60-b448-f4e0edc48234.jpg', '4.8', '56', '1', '2018-04-11');
INSERT INTO `t_book` VALUES ('66', '见识', '吴军', '3', '5', '294.', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/a2abe21f-2faa-4d7e-ad6e-e993863057d1.jpg', '4.8', '56', null, '2018-04-11');
INSERT INTO `t_book` VALUES ('67', '社群营销实战手册', '秋叶，邻三月，秦阳 ', '5', '5', '43.5', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/28250f3b-67df-4877-98fb-ad0cda68e0b3.jpg', '4.8', '56', '2', '2018-04-11');
INSERT INTO `t_book` VALUES ('68', '涛动周期论', '周金涛', '4', '18', '74.2', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '', null, 'book/0d5f2e5d-acd8-4c18-9954-5c535802e60b.jpg', '4.8', null, null, '2018-04-11');
INSERT INTO `t_book` VALUES ('69', '销售就是要会聊天', '宋犀堃', '3', '5', '26.9', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/aef63ed3-c120-4650-ad38-673041262ef0.jpg', '4.8', '56', '2', '2018-04-11');
INSERT INTO `t_book` VALUES ('70', '影响力', '[美] 罗伯特·西奥迪尼（Robert，B.，Cialdini） ', '4', '5', '59.9', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/895c1180-c18f-457f-a1ec-6b1bd89d674a.jpg', '4.8', '56', '1', '2018-04-11');
INSERT INTO `t_book` VALUES ('71', '有效管理的5大兵法', '孙陶然', '3', '5', '42.3', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/33b0030a-d5af-4bec-b784-2240c860db40.jpg', '4.8', '1', '1', '2018-04-11');
INSERT INTO `t_book` VALUES ('72', '战略节奏', '朱恒源、杨斌', '4', '5', '53.1', '你经常对着书店里的绵绵不绝的封面发呆吗？或者头晕脑涨地从音像店的琳琅满目中逃出？宽带下载和网上购物降临之后，即使在最小的城镇，你的选择也在每天成百上千地增加。这其中一定有你会喜爱的东西，但十有八九它们会在不知不觉中和你擦肩而过。媒体让老少咸宜的大片无处不在，对只适合一群人的东西却显得力不从心。', '8', null, 'book/5ad9150a-7f96-408c-9e8c-5cfc0f7f01a3.jpg', '3.7143', '0', '11', '2018-04-11');
INSERT INTO `t_book` VALUES ('73', '测试新增', '张三丰', '2', '7', '98', '嘻嘻嘻我型我秀惺惺惜惺惺惺惺惜惺惺', '11', null, 'book/d0ce8ebf-2536-4ea3-af5a-62bfff1d4d0e.png', null, '0', '0', '2018-04-18');

-- ----------------------------
-- Table structure for `t_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '书架分类编号，主键，自增长',
  `name` varchar(40) NOT NULL COMMENT '分类名称',
  `status` varchar(5) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('2', '操作系统', '2', '测试修改');
INSERT INTO `t_category` VALUES ('3', '电子商务', '1', '测试修改');
INSERT INTO `t_category` VALUES ('4', '数据库', '1', '测试信息');
INSERT INTO `t_category` VALUES ('5', '测试新增', '1', '测试新增');
INSERT INTO `t_category` VALUES ('6', 'toBookTypePage.actio', '1', 'toBookTypePage.action');
INSERT INTO `t_category` VALUES ('7', '/admin/addType.actio', '1', '/admin/addType.action');
INSERT INTO `t_category` VALUES ('8', '', '1', '');
INSERT INTO `t_category` VALUES ('9', '', '1', '');

-- ----------------------------
-- Table structure for `t_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluate`;
CREATE TABLE `t_evaluate` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键自增长',
  `content` varchar(200) NOT NULL COMMENT '评价内容',
  `bookid` int(5) NOT NULL,
  `score` int(1) DEFAULT NULL COMMENT '本次评价得分',
  `time` varchar(50) DEFAULT NULL COMMENT '价评时间',
  `remark` varchar(200) DEFAULT NULL,
  `userid` varchar(40) DEFAULT NULL COMMENT '评论者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_evaluate
-- ----------------------------
INSERT INTO `t_evaluate` VALUES ('1', '好看', '72', '3', '2018-04-09 17:19:10', '测试', 'zhangsan');
INSERT INTO `t_evaluate` VALUES ('2', '舒服', '72', '4', '2018-04-09 17:19:24', '测试', 'zhangsan');
INSERT INTO `t_evaluate` VALUES ('5', '这本书我看过，讲得还不错', '72', '5', '2018-04-11 17:38:16', null, 'zhangsan');
INSERT INTO `t_evaluate` VALUES ('6', '这本书我看过，讲得还不错', '72', '3', '2018-04-11 17:40:49', null, 'zhangsan');
INSERT INTO `t_evaluate` VALUES ('7', '这本书我看过，讲得还不错', '72', '5', '2018-04-11 17:47:38', null, 'zhangsan');
INSERT INTO `t_evaluate` VALUES ('8', '这本书我看过，讲得还不错', '72', '1', '2018-04-11 17:48:17', null, 'zhangsan');
INSERT INTO `t_evaluate` VALUES ('9', '这本书我看过，讲得还不错', '72', '5', '2018-04-11 17:53:09', null, 'zhangsan');

-- ----------------------------
-- Table structure for `t_homepage`
-- ----------------------------
DROP TABLE IF EXISTS `t_homepage`;
CREATE TABLE `t_homepage` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `name` varchar(100) NOT NULL,
  `pageid` int(5) NOT NULL COMMENT '记录bookid',
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_homepage
-- ----------------------------
INSERT INTO `t_homepage` VALUES ('13', '金融与金融投资', '1', '金融与金融投资');
INSERT INTO `t_homepage` VALUES ('14', '计算机与编程', '1', '');

-- ----------------------------
-- Table structure for `t_lovebook`
-- ----------------------------
DROP TABLE IF EXISTS `t_lovebook`;
CREATE TABLE `t_lovebook` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `bookid` int(5) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lovebook
-- ----------------------------
INSERT INTO `t_lovebook` VALUES ('18', 'zhangsan', '60', null);
INSERT INTO `t_lovebook` VALUES ('20', 'zhangsan', '57', null);
INSERT INTO `t_lovebook` VALUES ('22', 'zhangsan', '71', null);
INSERT INTO `t_lovebook` VALUES ('23', 'zhangsan', '53', null);

-- ----------------------------
-- Table structure for `t_mark`
-- ----------------------------
DROP TABLE IF EXISTS `t_mark`;
CREATE TABLE `t_mark` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mark
-- ----------------------------
INSERT INTO `t_mark` VALUES ('1', '小说', null);
INSERT INTO `t_mark` VALUES ('2', '名著', null);
INSERT INTO `t_mark` VALUES ('3', '科幻', null);
INSERT INTO `t_mark` VALUES ('4', '诗歌', null);
INSERT INTO `t_mark` VALUES ('5', '散文', null);
INSERT INTO `t_mark` VALUES ('6', '武侠', null);
INSERT INTO `t_mark` VALUES ('7', '历史', null);
INSERT INTO `t_mark` VALUES ('8', '金融', null);
INSERT INTO `t_mark` VALUES ('9', '理财', null);
INSERT INTO `t_mark` VALUES ('10', '互联网', null);
INSERT INTO `t_mark` VALUES ('11', '编程', null);

-- ----------------------------
-- Table structure for `t_pagebook`
-- ----------------------------
DROP TABLE IF EXISTS `t_pagebook`;
CREATE TABLE `t_pagebook` (
  `pageid` int(5) NOT NULL,
  `bookid` int(5) NOT NULL,
  `remark` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pagebook
-- ----------------------------
INSERT INTO `t_pagebook` VALUES ('14', '51', '');
INSERT INTO `t_pagebook` VALUES ('14', '53', '');
INSERT INTO `t_pagebook` VALUES ('14', '54', '');
INSERT INTO `t_pagebook` VALUES ('14', '56', '');
INSERT INTO `t_pagebook` VALUES ('14', '57', '');
INSERT INTO `t_pagebook` VALUES ('14', '58', '');
INSERT INTO `t_pagebook` VALUES ('14', '60', '');
INSERT INTO `t_pagebook` VALUES ('14', '61', '');
INSERT INTO `t_pagebook` VALUES ('13', '62', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '63', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '64', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '65', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '66', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '67', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '69', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '70', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '71', '金融与金融投资');
INSERT INTO `t_pagebook` VALUES ('13', '72', '金融与金融投资');

-- ----------------------------
-- Table structure for `t_publisher`
-- ----------------------------
DROP TABLE IF EXISTS `t_publisher`;
CREATE TABLE `t_publisher` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `name` varchar(100) NOT NULL COMMENT '出版社名称',
  `status` varchar(5) NOT NULL COMMENT '使用状态',
  `remark` varchar(200) DEFAULT ''' ''' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_publisher
-- ----------------------------
INSERT INTO `t_publisher` VALUES ('2', '人民文学出版社', '1', '测试修改');
INSERT INTO `t_publisher` VALUES ('3', '高等教育出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('4', '机械工业出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('5', '人民邮电出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('6', '清华大学出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('7', '浙江大学出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('8', '电子工业出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('9', '天津人民出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('10', '水利电力出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('11', '复旦大学出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('13', '中国青年出版社', '1', null);
INSERT INTO `t_publisher` VALUES ('14', '北京教育出版社', '1', '测试新增');

-- ----------------------------
-- Table structure for `t_sysconfig`
-- ----------------------------
DROP TABLE IF EXISTS `t_sysconfig`;
CREATE TABLE `t_sysconfig` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键，自增长',
  `param_name` varchar(100) NOT NULL COMMENT '参数名称',
  `param_value` varchar(100) NOT NULL COMMENT '数参值',
  `status` varchar(2) NOT NULL DEFAULT '1' COMMENT '态状',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sysconfig
-- ----------------------------
INSERT INTO `t_sysconfig` VALUES ('1', 'ADMIN_EMAIL_ACCOUNT', 'yadtang@163.com', '1', '测试修改');
INSERT INTO `t_sysconfig` VALUES ('2', 'ADMIN_EMAIL_PWD', 'TWM920625TWM', '1', '密码');

-- ----------------------------
-- Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `typeid` int(5) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typename` varchar(20) NOT NULL COMMENT '分类名称',
  `status` varchar(5) NOT NULL COMMENT '分类状态',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '宗教哲学', '1', '测试修改');
INSERT INTO `t_type` VALUES ('2', '社会科学', '1', '测试修改');
INSERT INTO `t_type` VALUES ('3', '政治法律', '1', null);
INSERT INTO `t_type` VALUES ('4', '军事', '1', null);
INSERT INTO `t_type` VALUES ('5', '经济', '1', null);
INSERT INTO `t_type` VALUES ('6', '文化科学', '1', null);
INSERT INTO `t_type` VALUES ('7', '语言文学', '1', null);
INSERT INTO `t_type` VALUES ('8', '历史地理', '1', null);
INSERT INTO `t_type` VALUES ('14', '水利工程', '1', null);
INSERT INTO `t_type` VALUES ('15', '计算机编程', '1', '测试新增');
INSERT INTO `t_type` VALUES ('16', '网络文学', '1', null);
INSERT INTO `t_type` VALUES ('17', '经典名著', '1', null);
INSERT INTO `t_type` VALUES ('18', '外语文献', '1', null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `userid` varchar(40) NOT NULL COMMENT '用户编号',
  `username` varchar(20) NOT NULL COMMENT '用户昵称',
  `userpwd` varchar(40) NOT NULL COMMENT '录登密码',
  `usertype` varchar(2) NOT NULL COMMENT '账号类型（0：普通用户，1：管理员）',
  `userstate` varchar(2) NOT NULL COMMENT '账号状态',
  `email` varchar(40) NOT NULL COMMENT '邮箱',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(100) DEFAULT NULL COMMENT '址地',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `hobby` varchar(200) DEFAULT NULL COMMENT '爱好',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('admin', '系统管理员', 'e10adc3949ba59abbe56e057f20f883e', '2', '2', 'admin@163.com', '13888888888', '福建师范大学兰苑', '系统管理员', null);
INSERT INTO `t_user` VALUES ('caocao', '曹操', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', 'caocao@163.com', '13888888888', null, null, null);
INSERT INTO `t_user` VALUES ('guanyu', '关羽', 'e10adc3949ba59abbe56e057f20f883e', '1', '2', 'guanyu@163.com', '13888888888', null, null, null);
INSERT INTO `t_user` VALUES ('lisi', '李四', 'e10adc3949ba59abbe56e057f20f883e', '1', '2', 'lisi@163.com', '13888888888', '福建师范大学', null, null);
INSERT INTO `t_user` VALUES ('liubei', '刘备', 'c33367701511b4f6020ec61ded352059', '1', '3', 'liubei@163.com', '13888888888', '福建师范大学兰苑', null, null);
INSERT INTO `t_user` VALUES ('sunquan', '孙权', 'c33367701511b4f6020ec61ded352059', '1', '3', 'sunquan@163.com', '13888888888', null, null, null);
INSERT INTO `t_user` VALUES ('wangwu', '王五', 'c33367701511b4f6020ec61ded352059', '1', '3', 'wangwu@163.com', '13888888888', null, null, null);
INSERT INTO `t_user` VALUES ('zhangfei', '张飞', 'e10adc3949ba59abbe56e057f20f883e', '1', '3', 'zhangfei@163.com', '13888888888', '福建师范大学', null, null);
INSERT INTO `t_user` VALUES ('zhangsan', '东风不败', 'e10adc3949ba59abbe56e057f20f883e', '1', '3', 'zhangsan@163.com', '13888888888', '福建省福州市福建师范大学旗山校区', '我是来打酱油的，自动忽略。。。。。。。。。', '1,7,8,9,10,11');
INSERT INTO `t_user` VALUES ('zhangsanfeng', '张三丰', 'e10adc3949ba59abbe56e057f20f883e', '1', '2', '876974423@qq.com', null, '123456', null, null);
INSERT INTO `t_user` VALUES ('zhaoyun', '赵云', 'e10adc3949ba59abbe56e057f20f883e', '1', '2', 'zhaoyun@163.com', '13888888888', '福建师范大学', null, null);
INSERT INTO `t_user` VALUES ('zhh1', '张哈哈', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '8769744231@qq.com', null, '123456', null, null);
INSERT INTO `t_user` VALUES ('zhh1234321', 'zhh1234321', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '8769744231@qq.com', null, '123456', null, null);
INSERT INTO `t_user` VALUES ('zhh2', '张哈哈', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '8769744231@qq.com', null, '123456', null, null);
INSERT INTO `t_user` VALUES ('zhh3', '张哈哈', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '8769744231@qq.com', null, '123456', null, null);
INSERT INTO `t_user` VALUES ('zhhzhh1', 'zhhzhh', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '8769744231@qq.com', null, '`123456', null, null);
INSERT INTO `t_user` VALUES ('zhhzhh234', 'zhhzhh', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '8769744231@qq.com', null, '`123456', null, null);
INSERT INTO `t_user` VALUES ('zhouyu', '周瑜', 'e10adc3949ba59abbe56e057f20f883e', '1', '3', 'zhouyu@163.com', '13888888888', '福建师范大学兰苑', null, null);
INSERT INTO `t_user` VALUES ('zhugeliang', '诸葛亮', 'e10adc3949ba59abbe56e057f20f883e', '1', '3', 'zhugeliang@163.com', '13888888888', '福建师范大学', null, null);
