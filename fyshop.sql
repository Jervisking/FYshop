/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : fyshop

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-05-08 23:01:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '女装男装');
INSERT INTO `category` VALUES ('2', '鞋靴箱包');
INSERT INTO `category` VALUES ('3', '运动户外');
INSERT INTO `category` VALUES ('4', '珠宝配饰');
INSERT INTO `category` VALUES ('5', '手机数码');
INSERT INTO `category` VALUES ('6', '家电办公');
INSERT INTO `category` VALUES ('7', '护肤彩妆');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK_categorysecond_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '潮流女装', '1');
INSERT INTO `categorysecond` VALUES ('2', '初冬羽绒', '1');
INSERT INTO `categorysecond` VALUES ('3', '毛呢大衣', '1');
INSERT INTO `categorysecond` VALUES ('4', '温暖毛衣', '1');
INSERT INTO `categorysecond` VALUES ('5', '精选男装', '1');
INSERT INTO `categorysecond` VALUES ('6', '冬季外套', '1');
INSERT INTO `categorysecond` VALUES ('7', '羽绒服', '1');
INSERT INTO `categorysecond` VALUES ('8', '品质童装', '1');
INSERT INTO `categorysecond` VALUES ('9', '女鞋', '2');
INSERT INTO `categorysecond` VALUES ('10', '短靴', '2');
INSERT INTO `categorysecond` VALUES ('11', '男鞋', '2');
INSERT INTO `categorysecond` VALUES ('12', '女包', '2');
INSERT INTO `categorysecond` VALUES ('13', '男包', '2');
INSERT INTO `categorysecond` VALUES ('14', '服饰配件', '2');
INSERT INTO `categorysecond` VALUES ('15', '运动鞋', '3');
INSERT INTO `categorysecond` VALUES ('16', '运动服', '3');
INSERT INTO `categorysecond` VALUES ('17', '户外运动', '3');
INSERT INTO `categorysecond` VALUES ('18', '健身装备', '3');
INSERT INTO `categorysecond` VALUES ('19', '骑行装备', '3');
INSERT INTO `categorysecond` VALUES ('20', '珠宝首饰', '4');
INSERT INTO `categorysecond` VALUES ('21', '时尚饰品', '4');
INSERT INTO `categorysecond` VALUES ('22', '品质手表', '4');
INSERT INTO `categorysecond` VALUES ('23', '眼镜配饰', '4');
INSERT INTO `categorysecond` VALUES ('24', '手机', '5');
INSERT INTO `categorysecond` VALUES ('25', '平板', '5');
INSERT INTO `categorysecond` VALUES ('26', '电脑', '5');
INSERT INTO `categorysecond` VALUES ('27', '相机', '5');
INSERT INTO `categorysecond` VALUES ('28', '大家电', '6');
INSERT INTO `categorysecond` VALUES ('29', '厨房电器', '6');
INSERT INTO `categorysecond` VALUES ('30', '生活电器', '6');
INSERT INTO `categorysecond` VALUES ('31', '个户电器', '6');
INSERT INTO `categorysecond` VALUES ('32', '办公耗材', '6');
INSERT INTO `categorysecond` VALUES ('33', '美容护肤', '7');
INSERT INTO `categorysecond` VALUES ('34', '强效保养', '7');
INSERT INTO `categorysecond` VALUES ('35', '超值彩妆', '7');
INSERT INTO `categorysecond` VALUES ('36', '换季保养', '7');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FK_orderitem_oid` (`oid`),
  KEY `FK_orderitem_pid` (`pid`),
  CONSTRAINT `FK_orderitem_oid` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FK_orderitem_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `name` varchar(21) DEFAULT NULL,
  `addr` varchar(60) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FK_orders_uid` (`uid`),
  CONSTRAINT `FK_orders_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FK_product_csid` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '最新韩版连帽加厚针织毛衣女灰色外套', '558', '228', 'products/test/cs10001.jpg', '双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。', '1', '2018-04-01 15:18:00', '1');
INSERT INTO `product` VALUES ('2', '女装立领长袖拼接PU皮毛呢外套', '436', '172', 'products/test/cs10002.jpg', '【现在拍下并支付定金，即可获得双12当天10元无门槛优惠券一张。注：只限有预付定金款~优惠券统一在12月11号发放】 毛呢外套 整洁干练的长款版型 整个肩部给予皮绒拼接 与毛呢一起撑起品质感 立领 长袖 肩部往下做流行加层拼接 一粒扣收合门襟 特意做的夹棉里层（袖里无） 不必再畏惧冷冽寒风', '0', '2018-04-01 15:18:00', '1');
INSERT INTO `product` VALUES ('3', '韩版女装翻领羔绒夹棉格子毛呢外套', '238', '119', 'products/test/cs10003.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套  羊羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', '0', '2018-04-25 15:18:00', '1');
INSERT INTO `product` VALUES ('4', '韩版女装翻领羔绒夹棉格子毛呢外套', '238', '119', 'products/test/cs10004.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套  羊羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', '0', '2014-04-01 15:18:00', '1');
INSERT INTO `product` VALUES ('5', '韩版女装翻领羔绒夹棉格子毛呢外套', '238', '119', 'products/test/cs10005.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套  羊羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', '0', '2018-04-01 15:18:00', '1');
INSERT INTO `product` VALUES ('6', '冬装韩版女装翻领羔绒夹棉格子毛呢外套', '238', '119', 'products/test/cs10006.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套  羊羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', '0', '2018-04-01 15:18:00', '1');
INSERT INTO `product` VALUES ('7', '新款优雅奢华毛领白鸭绒轻薄羽绒服', '1120', '590', 'products/test/cs10007.jpg', '秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！', '0', '2018-04-23 15:18:00', '1');
INSERT INTO `product` VALUES ('8', '秋冬季毛呢外套女中长款圆领小香风呢子大衣', '672', '336', 'products/test/cs10008.jpg', '【双12预售】双12提前开抢，11月24日—12月11日抢先付预付款33.6元，12月12日付剩余尾款，先付先发货，提前引爆双12！！！买就【送】双十二10元无门槛优惠券！！！商家【赠】运费险！！！', '0', '2018-04-01 15:18:00', '1');
INSERT INTO `product` VALUES ('9', '女装貉子毛大衣 时尚修身长袖淑女毛呢外套', '238', '119', 'products/test/cs10009.jpg', '秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！', '0', '2018-04-23 15:18:00', '1');
INSERT INTO `product` VALUES ('10', '修身显瘦淑女针织长袖打底连衣裙女', '356', '158', 'products/test/cs10010.jpg', '【1212万能盛典预售抢先购,早买早便宜！】定金15.80元，预售价158.00元，双12价涨价至178.00元!', '0', '2018-04-23 15:18:00', '1');
INSERT INTO `product` VALUES ('11', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20001.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2018-04-01 15:18:00', '2');
INSERT INTO `product` VALUES ('12', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20002.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2018-04-02 15:18:00', '2');
INSERT INTO `product` VALUES ('13', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20003.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2018-04-25 15:18:00', '2');
INSERT INTO `product` VALUES ('14', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20004.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2018-04-02 15:18:00', '2');
INSERT INTO `product` VALUES ('15', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20005.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2018-04-02 15:18:00', '2');
INSERT INTO `product` VALUES ('16', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20006.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2018-04-02 15:18:00', '2');
INSERT INTO `product` VALUES ('17', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20007.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2018-04-02 15:18:00', '2');
INSERT INTO `product` VALUES ('18', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20008.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2018-04-02 15:18:00', '2');
INSERT INTO `product` VALUES ('19', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', '9900', 'products/test/cs20009.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '0', '2014-10-02 15:18:00', '2');
INSERT INTO `product` VALUES ('20', '中长款貂皮大衣整貂女装', '17900', '7290', 'products/test/cs20010.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】【售后保障】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货', '0', '2018-04-02 15:18:00', '2');
INSERT INTO `product` VALUES ('21', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30001.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '1', '2018-04-02 15:18:00', '3');
INSERT INTO `product` VALUES ('22', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30002.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-02 15:18:00', '3');
INSERT INTO `product` VALUES ('23', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30003.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-25 15:18:00', '3');
INSERT INTO `product` VALUES ('24', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30004.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-03 15:18:00', '3');
INSERT INTO `product` VALUES ('25', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30005.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-03 15:18:00', '3');
INSERT INTO `product` VALUES ('26', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30006.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-03 15:18:00', '3');
INSERT INTO `product` VALUES ('27', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30007.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-03 15:18:00', '3');
INSERT INTO `product` VALUES ('28', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30008.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-03 15:18:00', '3');
INSERT INTO `product` VALUES ('29', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30009.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-03 15:18:00', '3');
INSERT INTO `product` VALUES ('30', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', '198', 'products/test/cs30010.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '0', '2018-04-03 15:18:00', '3');
INSERT INTO `product` VALUES ('31', '打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40001.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('32', '打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40002.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('33', '打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40003.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('34', '性感时尚 酷感黑色小圆领露肩修身长袖针织衫', '387', '186', 'products/test/cs40004.jpg', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('35', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40005.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '1', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('36', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40006.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('37', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40007.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-25 15:18:00', '4');
INSERT INTO `product` VALUES ('38', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40008.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('39', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40009.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('40', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40010.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '0', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('41', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', '186', 'products/test/cs40011.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '1', '2018-04-04 15:18:00', '4');
INSERT INTO `product` VALUES ('42', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50001.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '1', '2018-04-07 15:18:00', '5');
INSERT INTO `product` VALUES ('43', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50002.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '0', '2018-04-07 15:18:00', '5');
INSERT INTO `product` VALUES ('44', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50003.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '1', '2018-04-23 15:18:00', '5');
INSERT INTO `product` VALUES ('45', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50004.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '0', '2018-04-07 15:18:00', '5');
INSERT INTO `product` VALUES ('46', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50005.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '0', '2018-04-23 15:18:00', '5');
INSERT INTO `product` VALUES ('47', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50006.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '1', '2018-04-25 15:18:00', '5');
INSERT INTO `product` VALUES ('48', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50007.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '0', '2018-04-23 15:18:00', '5');
INSERT INTO `product` VALUES ('49', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50008.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '0', '2018-04-23 15:18:00', '5');
INSERT INTO `product` VALUES ('50', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50009.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '0', '2018-04-23 15:18:00', '5');
INSERT INTO `product` VALUES ('51', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', '358', 'products/test/cs50010.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '1', '2018-04-07 15:18:00', '5');
INSERT INTO `product` VALUES ('52', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60001.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '0', '2018-04-23 15:18:00', '6');
INSERT INTO `product` VALUES ('53', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60002.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '1', '2018-04-23 15:18:00', '6');
INSERT INTO `product` VALUES ('54', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60003.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '0', '2018-04-23 15:18:00', '6');
INSERT INTO `product` VALUES ('55', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60004.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '0', '2018-04-23 15:18:00', '6');
INSERT INTO `product` VALUES ('56', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60005.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '0', '2018-04-25 15:18:00', '6');
INSERT INTO `product` VALUES ('57', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60006.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '1', '2018-04-23 22:18:00', '6');
INSERT INTO `product` VALUES ('58', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60007.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '0', '2018-04-23 15:18:00', '6');
INSERT INTO `product` VALUES ('59', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60008.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '0', '2018-04-23 15:18:00', '6');
INSERT INTO `product` VALUES ('60', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60009.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '1', '2018-04-23 15:18:00', '6');
INSERT INTO `product` VALUES ('61', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', '299', 'products/test/cs60010.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '0', '2018-04-23 15:18:00', '6');
INSERT INTO `product` VALUES ('62', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70001.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '1', '2018-04-23 15:18:00', '7');
INSERT INTO `product` VALUES ('63', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70002.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '1', '2018-04-23 15:18:00', '7');
INSERT INTO `product` VALUES ('64', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70003.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '0', '2018-04-23 15:18:00', '7');
INSERT INTO `product` VALUES ('65', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70004.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '0', '2018-04-25 15:18:00', '7');
INSERT INTO `product` VALUES ('66', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70005.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '0', '2018-04-23 15:18:00', '7');
INSERT INTO `product` VALUES ('67', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70006.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '1', '2018-04-23 15:18:00', '7');
INSERT INTO `product` VALUES ('68', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70007.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '1', '2018-04-23 15:18:00', '7');
INSERT INTO `product` VALUES ('69', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70008.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '1', '2018-04-23 15:18:00', '7');
INSERT INTO `product` VALUES ('70', '韩版修身羽绒服加厚保暖可脱卸帽', '198', '83', 'products/test/cs70009.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '0', '2018-04-23 15:18:00', '7');
INSERT INTO `product` VALUES ('71', '飞跃（Feiyue）纯色韩版学生女鞋休闲鞋', '188', '78', 'products/p020901.png', '商品描述:女鞋', '0', '2018-05-08 16:22:00', '9');
INSERT INTO `product` VALUES ('72', 'Skechers斯凯奇女鞋复古休闲鞋女', '568', '499', 'products/p020902.png', '商品描述:女鞋', '0', '2018-05-08 16:22:00', '9');
INSERT INTO `product` VALUES ('73', 'Musbeme 夏季新品软底鱼嘴凉鞋', '238', '139', 'products/p020903.png', '商品描述:女鞋', '0', '2018-05-08 16:22:00', '9');
INSERT INTO `product` VALUES ('74', 'Dickies 休闲春夏季韩版情侣低帮帆布板鞋', '318', '128', 'products/p021101.png', '商品描述:男鞋', '0', '2018-05-08 16:22:00', '11');
INSERT INTO `product` VALUES ('75', '花花公子(PLAYBOY)DS65079 男鞋小白鞋', '348', '118', 'products/p021102.png', '商品描述:男鞋', '0', '2018-05-08 16:22:00', '11');
INSERT INTO `product` VALUES ('76', '零度(ZERO)飞织鞋 男运动户外透气英伦男士鞋', '558', '488', 'products/p021103.png', '商品描述:男鞋', '0', '2018-05-08 16:22:00', '11');
INSERT INTO `product` VALUES ('77', '牛仔服饰裙子皮对扣子金属真皮对扣扣子袖口搭肩带对扣', '24', '20', 'products/p021401.png', '商品描述:服饰配件', '0', '2018-05-08 16:22:00', '14');
INSERT INTO `product` VALUES ('78', '箱包服饰配件三角形纽扣金属圆环圆形钮扣', '5', '4', 'products/p021402.png', '商品描述:服饰配件', '0', '2018-05-08 16:22:00', '14');
INSERT INTO `product` VALUES ('79', '鹰标GA服饰辅料金属裤标老鹰LOGO裤牌高档时尚服装配件', '28', '18', 'products/p021403.png', '商品描述:服饰配件', '0', '2018-05-08 16:22:00', '14');
INSERT INTO `product` VALUES ('80', '紫皇一路(鹿)有你 富贵真银 镂花项链', '3800', '3583', 'products/p042001.png', '商品描述:珠宝首饰', '0', '2018-05-08 16:22:00', '20');
INSERT INTO `product` VALUES ('81', '黄金戒指男金镶玉男戒足金和田玉男士款', '6888', '5988', 'products/p042002.png', '商品描述:珠宝首饰', '0', '2018-05-08 16:22:00', '20');
INSERT INTO `product` VALUES ('82', '老铺黄金古法花丝富贵足金黄金手镯', '36888', '35188', 'products/p042003.png', '商品描述:珠宝首饰', '0', '2018-05-08 16:22:00', '20');
INSERT INTO `product` VALUES ('83', '苹果 Apple iphone X 面容ID识别，人像光效', '6800', '6783', 'products/p052401.png', '商品描述:手机', '1', '2018-05-08 16:22:00', '24');
INSERT INTO `product` VALUES ('84', '华为 P20 徕卡双镜头，AI智慧全面屏 ，杜比全景声', '3800', '3783', 'products/p052402.png', '商品描述:手机', '1', '2018-05-08 16:22:00', '24');
INSERT INTO `product` VALUES ('85', '小米 MIX 2S AI超感光双摄 全面屏2.0，防抖', '3500', '3218', 'products/p052403.png', '商品描述:手机', '1', '2018-05-08 16:22:00', '24');
INSERT INTO `product` VALUES ('86', '华硕(ASUS)飞行堡垒五代FX80 15.6英寸游戏笔记本', '6399', '5999', 'products/p052601.png', '商品描述:电脑', '1', '2018-05-08 16:22:00', '26');
INSERT INTO `product` VALUES ('87', '戴尔DELL灵越游匣GTX1050 15.6英寸游戏笔记本', '54999', '5298', 'products/p052602.png', '商品描述:电脑', '1', '2018-05-08 16:22:00', '26');
INSERT INTO `product` VALUES ('88', '联想(Lenovo)拯救者R720 15.6英寸大屏游戏笔记本', '6999', '6799', 'products/p052603.png', '商品描述:电脑', '1', '2018-05-08 16:22:00', '26');
INSERT INTO `product` VALUES ('89', '联想（Lenovo）AIO 520 致美一体机台式电脑', '3499', '3099', 'products/p052604.png', '商品描述:电脑', '1', '2018-05-08 16:22:00', '26');
INSERT INTO `product` VALUES ('90', '戴尔(DELL)灵越AIO 3475 23.8英寸IPS窄边框一体机', '3888', '3599', 'products/p052605.png', '商品描述:电脑', '1', '2018-05-08 16:22:00', '26');
INSERT INTO `product` VALUES ('91', '华硕(ASUS)傲世V241IC 23.8英寸一体机电脑', '4599', '4399', 'products/p052606.png', '商品描述:电脑', '1', '2018-05-08 16:22:00', '26');
INSERT INTO `product` VALUES ('92', '果田 240C 23.8英寸办公家用一体机电脑', '2999', '2799', 'products/p052607.png', '商品描述:电脑', '1', '2018-05-08 16:22:00', '26');
INSERT INTO `product` VALUES ('93', '海尔 BCD-572WDENU1 变频智控， 低温净味', '4288', '3999', 'products/p062801.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('94', '西门子 BCD-610W 无霜保鲜，循环制冷', '5288', '4999', 'products/p062802.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('95', '美的 MD100V71WDX 大容量， 洗烘一体', '3888', '3599', 'products/p062803.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('96', '海尔 EG8014HB39GU1 智能变频，蒸汽烘干', '4288', '3499', 'products/p062804.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('97', '美的 MG90V150WD 智能变频，安全童锁', '2888', '2229', 'products/p062805.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('98', 'TCL 65A730U 65英寸 30核人工智能', '4699', '4389', 'products/p062806.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('99', '小米（MI）电视 50英寸 4K 智能液晶电视', '2888', '2449', 'products/p062807.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('100', '海尔（Haier） 变频壁挂式白色家用空调', '4888', '3999', 'products/p062808.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('101', '奥克斯（AUX）变频冷暖 NFB系列空调', '4888', '4449', 'products/p062809.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');
INSERT INTO `product` VALUES ('102', '美的（Midea）全直流变频 冷暖空调', '3288', '2999', 'products/p062810.png', '商品描述:大家电', '0', '2018-05-08 16:23:00', '28');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zhang', '123', '张三', 'zhang@fyshop.com', '15700105700', '杭州', '1', null);
