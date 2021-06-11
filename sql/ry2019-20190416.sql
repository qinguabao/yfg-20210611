/*
Navicat MySQL Data Transfer

Source Server         : 10.8.3.182
Source Server Version : 50722
Source Host           : 10.8.3.182:3306
Source Database       : ry2019

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-04-16 10:45:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for col_address
-- ----------------------------
DROP TABLE IF EXISTS `col_address`;
CREATE TABLE `col_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `rec_name` varchar(64) DEFAULT NULL COMMENT '收件人姓名',
  `rec_address` varchar(150) DEFAULT NULL COMMENT '收件人地址',
  `pro_id` int(11) DEFAULT NULL COMMENT '省份',
  `city_id` int(11) DEFAULT NULL COMMENT '城市',
  `county_id` int(11) DEFAULT NULL COMMENT '区县',
  `postcode` varchar(6) DEFAULT NULL COMMENT '邮编',
  `is_default` char(1) DEFAULT NULL COMMENT '是否默认地址',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='用户快递信息';

-- ----------------------------
-- Records of col_address
-- ----------------------------
INSERT INTO `col_address` VALUES ('119', '779', '13554188089', '张三', '最高配', null, null, null, null, null, '0', null);

-- ----------------------------
-- Table structure for col_card_user
-- ----------------------------
DROP TABLE IF EXISTS `col_card_user`;
CREATE TABLE `col_card_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `apply_name` varchar(64) DEFAULT NULL COMMENT '申请人姓名',
  `apply_number` varchar(128) DEFAULT NULL COMMENT '学生证号码',
  `id_card_num` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `special_card_info` int(11) DEFAULT NULL COMMENT '优惠卡类型；0:学生卡，1:老年卡',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `apply_status` varchar(2) DEFAULT NULL COMMENT '申请状态；0:申请中;1:审核通过;2:审核不通过;3:制卡下载;4:制卡完成;5:已发货',
  `check_user` int(11) DEFAULT NULL COMMENT '审核人',
  `apply_type` varchar(2) DEFAULT NULL COMMENT '申请方式;0:微信;1:支付宝;2:PC端',
  `order_code` varchar(32) DEFAULT NULL COMMENT '支付订单号',
  `pay_amount` int(11) DEFAULT NULL COMMENT '支付金额',
  `pay_status` char(1) DEFAULT NULL COMMENT '支付状态;0:已支付;1:未支付;2:支付失败',
  `connect_telphone` varchar(30) DEFAULT NULL COMMENT '联系人电话',
  `connect_mobile` varchar(20) DEFAULT NULL COMMENT '联系人手机',
  `pay_time` datetime DEFAULT NULL COMMENT '支付申请时间',
  `pay_complete_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `pay_type` varchar(2) DEFAULT NULL COMMENT '支付方式;0:微信;1:支付宝',
  `mail_type` char(1) DEFAULT NULL COMMENT '邮寄自取;0:邮寄;1:自取',
  `company_name` varchar(64) DEFAULT NULL COMMENT '快递公司',
  `mail_no` varchar(32) DEFAULT NULL COMMENT '快递单号',
  `reject_info` varchar(200) DEFAULT NULL COMMENT '驳回原因',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `check_date` datetime DEFAULT NULL COMMENT '审核时间',
  `image_one` varchar(200) DEFAULT NULL COMMENT '身份证、户口本',
  `image_two` varchar(200) DEFAULT NULL COMMENT '证件',
  `image_three` varchar(200) DEFAULT NULL COMMENT '制卡图片',
  `image_four` varchar(200) DEFAULT NULL COMMENT '备用',
  `image_five` varchar(200) DEFAULT NULL COMMENT '制卡图片备用',
  `birth_date` varchar(64) DEFAULT NULL COMMENT '出生日期',
  `charge_info` char(1) DEFAULT NULL COMMENT '是否充值;0:是;1:否',
  `charge_amount` int(11) DEFAULT NULL COMMENT '充值金额',
  `card_num` varchar(32) DEFAULT NULL COMMENT '卡号',
  `card_fee` int(11) DEFAULT NULL COMMENT '卡费用',
  `relation_to_apply` varchar(64) DEFAULT NULL COMMENT '与申请人关系',
  `agent_name` varchar(64) DEFAULT NULL COMMENT '代办人姓名',
  `agent_mobile` varchar(20) DEFAULT NULL COMMENT '代办人电话',
  `agent_address` varchar(150) DEFAULT NULL COMMENT '代办人地址',
  `front_user_id` int(11) DEFAULT NULL COMMENT '信息填写人',
  `address_id` int(11) DEFAULT NULL COMMENT '收件地址id',
  `station_id` int(11) DEFAULT NULL COMMENT '自取网点',
  `school_info` int(11) DEFAULT NULL COMMENT '学校信息',
  `export_times` int(11) DEFAULT NULL COMMENT '导出次数',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `backup_one` varchar(64) DEFAULT NULL COMMENT '制卡下载文件路径',
  `backup_two` varchar(64) DEFAULT NULL COMMENT '备用字段2',
  `backup_three` varchar(64) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='制卡信息';

-- ----------------------------
-- Records of col_card_user
-- ----------------------------
INSERT INTO `col_card_user` VALUES ('22', '测试', null, null, '0', '1', null, '4', '1', '0', null, null, '0', null, null, null, null, '0', '0', '申通', '23464648', '1', '2019-01-09 09:49:25', '2019-01-04 15:02:18', null, null, 'group1/M00/00/61/CggD51ylxf-ASneHAACHrWHgc3w851.jpg', null, null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, '2222222', 'group1/M00/00/62/CggD51yl246AL8YMAACMj6YnxdE260.zip', null, null);
INSERT INTO `col_card_user` VALUES ('182', '绿林', null, '420111200112255526', '1', '1', '2019-04-16 09:08:53', '0', '0', '0', '201904160909146245087', '2000', '1', '15072296852', '15072256523', '2019-04-16 09:09:15', null, '0', '1', null, null, null, '2019-04-16 09:09:15', null, 'group1/M00/00/63/CggD51y1QsqASCZ1AAC9YBz9_R8644.jpg', 'group1/M00/00/63/CggD51y1QsqABfOVAAC9YBz9_R8897.jpg', 'group1/M00/00/63/CggD51y1QsqADMZdAAC9YBz9_R8110.jpg', 'group1/M00/00/63/CggD51y1QsqAIUtpAAC9YBz9_R8196.jpg', null, null, null, '1', null, '2000', null, null, null, null, '773', null, '121', '111', '0', null, null, null, null);

-- ----------------------------
-- Table structure for col_interface_app_acc
-- ----------------------------
DROP TABLE IF EXISTS `col_interface_app_acc`;
CREATE TABLE `col_interface_app_acc` (
  `id` int(11) NOT NULL,
  `channel_name` varchar(50) DEFAULT NULL COMMENT '渠道名称',
  `sign_key` varchar(100) DEFAULT NULL COMMENT '加密key',
  `sign_type` varchar(50) DEFAULT NULL COMMENT '加密方式',
  `mac_id` varchar(50) DEFAULT NULL COMMENT '商户号',
  `mac_key` varchar(50) DEFAULT NULL COMMENT '商户密钥',
  `result_type` varchar(50) DEFAULT NULL COMMENT '结算方式',
  `create_time` varchar(50) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(50) DEFAULT NULL COMMENT '修改时间',
  `state` varchar(10) DEFAULT NULL COMMENT '状态：0正常  1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of col_interface_app_acc
-- ----------------------------

-- ----------------------------
-- Table structure for col_interface_order
-- ----------------------------
DROP TABLE IF EXISTS `col_interface_order`;
CREATE TABLE `col_interface_order` (
  `id` int(11) NOT NULL,
  `mobile_phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `id_card_number` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `order_no` varchar(32) DEFAULT NULL COMMENT '系统订单号',
  `order_id` varchar(32) DEFAULT NULL COMMENT '微信或者支付宝返回的订单号',
  `card_no` varchar(32) DEFAULT NULL COMMENT '卡号',
  `order_amount` int(10) DEFAULT NULL COMMENT '订单金额 单位分',
  `acc_id` int(32) DEFAULT NULL COMMENT '应用id 对应接入方的主键',
  `status` varchar(10) DEFAULT NULL COMMENT '订单状态，0：未支付，1：支付中，2：已支付，3：充值失败，4：退款中，5：退款成功，6：退款失败，7：订单关闭',
  `create_time` varchar(32) DEFAULT NULL COMMENT '订单创建时间',
  `deal_time` varchar(32) DEFAULT NULL COMMENT '交易完成时间',
  `pay_type` int(10) DEFAULT NULL COMMENT '支付方式，1：微信支付  2：支付宝  3：其他',
  `refund_no` varchar(32) DEFAULT NULL COMMENT '退款单号',
  `refund_id` varchar(255) DEFAULT NULL COMMENT '退款单号，由微信支付返回或支付宝返回',
  `refund_money` int(10) DEFAULT NULL COMMENT '退款金额，单位分',
  `refund_time` varchar(32) DEFAULT NULL COMMENT '退款时间',
  `refund_type` varchar(2) DEFAULT NULL COMMENT '退款方式，1：微信支付  2：支付宝',
  `notify_flag` varchar(2) DEFAULT NULL COMMENT '支付回调处理：0-未处理 1-已处理'',',
  `refund_notify_flag` varchar(2) DEFAULT NULL COMMENT '退款通知处理：0-未处理，1-已处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of col_interface_order
-- ----------------------------

-- ----------------------------
-- Table structure for col_layout_info
-- ----------------------------
DROP TABLE IF EXISTS `col_layout_info`;
CREATE TABLE `col_layout_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `layout_name` varchar(64) DEFAULT NULL COMMENT '版面名称',
  `ima_url_front` varchar(200) DEFAULT NULL COMMENT '版面正面',
  `ima_url_obverse` varchar(200) DEFAULT NULL COMMENT '版面反面',
  `x_axis` varchar(20) DEFAULT NULL COMMENT 'x轴',
  `y_axis` varchar(20) DEFAULT NULL COMMENT 'y轴',
  `layout_length` varchar(20) DEFAULT NULL COMMENT '版面长',
  `layout_width` varchar(20) DEFAULT NULL COMMENT '版面宽',
  `word_size` varchar(20) DEFAULT NULL COMMENT '字体大小',
  `user_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `user_no` varchar(32) DEFAULT NULL COMMENT '编号',
  `user_position` varchar(32) DEFAULT NULL COMMENT '职位',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `check_user` int(11) DEFAULT NULL COMMENT '审核人',
  `check_time` datetime DEFAULT NULL COMMENT '审核时间',
  `card_type_id` int(11) DEFAULT NULL COMMENT '卡片类型',
  `user_name_x` varchar(20) DEFAULT NULL COMMENT '姓名x轴',
  `user_name_y` varchar(20) DEFAULT NULL COMMENT '姓名y轴',
  `user_no_x` varchar(20) DEFAULT NULL COMMENT '编号x轴',
  `user_no_y` varchar(20) DEFAULT NULL COMMENT '编号y轴',
  `position_x` varchar(20) DEFAULT NULL COMMENT '职位x轴',
  `position_y` varchar(20) DEFAULT NULL COMMENT '职位y轴',
  `cad_file` varchar(200) DEFAULT NULL COMMENT '制卡工程图',
  `word_font` varchar(20) DEFAULT NULL COMMENT '字体',
  `office_x` varchar(20) DEFAULT NULL COMMENT '部门X轴',
  `office_y` varchar(20) DEFAULT NULL COMMENT '部门Y轴',
  `seal_x` varchar(20) DEFAULT NULL COMMENT '盖章X轴',
  `seal_y` varchar(20) DEFAULT NULL COMMENT '盖章Y轴',
  `seal_length` varchar(20) DEFAULT NULL COMMENT '章子长度',
  `seal_width` varchar(20) DEFAULT NULL COMMENT '章子宽度',
  `del_flag` char(1) DEFAULT NULL COMMENT '是否删除',
  `remarks` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版面信息';

-- ----------------------------
-- Records of col_layout_info
-- ----------------------------

-- ----------------------------
-- Table structure for col_school_info
-- ----------------------------
DROP TABLE IF EXISTS `col_school_info`;
CREATE TABLE `col_school_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `school_name` varchar(100) DEFAULT NULL COMMENT '学校名称',
  `education_type` varchar(100) DEFAULT NULL COMMENT '学历级别',
  `department` varchar(100) DEFAULT NULL COMMENT '系别',
  `profession_info` varchar(100) DEFAULT NULL COMMENT '专业',
  `education_year` int(11) DEFAULT NULL COMMENT '学制年',
  `class_info` varchar(255) DEFAULT NULL COMMENT '班级',
  `student_no` varchar(64) DEFAULT NULL COMMENT '学生证号',
  `passport_name` varchar(100) DEFAULT NULL COMMENT '护照姓名',
  `passport_num` varchar(64) DEFAULT NULL COMMENT '护照号码',
  `birth_day` varchar(64) DEFAULT NULL COMMENT '出生年月',
  `nationality` varchar(64) DEFAULT NULL COMMENT '国籍',
  `remarks` varchar(150) DEFAULT NULL COMMENT '备注',
  `backup_one` varchar(64) DEFAULT NULL COMMENT '备用字段1',
  `backup_two` varchar(64) DEFAULT NULL COMMENT '备用字段2',
  `backup_three` varchar(64) DEFAULT NULL COMMENT '备用字段3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校信息';

-- ----------------------------
-- Records of col_school_info
-- ----------------------------

-- ----------------------------
-- Table structure for col_special_card_info
-- ----------------------------
DROP TABLE IF EXISTS `col_special_card_info`;
CREATE TABLE `col_special_card_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `card_type_name` varchar(255) DEFAULT NULL COMMENT '优惠卡名称',
  `pro_id` int(11) DEFAULT NULL COMMENT '省份',
  `city_id` int(11) DEFAULT NULL COMMENT '城市',
  `county_id` int(11) DEFAULT NULL COMMENT '区县',
  `card_fee` int(11) DEFAULT NULL COMMENT '卡费用',
  `mail_fee` int(11) DEFAULT NULL COMMENT '快递费用',
  `card_type` varchar(2) DEFAULT NULL COMMENT '卡类型',
  `layout_id` int(11) DEFAULT NULL COMMENT '版面',
  `del_flag` char(1) DEFAULT NULL COMMENT '是否删除',
  `status` varchar(2) DEFAULT NULL COMMENT '状态',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `update_user` datetime DEFAULT NULL COMMENT '更新人',
  `remarks` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='优惠卡';

-- ----------------------------
-- Records of col_special_card_info
-- ----------------------------
INSERT INTO `col_special_card_info` VALUES ('1', '学生卡', null, null, null, '2000', '1000', '0', null, null, null, '2019-03-27 09:20:30', null, null, null, null);
INSERT INTO `col_special_card_info` VALUES ('2', '老年卡', null, null, null, '2000', '1000', '1', null, null, null, '2019-03-27 09:20:35', null, null, null, null);

-- ----------------------------
-- Table structure for col_station_info
-- ----------------------------
DROP TABLE IF EXISTS `col_station_info`;
CREATE TABLE `col_station_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pro_id` int(11) DEFAULT NULL COMMENT '省',
  `city_id` int(11) DEFAULT NULL COMMENT '城市',
  `county_id` int(11) DEFAULT NULL COMMENT '区县',
  `station_name` varchar(64) DEFAULT NULL COMMENT '网点名称',
  `station_address` varchar(150) DEFAULT NULL COMMENT '网点地址',
  `station_mobile` varchar(20) DEFAULT NULL COMMENT '网点联系电话',
  `station_connect_person` varchar(64) DEFAULT NULL COMMENT '网点联系人',
  `station_net_time` varchar(64) DEFAULT NULL COMMENT '网点服务时间',
  `station_server_info` varchar(100) DEFAULT NULL COMMENT '网点服务信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `station_status` varchar(2) DEFAULT NULL COMMENT '网点状态；0:在线，1:下线',
  `del_flag` char(1) DEFAULT NULL COMMENT '是否删除',
  `remarks` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='取货网点信息';

-- ----------------------------
-- Records of col_station_info
-- ----------------------------
INSERT INTO `col_station_info` VALUES ('121', '420000', '420100', '420106', '东方红广场站', '兰州市城关区广场南路4-6号', '13554188089', '周芷若', '上午09:00---下午17:00', '专业办理学生卡', '2019-03-24 00:00:00', '2019-01-27 09:52:35', '0', '0', '测试修改');
INSERT INTO `col_station_info` VALUES ('122', '420000', '420100', '420115', '兰州交通大学站', '甘肃省兰州市安宁区安宁西路88号', '15107181720', '张无忌', '上午09:00 ---下午 17:00', '学生卡带领服务', '2019-01-25 16:05:51', null, '0', '0', null);
INSERT INTO `col_station_info` VALUES ('123', '420000', '420100', '420115', '兰州理工大学', '甘肃省兰州市七里河区彭家坪路36号龚家湾', '12789071230', '赵敏', '上午08:00--下午18:00', '专业办理学生卡', '2019-01-25 16:09:21', null, '0', '0', null);
INSERT INTO `col_station_info` VALUES ('124', null, null, null, '元台子', '兰州市安宁区元台子', '18871239867', '范瑶', '上午09:00--下午17:30', '学生卡代领服务', null, null, null, null, null);

-- ----------------------------
-- Table structure for col_user
-- ----------------------------
DROP TABLE IF EXISTS `col_user`;
CREATE TABLE `col_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `open_id` varchar(200) DEFAULT NULL COMMENT '微信openId',
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录名',
  `passwd` varchar(64) DEFAULT NULL COMMENT '密码',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `source` varchar(32) DEFAULT NULL COMMENT '用户来源',
  `city` varchar(32) DEFAULT NULL COMMENT '城市',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_ip` varchar(64) DEFAULT NULL,
  `remarks` varchar(150) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=799 DEFAULT CHARSET=utf8 COMMENT='前台用户表';

-- ----------------------------
-- Records of col_user
-- ----------------------------
INSERT INTO `col_user` VALUES ('1', '25436', null, null, null, null, null, '2019-03-25 11:05:10', '2019-03-25 11:05:10', null, null, '2019-03-25 11:05:10', null, null);
INSERT INTO `col_user` VALUES ('2', '28744', null, null, null, null, null, '2019-03-25 11:09:00', '2019-03-25 11:09:00', null, null, '2019-03-25 11:09:00', null, null);
INSERT INTO `col_user` VALUES ('3', '94716', null, null, null, null, null, '2019-03-25 13:28:27', '2019-03-25 13:28:27', null, null, '2019-03-25 13:28:27', null, null);
INSERT INTO `col_user` VALUES ('4', '35746', null, null, null, null, null, '2019-03-25 13:38:01', '2019-03-25 13:38:01', null, null, '2019-03-25 13:38:01', null, null);
INSERT INTO `col_user` VALUES ('5', '15021', null, null, null, null, null, '2019-03-25 13:38:01', '2019-03-25 13:38:01', null, null, '2019-03-25 13:38:01', null, null);
INSERT INTO `col_user` VALUES ('6', '1275', null, null, null, null, null, '2019-03-25 13:38:15', '2019-03-25 13:38:15', null, null, '2019-03-25 13:38:15', null, null);
INSERT INTO `col_user` VALUES ('7', '84303', null, null, null, null, null, '2019-03-25 13:38:16', '2019-03-25 13:38:16', null, null, '2019-03-25 13:38:16', null, null);
INSERT INTO `col_user` VALUES ('8', '63641', null, null, null, null, null, '2019-03-25 14:14:18', '2019-03-25 14:14:18', null, null, '2019-03-25 14:14:18', null, null);
INSERT INTO `col_user` VALUES ('9', '97650', null, null, null, null, null, '2019-03-25 14:14:34', '2019-03-25 14:14:34', null, null, '2019-03-25 14:14:34', null, null);
INSERT INTO `col_user` VALUES ('10', '84505', null, null, null, null, null, '2019-03-25 14:14:37', '2019-03-25 14:14:37', null, null, '2019-03-25 14:14:37', null, null);
INSERT INTO `col_user` VALUES ('11', '95307', null, null, null, null, null, '2019-03-25 14:15:41', '2019-03-25 14:15:41', null, null, '2019-03-25 14:15:41', null, null);
INSERT INTO `col_user` VALUES ('12', null, null, null, null, null, null, '2019-03-26 14:41:54', '2019-03-26 14:41:54', null, null, '2019-03-26 14:41:54', null, null);
INSERT INTO `col_user` VALUES ('13', null, null, null, null, null, null, '2019-03-26 14:41:58', '2019-03-26 14:41:58', null, null, '2019-03-26 14:41:58', null, null);
INSERT INTO `col_user` VALUES ('14', null, null, null, null, null, null, '2019-03-26 14:43:33', '2019-03-26 14:43:33', null, null, '2019-03-26 14:43:33', null, null);
INSERT INTO `col_user` VALUES ('15', null, null, null, null, null, null, '2019-03-26 14:44:11', '2019-03-26 14:44:11', null, null, '2019-03-26 14:44:11', null, null);
INSERT INTO `col_user` VALUES ('16', null, null, null, null, null, null, '2019-03-26 14:44:35', '2019-03-26 14:44:35', null, null, '2019-03-26 14:44:35', null, null);
INSERT INTO `col_user` VALUES ('17', null, null, null, null, null, null, '2019-03-26 14:45:08', '2019-03-26 14:45:08', null, null, '2019-03-26 14:45:08', null, null);
INSERT INTO `col_user` VALUES ('18', null, null, null, null, null, null, '2019-03-26 14:53:25', '2019-03-26 14:53:25', null, null, '2019-03-26 14:53:25', null, null);
INSERT INTO `col_user` VALUES ('19', '32559', null, null, null, null, null, '2019-03-26 14:57:18', '2019-03-26 14:57:18', null, null, '2019-03-26 14:57:18', null, null);
INSERT INTO `col_user` VALUES ('20', '27953', null, null, null, null, null, '2019-03-26 14:57:51', '2019-03-26 14:57:51', null, null, '2019-03-26 14:57:51', null, null);
INSERT INTO `col_user` VALUES ('21', '57837', null, null, null, null, null, '2019-03-26 14:58:01', '2019-03-26 14:58:01', null, null, '2019-03-26 14:58:01', null, null);
INSERT INTO `col_user` VALUES ('22', '15243', null, null, null, null, null, '2019-03-26 14:58:02', '2019-03-26 14:58:02', null, null, '2019-03-26 14:58:02', null, null);
INSERT INTO `col_user` VALUES ('23', '71088', null, null, null, null, null, '2019-03-26 14:58:43', '2019-03-26 14:58:43', null, null, '2019-03-26 14:58:43', null, null);
INSERT INTO `col_user` VALUES ('24', '26552', null, null, null, null, null, '2019-03-26 15:51:31', '2019-03-26 15:51:31', null, null, '2019-03-26 15:51:31', null, null);
INSERT INTO `col_user` VALUES ('25', '90427', null, null, null, null, null, '2019-03-26 15:51:49', '2019-03-26 15:51:49', null, null, '2019-03-26 15:51:49', null, null);
INSERT INTO `col_user` VALUES ('26', '54126', null, null, null, null, null, '2019-03-26 15:52:07', '2019-03-26 15:52:07', null, null, '2019-03-26 15:52:07', null, null);
INSERT INTO `col_user` VALUES ('27', '76458', null, null, null, null, null, '2019-03-26 16:04:02', '2019-03-26 16:04:02', null, null, '2019-03-26 16:04:02', null, null);
INSERT INTO `col_user` VALUES ('28', '63266', null, null, null, null, null, '2019-03-26 16:04:19', '2019-03-26 16:04:19', null, null, '2019-03-26 16:04:19', null, null);
INSERT INTO `col_user` VALUES ('29', '85353', null, null, null, null, null, '2019-03-26 16:09:54', '2019-03-26 16:09:54', null, null, '2019-03-26 16:09:54', null, null);
INSERT INTO `col_user` VALUES ('30', '82905', null, null, null, null, null, '2019-03-26 16:11:05', '2019-03-26 16:11:05', null, null, '2019-03-26 16:11:05', null, null);
INSERT INTO `col_user` VALUES ('31', '49675', null, null, null, null, null, '2019-03-26 17:04:27', '2019-03-26 17:04:27', null, null, '2019-03-26 17:04:27', null, null);
INSERT INTO `col_user` VALUES ('32', '90594', null, null, null, null, null, '2019-03-26 17:04:29', '2019-03-26 17:04:29', null, null, '2019-03-26 17:04:29', null, null);
INSERT INTO `col_user` VALUES ('33', '82255', null, null, null, null, null, '2019-03-26 17:14:18', '2019-03-26 17:14:18', null, null, '2019-03-26 17:14:18', null, null);
INSERT INTO `col_user` VALUES ('34', '56987', null, null, null, null, null, '2019-03-26 17:14:21', '2019-03-26 17:14:21', null, null, '2019-03-26 17:14:21', null, null);
INSERT INTO `col_user` VALUES ('35', '81949', null, null, null, null, null, '2019-03-26 17:14:37', '2019-03-26 17:14:37', null, null, '2019-03-26 17:14:37', null, null);
INSERT INTO `col_user` VALUES ('36', '11802', null, null, null, null, null, '2019-03-26 17:31:38', '2019-03-26 17:31:38', null, null, '2019-03-26 17:31:38', null, null);
INSERT INTO `col_user` VALUES ('37', '42316', null, null, null, null, null, '2019-03-26 19:42:10', '2019-03-26 19:42:10', null, null, '2019-03-26 19:42:10', null, null);
INSERT INTO `col_user` VALUES ('38', '45873', null, null, null, null, null, '2019-03-26 19:45:20', '2019-03-26 19:45:20', null, null, '2019-03-26 19:45:20', null, null);
INSERT INTO `col_user` VALUES ('39', '76369', null, null, null, null, null, '2019-03-26 19:46:57', '2019-03-26 19:46:57', null, null, '2019-03-26 19:46:57', null, null);
INSERT INTO `col_user` VALUES ('40', '16279', null, null, null, null, null, '2019-03-26 19:48:07', '2019-03-26 19:48:07', null, null, '2019-03-26 19:48:07', null, null);
INSERT INTO `col_user` VALUES ('41', '97258', null, null, null, null, null, '2019-03-26 19:48:34', '2019-03-26 19:48:34', null, null, '2019-03-26 19:48:34', null, null);
INSERT INTO `col_user` VALUES ('42', '82990', null, null, null, null, null, '2019-03-26 19:48:36', '2019-03-26 19:48:36', null, null, '2019-03-26 19:48:36', null, null);
INSERT INTO `col_user` VALUES ('43', '97761', null, null, null, null, null, '2019-03-26 19:48:55', '2019-03-26 19:48:55', null, null, '2019-03-26 19:48:55', null, null);
INSERT INTO `col_user` VALUES ('44', '89294', null, null, null, null, null, '2019-03-26 19:49:15', '2019-03-26 19:49:15', null, null, '2019-03-26 19:49:15', null, null);
INSERT INTO `col_user` VALUES ('45', '16198', null, null, null, null, null, '2019-03-26 19:49:39', '2019-03-26 19:49:39', null, null, '2019-03-26 19:49:39', null, null);
INSERT INTO `col_user` VALUES ('46', '76179', null, null, null, null, null, '2019-03-26 19:49:41', '2019-03-26 19:49:41', null, null, '2019-03-26 19:49:41', null, null);
INSERT INTO `col_user` VALUES ('47', '13575', null, null, null, null, null, '2019-03-26 19:49:44', '2019-03-26 19:49:44', null, null, '2019-03-26 19:49:44', null, null);
INSERT INTO `col_user` VALUES ('48', '4528', null, null, null, null, null, '2019-03-26 19:50:10', '2019-03-26 19:50:10', null, null, '2019-03-26 19:50:10', null, null);
INSERT INTO `col_user` VALUES ('49', '12718', null, null, null, null, null, '2019-03-26 19:50:17', '2019-03-26 19:50:17', null, null, '2019-03-26 19:50:17', null, null);
INSERT INTO `col_user` VALUES ('50', '64606', null, null, null, null, null, '2019-03-26 19:53:47', '2019-03-26 19:53:47', null, null, '2019-03-26 19:53:47', null, null);
INSERT INTO `col_user` VALUES ('51', '25061', null, null, null, null, null, '2019-03-26 19:55:31', '2019-03-26 19:55:31', null, null, '2019-03-26 19:55:31', null, null);
INSERT INTO `col_user` VALUES ('52', '32121', null, null, null, null, null, '2019-03-26 19:55:44', '2019-03-26 19:55:44', null, null, '2019-03-26 19:55:44', null, null);
INSERT INTO `col_user` VALUES ('53', '73338', null, null, null, null, null, '2019-03-26 19:56:32', '2019-03-26 19:56:32', null, null, '2019-03-26 19:56:32', null, null);
INSERT INTO `col_user` VALUES ('54', '11499', null, null, null, null, null, '2019-03-26 19:56:41', '2019-03-26 19:56:41', null, null, '2019-03-26 19:56:41', null, null);
INSERT INTO `col_user` VALUES ('55', '87164', null, null, null, null, null, '2019-03-26 19:56:42', '2019-03-26 19:56:42', null, null, '2019-03-26 19:56:42', null, null);
INSERT INTO `col_user` VALUES ('56', '63126', null, null, null, null, null, '2019-03-26 19:56:57', '2019-03-26 19:56:57', null, null, '2019-03-26 19:56:57', null, null);
INSERT INTO `col_user` VALUES ('57', '3804', null, null, null, null, null, '2019-03-26 19:57:05', '2019-03-26 19:57:05', null, null, '2019-03-26 19:57:05', null, null);
INSERT INTO `col_user` VALUES ('58', '89400', null, null, null, null, null, '2019-03-26 19:57:06', '2019-03-26 19:57:06', null, null, '2019-03-26 19:57:06', null, null);
INSERT INTO `col_user` VALUES ('59', '46762', null, null, null, null, null, '2019-03-26 19:57:29', '2019-03-26 19:57:29', null, null, '2019-03-26 19:57:29', null, null);
INSERT INTO `col_user` VALUES ('60', '98143', null, null, null, null, null, '2019-03-26 19:58:10', '2019-03-26 19:58:10', null, null, '2019-03-26 19:58:10', null, null);
INSERT INTO `col_user` VALUES ('61', '56527', null, null, null, null, null, '2019-03-26 19:58:13', '2019-03-26 19:58:13', null, null, '2019-03-26 19:58:13', null, null);
INSERT INTO `col_user` VALUES ('62', '13752', null, null, null, null, null, '2019-03-26 19:57:34', '2019-03-26 19:57:34', null, null, '2019-03-26 19:57:34', null, null);
INSERT INTO `col_user` VALUES ('63', '93403', null, null, null, null, null, '2019-03-26 19:57:37', '2019-03-26 19:57:37', null, null, '2019-03-26 19:57:37', null, null);
INSERT INTO `col_user` VALUES ('64', '4173', null, null, null, null, null, '2019-03-26 20:01:38', '2019-03-26 20:01:38', null, null, '2019-03-26 20:01:38', null, null);
INSERT INTO `col_user` VALUES ('65', '32702', null, null, null, null, null, '2019-03-26 20:09:46', '2019-03-26 20:09:46', null, null, '2019-03-26 20:09:46', null, null);
INSERT INTO `col_user` VALUES ('66', '32893', null, null, null, null, null, '2019-03-26 20:10:50', '2019-03-26 20:10:50', null, null, '2019-03-26 20:10:50', null, null);
INSERT INTO `col_user` VALUES ('67', '23256', null, null, null, null, null, '2019-03-26 20:06:22', '2019-03-26 20:06:22', null, null, '2019-03-26 20:06:22', null, null);
INSERT INTO `col_user` VALUES ('68', '37262', null, null, null, null, null, '2019-03-26 20:24:12', '2019-03-26 20:24:12', null, null, '2019-03-26 20:24:12', null, null);
INSERT INTO `col_user` VALUES ('69', '45151', null, null, null, null, null, '2019-03-26 20:25:28', '2019-03-26 20:25:28', null, null, '2019-03-26 20:25:28', null, null);
INSERT INTO `col_user` VALUES ('70', '99524', null, null, null, null, null, '2019-03-26 20:26:29', '2019-03-26 20:26:29', null, null, '2019-03-26 20:26:29', null, null);
INSERT INTO `col_user` VALUES ('71', '11040', null, null, null, null, null, '2019-03-26 20:51:29', '2019-03-26 20:51:29', null, null, '2019-03-26 20:51:29', null, null);
INSERT INTO `col_user` VALUES ('72', '86664', null, null, null, null, null, '2019-03-26 20:52:18', '2019-03-26 20:52:18', null, null, '2019-03-26 20:52:18', null, null);
INSERT INTO `col_user` VALUES ('73', '82905', null, null, null, null, null, '2019-03-26 20:56:19', '2019-03-26 20:56:19', null, null, '2019-03-26 20:56:19', null, null);
INSERT INTO `col_user` VALUES ('74', '98938', null, null, null, null, null, '2019-03-26 20:56:33', '2019-03-26 20:56:33', null, null, '2019-03-26 20:56:33', null, null);
INSERT INTO `col_user` VALUES ('75', '10833', null, null, null, null, null, '2019-03-26 20:57:54', '2019-03-26 20:57:54', null, null, '2019-03-26 20:57:54', null, null);
INSERT INTO `col_user` VALUES ('76', '2818', null, null, null, null, null, '2019-03-26 21:02:51', '2019-03-26 21:02:51', null, null, '2019-03-26 21:02:51', null, null);
INSERT INTO `col_user` VALUES ('77', '33250', null, null, null, null, null, '2019-03-26 21:07:53', '2019-03-26 21:07:53', null, null, '2019-03-26 21:07:53', null, null);
INSERT INTO `col_user` VALUES ('78', '73789', null, null, null, null, null, '2019-03-27 07:22:48', '2019-03-27 07:22:48', null, null, '2019-03-27 07:22:48', null, null);
INSERT INTO `col_user` VALUES ('79', '82252', null, null, null, null, null, '2019-03-27 08:11:41', '2019-03-27 08:11:41', null, null, '2019-03-27 08:11:41', null, null);
INSERT INTO `col_user` VALUES ('80', '12101', null, null, null, null, null, '2019-03-27 08:47:17', '2019-03-27 08:47:17', null, null, '2019-03-27 08:47:17', null, null);
INSERT INTO `col_user` VALUES ('81', '65620', null, null, null, null, null, '2019-03-27 08:47:21', '2019-03-27 08:47:21', null, null, '2019-03-27 08:47:21', null, null);
INSERT INTO `col_user` VALUES ('82', '23443', null, null, null, null, null, '2019-03-27 08:50:53', '2019-03-27 08:50:53', null, null, '2019-03-27 08:50:53', null, null);
INSERT INTO `col_user` VALUES ('83', '45588', null, null, null, null, null, '2019-03-27 08:51:50', '2019-03-27 08:51:50', null, null, '2019-03-27 08:51:50', null, null);
INSERT INTO `col_user` VALUES ('84', '38944', null, null, null, null, null, '2019-03-27 08:53:58', '2019-03-27 08:53:58', null, null, '2019-03-27 08:53:58', null, null);
INSERT INTO `col_user` VALUES ('85', '71595', null, null, null, null, null, '2019-03-27 08:56:23', '2019-03-27 08:56:23', null, null, '2019-03-27 08:56:23', null, null);
INSERT INTO `col_user` VALUES ('86', '68981', null, null, null, null, null, '2019-03-27 08:57:10', '2019-03-27 08:57:10', null, null, '2019-03-27 08:57:10', null, null);
INSERT INTO `col_user` VALUES ('87', '38841', null, null, null, null, null, '2019-03-27 08:57:54', '2019-03-27 08:57:54', null, null, '2019-03-27 08:57:54', null, null);
INSERT INTO `col_user` VALUES ('88', '43335', null, null, null, null, null, '2019-03-27 08:58:28', '2019-03-27 08:58:28', null, null, '2019-03-27 08:58:28', null, null);
INSERT INTO `col_user` VALUES ('89', '1420', null, null, null, null, null, '2019-03-27 09:01:27', '2019-03-27 09:01:27', null, null, '2019-03-27 09:01:27', null, null);
INSERT INTO `col_user` VALUES ('90', '26953', null, null, null, null, null, '2019-03-27 09:04:22', '2019-03-27 09:04:22', null, null, '2019-03-27 09:04:22', null, null);
INSERT INTO `col_user` VALUES ('91', '82741', null, null, null, null, null, '2019-03-27 09:04:24', '2019-03-27 09:04:24', null, null, '2019-03-27 09:04:24', null, null);
INSERT INTO `col_user` VALUES ('92', '59153', null, null, null, null, null, '2019-03-27 09:04:38', '2019-03-27 09:04:38', null, null, '2019-03-27 09:04:38', null, null);
INSERT INTO `col_user` VALUES ('93', '64812', null, null, null, null, null, '2019-03-27 09:05:11', '2019-03-27 09:05:11', null, null, '2019-03-27 09:05:11', null, null);
INSERT INTO `col_user` VALUES ('94', '98954', null, null, null, null, null, '2019-03-27 09:05:39', '2019-03-27 09:05:39', null, null, '2019-03-27 09:05:39', null, null);
INSERT INTO `col_user` VALUES ('95', '53767', null, null, null, null, null, '2019-03-27 09:05:52', '2019-03-27 09:05:52', null, null, '2019-03-27 09:05:52', null, null);
INSERT INTO `col_user` VALUES ('96', '80665', null, null, null, null, null, '2019-03-27 09:06:03', '2019-03-27 09:06:03', null, null, '2019-03-27 09:06:03', null, null);
INSERT INTO `col_user` VALUES ('97', '91514', null, null, null, null, null, '2019-03-27 09:06:37', '2019-03-27 09:06:37', null, null, '2019-03-27 09:06:37', null, null);
INSERT INTO `col_user` VALUES ('98', '14044', null, null, null, null, null, '2019-03-27 09:07:16', '2019-03-27 09:07:16', null, null, '2019-03-27 09:07:16', null, null);
INSERT INTO `col_user` VALUES ('99', '28463', null, null, null, null, null, '2019-03-27 09:07:28', '2019-03-27 09:07:28', null, null, '2019-03-27 09:07:28', null, null);
INSERT INTO `col_user` VALUES ('100', '83571', null, null, null, null, null, '2019-03-27 09:12:59', '2019-03-27 09:12:59', null, null, '2019-03-27 09:12:59', null, null);
INSERT INTO `col_user` VALUES ('101', '51508', null, null, null, null, null, '2019-03-27 09:07:48', '2019-03-27 09:07:48', null, null, '2019-03-27 09:07:48', null, null);
INSERT INTO `col_user` VALUES ('102', '21297', null, null, null, null, null, '2019-03-27 09:07:50', '2019-03-27 09:07:50', null, null, '2019-03-27 09:07:50', null, null);
INSERT INTO `col_user` VALUES ('103', '98184', null, null, null, null, null, '2019-03-27 09:07:59', '2019-03-27 09:07:59', null, null, '2019-03-27 09:07:59', null, null);
INSERT INTO `col_user` VALUES ('104', '55548', null, null, null, null, null, '2019-03-27 09:08:09', '2019-03-27 09:08:09', null, null, '2019-03-27 09:08:09', null, null);
INSERT INTO `col_user` VALUES ('105', '19993', null, null, null, null, null, '2019-03-27 09:08:26', '2019-03-27 09:08:26', null, null, '2019-03-27 09:08:26', null, null);
INSERT INTO `col_user` VALUES ('106', '2425', null, null, null, null, null, '2019-03-27 09:08:52', '2019-03-27 09:08:52', null, null, '2019-03-27 09:08:52', null, null);
INSERT INTO `col_user` VALUES ('107', '17716', null, null, null, null, null, '2019-03-27 09:09:44', '2019-03-27 09:09:44', null, null, '2019-03-27 09:09:44', null, null);
INSERT INTO `col_user` VALUES ('108', '63078', null, null, null, null, null, '2019-03-27 09:10:34', '2019-03-27 09:10:34', null, null, '2019-03-27 09:10:34', null, null);
INSERT INTO `col_user` VALUES ('109', '50012', null, null, null, null, null, '2019-03-27 09:11:59', '2019-03-27 09:11:59', null, null, '2019-03-27 09:11:59', null, null);
INSERT INTO `col_user` VALUES ('110', '51903', null, null, null, null, null, '2019-03-27 09:12:02', '2019-03-27 09:12:02', null, null, '2019-03-27 09:12:02', null, null);
INSERT INTO `col_user` VALUES ('111', '67525', null, null, null, null, null, '2019-03-27 09:13:02', '2019-03-27 09:13:02', null, null, '2019-03-27 09:13:02', null, null);
INSERT INTO `col_user` VALUES ('112', '29492', null, null, null, null, null, '2019-03-27 09:13:06', '2019-03-27 09:13:06', null, null, '2019-03-27 09:13:06', null, null);
INSERT INTO `col_user` VALUES ('113', '8737', null, null, null, null, null, '2019-03-27 09:13:54', '2019-03-27 09:13:54', null, null, '2019-03-27 09:13:54', null, null);
INSERT INTO `col_user` VALUES ('114', '78810', null, null, null, null, null, '2019-03-27 09:15:44', '2019-03-27 09:15:44', null, null, '2019-03-27 09:15:44', null, null);
INSERT INTO `col_user` VALUES ('115', '68558', null, null, null, null, null, '2019-03-27 09:16:09', '2019-03-27 09:16:09', null, null, '2019-03-27 09:16:09', null, null);
INSERT INTO `col_user` VALUES ('116', '84583', null, null, null, null, null, '2019-03-27 09:16:11', '2019-03-27 09:16:11', null, null, '2019-03-27 09:16:11', null, null);
INSERT INTO `col_user` VALUES ('117', '49341', null, null, null, null, null, '2019-03-27 09:16:40', '2019-03-27 09:16:40', null, null, '2019-03-27 09:16:40', null, null);
INSERT INTO `col_user` VALUES ('118', '92402', null, null, null, null, null, '2019-03-27 09:16:42', '2019-03-27 09:16:42', null, null, '2019-03-27 09:16:42', null, null);
INSERT INTO `col_user` VALUES ('119', '60313', null, null, null, null, null, '2019-03-27 09:16:43', '2019-03-27 09:16:43', null, null, '2019-03-27 09:16:43', null, null);
INSERT INTO `col_user` VALUES ('120', '86862', null, null, null, null, null, '2019-03-27 09:17:36', '2019-03-27 09:17:36', null, null, '2019-03-27 09:17:36', null, null);
INSERT INTO `col_user` VALUES ('121', '23813', null, null, null, null, null, '2019-03-27 09:19:30', '2019-03-27 09:19:30', null, null, '2019-03-27 09:19:30', null, null);
INSERT INTO `col_user` VALUES ('122', '89845', null, null, null, null, null, '2019-03-27 09:19:58', '2019-03-27 09:19:58', null, null, '2019-03-27 09:19:58', null, null);
INSERT INTO `col_user` VALUES ('123', '59692', null, null, null, null, null, '2019-03-27 09:21:11', '2019-03-27 09:21:11', null, null, '2019-03-27 09:21:11', null, null);
INSERT INTO `col_user` VALUES ('124', '39039', null, null, null, null, null, '2019-03-27 09:21:46', '2019-03-27 09:21:46', null, null, '2019-03-27 09:21:46', null, null);
INSERT INTO `col_user` VALUES ('125', '90415', null, null, null, null, null, '2019-03-27 09:22:15', '2019-03-27 09:22:15', null, null, '2019-03-27 09:22:15', null, null);
INSERT INTO `col_user` VALUES ('126', '31323', null, null, null, null, null, '2019-03-27 09:22:55', '2019-03-27 09:22:55', null, null, '2019-03-27 09:22:55', null, null);
INSERT INTO `col_user` VALUES ('127', '94906', null, null, null, null, null, '2019-03-27 09:23:33', '2019-03-27 09:23:33', null, null, '2019-03-27 09:23:33', null, null);
INSERT INTO `col_user` VALUES ('128', '77588', null, null, null, null, null, '2019-03-27 09:23:34', '2019-03-27 09:23:34', null, null, '2019-03-27 09:23:34', null, null);
INSERT INTO `col_user` VALUES ('129', '32201', null, null, null, null, null, '2019-03-27 09:23:35', '2019-03-27 09:23:35', null, null, '2019-03-27 09:23:35', null, null);
INSERT INTO `col_user` VALUES ('130', '13896', null, null, null, null, null, '2019-03-27 09:35:09', '2019-03-27 09:35:09', null, null, '2019-03-27 09:35:09', null, null);
INSERT INTO `col_user` VALUES ('131', '94965', null, null, null, null, null, '2019-03-27 09:35:47', '2019-03-27 09:35:47', null, null, '2019-03-27 09:35:47', null, null);
INSERT INTO `col_user` VALUES ('132', '31905', null, null, null, null, null, '2019-03-27 09:36:12', '2019-03-27 09:36:12', null, null, '2019-03-27 09:36:12', null, null);
INSERT INTO `col_user` VALUES ('133', '75070', null, null, null, null, null, '2019-03-27 09:36:30', '2019-03-27 09:36:30', null, null, '2019-03-27 09:36:30', null, null);
INSERT INTO `col_user` VALUES ('134', '5738', null, null, null, null, null, '2019-03-27 09:38:08', '2019-03-27 09:38:08', null, null, '2019-03-27 09:38:08', null, null);
INSERT INTO `col_user` VALUES ('135', '79016', null, null, null, null, null, '2019-03-27 09:38:42', '2019-03-27 09:38:42', null, null, '2019-03-27 09:38:42', null, null);
INSERT INTO `col_user` VALUES ('136', '56742', null, null, null, null, null, '2019-03-27 09:49:09', '2019-03-27 09:49:09', null, null, '2019-03-27 09:49:09', null, null);
INSERT INTO `col_user` VALUES ('137', '57950', null, null, null, null, null, '2019-03-27 09:49:13', '2019-03-27 09:49:13', null, null, '2019-03-27 09:49:13', null, null);
INSERT INTO `col_user` VALUES ('138', '78858', null, null, null, null, null, '2019-03-27 09:51:58', '2019-03-27 09:51:58', null, null, '2019-03-27 09:51:58', null, null);
INSERT INTO `col_user` VALUES ('139', '34362', null, null, null, null, null, '2019-03-27 09:54:16', '2019-03-27 09:54:16', null, null, '2019-03-27 09:54:16', null, null);
INSERT INTO `col_user` VALUES ('140', '19845', null, null, null, null, null, '2019-03-27 10:08:52', '2019-03-27 10:08:52', null, null, '2019-03-27 10:08:52', null, null);
INSERT INTO `col_user` VALUES ('141', '9885', null, null, null, null, null, '2019-03-27 10:09:18', '2019-03-27 10:09:18', null, null, '2019-03-27 10:09:18', null, null);
INSERT INTO `col_user` VALUES ('142', '56946', null, null, null, null, null, '2019-03-27 10:09:38', '2019-03-27 10:09:38', null, null, '2019-03-27 10:09:38', null, null);
INSERT INTO `col_user` VALUES ('143', '1487', null, null, null, null, null, '2019-03-27 10:12:16', '2019-03-27 10:12:16', null, null, '2019-03-27 10:12:16', null, null);
INSERT INTO `col_user` VALUES ('144', '20105', null, null, null, null, null, '2019-03-27 10:12:59', '2019-03-27 10:12:59', null, null, '2019-03-27 10:12:59', null, null);
INSERT INTO `col_user` VALUES ('145', '84566', null, null, null, null, null, '2019-03-27 10:13:00', '2019-03-27 10:13:00', null, null, '2019-03-27 10:13:00', null, null);
INSERT INTO `col_user` VALUES ('146', '9833', null, null, null, null, null, '2019-03-27 10:13:05', '2019-03-27 10:13:05', null, null, '2019-03-27 10:13:05', null, null);
INSERT INTO `col_user` VALUES ('147', '33834', null, null, null, null, null, '2019-03-27 10:13:16', '2019-03-27 10:13:16', null, null, '2019-03-27 10:13:16', null, null);
INSERT INTO `col_user` VALUES ('148', '39407', null, null, null, null, null, '2019-03-27 10:20:37', '2019-03-27 10:20:37', null, null, '2019-03-27 10:20:37', null, null);
INSERT INTO `col_user` VALUES ('149', '26524', null, null, null, null, null, '2019-03-27 10:20:43', '2019-03-27 10:20:43', null, null, '2019-03-27 10:20:43', null, null);
INSERT INTO `col_user` VALUES ('150', '1038', null, null, null, null, null, '2019-03-27 10:20:56', '2019-03-27 10:20:56', null, null, '2019-03-27 10:20:56', null, null);
INSERT INTO `col_user` VALUES ('151', '9489', null, null, null, null, null, '2019-03-27 10:21:15', '2019-03-27 10:21:15', null, null, '2019-03-27 10:21:15', null, null);
INSERT INTO `col_user` VALUES ('152', '78540', null, null, null, null, null, '2019-03-27 10:21:19', '2019-03-27 10:21:19', null, null, '2019-03-27 10:21:19', null, null);
INSERT INTO `col_user` VALUES ('153', '24474', null, null, null, null, null, '2019-03-27 10:33:24', '2019-03-27 10:33:24', null, null, '2019-03-27 10:33:24', null, null);
INSERT INTO `col_user` VALUES ('154', '95791', null, null, null, null, null, '2019-03-27 10:50:56', '2019-03-27 10:50:56', null, null, '2019-03-27 10:50:56', null, null);
INSERT INTO `col_user` VALUES ('155', '82681', null, null, null, null, null, '2019-03-27 10:57:27', '2019-03-27 10:57:27', null, null, '2019-03-27 10:57:27', null, null);
INSERT INTO `col_user` VALUES ('156', '85603', null, null, null, null, null, '2019-03-27 10:57:32', '2019-03-27 10:57:32', null, null, '2019-03-27 10:57:32', null, null);
INSERT INTO `col_user` VALUES ('157', '45339', null, null, null, null, null, '2019-03-27 10:57:46', '2019-03-27 10:57:46', null, null, '2019-03-27 10:57:46', null, null);
INSERT INTO `col_user` VALUES ('158', '73308', null, null, null, null, null, '2019-03-27 10:57:52', '2019-03-27 10:57:52', null, null, '2019-03-27 10:57:52', null, null);
INSERT INTO `col_user` VALUES ('159', '21492', null, null, null, null, null, '2019-03-27 10:58:12', '2019-03-27 10:58:12', null, null, '2019-03-27 10:58:12', null, null);
INSERT INTO `col_user` VALUES ('160', '60340', null, null, null, null, null, '2019-03-27 11:03:00', '2019-03-27 11:03:00', null, null, '2019-03-27 11:03:00', null, null);
INSERT INTO `col_user` VALUES ('161', '12586', null, null, null, null, null, '2019-03-27 11:24:57', '2019-03-27 11:24:57', null, null, '2019-03-27 11:24:57', null, null);
INSERT INTO `col_user` VALUES ('162', '98791', null, null, null, null, null, '2019-03-27 13:08:37', '2019-03-27 13:08:37', null, null, '2019-03-27 13:08:37', null, null);
INSERT INTO `col_user` VALUES ('163', '91927', null, null, null, null, null, '2019-03-27 13:08:39', '2019-03-27 13:08:39', null, null, '2019-03-27 13:08:39', null, null);
INSERT INTO `col_user` VALUES ('164', '29509', null, null, null, null, null, '2019-03-27 13:20:02', '2019-03-27 13:20:02', null, null, '2019-03-27 13:20:02', null, null);
INSERT INTO `col_user` VALUES ('165', '84937', null, null, null, null, null, '2019-03-27 13:20:50', '2019-03-27 13:20:50', null, null, '2019-03-27 13:20:50', null, null);
INSERT INTO `col_user` VALUES ('166', '83212', null, null, null, null, null, '2019-03-27 13:21:10', '2019-03-27 13:21:10', null, null, '2019-03-27 13:21:10', null, null);
INSERT INTO `col_user` VALUES ('167', '41693', null, null, null, null, null, '2019-03-27 13:25:49', '2019-03-27 13:25:49', null, null, '2019-03-27 13:25:49', null, null);
INSERT INTO `col_user` VALUES ('168', '78354', null, null, null, null, null, '2019-03-27 13:40:17', '2019-03-27 13:40:17', null, null, '2019-03-27 13:40:17', null, null);
INSERT INTO `col_user` VALUES ('169', '93753', null, null, null, null, null, '2019-03-27 13:44:20', '2019-03-27 13:44:20', null, null, '2019-03-27 13:44:20', null, null);
INSERT INTO `col_user` VALUES ('170', '43649', null, null, null, null, null, '2019-03-27 13:44:44', '2019-03-27 13:44:44', null, null, '2019-03-27 13:44:44', null, null);
INSERT INTO `col_user` VALUES ('171', '4243', null, null, null, null, null, '2019-03-27 13:44:54', '2019-03-27 13:44:54', null, null, '2019-03-27 13:44:54', null, null);
INSERT INTO `col_user` VALUES ('172', '17861', null, null, null, null, null, '2019-03-27 13:45:56', '2019-03-27 13:45:56', null, null, '2019-03-27 13:45:56', null, null);
INSERT INTO `col_user` VALUES ('173', '14210', null, null, null, null, null, '2019-03-27 13:46:02', '2019-03-27 13:46:02', null, null, '2019-03-27 13:46:02', null, null);
INSERT INTO `col_user` VALUES ('174', '81252', null, null, null, null, null, '2019-03-27 13:46:05', '2019-03-27 13:46:05', null, null, '2019-03-27 13:46:05', null, null);
INSERT INTO `col_user` VALUES ('175', '17057', null, null, null, null, null, '2019-03-27 13:46:07', '2019-03-27 13:46:07', null, null, '2019-03-27 13:46:07', null, null);
INSERT INTO `col_user` VALUES ('176', '38694', null, null, null, null, null, '2019-03-27 13:47:04', '2019-03-27 13:47:04', null, null, '2019-03-27 13:47:04', null, null);
INSERT INTO `col_user` VALUES ('177', '56635', null, null, null, null, null, '2019-03-27 13:47:31', '2019-03-27 13:47:31', null, null, '2019-03-27 13:47:31', null, null);
INSERT INTO `col_user` VALUES ('178', '64128', null, null, null, null, null, '2019-03-27 13:47:45', '2019-03-27 13:47:45', null, null, '2019-03-27 13:47:45', null, null);
INSERT INTO `col_user` VALUES ('179', '48550', null, null, null, null, null, '2019-03-27 13:48:29', '2019-03-27 13:48:29', null, null, '2019-03-27 13:48:29', null, null);
INSERT INTO `col_user` VALUES ('180', '55385', null, null, null, null, null, '2019-03-27 13:49:11', '2019-03-27 13:49:11', null, null, '2019-03-27 13:49:11', null, null);
INSERT INTO `col_user` VALUES ('181', '81864', null, null, null, null, null, '2019-03-27 13:50:06', '2019-03-27 13:50:06', null, null, '2019-03-27 13:50:06', null, null);
INSERT INTO `col_user` VALUES ('182', '30397', null, null, null, null, null, '2019-03-27 13:50:43', '2019-03-27 13:50:43', null, null, '2019-03-27 13:50:43', null, null);
INSERT INTO `col_user` VALUES ('183', '86140', null, null, null, null, null, '2019-03-27 13:50:47', '2019-03-27 13:50:47', null, null, '2019-03-27 13:50:47', null, null);
INSERT INTO `col_user` VALUES ('184', '26165', null, null, null, null, null, '2019-03-27 13:52:53', '2019-03-27 13:52:53', null, null, '2019-03-27 13:52:53', null, null);
INSERT INTO `col_user` VALUES ('185', '47462', null, null, null, null, null, '2019-03-27 13:53:14', '2019-03-27 13:53:14', null, null, '2019-03-27 13:53:14', null, null);
INSERT INTO `col_user` VALUES ('186', '55263', null, null, null, null, null, '2019-03-27 13:53:20', '2019-03-27 13:53:20', null, null, '2019-03-27 13:53:20', null, null);
INSERT INTO `col_user` VALUES ('187', '63249', null, null, null, null, null, '2019-03-27 13:54:55', '2019-03-27 13:54:55', null, null, '2019-03-27 13:54:55', null, null);
INSERT INTO `col_user` VALUES ('188', '31808', null, null, null, null, null, '2019-03-27 13:55:12', '2019-03-27 13:55:12', null, null, '2019-03-27 13:55:12', null, null);
INSERT INTO `col_user` VALUES ('189', '14268', null, null, null, null, null, '2019-03-27 13:57:34', '2019-03-27 13:57:34', null, null, '2019-03-27 13:57:34', null, null);
INSERT INTO `col_user` VALUES ('190', '98831', null, null, null, null, null, '2019-03-27 14:04:59', '2019-03-27 14:04:59', null, null, '2019-03-27 14:04:59', null, null);
INSERT INTO `col_user` VALUES ('191', '99781', null, null, null, null, null, '2019-03-27 14:05:06', '2019-03-27 14:05:06', null, null, '2019-03-27 14:05:06', null, null);
INSERT INTO `col_user` VALUES ('192', '42575', null, null, null, null, null, '2019-03-27 14:06:31', '2019-03-27 14:06:31', null, null, '2019-03-27 14:06:31', null, null);
INSERT INTO `col_user` VALUES ('193', '59781', null, null, null, null, null, '2019-03-27 14:19:21', '2019-03-27 14:19:21', null, null, '2019-03-27 14:19:21', null, null);
INSERT INTO `col_user` VALUES ('194', '90309', null, null, null, null, null, '2019-03-27 14:19:21', '2019-03-27 14:19:21', null, null, '2019-03-27 14:19:21', null, null);
INSERT INTO `col_user` VALUES ('195', '11991', null, null, null, null, null, '2019-03-27 14:19:28', '2019-03-27 14:19:28', null, null, '2019-03-27 14:19:28', null, null);
INSERT INTO `col_user` VALUES ('196', '34424', null, null, null, null, null, '2019-03-27 14:19:54', '2019-03-27 14:19:54', null, null, '2019-03-27 14:19:54', null, null);
INSERT INTO `col_user` VALUES ('197', '72178', null, null, null, null, null, '2019-03-27 14:22:34', '2019-03-27 14:22:34', null, null, '2019-03-27 14:22:34', null, null);
INSERT INTO `col_user` VALUES ('198', '13565', null, null, null, null, null, '2019-03-27 14:22:57', '2019-03-27 14:22:57', null, null, '2019-03-27 14:22:57', null, null);
INSERT INTO `col_user` VALUES ('199', '88162', null, null, null, null, null, '2019-03-27 14:23:47', '2019-03-27 14:23:47', null, null, '2019-03-27 14:23:47', null, null);
INSERT INTO `col_user` VALUES ('200', '88804', null, null, null, null, null, '2019-03-27 14:24:17', '2019-03-27 14:24:17', null, null, '2019-03-27 14:24:17', null, null);
INSERT INTO `col_user` VALUES ('201', '60166', null, null, null, null, null, '2019-03-27 14:24:53', '2019-03-27 14:24:53', null, null, '2019-03-27 14:24:53', null, null);
INSERT INTO `col_user` VALUES ('202', '69015', null, null, null, null, null, '2019-03-27 14:25:11', '2019-03-27 14:25:11', null, null, '2019-03-27 14:25:11', null, null);
INSERT INTO `col_user` VALUES ('203', '65852', null, null, null, null, null, '2019-03-27 14:28:05', '2019-03-27 14:28:05', null, null, '2019-03-27 14:28:05', null, null);
INSERT INTO `col_user` VALUES ('204', '78872', null, null, null, null, null, '2019-03-27 14:28:32', '2019-03-27 14:28:32', null, null, '2019-03-27 14:28:32', null, null);
INSERT INTO `col_user` VALUES ('205', '35821', null, null, null, null, null, '2019-03-27 14:37:36', '2019-03-27 14:37:36', null, null, '2019-03-27 14:37:36', null, null);
INSERT INTO `col_user` VALUES ('206', '85963', null, null, null, null, null, '2019-03-27 14:40:23', '2019-03-27 14:40:23', null, null, '2019-03-27 14:40:23', null, null);
INSERT INTO `col_user` VALUES ('207', '34714', null, null, null, null, null, '2019-03-27 14:54:33', '2019-03-27 14:54:33', null, null, '2019-03-27 14:54:33', null, null);
INSERT INTO `col_user` VALUES ('208', '80938', null, null, null, null, null, '2019-03-27 15:10:29', '2019-03-27 15:10:29', null, null, '2019-03-27 15:10:29', null, null);
INSERT INTO `col_user` VALUES ('209', '88495', null, null, null, null, null, '2019-03-27 15:10:36', '2019-03-27 15:10:36', null, null, '2019-03-27 15:10:36', null, null);
INSERT INTO `col_user` VALUES ('210', '65630', null, null, null, null, null, '2019-03-27 15:11:13', '2019-03-27 15:11:13', null, null, '2019-03-27 15:11:13', null, null);
INSERT INTO `col_user` VALUES ('211', '13805', null, null, null, null, null, '2019-03-27 15:18:16', '2019-03-27 15:18:16', null, null, '2019-03-27 15:18:16', null, null);
INSERT INTO `col_user` VALUES ('212', '49029', null, null, null, null, null, '2019-03-27 15:18:28', '2019-03-27 15:18:28', null, null, '2019-03-27 15:18:28', null, null);
INSERT INTO `col_user` VALUES ('213', '92152', null, null, null, null, null, '2019-03-27 15:18:54', '2019-03-27 15:18:54', null, null, '2019-03-27 15:18:54', null, null);
INSERT INTO `col_user` VALUES ('214', '26964', null, null, null, null, null, '2019-03-27 15:29:36', '2019-03-27 15:29:36', null, null, '2019-03-27 15:29:36', null, null);
INSERT INTO `col_user` VALUES ('215', '7475', null, null, null, null, null, '2019-03-27 15:29:58', '2019-03-27 15:29:58', null, null, '2019-03-27 15:29:58', null, null);
INSERT INTO `col_user` VALUES ('216', '80171', null, null, null, null, null, '2019-03-27 15:31:26', '2019-03-27 15:31:26', null, null, '2019-03-27 15:31:26', null, null);
INSERT INTO `col_user` VALUES ('217', '75158', null, null, null, null, null, '2019-03-27 15:31:41', '2019-03-27 15:31:41', null, null, '2019-03-27 15:31:41', null, null);
INSERT INTO `col_user` VALUES ('218', '13360', null, null, null, null, null, '2019-03-27 15:32:00', '2019-03-27 15:32:00', null, null, '2019-03-27 15:32:00', null, null);
INSERT INTO `col_user` VALUES ('219', '86936', null, null, null, null, null, '2019-03-27 15:32:58', '2019-03-27 15:32:58', null, null, '2019-03-27 15:32:58', null, null);
INSERT INTO `col_user` VALUES ('220', '62039', null, null, null, null, null, '2019-03-27 15:33:27', '2019-03-27 15:33:27', null, null, '2019-03-27 15:33:27', null, null);
INSERT INTO `col_user` VALUES ('221', '68006', null, null, null, null, null, '2019-03-27 15:33:41', '2019-03-27 15:33:41', null, null, '2019-03-27 15:33:41', null, null);
INSERT INTO `col_user` VALUES ('222', '82846', null, null, null, null, null, '2019-03-27 15:33:59', '2019-03-27 15:33:59', null, null, '2019-03-27 15:33:59', null, null);
INSERT INTO `col_user` VALUES ('223', '30854', null, null, null, null, null, '2019-03-27 15:34:14', '2019-03-27 15:34:14', null, null, '2019-03-27 15:34:14', null, null);
INSERT INTO `col_user` VALUES ('224', '17379', null, null, null, null, null, '2019-03-27 15:34:25', '2019-03-27 15:34:25', null, null, '2019-03-27 15:34:25', null, null);
INSERT INTO `col_user` VALUES ('225', '49952', null, null, null, null, null, '2019-03-27 15:34:32', '2019-03-27 15:34:32', null, null, '2019-03-27 15:34:32', null, null);
INSERT INTO `col_user` VALUES ('226', '24994', null, null, null, null, null, '2019-03-27 15:34:52', '2019-03-27 15:34:52', null, null, '2019-03-27 15:34:52', null, null);
INSERT INTO `col_user` VALUES ('227', '38476', null, null, null, null, null, '2019-03-27 15:35:06', '2019-03-27 15:35:06', null, null, '2019-03-27 15:35:06', null, null);
INSERT INTO `col_user` VALUES ('228', '18300', null, null, null, null, null, '2019-03-27 15:37:24', '2019-03-27 15:37:24', null, null, '2019-03-27 15:37:24', null, null);
INSERT INTO `col_user` VALUES ('229', '35178', null, null, null, null, null, '2019-03-27 15:39:41', '2019-03-27 15:39:41', null, null, '2019-03-27 15:39:41', null, null);
INSERT INTO `col_user` VALUES ('230', '55719', null, null, null, null, null, '2019-03-27 15:40:01', '2019-03-27 15:40:01', null, null, '2019-03-27 15:40:01', null, null);
INSERT INTO `col_user` VALUES ('231', '71944', null, null, null, null, null, '2019-03-27 15:40:21', '2019-03-27 15:40:21', null, null, '2019-03-27 15:40:21', null, null);
INSERT INTO `col_user` VALUES ('232', '31163', null, null, null, null, null, '2019-03-27 15:40:29', '2019-03-27 15:40:29', null, null, '2019-03-27 15:40:29', null, null);
INSERT INTO `col_user` VALUES ('233', '47499', null, null, null, null, null, '2019-03-27 15:40:32', '2019-03-27 15:40:32', null, null, '2019-03-27 15:40:32', null, null);
INSERT INTO `col_user` VALUES ('234', '27318', null, null, null, null, null, '2019-03-27 15:41:08', '2019-03-27 15:41:08', null, null, '2019-03-27 15:41:08', null, null);
INSERT INTO `col_user` VALUES ('235', '3220', null, null, null, null, null, '2019-03-27 15:41:16', '2019-03-27 15:41:16', null, null, '2019-03-27 15:41:16', null, null);
INSERT INTO `col_user` VALUES ('236', '31552', null, null, null, null, null, '2019-03-27 15:41:27', '2019-03-27 15:41:27', null, null, '2019-03-27 15:41:27', null, null);
INSERT INTO `col_user` VALUES ('237', '37850', null, null, null, null, null, '2019-03-27 15:41:52', '2019-03-27 15:41:52', null, null, '2019-03-27 15:41:52', null, null);
INSERT INTO `col_user` VALUES ('238', '36299', null, null, null, null, null, '2019-03-27 15:41:55', '2019-03-27 15:41:55', null, null, '2019-03-27 15:41:55', null, null);
INSERT INTO `col_user` VALUES ('239', '5453', null, null, null, null, null, '2019-03-27 15:42:00', '2019-03-27 15:42:00', null, null, '2019-03-27 15:42:00', null, null);
INSERT INTO `col_user` VALUES ('240', '54298', null, null, null, null, null, '2019-03-27 15:42:08', '2019-03-27 15:42:08', null, null, '2019-03-27 15:42:08', null, null);
INSERT INTO `col_user` VALUES ('241', '6780', null, null, null, null, null, '2019-03-27 15:42:35', '2019-03-27 15:42:35', null, null, '2019-03-27 15:42:35', null, null);
INSERT INTO `col_user` VALUES ('242', '48392', null, null, null, null, null, '2019-03-27 15:44:01', '2019-03-27 15:44:01', null, null, '2019-03-27 15:44:01', null, null);
INSERT INTO `col_user` VALUES ('243', '86002', null, null, null, null, null, '2019-03-27 15:45:21', '2019-03-27 15:45:21', null, null, '2019-03-27 15:45:21', null, null);
INSERT INTO `col_user` VALUES ('244', '50216', null, null, null, null, null, '2019-03-27 15:45:55', '2019-03-27 15:45:55', null, null, '2019-03-27 15:45:55', null, null);
INSERT INTO `col_user` VALUES ('245', '71206', null, null, null, null, null, '2019-03-27 15:50:29', '2019-03-27 15:50:29', null, null, '2019-03-27 15:50:29', null, null);
INSERT INTO `col_user` VALUES ('246', '94714', null, null, null, null, null, '2019-03-27 15:56:11', '2019-03-27 15:56:11', null, null, '2019-03-27 15:56:11', null, null);
INSERT INTO `col_user` VALUES ('247', '69064', null, null, null, null, null, '2019-03-27 15:58:39', '2019-03-27 15:58:39', null, null, '2019-03-27 15:58:39', null, null);
INSERT INTO `col_user` VALUES ('248', '37829', null, null, null, null, null, '2019-03-27 16:09:21', '2019-03-27 16:09:21', null, null, '2019-03-27 16:09:21', null, null);
INSERT INTO `col_user` VALUES ('249', '58096', null, null, null, null, null, '2019-03-27 16:11:25', '2019-03-27 16:11:25', null, null, '2019-03-27 16:11:25', null, null);
INSERT INTO `col_user` VALUES ('250', '44603', null, null, null, null, null, '2019-03-27 16:11:28', '2019-03-27 16:11:28', null, null, '2019-03-27 16:11:28', null, null);
INSERT INTO `col_user` VALUES ('251', '59477', null, null, null, null, null, '2019-03-27 16:12:06', '2019-03-27 16:12:06', null, null, '2019-03-27 16:12:06', null, null);
INSERT INTO `col_user` VALUES ('252', '84196', null, null, null, null, null, '2019-03-27 16:12:40', '2019-03-27 16:12:40', null, null, '2019-03-27 16:12:40', null, null);
INSERT INTO `col_user` VALUES ('253', '96194', null, null, null, null, null, '2019-03-27 16:13:55', '2019-03-27 16:13:55', null, null, '2019-03-27 16:13:55', null, null);
INSERT INTO `col_user` VALUES ('254', '37482', null, null, null, null, null, '2019-03-27 16:13:58', '2019-03-27 16:13:58', null, null, '2019-03-27 16:13:58', null, null);
INSERT INTO `col_user` VALUES ('255', '48711', null, null, null, null, null, '2019-03-27 16:15:08', '2019-03-27 16:15:08', null, null, '2019-03-27 16:15:08', null, null);
INSERT INTO `col_user` VALUES ('256', '41824', null, null, null, null, null, '2019-03-27 16:15:11', '2019-03-27 16:15:11', null, null, '2019-03-27 16:15:11', null, null);
INSERT INTO `col_user` VALUES ('257', '2621', null, null, null, null, null, '2019-03-27 16:15:43', '2019-03-27 16:15:43', null, null, '2019-03-27 16:15:43', null, null);
INSERT INTO `col_user` VALUES ('258', '22710', null, null, null, null, null, '2019-03-27 16:15:46', '2019-03-27 16:15:46', null, null, '2019-03-27 16:15:46', null, null);
INSERT INTO `col_user` VALUES ('259', '43883', null, null, null, null, null, '2019-03-27 16:16:46', '2019-03-27 16:16:46', null, null, '2019-03-27 16:16:46', null, null);
INSERT INTO `col_user` VALUES ('260', '36298', null, null, null, null, null, '2019-03-27 16:23:36', '2019-03-27 16:23:36', null, null, '2019-03-27 16:23:36', null, null);
INSERT INTO `col_user` VALUES ('261', '46283', null, null, null, null, null, '2019-03-27 16:27:05', '2019-03-27 16:27:05', null, null, '2019-03-27 16:27:05', null, null);
INSERT INTO `col_user` VALUES ('262', '84132', null, null, null, null, null, '2019-03-27 16:27:08', '2019-03-27 16:27:08', null, null, '2019-03-27 16:27:08', null, null);
INSERT INTO `col_user` VALUES ('263', '47537', null, null, null, null, null, '2019-03-27 16:27:19', '2019-03-27 16:27:19', null, null, '2019-03-27 16:27:19', null, null);
INSERT INTO `col_user` VALUES ('264', '58782', null, null, null, null, null, '2019-03-27 16:27:22', '2019-03-27 16:27:22', null, null, '2019-03-27 16:27:22', null, null);
INSERT INTO `col_user` VALUES ('265', '82258', null, null, null, null, null, '2019-03-27 16:27:26', '2019-03-27 16:27:26', null, null, '2019-03-27 16:27:26', null, null);
INSERT INTO `col_user` VALUES ('266', '92901', null, null, null, null, null, '2019-03-27 16:27:52', '2019-03-27 16:27:52', null, null, '2019-03-27 16:27:52', null, null);
INSERT INTO `col_user` VALUES ('267', '70173', null, null, null, null, null, '2019-03-27 16:28:08', '2019-03-27 16:28:08', null, null, '2019-03-27 16:28:08', null, null);
INSERT INTO `col_user` VALUES ('268', '25119', null, null, null, null, null, '2019-03-27 16:32:28', '2019-03-27 16:32:28', null, null, '2019-03-27 16:32:28', null, null);
INSERT INTO `col_user` VALUES ('269', '87746', null, null, null, null, null, '2019-03-27 16:32:43', '2019-03-27 16:32:43', null, null, '2019-03-27 16:32:43', null, null);
INSERT INTO `col_user` VALUES ('270', '19212', null, null, null, null, null, '2019-03-27 16:32:43', '2019-03-27 16:32:43', null, null, '2019-03-27 16:32:43', null, null);
INSERT INTO `col_user` VALUES ('271', '84818', null, null, null, null, null, '2019-03-27 16:32:44', '2019-03-27 16:32:44', null, null, '2019-03-27 16:32:44', null, null);
INSERT INTO `col_user` VALUES ('272', '92774', null, null, null, null, null, '2019-03-27 16:32:44', '2019-03-27 16:32:44', null, null, '2019-03-27 16:32:44', null, null);
INSERT INTO `col_user` VALUES ('273', '47827', null, null, null, null, null, '2019-03-27 16:32:45', '2019-03-27 16:32:45', null, null, '2019-03-27 16:32:45', null, null);
INSERT INTO `col_user` VALUES ('274', '4283', null, null, null, null, null, '2019-03-27 16:32:45', '2019-03-27 16:32:45', null, null, '2019-03-27 16:32:45', null, null);
INSERT INTO `col_user` VALUES ('275', '62339', null, null, null, null, null, '2019-03-27 16:32:46', '2019-03-27 16:32:46', null, null, '2019-03-27 16:32:46', null, null);
INSERT INTO `col_user` VALUES ('276', '63684', null, null, null, null, null, '2019-03-27 16:32:46', '2019-03-27 16:32:46', null, null, '2019-03-27 16:32:46', null, null);
INSERT INTO `col_user` VALUES ('277', '94323', null, null, null, null, null, '2019-03-27 16:32:47', '2019-03-27 16:32:47', null, null, '2019-03-27 16:32:47', null, null);
INSERT INTO `col_user` VALUES ('278', '78196', null, null, null, null, null, '2019-03-27 16:32:47', '2019-03-27 16:32:47', null, null, '2019-03-27 16:32:47', null, null);
INSERT INTO `col_user` VALUES ('279', '66633', null, null, null, null, null, '2019-03-27 16:32:48', '2019-03-27 16:32:48', null, null, '2019-03-27 16:32:48', null, null);
INSERT INTO `col_user` VALUES ('280', '44091', null, null, null, null, null, '2019-03-27 16:32:48', '2019-03-27 16:32:48', null, null, '2019-03-27 16:32:48', null, null);
INSERT INTO `col_user` VALUES ('281', '64521', null, null, null, null, null, '2019-03-27 16:40:40', '2019-03-27 16:40:40', null, null, '2019-03-27 16:40:40', null, null);
INSERT INTO `col_user` VALUES ('282', '81598', null, null, null, null, null, '2019-03-27 16:40:44', '2019-03-27 16:40:44', null, null, '2019-03-27 16:40:44', null, null);
INSERT INTO `col_user` VALUES ('283', '99985', null, null, null, null, null, '2019-03-27 16:42:20', '2019-03-27 16:42:20', null, null, '2019-03-27 16:42:20', null, null);
INSERT INTO `col_user` VALUES ('284', '65204', null, null, null, null, null, '2019-03-27 16:43:50', '2019-03-27 16:43:50', null, null, '2019-03-27 16:43:50', null, null);
INSERT INTO `col_user` VALUES ('285', '11982', null, null, null, null, null, '2019-03-27 16:44:41', '2019-03-27 16:44:41', null, null, '2019-03-27 16:44:41', null, null);
INSERT INTO `col_user` VALUES ('286', '85199', null, null, null, null, null, '2019-03-27 16:48:15', '2019-03-27 16:48:15', null, null, '2019-03-27 16:48:15', null, null);
INSERT INTO `col_user` VALUES ('287', '55875', null, null, null, null, null, '2019-03-27 16:54:01', '2019-03-27 16:54:01', null, null, '2019-03-27 16:54:01', null, null);
INSERT INTO `col_user` VALUES ('288', '49772', null, null, null, null, null, '2019-03-27 16:58:37', '2019-03-27 16:58:37', null, null, '2019-03-27 16:58:37', null, null);
INSERT INTO `col_user` VALUES ('289', '42416', null, null, null, null, null, '2019-03-27 17:07:17', '2019-03-27 17:07:17', null, null, '2019-03-27 17:07:17', null, null);
INSERT INTO `col_user` VALUES ('290', '37507', null, null, null, null, null, '2019-03-27 17:07:24', '2019-03-27 17:07:24', null, null, '2019-03-27 17:07:24', null, null);
INSERT INTO `col_user` VALUES ('291', '75534', null, null, null, null, null, '2019-03-27 17:07:40', '2019-03-27 17:07:40', null, null, '2019-03-27 17:07:40', null, null);
INSERT INTO `col_user` VALUES ('292', '31561', null, null, null, null, null, '2019-03-27 17:08:16', '2019-03-27 17:08:16', null, null, '2019-03-27 17:08:16', null, null);
INSERT INTO `col_user` VALUES ('293', '35789', null, null, null, null, null, '2019-03-27 17:17:48', '2019-03-27 17:17:48', null, null, '2019-03-27 17:17:48', null, null);
INSERT INTO `col_user` VALUES ('294', '60746', null, null, null, null, null, '2019-03-27 17:18:26', '2019-03-27 17:18:26', null, null, '2019-03-27 17:18:26', null, null);
INSERT INTO `col_user` VALUES ('295', '51799', null, null, null, null, null, '2019-03-27 17:19:50', '2019-03-27 17:19:50', null, null, '2019-03-27 17:19:50', null, null);
INSERT INTO `col_user` VALUES ('296', '60368', null, null, null, null, null, '2019-03-27 17:19:55', '2019-03-27 17:19:55', null, null, '2019-03-27 17:19:55', null, null);
INSERT INTO `col_user` VALUES ('297', '25367', null, null, null, null, null, '2019-03-27 17:19:59', '2019-03-27 17:19:59', null, null, '2019-03-27 17:19:59', null, null);
INSERT INTO `col_user` VALUES ('298', '3463', null, null, null, null, null, '2019-03-27 17:22:30', '2019-03-27 17:22:30', null, null, '2019-03-27 17:22:30', null, null);
INSERT INTO `col_user` VALUES ('299', '47138', null, null, null, null, null, '2019-03-27 17:23:20', '2019-03-27 17:23:20', null, null, '2019-03-27 17:23:20', null, null);
INSERT INTO `col_user` VALUES ('300', '61010', null, null, null, null, null, '2019-03-27 17:24:08', '2019-03-27 17:24:08', null, null, '2019-03-27 17:24:08', null, null);
INSERT INTO `col_user` VALUES ('301', '27335', null, null, null, null, null, '2019-03-27 17:24:24', '2019-03-27 17:24:24', null, null, '2019-03-27 17:24:24', null, null);
INSERT INTO `col_user` VALUES ('302', '88000', null, null, null, null, null, '2019-03-27 17:24:57', '2019-03-27 17:24:57', null, null, '2019-03-27 17:24:57', null, null);
INSERT INTO `col_user` VALUES ('303', '8901', null, null, null, null, null, '2019-03-27 17:25:23', '2019-03-27 17:25:23', null, null, '2019-03-27 17:25:23', null, null);
INSERT INTO `col_user` VALUES ('304', '1619', null, null, null, null, null, '2019-03-27 17:26:20', '2019-03-27 17:26:20', null, null, '2019-03-27 17:26:20', null, null);
INSERT INTO `col_user` VALUES ('305', '38095', null, null, null, null, null, '2019-03-27 17:31:46', '2019-03-27 17:31:46', null, null, '2019-03-27 17:31:46', null, null);
INSERT INTO `col_user` VALUES ('306', '64447', null, null, null, null, null, '2019-03-27 17:31:50', '2019-03-27 17:31:50', null, null, '2019-03-27 17:31:50', null, null);
INSERT INTO `col_user` VALUES ('307', '44249', null, null, null, null, null, '2019-03-27 17:32:53', '2019-03-27 17:32:53', null, null, '2019-03-27 17:32:53', null, null);
INSERT INTO `col_user` VALUES ('308', '65650', null, null, null, null, null, '2019-03-27 17:33:01', '2019-03-27 17:33:01', null, null, '2019-03-27 17:33:01', null, null);
INSERT INTO `col_user` VALUES ('309', '31408', null, null, null, null, null, '2019-03-27 17:33:42', '2019-03-27 17:33:42', null, null, '2019-03-27 17:33:42', null, null);
INSERT INTO `col_user` VALUES ('310', '4856', null, null, null, null, null, '2019-03-27 17:34:09', '2019-03-27 17:34:09', null, null, '2019-03-27 17:34:09', null, null);
INSERT INTO `col_user` VALUES ('311', '77912', null, null, null, null, null, '2019-03-27 17:35:30', '2019-03-27 17:35:30', null, null, '2019-03-27 17:35:30', null, null);
INSERT INTO `col_user` VALUES ('312', '32303', null, null, null, null, null, '2019-03-27 17:38:47', '2019-03-27 17:38:47', null, null, '2019-03-27 17:38:47', null, null);
INSERT INTO `col_user` VALUES ('313', '85119', null, null, null, null, null, '2019-03-27 17:39:28', '2019-03-27 17:39:28', null, null, '2019-03-27 17:39:28', null, null);
INSERT INTO `col_user` VALUES ('314', '15922', null, null, null, null, null, '2019-03-27 17:41:10', '2019-03-27 17:41:10', null, null, '2019-03-27 17:41:10', null, null);
INSERT INTO `col_user` VALUES ('315', '39577', null, null, null, null, null, '2019-03-27 17:41:19', '2019-03-27 17:41:19', null, null, '2019-03-27 17:41:19', null, null);
INSERT INTO `col_user` VALUES ('316', '31308', null, null, null, null, null, '2019-03-27 17:41:20', '2019-03-27 17:41:20', null, null, '2019-03-27 17:41:20', null, null);
INSERT INTO `col_user` VALUES ('317', '21532', null, null, null, null, null, '2019-03-27 17:41:26', '2019-03-27 17:41:26', null, null, '2019-03-27 17:41:26', null, null);
INSERT INTO `col_user` VALUES ('318', '39081', null, null, null, null, null, '2019-03-27 17:41:27', '2019-03-27 17:41:27', null, null, '2019-03-27 17:41:27', null, null);
INSERT INTO `col_user` VALUES ('319', '92648', null, null, null, null, null, '2019-03-27 17:41:51', '2019-03-27 17:41:51', null, null, '2019-03-27 17:41:51', null, null);
INSERT INTO `col_user` VALUES ('320', '63478', null, null, null, null, null, '2019-03-27 17:43:32', '2019-03-27 17:43:32', null, null, '2019-03-27 17:43:32', null, null);
INSERT INTO `col_user` VALUES ('321', '61984', null, null, null, null, null, '2019-03-27 17:45:54', '2019-03-27 17:45:54', null, null, '2019-03-27 17:45:54', null, null);
INSERT INTO `col_user` VALUES ('322', '17005', null, null, null, null, null, '2019-03-27 17:45:59', '2019-03-27 17:45:59', null, null, '2019-03-27 17:45:59', null, null);
INSERT INTO `col_user` VALUES ('323', '9095', null, null, null, null, null, '2019-03-27 17:40:53', '2019-03-27 17:40:53', null, null, '2019-03-27 17:40:53', null, null);
INSERT INTO `col_user` VALUES ('324', '53124', null, null, null, null, null, '2019-03-27 17:46:16', '2019-03-27 17:46:16', null, null, '2019-03-27 17:46:16', null, null);
INSERT INTO `col_user` VALUES ('325', '89775', null, null, null, null, null, '2019-03-27 17:41:32', '2019-03-27 17:41:32', null, null, '2019-03-27 17:41:32', null, null);
INSERT INTO `col_user` VALUES ('326', '87347', null, null, null, null, null, '2019-03-27 17:43:24', '2019-03-27 17:43:24', null, null, '2019-03-27 17:43:24', null, null);
INSERT INTO `col_user` VALUES ('327', '69', null, null, null, null, null, '2019-03-27 17:45:26', '2019-03-27 17:45:26', null, null, '2019-03-27 17:45:26', null, null);
INSERT INTO `col_user` VALUES ('328', '4608', null, null, null, null, null, '2019-03-27 17:53:36', '2019-03-27 17:53:36', null, null, '2019-03-27 17:53:36', null, null);
INSERT INTO `col_user` VALUES ('329', '77951', null, null, null, null, null, '2019-03-27 17:48:40', '2019-03-27 17:48:40', null, null, '2019-03-27 17:48:40', null, null);
INSERT INTO `col_user` VALUES ('330', '28589', null, null, null, null, null, '2019-03-27 17:53:55', '2019-03-27 17:53:55', null, null, '2019-03-27 17:53:55', null, null);
INSERT INTO `col_user` VALUES ('331', '85556', null, null, null, null, null, '2019-03-27 17:53:56', '2019-03-27 17:53:56', null, null, '2019-03-27 17:53:56', null, null);
INSERT INTO `col_user` VALUES ('332', '73529', null, null, null, null, null, '2019-03-27 17:54:28', '2019-03-27 17:54:28', null, null, '2019-03-27 17:54:28', null, null);
INSERT INTO `col_user` VALUES ('333', '54077', null, null, null, null, null, '2019-03-27 17:54:28', '2019-03-27 17:54:28', null, null, '2019-03-27 17:54:28', null, null);
INSERT INTO `col_user` VALUES ('334', '7693', null, null, null, null, null, '2019-03-27 17:54:31', '2019-03-27 17:54:31', null, null, '2019-03-27 17:54:31', null, null);
INSERT INTO `col_user` VALUES ('335', '18442', null, null, null, null, null, '2019-03-27 17:54:34', '2019-03-27 17:54:34', null, null, '2019-03-27 17:54:34', null, null);
INSERT INTO `col_user` VALUES ('336', '52362', null, null, null, null, null, '2019-03-27 17:55:47', '2019-03-27 17:55:47', null, null, '2019-03-27 17:55:47', null, null);
INSERT INTO `col_user` VALUES ('337', '95192', null, null, null, null, null, '2019-03-27 17:57:45', '2019-03-27 17:57:45', null, null, '2019-03-27 17:57:45', null, null);
INSERT INTO `col_user` VALUES ('338', '72287', null, null, null, null, null, '2019-03-27 17:57:48', '2019-03-27 17:57:48', null, null, '2019-03-27 17:57:48', null, null);
INSERT INTO `col_user` VALUES ('339', '73746', null, null, null, null, null, '2019-03-27 18:02:00', '2019-03-27 18:02:00', null, null, '2019-03-27 18:02:00', null, null);
INSERT INTO `col_user` VALUES ('340', '28898', null, null, null, null, null, '2019-03-27 18:02:02', '2019-03-27 18:02:02', null, null, '2019-03-27 18:02:02', null, null);
INSERT INTO `col_user` VALUES ('341', '82205', null, null, null, null, null, '2019-03-27 18:02:08', '2019-03-27 18:02:08', null, null, '2019-03-27 18:02:08', null, null);
INSERT INTO `col_user` VALUES ('342', '42962', null, null, null, null, null, '2019-03-27 18:02:47', '2019-03-27 18:02:47', null, null, '2019-03-27 18:02:47', null, null);
INSERT INTO `col_user` VALUES ('343', '72330', null, null, null, null, null, '2019-03-27 18:03:20', '2019-03-27 18:03:20', null, null, '2019-03-27 18:03:20', null, null);
INSERT INTO `col_user` VALUES ('344', '36622', null, null, null, null, null, '2019-03-27 18:03:37', '2019-03-27 18:03:37', null, null, '2019-03-27 18:03:37', null, null);
INSERT INTO `col_user` VALUES ('345', '71495', null, null, null, null, null, '2019-03-27 18:04:46', '2019-03-27 18:04:46', null, null, '2019-03-27 18:04:46', null, null);
INSERT INTO `col_user` VALUES ('346', '66185', null, null, null, null, null, '2019-03-27 18:05:41', '2019-03-27 18:05:41', null, null, '2019-03-27 18:05:41', null, null);
INSERT INTO `col_user` VALUES ('347', '2090', null, null, null, null, null, '2019-03-27 18:06:20', '2019-03-27 18:06:20', null, null, '2019-03-27 18:06:20', null, null);
INSERT INTO `col_user` VALUES ('348', '36742', null, null, null, null, null, '2019-03-27 18:08:44', '2019-03-27 18:08:44', null, null, '2019-03-27 18:08:44', null, null);
INSERT INTO `col_user` VALUES ('349', '91275', null, null, null, null, null, '2019-03-27 18:09:00', '2019-03-27 18:09:00', null, null, '2019-03-27 18:09:00', null, null);
INSERT INTO `col_user` VALUES ('350', '34213', null, null, null, null, null, '2019-03-27 18:11:28', '2019-03-27 18:11:28', null, null, '2019-03-27 18:11:28', null, null);
INSERT INTO `col_user` VALUES ('351', '63935', null, null, null, null, null, '2019-03-27 18:11:30', '2019-03-27 18:11:30', null, null, '2019-03-27 18:11:30', null, null);
INSERT INTO `col_user` VALUES ('352', '16059', null, null, null, null, null, '2019-03-27 18:14:16', '2019-03-27 18:14:16', null, null, '2019-03-27 18:14:16', null, null);
INSERT INTO `col_user` VALUES ('353', '87413', null, null, null, null, null, '2019-03-27 18:17:08', '2019-03-27 18:17:08', null, null, '2019-03-27 18:17:08', null, null);
INSERT INTO `col_user` VALUES ('354', '73720', null, null, null, null, null, '2019-03-27 18:24:51', '2019-03-27 18:24:51', null, null, '2019-03-27 18:24:51', null, null);
INSERT INTO `col_user` VALUES ('355', '14078', null, null, null, null, null, '2019-03-27 18:25:04', '2019-03-27 18:25:04', null, null, '2019-03-27 18:25:04', null, null);
INSERT INTO `col_user` VALUES ('356', '6283', null, null, null, null, null, '2019-03-27 18:25:09', '2019-03-27 18:25:09', null, null, '2019-03-27 18:25:09', null, null);
INSERT INTO `col_user` VALUES ('357', '2191', null, null, null, null, null, '2019-03-27 18:25:45', '2019-03-27 18:25:45', null, null, '2019-03-27 18:25:45', null, null);
INSERT INTO `col_user` VALUES ('358', '28382', null, null, null, null, null, '2019-03-27 18:25:51', '2019-03-27 18:25:51', null, null, '2019-03-27 18:25:51', null, null);
INSERT INTO `col_user` VALUES ('359', '55755', null, null, null, null, null, '2019-03-27 18:26:05', '2019-03-27 18:26:05', null, null, '2019-03-27 18:26:05', null, null);
INSERT INTO `col_user` VALUES ('360', '29665', null, null, null, null, null, '2019-03-27 18:26:28', '2019-03-27 18:26:28', null, null, '2019-03-27 18:26:28', null, null);
INSERT INTO `col_user` VALUES ('361', '64072', null, null, null, null, null, '2019-03-27 18:27:33', '2019-03-27 18:27:33', null, null, '2019-03-27 18:27:33', null, null);
INSERT INTO `col_user` VALUES ('362', '16024', null, null, null, null, null, '2019-03-27 18:27:52', '2019-03-27 18:27:52', null, null, '2019-03-27 18:27:52', null, null);
INSERT INTO `col_user` VALUES ('363', '3899', null, null, null, null, null, '2019-03-27 18:28:02', '2019-03-27 18:28:02', null, null, '2019-03-27 18:28:02', null, null);
INSERT INTO `col_user` VALUES ('364', '84805', null, null, null, null, null, '2019-03-27 18:30:44', '2019-03-27 18:30:44', null, null, '2019-03-27 18:30:44', null, null);
INSERT INTO `col_user` VALUES ('365', '28925', null, null, null, null, null, '2019-03-27 18:34:44', '2019-03-27 18:34:44', null, null, '2019-03-27 18:34:44', null, null);
INSERT INTO `col_user` VALUES ('366', '34776', null, null, null, null, null, '2019-03-27 18:35:16', '2019-03-27 18:35:16', null, null, '2019-03-27 18:35:16', null, null);
INSERT INTO `col_user` VALUES ('367', '42088', null, null, null, null, null, '2019-03-27 18:36:04', '2019-03-27 18:36:04', null, null, '2019-03-27 18:36:04', null, null);
INSERT INTO `col_user` VALUES ('368', '23846', null, null, null, null, null, '2019-03-27 18:37:13', '2019-03-27 18:37:13', null, null, '2019-03-27 18:37:13', null, null);
INSERT INTO `col_user` VALUES ('369', '95227', null, null, null, null, null, '2019-03-27 18:38:11', '2019-03-27 18:38:11', null, null, '2019-03-27 18:38:11', null, null);
INSERT INTO `col_user` VALUES ('370', '95227', null, null, null, null, null, '2019-03-27 18:38:12', '2019-03-27 18:38:12', null, null, '2019-03-27 18:38:12', null, null);
INSERT INTO `col_user` VALUES ('371', '1496', null, null, null, null, null, '2019-03-27 18:39:34', '2019-03-27 18:39:34', null, null, '2019-03-27 18:39:34', null, null);
INSERT INTO `col_user` VALUES ('372', '24716', null, null, null, null, null, '2019-03-27 18:39:36', '2019-03-27 18:39:36', null, null, '2019-03-27 18:39:36', null, null);
INSERT INTO `col_user` VALUES ('373', '83248', null, null, null, null, null, '2019-03-27 18:40:34', '2019-03-27 18:40:34', null, null, '2019-03-27 18:40:34', null, null);
INSERT INTO `col_user` VALUES ('374', '96363', null, null, null, null, null, '2019-03-27 18:41:54', '2019-03-27 18:41:54', null, null, '2019-03-27 18:41:54', null, null);
INSERT INTO `col_user` VALUES ('375', '3526', null, null, null, null, null, '2019-03-27 18:42:01', '2019-03-27 18:42:01', null, null, '2019-03-27 18:42:01', null, null);
INSERT INTO `col_user` VALUES ('376', '89867', null, null, null, null, null, '2019-03-27 18:42:02', '2019-03-27 18:42:02', null, null, '2019-03-27 18:42:02', null, null);
INSERT INTO `col_user` VALUES ('377', '3976', null, null, null, null, null, '2019-03-27 18:42:05', '2019-03-27 18:42:05', null, null, '2019-03-27 18:42:05', null, null);
INSERT INTO `col_user` VALUES ('378', '56158', null, null, null, null, null, '2019-03-27 18:42:13', '2019-03-27 18:42:13', null, null, '2019-03-27 18:42:13', null, null);
INSERT INTO `col_user` VALUES ('379', '94033', null, null, null, null, null, '2019-03-27 18:43:07', '2019-03-27 18:43:07', null, null, '2019-03-27 18:43:07', null, null);
INSERT INTO `col_user` VALUES ('380', '34874', null, null, null, null, null, '2019-03-27 18:43:10', '2019-03-27 18:43:10', null, null, '2019-03-27 18:43:10', null, null);
INSERT INTO `col_user` VALUES ('381', '83267', null, null, null, null, null, '2019-03-27 18:44:24', '2019-03-27 18:44:24', null, null, '2019-03-27 18:44:24', null, null);
INSERT INTO `col_user` VALUES ('382', '20748', null, null, null, null, null, '2019-03-27 18:44:41', '2019-03-27 18:44:41', null, null, '2019-03-27 18:44:41', null, null);
INSERT INTO `col_user` VALUES ('383', '2906', null, null, null, null, null, '2019-03-27 18:44:49', '2019-03-27 18:44:49', null, null, '2019-03-27 18:44:49', null, null);
INSERT INTO `col_user` VALUES ('384', '73555', null, null, null, null, null, '2019-03-27 18:46:23', '2019-03-27 18:46:23', null, null, '2019-03-27 18:46:23', null, null);
INSERT INTO `col_user` VALUES ('385', '39815', null, null, null, null, null, '2019-03-27 18:47:04', '2019-03-27 18:47:04', null, null, '2019-03-27 18:47:04', null, null);
INSERT INTO `col_user` VALUES ('386', '21845', null, null, null, null, null, '2019-03-27 18:47:12', '2019-03-27 18:47:12', null, null, '2019-03-27 18:47:12', null, null);
INSERT INTO `col_user` VALUES ('387', '63367', null, null, null, null, null, '2019-03-27 18:47:26', '2019-03-27 18:47:26', null, null, '2019-03-27 18:47:26', null, null);
INSERT INTO `col_user` VALUES ('388', '94837', null, null, null, null, null, '2019-03-27 18:47:54', '2019-03-27 18:47:54', null, null, '2019-03-27 18:47:54', null, null);
INSERT INTO `col_user` VALUES ('389', '78533', null, null, null, null, null, '2019-03-27 19:13:24', '2019-03-27 19:13:24', null, null, '2019-03-27 19:13:24', null, null);
INSERT INTO `col_user` VALUES ('390', '19528', null, null, null, null, null, '2019-03-27 19:14:12', '2019-03-27 19:14:12', null, null, '2019-03-27 19:14:12', null, null);
INSERT INTO `col_user` VALUES ('391', '6319', null, null, null, null, null, '2019-03-27 19:16:33', '2019-03-27 19:16:33', null, null, '2019-03-27 19:16:33', null, null);
INSERT INTO `col_user` VALUES ('392', '1386', null, null, null, null, null, '2019-03-27 19:18:04', '2019-03-27 19:18:04', null, null, '2019-03-27 19:18:04', null, null);
INSERT INTO `col_user` VALUES ('393', '91520', null, null, null, null, null, '2019-03-27 19:19:22', '2019-03-27 19:19:22', null, null, '2019-03-27 19:19:22', null, null);
INSERT INTO `col_user` VALUES ('394', '90901', null, null, null, null, null, '2019-03-27 19:19:34', '2019-03-27 19:19:34', null, null, '2019-03-27 19:19:34', null, null);
INSERT INTO `col_user` VALUES ('395', '52267', null, null, null, null, null, '2019-03-27 19:19:44', '2019-03-27 19:19:44', null, null, '2019-03-27 19:19:44', null, null);
INSERT INTO `col_user` VALUES ('396', '44575', null, null, null, null, null, '2019-03-27 19:19:51', '2019-03-27 19:19:51', null, null, '2019-03-27 19:19:51', null, null);
INSERT INTO `col_user` VALUES ('397', '64646', null, null, null, null, null, '2019-03-27 19:20:35', '2019-03-27 19:20:35', null, null, '2019-03-27 19:20:35', null, null);
INSERT INTO `col_user` VALUES ('398', '40557', null, null, null, null, null, '2019-03-27 19:21:16', '2019-03-27 19:21:16', null, null, '2019-03-27 19:21:16', null, null);
INSERT INTO `col_user` VALUES ('399', '14172', null, null, null, null, null, '2019-03-27 19:23:12', '2019-03-27 19:23:12', null, null, '2019-03-27 19:23:12', null, null);
INSERT INTO `col_user` VALUES ('400', '78204', null, null, null, null, null, '2019-03-27 19:28:06', '2019-03-27 19:28:06', null, null, '2019-03-27 19:28:06', null, null);
INSERT INTO `col_user` VALUES ('401', '2571', null, null, null, null, null, '2019-03-27 19:28:13', '2019-03-27 19:28:13', null, null, '2019-03-27 19:28:13', null, null);
INSERT INTO `col_user` VALUES ('402', '66975', null, null, null, null, null, '2019-03-27 19:30:29', '2019-03-27 19:30:29', null, null, '2019-03-27 19:30:29', null, null);
INSERT INTO `col_user` VALUES ('403', '924', null, null, null, null, null, '2019-03-27 19:30:50', '2019-03-27 19:30:50', null, null, '2019-03-27 19:30:50', null, null);
INSERT INTO `col_user` VALUES ('404', '11853', null, null, null, null, null, '2019-03-27 19:31:23', '2019-03-27 19:31:23', null, null, '2019-03-27 19:31:23', null, null);
INSERT INTO `col_user` VALUES ('405', '40426', null, null, null, null, null, '2019-03-27 19:34:33', '2019-03-27 19:34:33', null, null, '2019-03-27 19:34:33', null, null);
INSERT INTO `col_user` VALUES ('406', '40276', null, null, null, null, null, '2019-03-27 19:35:49', '2019-03-27 19:35:49', null, null, '2019-03-27 19:35:49', null, null);
INSERT INTO `col_user` VALUES ('407', '63938', null, null, null, null, null, '2019-03-27 19:35:50', '2019-03-27 19:35:50', null, null, '2019-03-27 19:35:50', null, null);
INSERT INTO `col_user` VALUES ('408', '80606', null, null, null, null, null, '2019-03-27 19:36:10', '2019-03-27 19:36:10', null, null, '2019-03-27 19:36:10', null, null);
INSERT INTO `col_user` VALUES ('409', '28962', null, null, null, null, null, '2019-03-27 19:36:53', '2019-03-27 19:36:53', null, null, '2019-03-27 19:36:53', null, null);
INSERT INTO `col_user` VALUES ('410', '82819', null, null, null, null, null, '2019-03-27 19:37:14', '2019-03-27 19:37:14', null, null, '2019-03-27 19:37:14', null, null);
INSERT INTO `col_user` VALUES ('411', '43626', null, null, null, null, null, '2019-03-27 19:37:26', '2019-03-27 19:37:26', null, null, '2019-03-27 19:37:26', null, null);
INSERT INTO `col_user` VALUES ('412', '53899', null, null, null, null, null, '2019-03-27 19:42:56', '2019-03-27 19:42:56', null, null, '2019-03-27 19:42:56', null, null);
INSERT INTO `col_user` VALUES ('413', '46859', null, null, null, null, null, '2019-03-27 19:46:19', '2019-03-27 19:46:19', null, null, '2019-03-27 19:46:19', null, null);
INSERT INTO `col_user` VALUES ('414', '87393', null, null, null, null, null, '2019-03-27 19:46:26', '2019-03-27 19:46:26', null, null, '2019-03-27 19:46:26', null, null);
INSERT INTO `col_user` VALUES ('415', '65681', null, null, null, null, null, '2019-03-27 19:46:59', '2019-03-27 19:46:59', null, null, '2019-03-27 19:46:59', null, null);
INSERT INTO `col_user` VALUES ('416', '24725', null, null, null, null, null, '2019-03-27 19:47:13', '2019-03-27 19:47:13', null, null, '2019-03-27 19:47:13', null, null);
INSERT INTO `col_user` VALUES ('417', '25588', null, null, null, null, null, '2019-03-27 19:47:42', '2019-03-27 19:47:42', null, null, '2019-03-27 19:47:42', null, null);
INSERT INTO `col_user` VALUES ('418', '27164', null, null, null, null, null, '2019-03-27 19:47:46', '2019-03-27 19:47:46', null, null, '2019-03-27 19:47:46', null, null);
INSERT INTO `col_user` VALUES ('419', '87331', null, null, null, null, null, '2019-03-27 19:47:49', '2019-03-27 19:47:49', null, null, '2019-03-27 19:47:49', null, null);
INSERT INTO `col_user` VALUES ('420', '89485', null, null, null, null, null, '2019-03-27 19:47:54', '2019-03-27 19:47:54', null, null, '2019-03-27 19:47:54', null, null);
INSERT INTO `col_user` VALUES ('421', '52355', null, null, null, null, null, '2019-03-27 19:48:00', '2019-03-27 19:48:00', null, null, '2019-03-27 19:48:00', null, null);
INSERT INTO `col_user` VALUES ('422', '79923', null, null, null, null, null, '2019-03-27 19:48:28', '2019-03-27 19:48:28', null, null, '2019-03-27 19:48:28', null, null);
INSERT INTO `col_user` VALUES ('423', '54572', null, null, null, null, null, '2019-03-27 19:50:16', '2019-03-27 19:50:16', null, null, '2019-03-27 19:50:16', null, null);
INSERT INTO `col_user` VALUES ('424', '4017', null, null, null, null, null, '2019-03-27 19:50:28', '2019-03-27 19:50:28', null, null, '2019-03-27 19:50:28', null, null);
INSERT INTO `col_user` VALUES ('425', '81653', null, null, null, null, null, '2019-03-27 19:50:43', '2019-03-27 19:50:43', null, null, '2019-03-27 19:50:43', null, null);
INSERT INTO `col_user` VALUES ('426', '91629', null, null, null, null, null, '2019-03-27 19:51:32', '2019-03-27 19:51:32', null, null, '2019-03-27 19:51:32', null, null);
INSERT INTO `col_user` VALUES ('427', '74552', null, null, null, null, null, '2019-03-27 19:51:40', '2019-03-27 19:51:40', null, null, '2019-03-27 19:51:40', null, null);
INSERT INTO `col_user` VALUES ('428', '40248', null, null, null, null, null, '2019-03-27 19:51:43', '2019-03-27 19:51:43', null, null, '2019-03-27 19:51:43', null, null);
INSERT INTO `col_user` VALUES ('429', '77852', null, null, null, null, null, '2019-03-27 19:51:50', '2019-03-27 19:51:50', null, null, '2019-03-27 19:51:50', null, null);
INSERT INTO `col_user` VALUES ('430', '15860', null, null, null, null, null, '2019-03-27 19:52:30', '2019-03-27 19:52:30', null, null, '2019-03-27 19:52:30', null, null);
INSERT INTO `col_user` VALUES ('431', '66951', null, null, null, null, null, '2019-03-27 19:53:02', '2019-03-27 19:53:02', null, null, '2019-03-27 19:53:02', null, null);
INSERT INTO `col_user` VALUES ('432', '89791', null, null, null, null, null, '2019-03-27 19:53:09', '2019-03-27 19:53:09', null, null, '2019-03-27 19:53:09', null, null);
INSERT INTO `col_user` VALUES ('433', '6089', null, null, null, null, null, '2019-03-27 19:53:18', '2019-03-27 19:53:18', null, null, '2019-03-27 19:53:18', null, null);
INSERT INTO `col_user` VALUES ('434', '32626', null, null, null, null, null, '2019-03-27 19:54:17', '2019-03-27 19:54:17', null, null, '2019-03-27 19:54:17', null, null);
INSERT INTO `col_user` VALUES ('435', '92303', null, null, null, null, null, '2019-03-27 19:54:53', '2019-03-27 19:54:53', null, null, '2019-03-27 19:54:53', null, null);
INSERT INTO `col_user` VALUES ('436', '26248', null, null, null, null, null, '2019-03-27 19:55:02', '2019-03-27 19:55:02', null, null, '2019-03-27 19:55:02', null, null);
INSERT INTO `col_user` VALUES ('437', '49446', null, null, null, null, null, '2019-03-27 19:55:09', '2019-03-27 19:55:09', null, null, '2019-03-27 19:55:09', null, null);
INSERT INTO `col_user` VALUES ('438', '58430', null, null, null, null, null, '2019-03-27 19:55:17', '2019-03-27 19:55:17', null, null, '2019-03-27 19:55:17', null, null);
INSERT INTO `col_user` VALUES ('439', '94490', null, null, null, null, null, '2019-03-27 19:56:10', '2019-03-27 19:56:10', null, null, '2019-03-27 19:56:10', null, null);
INSERT INTO `col_user` VALUES ('440', '53074', null, null, null, null, null, '2019-03-27 19:56:19', '2019-03-27 19:56:19', null, null, '2019-03-27 19:56:19', null, null);
INSERT INTO `col_user` VALUES ('441', '72940', null, null, null, null, null, '2019-03-27 19:56:24', '2019-03-27 19:56:24', null, null, '2019-03-27 19:56:24', null, null);
INSERT INTO `col_user` VALUES ('442', '21209', null, null, null, null, null, '2019-03-27 19:57:00', '2019-03-27 19:57:00', null, null, '2019-03-27 19:57:00', null, null);
INSERT INTO `col_user` VALUES ('443', '11191', null, null, null, null, null, '2019-03-27 19:57:46', '2019-03-27 19:57:46', null, null, '2019-03-27 19:57:46', null, null);
INSERT INTO `col_user` VALUES ('444', '55217', null, null, null, null, null, '2019-03-27 19:57:51', '2019-03-27 19:57:51', null, null, '2019-03-27 19:57:51', null, null);
INSERT INTO `col_user` VALUES ('445', '93746', null, null, null, null, null, '2019-03-27 19:57:56', '2019-03-27 19:57:56', null, null, '2019-03-27 19:57:56', null, null);
INSERT INTO `col_user` VALUES ('446', '53179', null, null, null, null, null, '2019-03-27 19:58:54', '2019-03-27 19:58:54', null, null, '2019-03-27 19:58:54', null, null);
INSERT INTO `col_user` VALUES ('447', '73765', null, null, null, null, null, '2019-03-27 19:59:02', '2019-03-27 19:59:02', null, null, '2019-03-27 19:59:02', null, null);
INSERT INTO `col_user` VALUES ('448', '48666', null, null, null, null, null, '2019-03-27 20:00:04', '2019-03-27 20:00:04', null, null, '2019-03-27 20:00:04', null, null);
INSERT INTO `col_user` VALUES ('449', '73930', null, null, null, null, null, '2019-03-27 20:00:33', '2019-03-27 20:00:33', null, null, '2019-03-27 20:00:33', null, null);
INSERT INTO `col_user` VALUES ('450', '28424', null, null, null, null, null, '2019-03-27 20:01:15', '2019-03-27 20:01:15', null, null, '2019-03-27 20:01:15', null, null);
INSERT INTO `col_user` VALUES ('451', '17485', null, null, null, null, null, '2019-03-27 20:01:20', '2019-03-27 20:01:20', null, null, '2019-03-27 20:01:20', null, null);
INSERT INTO `col_user` VALUES ('452', '62636', null, null, null, null, null, '2019-03-27 20:01:40', '2019-03-27 20:01:40', null, null, '2019-03-27 20:01:40', null, null);
INSERT INTO `col_user` VALUES ('453', '55730', null, null, null, null, null, '2019-03-27 20:05:05', '2019-03-27 20:05:05', null, null, '2019-03-27 20:05:05', null, null);
INSERT INTO `col_user` VALUES ('454', '48004', null, null, null, null, null, '2019-03-27 20:05:09', '2019-03-27 20:05:09', null, null, '2019-03-27 20:05:09', null, null);
INSERT INTO `col_user` VALUES ('455', '28016', null, null, null, null, null, '2019-03-27 20:05:42', '2019-03-27 20:05:42', null, null, '2019-03-27 20:05:42', null, null);
INSERT INTO `col_user` VALUES ('456', '90418', null, null, null, null, null, '2019-03-27 20:06:01', '2019-03-27 20:06:01', null, null, '2019-03-27 20:06:01', null, null);
INSERT INTO `col_user` VALUES ('457', '5257', null, null, null, null, null, '2019-03-27 20:06:30', '2019-03-27 20:06:30', null, null, '2019-03-27 20:06:30', null, null);
INSERT INTO `col_user` VALUES ('458', '31877', null, null, null, null, null, '2019-03-27 20:07:23', '2019-03-27 20:07:23', null, null, '2019-03-27 20:07:23', null, null);
INSERT INTO `col_user` VALUES ('459', '79327', null, null, null, null, null, '2019-03-27 20:07:47', '2019-03-27 20:07:47', null, null, '2019-03-27 20:07:47', null, null);
INSERT INTO `col_user` VALUES ('460', '42710', null, null, null, null, null, '2019-03-27 20:07:52', '2019-03-27 20:07:52', null, null, '2019-03-27 20:07:52', null, null);
INSERT INTO `col_user` VALUES ('461', '68514', null, null, null, null, null, '2019-03-27 20:08:16', '2019-03-27 20:08:16', null, null, '2019-03-27 20:08:16', null, null);
INSERT INTO `col_user` VALUES ('462', '32679', null, null, null, null, null, '2019-03-27 20:08:19', '2019-03-27 20:08:19', null, null, '2019-03-27 20:08:19', null, null);
INSERT INTO `col_user` VALUES ('463', '47097', null, null, null, null, null, '2019-03-27 20:08:32', '2019-03-27 20:08:32', null, null, '2019-03-27 20:08:32', null, null);
INSERT INTO `col_user` VALUES ('464', '91842', null, null, null, null, null, '2019-03-27 20:08:48', '2019-03-27 20:08:48', null, null, '2019-03-27 20:08:48', null, null);
INSERT INTO `col_user` VALUES ('465', '47573', null, null, null, null, null, '2019-03-27 20:10:08', '2019-03-27 20:10:08', null, null, '2019-03-27 20:10:08', null, null);
INSERT INTO `col_user` VALUES ('466', '96540', null, null, null, null, null, '2019-03-27 20:10:11', '2019-03-27 20:10:11', null, null, '2019-03-27 20:10:11', null, null);
INSERT INTO `col_user` VALUES ('467', '73426', null, null, null, null, null, '2019-03-27 20:10:56', '2019-03-27 20:10:56', null, null, '2019-03-27 20:10:56', null, null);
INSERT INTO `col_user` VALUES ('468', '44162', null, null, null, null, null, '2019-03-27 20:12:25', '2019-03-27 20:12:25', null, null, '2019-03-27 20:12:25', null, null);
INSERT INTO `col_user` VALUES ('469', '26447', null, null, null, null, null, '2019-03-27 20:12:29', '2019-03-27 20:12:29', null, null, '2019-03-27 20:12:29', null, null);
INSERT INTO `col_user` VALUES ('470', '92639', null, null, null, null, null, '2019-03-27 20:13:50', '2019-03-27 20:13:50', null, null, '2019-03-27 20:13:50', null, null);
INSERT INTO `col_user` VALUES ('471', '19313', null, null, null, null, null, '2019-03-27 20:14:00', '2019-03-27 20:14:00', null, null, '2019-03-27 20:14:00', null, null);
INSERT INTO `col_user` VALUES ('472', '25168', null, null, null, null, null, '2019-03-27 20:14:04', '2019-03-27 20:14:04', null, null, '2019-03-27 20:14:04', null, null);
INSERT INTO `col_user` VALUES ('473', '77702', null, null, null, null, null, '2019-03-27 20:14:24', '2019-03-27 20:14:24', null, null, '2019-03-27 20:14:24', null, null);
INSERT INTO `col_user` VALUES ('474', '96707', null, null, null, null, null, '2019-03-27 20:14:29', '2019-03-27 20:14:29', null, null, '2019-03-27 20:14:29', null, null);
INSERT INTO `col_user` VALUES ('475', '99475', null, null, null, null, null, '2019-03-27 20:14:34', '2019-03-27 20:14:34', null, null, '2019-03-27 20:14:34', null, null);
INSERT INTO `col_user` VALUES ('476', '67956', null, null, null, null, null, '2019-03-27 20:14:46', '2019-03-27 20:14:46', null, null, '2019-03-27 20:14:46', null, null);
INSERT INTO `col_user` VALUES ('477', '69060', null, null, null, null, null, '2019-03-27 20:14:49', '2019-03-27 20:14:49', null, null, '2019-03-27 20:14:49', null, null);
INSERT INTO `col_user` VALUES ('478', '4320', null, null, null, null, null, '2019-03-27 20:16:56', '2019-03-27 20:16:56', null, null, '2019-03-27 20:16:56', null, null);
INSERT INTO `col_user` VALUES ('479', '84134', null, null, null, null, null, '2019-03-27 20:19:24', '2019-03-27 20:19:24', null, null, '2019-03-27 20:19:24', null, null);
INSERT INTO `col_user` VALUES ('480', '37049', null, null, null, null, null, '2019-03-27 20:19:29', '2019-03-27 20:19:29', null, null, '2019-03-27 20:19:29', null, null);
INSERT INTO `col_user` VALUES ('481', '63365', null, null, null, null, null, '2019-03-27 20:19:38', '2019-03-27 20:19:38', null, null, '2019-03-27 20:19:38', null, null);
INSERT INTO `col_user` VALUES ('482', '3194', null, null, null, null, null, '2019-03-27 20:19:39', '2019-03-27 20:19:39', null, null, '2019-03-27 20:19:39', null, null);
INSERT INTO `col_user` VALUES ('483', '60100', null, null, null, null, null, '2019-03-27 20:19:56', '2019-03-27 20:19:56', null, null, '2019-03-27 20:19:56', null, null);
INSERT INTO `col_user` VALUES ('484', '65336', null, null, null, null, null, '2019-03-27 20:20:17', '2019-03-27 20:20:17', null, null, '2019-03-27 20:20:17', null, null);
INSERT INTO `col_user` VALUES ('485', '84834', null, null, null, null, null, '2019-03-27 20:20:18', '2019-03-27 20:20:18', null, null, '2019-03-27 20:20:18', null, null);
INSERT INTO `col_user` VALUES ('486', '87960', null, null, null, null, null, '2019-03-27 20:20:21', '2019-03-27 20:20:21', null, null, '2019-03-27 20:20:21', null, null);
INSERT INTO `col_user` VALUES ('487', '49601', null, null, null, null, null, '2019-03-27 20:20:26', '2019-03-27 20:20:26', null, null, '2019-03-27 20:20:26', null, null);
INSERT INTO `col_user` VALUES ('488', '24204', null, null, null, null, null, '2019-03-27 20:20:29', '2019-03-27 20:20:29', null, null, '2019-03-27 20:20:29', null, null);
INSERT INTO `col_user` VALUES ('489', '15952', null, null, null, null, null, '2019-03-27 20:20:57', '2019-03-27 20:20:57', null, null, '2019-03-27 20:20:57', null, null);
INSERT INTO `col_user` VALUES ('490', '1902', null, null, null, null, null, '2019-03-27 20:21:09', '2019-03-27 20:21:09', null, null, '2019-03-27 20:21:09', null, null);
INSERT INTO `col_user` VALUES ('491', '43259', null, null, null, null, null, '2019-03-27 20:21:13', '2019-03-27 20:21:13', null, null, '2019-03-27 20:21:13', null, null);
INSERT INTO `col_user` VALUES ('492', '24787', null, null, null, null, null, '2019-03-27 20:21:31', '2019-03-27 20:21:31', null, null, '2019-03-27 20:21:31', null, null);
INSERT INTO `col_user` VALUES ('493', '63053', null, null, null, null, null, '2019-03-27 20:23:00', '2019-03-27 20:23:00', null, null, '2019-03-27 20:23:00', null, null);
INSERT INTO `col_user` VALUES ('494', '35256', null, null, null, null, null, '2019-03-27 20:23:04', '2019-03-27 20:23:04', null, null, '2019-03-27 20:23:04', null, null);
INSERT INTO `col_user` VALUES ('495', '76423', null, null, null, null, null, '2019-03-27 20:23:07', '2019-03-27 20:23:07', null, null, '2019-03-27 20:23:07', null, null);
INSERT INTO `col_user` VALUES ('496', '84647', null, null, null, null, null, '2019-03-27 20:25:14', '2019-03-27 20:25:14', null, null, '2019-03-27 20:25:14', null, null);
INSERT INTO `col_user` VALUES ('497', '5058', null, null, null, null, null, '2019-03-27 20:27:31', '2019-03-27 20:27:31', null, null, '2019-03-27 20:27:31', null, null);
INSERT INTO `col_user` VALUES ('498', '66564', null, null, null, null, null, '2019-03-27 20:27:33', '2019-03-27 20:27:33', null, null, '2019-03-27 20:27:33', null, null);
INSERT INTO `col_user` VALUES ('499', '87253', null, null, null, null, null, '2019-03-27 20:27:40', '2019-03-27 20:27:40', null, null, '2019-03-27 20:27:40', null, null);
INSERT INTO `col_user` VALUES ('500', '48153', null, null, null, null, null, '2019-03-27 20:28:32', '2019-03-27 20:28:32', null, null, '2019-03-27 20:28:32', null, null);
INSERT INTO `col_user` VALUES ('501', '1393', null, null, null, null, null, '2019-03-27 20:28:35', '2019-03-27 20:28:35', null, null, '2019-03-27 20:28:35', null, null);
INSERT INTO `col_user` VALUES ('502', '53629', null, null, null, null, null, '2019-03-27 20:29:00', '2019-03-27 20:29:00', null, null, '2019-03-27 20:29:00', null, null);
INSERT INTO `col_user` VALUES ('503', '84523', null, null, null, null, null, '2019-03-27 20:29:51', '2019-03-27 20:29:51', null, null, '2019-03-27 20:29:51', null, null);
INSERT INTO `col_user` VALUES ('504', '88296', null, null, null, null, null, '2019-03-27 20:30:12', '2019-03-27 20:30:12', null, null, '2019-03-27 20:30:12', null, null);
INSERT INTO `col_user` VALUES ('505', '63476', null, null, null, null, null, '2019-03-27 20:30:18', '2019-03-27 20:30:18', null, null, '2019-03-27 20:30:18', null, null);
INSERT INTO `col_user` VALUES ('506', '32408', null, null, null, null, null, '2019-03-27 20:31:57', '2019-03-27 20:31:57', null, null, '2019-03-27 20:31:57', null, null);
INSERT INTO `col_user` VALUES ('507', '88234', null, null, null, null, null, '2019-03-27 20:32:01', '2019-03-27 20:32:01', null, null, '2019-03-27 20:32:01', null, null);
INSERT INTO `col_user` VALUES ('508', '31893', null, null, null, null, null, '2019-03-27 20:32:13', '2019-03-27 20:32:13', null, null, '2019-03-27 20:32:13', null, null);
INSERT INTO `col_user` VALUES ('509', '87163', null, null, null, null, null, '2019-03-27 20:32:35', '2019-03-27 20:32:35', null, null, '2019-03-27 20:32:35', null, null);
INSERT INTO `col_user` VALUES ('510', '1322', null, null, null, null, null, '2019-03-27 20:32:36', '2019-03-27 20:32:36', null, null, '2019-03-27 20:32:36', null, null);
INSERT INTO `col_user` VALUES ('511', '1255', null, null, null, null, null, '2019-03-27 20:32:53', '2019-03-27 20:32:53', null, null, '2019-03-27 20:32:53', null, null);
INSERT INTO `col_user` VALUES ('512', '55779', null, null, null, null, null, '2019-03-27 20:32:55', '2019-03-27 20:32:55', null, null, '2019-03-27 20:32:55', null, null);
INSERT INTO `col_user` VALUES ('513', '60722', null, null, null, null, null, '2019-03-27 20:33:14', '2019-03-27 20:33:14', null, null, '2019-03-27 20:33:14', null, null);
INSERT INTO `col_user` VALUES ('514', '18373', null, null, null, null, null, '2019-03-27 20:33:41', '2019-03-27 20:33:41', null, null, '2019-03-27 20:33:41', null, null);
INSERT INTO `col_user` VALUES ('515', '51846', null, null, null, null, null, '2019-03-27 20:34:35', '2019-03-27 20:34:35', null, null, '2019-03-27 20:34:35', null, null);
INSERT INTO `col_user` VALUES ('516', '59914', null, null, null, null, null, '2019-03-27 20:34:42', '2019-03-27 20:34:42', null, null, '2019-03-27 20:34:42', null, null);
INSERT INTO `col_user` VALUES ('517', '94425', null, null, null, null, null, '2019-03-27 20:34:50', '2019-03-27 20:34:50', null, null, '2019-03-27 20:34:50', null, null);
INSERT INTO `col_user` VALUES ('518', '66025', null, null, null, null, null, '2019-03-27 20:34:56', '2019-03-27 20:34:56', null, null, '2019-03-27 20:34:56', null, null);
INSERT INTO `col_user` VALUES ('519', '5513', null, null, null, null, null, '2019-03-27 20:35:18', '2019-03-27 20:35:18', null, null, '2019-03-27 20:35:18', null, null);
INSERT INTO `col_user` VALUES ('520', '69251', null, null, null, null, null, '2019-03-27 20:35:40', '2019-03-27 20:35:40', null, null, '2019-03-27 20:35:40', null, null);
INSERT INTO `col_user` VALUES ('521', '66313', null, null, null, null, null, '2019-03-27 20:38:22', '2019-03-27 20:38:22', null, null, '2019-03-27 20:38:22', null, null);
INSERT INTO `col_user` VALUES ('522', '97000', null, null, null, null, null, '2019-03-27 20:38:26', '2019-03-27 20:38:26', null, null, '2019-03-27 20:38:26', null, null);
INSERT INTO `col_user` VALUES ('523', '6114', null, null, null, null, null, '2019-03-27 20:38:40', '2019-03-27 20:38:40', null, null, '2019-03-27 20:38:40', null, null);
INSERT INTO `col_user` VALUES ('524', '89984', null, null, null, null, null, '2019-03-27 20:38:46', '2019-03-27 20:38:46', null, null, '2019-03-27 20:38:46', null, null);
INSERT INTO `col_user` VALUES ('525', '60924', null, null, null, null, null, '2019-03-27 20:40:09', '2019-03-27 20:40:09', null, null, '2019-03-27 20:40:09', null, null);
INSERT INTO `col_user` VALUES ('526', '25729', null, null, null, null, null, '2019-03-27 20:40:17', '2019-03-27 20:40:17', null, null, '2019-03-27 20:40:17', null, null);
INSERT INTO `col_user` VALUES ('527', '28687', null, null, null, null, null, '2019-03-27 20:42:33', '2019-03-27 20:42:33', null, null, '2019-03-27 20:42:33', null, null);
INSERT INTO `col_user` VALUES ('528', '55367', null, null, null, null, null, '2019-03-27 20:46:03', '2019-03-27 20:46:03', null, null, '2019-03-27 20:46:03', null, null);
INSERT INTO `col_user` VALUES ('529', '12721', null, null, null, null, null, '2019-03-27 20:46:42', '2019-03-27 20:46:42', null, null, '2019-03-27 20:46:42', null, null);
INSERT INTO `col_user` VALUES ('530', '86355', null, null, null, null, null, '2019-03-27 20:46:46', '2019-03-27 20:46:46', null, null, '2019-03-27 20:46:46', null, null);
INSERT INTO `col_user` VALUES ('531', '10551', null, null, null, null, null, '2019-03-27 20:46:49', '2019-03-27 20:46:49', null, null, '2019-03-27 20:46:49', null, null);
INSERT INTO `col_user` VALUES ('532', '72692', null, null, null, null, null, '2019-03-27 20:46:52', '2019-03-27 20:46:52', null, null, '2019-03-27 20:46:52', null, null);
INSERT INTO `col_user` VALUES ('533', '83636', null, null, null, null, null, '2019-03-27 20:46:57', '2019-03-27 20:46:57', null, null, '2019-03-27 20:46:57', null, null);
INSERT INTO `col_user` VALUES ('534', '19916', null, null, null, null, null, '2019-03-27 20:47:02', '2019-03-27 20:47:02', null, null, '2019-03-27 20:47:02', null, null);
INSERT INTO `col_user` VALUES ('535', '50821', null, null, null, null, null, '2019-03-27 20:47:20', '2019-03-27 20:47:20', null, null, '2019-03-27 20:47:20', null, null);
INSERT INTO `col_user` VALUES ('536', '43738', null, null, null, null, null, '2019-03-27 20:47:43', '2019-03-27 20:47:43', null, null, '2019-03-27 20:47:43', null, null);
INSERT INTO `col_user` VALUES ('537', '10424', null, null, null, null, null, '2019-03-27 20:50:32', '2019-03-27 20:50:32', null, null, '2019-03-27 20:50:32', null, null);
INSERT INTO `col_user` VALUES ('538', '98461', null, null, null, null, null, '2019-03-27 20:50:49', '2019-03-27 20:50:49', null, null, '2019-03-27 20:50:49', null, null);
INSERT INTO `col_user` VALUES ('539', '65482', null, null, null, null, null, '2019-03-27 20:50:53', '2019-03-27 20:50:53', null, null, '2019-03-27 20:50:53', null, null);
INSERT INTO `col_user` VALUES ('540', '47186', null, null, null, null, null, '2019-03-27 20:51:03', '2019-03-27 20:51:03', null, null, '2019-03-27 20:51:03', null, null);
INSERT INTO `col_user` VALUES ('541', '33570', null, null, null, null, null, '2019-03-27 20:51:27', '2019-03-27 20:51:27', null, null, '2019-03-27 20:51:27', null, null);
INSERT INTO `col_user` VALUES ('542', '57608', null, null, null, null, null, '2019-03-27 20:51:32', '2019-03-27 20:51:32', null, null, '2019-03-27 20:51:32', null, null);
INSERT INTO `col_user` VALUES ('543', '30067', null, null, null, null, null, '2019-03-27 20:52:53', '2019-03-27 20:52:53', null, null, '2019-03-27 20:52:53', null, null);
INSERT INTO `col_user` VALUES ('544', '67587', null, null, null, null, null, '2019-03-27 20:53:04', '2019-03-27 20:53:04', null, null, '2019-03-27 20:53:04', null, null);
INSERT INTO `col_user` VALUES ('545', '58415', null, null, null, null, null, '2019-03-27 20:53:32', '2019-03-27 20:53:32', null, null, '2019-03-27 20:53:32', null, null);
INSERT INTO `col_user` VALUES ('546', '97101', null, null, null, null, null, '2019-03-27 20:53:36', '2019-03-27 20:53:36', null, null, '2019-03-27 20:53:36', null, null);
INSERT INTO `col_user` VALUES ('547', '66782', null, null, null, null, null, '2019-03-27 20:53:58', '2019-03-27 20:53:58', null, null, '2019-03-27 20:53:58', null, null);
INSERT INTO `col_user` VALUES ('548', '18900', null, null, null, null, null, '2019-03-27 20:55:02', '2019-03-27 20:55:02', null, null, '2019-03-27 20:55:02', null, null);
INSERT INTO `col_user` VALUES ('549', '55944', null, null, null, null, null, '2019-03-27 20:56:18', '2019-03-27 20:56:18', null, null, '2019-03-27 20:56:18', null, null);
INSERT INTO `col_user` VALUES ('550', '41061', null, null, null, null, null, '2019-03-27 20:56:56', '2019-03-27 20:56:56', null, null, '2019-03-27 20:56:56', null, null);
INSERT INTO `col_user` VALUES ('551', '4661', null, null, null, null, null, '2019-03-27 20:57:22', '2019-03-27 20:57:22', null, null, '2019-03-27 20:57:22', null, null);
INSERT INTO `col_user` VALUES ('552', '93936', null, null, null, null, null, '2019-03-27 20:58:11', '2019-03-27 20:58:11', null, null, '2019-03-27 20:58:11', null, null);
INSERT INTO `col_user` VALUES ('553', '82585', null, null, null, null, null, '2019-03-27 20:59:17', '2019-03-27 20:59:17', null, null, '2019-03-27 20:59:17', null, null);
INSERT INTO `col_user` VALUES ('554', '92996', null, null, null, null, null, '2019-03-27 20:59:36', '2019-03-27 20:59:36', null, null, '2019-03-27 20:59:36', null, null);
INSERT INTO `col_user` VALUES ('555', '77333', null, null, null, null, null, '2019-03-27 20:59:42', '2019-03-27 20:59:42', null, null, '2019-03-27 20:59:42', null, null);
INSERT INTO `col_user` VALUES ('556', '19087', null, null, null, null, null, '2019-03-27 20:59:46', '2019-03-27 20:59:46', null, null, '2019-03-27 20:59:46', null, null);
INSERT INTO `col_user` VALUES ('557', '97898', null, null, null, null, null, '2019-03-27 20:59:50', '2019-03-27 20:59:50', null, null, '2019-03-27 20:59:50', null, null);
INSERT INTO `col_user` VALUES ('558', '8575', null, null, null, null, null, '2019-03-27 20:59:53', '2019-03-27 20:59:53', null, null, '2019-03-27 20:59:53', null, null);
INSERT INTO `col_user` VALUES ('559', '34594', null, null, null, null, null, '2019-03-27 20:59:55', '2019-03-27 20:59:55', null, null, '2019-03-27 20:59:55', null, null);
INSERT INTO `col_user` VALUES ('560', '47625', null, null, null, null, null, '2019-03-27 20:59:59', '2019-03-27 20:59:59', null, null, '2019-03-27 20:59:59', null, null);
INSERT INTO `col_user` VALUES ('561', '3363', null, null, null, null, null, '2019-03-27 21:00:02', '2019-03-27 21:00:02', null, null, '2019-03-27 21:00:02', null, null);
INSERT INTO `col_user` VALUES ('562', '81105', null, null, null, null, null, '2019-03-27 21:00:09', '2019-03-27 21:00:09', null, null, '2019-03-27 21:00:09', null, null);
INSERT INTO `col_user` VALUES ('563', '78595', null, null, null, null, null, '2019-03-27 21:00:09', '2019-03-27 21:00:09', null, null, '2019-03-27 21:00:09', null, null);
INSERT INTO `col_user` VALUES ('564', '13143', null, null, null, null, null, '2019-03-27 21:00:18', '2019-03-27 21:00:18', null, null, '2019-03-27 21:00:18', null, null);
INSERT INTO `col_user` VALUES ('565', '7493', null, null, null, null, null, '2019-03-27 21:00:28', '2019-03-27 21:00:28', null, null, '2019-03-27 21:00:28', null, null);
INSERT INTO `col_user` VALUES ('566', '70978', null, null, null, null, null, '2019-03-27 21:00:37', '2019-03-27 21:00:37', null, null, '2019-03-27 21:00:37', null, null);
INSERT INTO `col_user` VALUES ('567', '52053', null, null, null, null, null, '2019-03-27 21:00:53', '2019-03-27 21:00:53', null, null, '2019-03-27 21:00:53', null, null);
INSERT INTO `col_user` VALUES ('568', '31818', null, null, null, null, null, '2019-03-27 21:00:58', '2019-03-27 21:00:58', null, null, '2019-03-27 21:00:58', null, null);
INSERT INTO `col_user` VALUES ('569', '30323', null, null, null, null, null, '2019-03-27 21:00:59', '2019-03-27 21:00:59', null, null, '2019-03-27 21:00:59', null, null);
INSERT INTO `col_user` VALUES ('570', '63533', null, null, null, null, null, '2019-03-27 21:01:06', '2019-03-27 21:01:06', null, null, '2019-03-27 21:01:06', null, null);
INSERT INTO `col_user` VALUES ('571', '50630', null, null, null, null, null, '2019-03-27 21:01:12', '2019-03-27 21:01:12', null, null, '2019-03-27 21:01:12', null, null);
INSERT INTO `col_user` VALUES ('572', '48318', null, null, null, null, null, '2019-03-27 21:01:15', '2019-03-27 21:01:15', null, null, '2019-03-27 21:01:15', null, null);
INSERT INTO `col_user` VALUES ('573', '1985', null, null, null, null, null, '2019-03-27 21:01:45', '2019-03-27 21:01:45', null, null, '2019-03-27 21:01:45', null, null);
INSERT INTO `col_user` VALUES ('574', '82628', null, null, null, null, null, '2019-03-27 21:03:28', '2019-03-27 21:03:28', null, null, '2019-03-27 21:03:28', null, null);
INSERT INTO `col_user` VALUES ('575', '92030', null, null, null, null, null, '2019-03-27 21:08:11', '2019-03-27 21:08:11', null, null, '2019-03-27 21:08:11', null, null);
INSERT INTO `col_user` VALUES ('576', '41510', null, null, null, null, null, '2019-03-27 21:21:32', '2019-03-27 21:21:32', null, null, '2019-03-27 21:21:32', null, null);
INSERT INTO `col_user` VALUES ('577', '50549', null, null, null, null, null, '2019-03-27 21:21:40', '2019-03-27 21:21:40', null, null, '2019-03-27 21:21:40', null, null);
INSERT INTO `col_user` VALUES ('578', '73066', null, null, null, null, null, '2019-03-27 21:22:24', '2019-03-27 21:22:24', null, null, '2019-03-27 21:22:24', null, null);
INSERT INTO `col_user` VALUES ('579', '4433', null, null, null, null, null, '2019-03-27 21:22:35', '2019-03-27 21:22:35', null, null, '2019-03-27 21:22:35', null, null);
INSERT INTO `col_user` VALUES ('580', '11521', null, null, null, null, null, '2019-03-27 21:22:50', '2019-03-27 21:22:50', null, null, '2019-03-27 21:22:50', null, null);
INSERT INTO `col_user` VALUES ('581', '99119', null, null, null, null, null, '2019-03-27 21:22:55', '2019-03-27 21:22:55', null, null, '2019-03-27 21:22:55', null, null);
INSERT INTO `col_user` VALUES ('582', '55059', null, null, null, null, null, '2019-03-27 21:23:07', '2019-03-27 21:23:07', null, null, '2019-03-27 21:23:07', null, null);
INSERT INTO `col_user` VALUES ('583', '36226', null, null, null, null, null, '2019-03-27 21:24:21', '2019-03-27 21:24:21', null, null, '2019-03-27 21:24:21', null, null);
INSERT INTO `col_user` VALUES ('584', '28769', null, null, null, null, null, '2019-03-27 21:43:04', '2019-03-27 21:43:04', null, null, '2019-03-27 21:43:04', null, null);
INSERT INTO `col_user` VALUES ('585', '83433', null, null, null, null, null, '2019-03-27 21:48:06', '2019-03-27 21:48:06', null, null, '2019-03-27 21:48:06', null, null);
INSERT INTO `col_user` VALUES ('586', '76072', null, null, null, null, null, '2019-03-28 01:49:17', '2019-03-28 01:49:17', null, null, '2019-03-28 01:49:17', null, null);
INSERT INTO `col_user` VALUES ('587', '65787', null, null, null, null, null, '2019-03-28 07:47:21', '2019-03-28 07:47:21', null, null, '2019-03-28 07:47:21', null, null);
INSERT INTO `col_user` VALUES ('588', '42879', null, null, null, null, null, '2019-03-28 07:47:27', '2019-03-28 07:47:27', null, null, '2019-03-28 07:47:27', null, null);
INSERT INTO `col_user` VALUES ('589', '47366', null, null, null, null, null, '2019-03-28 07:47:36', '2019-03-28 07:47:36', null, null, '2019-03-28 07:47:36', null, null);
INSERT INTO `col_user` VALUES ('590', '26877', null, null, null, null, null, '2019-03-28 08:21:19', '2019-03-28 08:21:19', null, null, '2019-03-28 08:21:19', null, null);
INSERT INTO `col_user` VALUES ('591', '88857', null, null, null, null, null, '2019-03-28 08:22:43', '2019-03-28 08:22:43', null, null, '2019-03-28 08:22:43', null, null);
INSERT INTO `col_user` VALUES ('592', '29291', null, null, null, null, null, '2019-03-28 08:23:29', '2019-03-28 08:23:29', null, null, '2019-03-28 08:23:29', null, null);
INSERT INTO `col_user` VALUES ('593', '6071', null, null, null, null, null, '2019-03-28 08:24:00', '2019-03-28 08:24:00', null, null, '2019-03-28 08:24:00', null, null);
INSERT INTO `col_user` VALUES ('594', '65150', null, null, null, null, null, '2019-03-28 08:24:04', '2019-03-28 08:24:04', null, null, '2019-03-28 08:24:04', null, null);
INSERT INTO `col_user` VALUES ('595', '7656', null, null, null, null, null, '2019-03-28 08:24:22', '2019-03-28 08:24:22', null, null, '2019-03-28 08:24:22', null, null);
INSERT INTO `col_user` VALUES ('596', '70492', null, null, null, null, null, '2019-03-28 08:24:34', '2019-03-28 08:24:34', null, null, '2019-03-28 08:24:34', null, null);
INSERT INTO `col_user` VALUES ('597', '8838', null, null, null, null, null, '2019-03-28 08:24:57', '2019-03-28 08:24:57', null, null, '2019-03-28 08:24:57', null, null);
INSERT INTO `col_user` VALUES ('598', '25182', null, null, null, null, null, '2019-03-28 08:27:16', '2019-03-28 08:27:16', null, null, '2019-03-28 08:27:16', null, null);
INSERT INTO `col_user` VALUES ('599', '39536', null, null, null, null, null, '2019-03-28 08:27:28', '2019-03-28 08:27:28', null, null, '2019-03-28 08:27:28', null, null);
INSERT INTO `col_user` VALUES ('600', '72989', null, null, null, null, null, '2019-03-28 08:27:31', '2019-03-28 08:27:31', null, null, '2019-03-28 08:27:31', null, null);
INSERT INTO `col_user` VALUES ('601', '1550', null, null, null, null, null, '2019-03-28 08:27:31', '2019-03-28 08:27:31', null, null, '2019-03-28 08:27:31', null, null);
INSERT INTO `col_user` VALUES ('602', '61782', null, null, null, null, null, '2019-03-28 08:27:33', '2019-03-28 08:27:33', null, null, '2019-03-28 08:27:33', null, null);
INSERT INTO `col_user` VALUES ('603', '355', null, null, null, null, null, '2019-03-28 08:27:35', '2019-03-28 08:27:35', null, null, '2019-03-28 08:27:35', null, null);
INSERT INTO `col_user` VALUES ('604', '95116', null, null, null, null, null, '2019-03-28 08:27:38', '2019-03-28 08:27:38', null, null, '2019-03-28 08:27:38', null, null);
INSERT INTO `col_user` VALUES ('605', '48742', null, null, null, null, null, '2019-03-28 08:27:57', '2019-03-28 08:27:57', null, null, '2019-03-28 08:27:57', null, null);
INSERT INTO `col_user` VALUES ('606', '70013', null, null, null, null, null, '2019-03-28 08:44:18', '2019-03-28 08:44:18', null, null, '2019-03-28 08:44:18', null, null);
INSERT INTO `col_user` VALUES ('607', '19716', null, null, null, null, null, '2019-03-28 08:51:54', '2019-03-28 08:51:54', null, null, '2019-03-28 08:51:54', null, null);
INSERT INTO `col_user` VALUES ('608', '36266', null, null, null, null, null, '2019-03-28 08:59:53', '2019-03-28 08:59:53', null, null, '2019-03-28 08:59:53', null, null);
INSERT INTO `col_user` VALUES ('609', '44193', null, null, null, null, null, '2019-03-28 09:01:00', '2019-03-28 09:01:00', null, null, '2019-03-28 09:01:00', null, null);
INSERT INTO `col_user` VALUES ('610', '24908', null, null, null, null, null, '2019-03-28 09:02:08', '2019-03-28 09:02:08', null, null, '2019-03-28 09:02:08', null, null);
INSERT INTO `col_user` VALUES ('611', '54661', null, null, null, null, null, '2019-03-28 09:05:17', '2019-03-28 09:05:17', null, null, '2019-03-28 09:05:17', null, null);
INSERT INTO `col_user` VALUES ('612', '8602', null, null, null, null, null, '2019-03-28 09:06:02', '2019-03-28 09:06:02', null, null, '2019-03-28 09:06:02', null, null);
INSERT INTO `col_user` VALUES ('613', '38813', null, null, null, null, null, '2019-03-28 09:06:46', '2019-03-28 09:06:46', null, null, '2019-03-28 09:06:46', null, null);
INSERT INTO `col_user` VALUES ('614', '98224', null, null, null, null, null, '2019-03-28 09:07:06', '2019-03-28 09:07:06', null, null, '2019-03-28 09:07:06', null, null);
INSERT INTO `col_user` VALUES ('615', '26539', null, null, null, null, null, '2019-03-28 09:07:06', '2019-03-28 09:07:06', null, null, '2019-03-28 09:07:06', null, null);
INSERT INTO `col_user` VALUES ('616', '34479', null, null, null, null, null, '2019-03-28 09:07:12', '2019-03-28 09:07:12', null, null, '2019-03-28 09:07:12', null, null);
INSERT INTO `col_user` VALUES ('617', '92869', null, null, null, null, null, '2019-03-28 09:07:53', '2019-03-28 09:07:53', null, null, '2019-03-28 09:07:53', null, null);
INSERT INTO `col_user` VALUES ('618', '88055', null, null, null, null, null, '2019-03-28 09:08:55', '2019-03-28 09:08:55', null, null, '2019-03-28 09:08:55', null, null);
INSERT INTO `col_user` VALUES ('619', '29509', null, null, null, null, null, '2019-03-28 09:25:33', '2019-03-28 09:25:33', null, null, '2019-03-28 09:25:33', null, null);
INSERT INTO `col_user` VALUES ('620', '13352', null, null, null, null, null, '2019-03-28 09:25:42', '2019-03-28 09:25:42', null, null, '2019-03-28 09:25:42', null, null);
INSERT INTO `col_user` VALUES ('621', '57818', null, null, null, null, null, '2019-03-28 09:27:42', '2019-03-28 09:27:42', null, null, '2019-03-28 09:27:42', null, null);
INSERT INTO `col_user` VALUES ('622', '61284', null, null, null, null, null, '2019-03-28 09:29:23', '2019-03-28 09:29:23', null, null, '2019-03-28 09:29:23', null, null);
INSERT INTO `col_user` VALUES ('623', '10375', null, null, null, null, null, '2019-03-28 09:29:32', '2019-03-28 09:29:32', null, null, '2019-03-28 09:29:32', null, null);
INSERT INTO `col_user` VALUES ('624', '91198', null, null, null, null, null, '2019-03-28 09:29:44', '2019-03-28 09:29:44', null, null, '2019-03-28 09:29:44', null, null);
INSERT INTO `col_user` VALUES ('625', '47199', null, null, null, null, null, '2019-03-28 09:29:49', '2019-03-28 09:29:49', null, null, '2019-03-28 09:29:49', null, null);
INSERT INTO `col_user` VALUES ('626', '34370', null, null, null, null, null, '2019-03-28 09:44:32', '2019-03-28 09:44:32', null, null, '2019-03-28 09:44:32', null, null);
INSERT INTO `col_user` VALUES ('627', '49384', null, null, null, null, null, '2019-03-28 09:44:38', '2019-03-28 09:44:38', null, null, '2019-03-28 09:44:38', null, null);
INSERT INTO `col_user` VALUES ('628', '88871', null, null, null, null, null, '2019-03-28 10:07:42', '2019-03-28 10:07:42', null, null, '2019-03-28 10:07:42', null, null);
INSERT INTO `col_user` VALUES ('629', '67378', null, null, null, null, null, '2019-03-28 10:09:10', '2019-03-28 10:09:10', null, null, '2019-03-28 10:09:10', null, null);
INSERT INTO `col_user` VALUES ('630', '4269', null, null, null, null, null, '2019-03-28 10:10:39', '2019-03-28 10:10:39', null, null, '2019-03-28 10:10:39', null, null);
INSERT INTO `col_user` VALUES ('631', '72065', null, null, null, null, null, '2019-03-28 10:10:55', '2019-03-28 10:10:55', null, null, '2019-03-28 10:10:55', null, null);
INSERT INTO `col_user` VALUES ('632', '64766', null, null, null, null, null, '2019-03-28 10:10:59', '2019-03-28 10:10:59', null, null, '2019-03-28 10:10:59', null, null);
INSERT INTO `col_user` VALUES ('633', '65606', null, null, null, null, null, '2019-03-28 10:12:31', '2019-03-28 10:12:31', null, null, '2019-03-28 10:12:31', null, null);
INSERT INTO `col_user` VALUES ('634', '72862', null, null, null, null, null, '2019-03-28 10:12:37', '2019-03-28 10:12:37', null, null, '2019-03-28 10:12:37', null, null);
INSERT INTO `col_user` VALUES ('635', '2380', null, null, null, null, null, '2019-03-28 10:17:30', '2019-03-28 10:17:30', null, null, '2019-03-28 10:17:30', null, null);
INSERT INTO `col_user` VALUES ('636', '9776', null, null, null, null, null, '2019-03-28 10:17:57', '2019-03-28 10:17:57', null, null, '2019-03-28 10:17:57', null, null);
INSERT INTO `col_user` VALUES ('637', '29225', null, null, null, null, null, '2019-03-28 10:18:22', '2019-03-28 10:18:22', null, null, '2019-03-28 10:18:22', null, null);
INSERT INTO `col_user` VALUES ('638', '55562', null, null, null, null, null, '2019-03-28 11:03:26', '2019-03-28 11:03:26', null, null, '2019-03-28 11:03:26', null, null);
INSERT INTO `col_user` VALUES ('639', '50490', null, null, null, null, null, '2019-03-28 11:14:02', '2019-03-28 11:14:02', null, null, '2019-03-28 11:14:02', null, null);
INSERT INTO `col_user` VALUES ('640', '62208', null, null, null, null, null, '2019-03-28 11:22:33', '2019-03-28 11:22:33', null, null, '2019-03-28 11:22:33', null, null);
INSERT INTO `col_user` VALUES ('641', '86509', null, null, null, null, null, '2019-03-28 11:22:38', '2019-03-28 11:22:38', null, null, '2019-03-28 11:22:38', null, null);
INSERT INTO `col_user` VALUES ('642', '97482', null, null, null, null, null, '2019-03-28 11:30:49', '2019-03-28 11:30:49', null, null, '2019-03-28 11:30:49', null, null);
INSERT INTO `col_user` VALUES ('643', '21209', null, null, null, null, null, '2019-03-28 13:27:40', '2019-03-28 13:27:40', null, null, '2019-03-28 13:27:40', null, null);
INSERT INTO `col_user` VALUES ('644', '85593', null, null, null, null, null, '2019-03-28 19:09:31', '2019-03-28 19:09:31', null, null, '2019-03-28 19:09:31', null, null);
INSERT INTO `col_user` VALUES ('645', '96555', null, null, null, null, null, '2019-03-29 11:34:36', '2019-03-29 11:34:36', null, null, '2019-03-29 11:34:36', null, null);
INSERT INTO `col_user` VALUES ('646', '94048', null, null, null, null, null, '2019-03-29 13:37:37', '2019-03-29 13:37:37', null, null, '2019-03-29 13:37:37', null, null);
INSERT INTO `col_user` VALUES ('647', '41168', null, null, null, null, null, '2019-03-29 13:37:42', '2019-03-29 13:37:42', null, null, '2019-03-29 13:37:42', null, null);
INSERT INTO `col_user` VALUES ('648', '34509', null, null, null, null, null, '2019-03-29 13:38:06', '2019-03-29 13:38:06', null, null, '2019-03-29 13:38:06', null, null);
INSERT INTO `col_user` VALUES ('649', '4918', null, null, null, null, null, '2019-03-29 13:38:40', '2019-03-29 13:38:40', null, null, '2019-03-29 13:38:40', null, null);
INSERT INTO `col_user` VALUES ('650', '83614', null, null, null, null, null, '2019-03-29 13:38:44', '2019-03-29 13:38:44', null, null, '2019-03-29 13:38:44', null, null);
INSERT INTO `col_user` VALUES ('651', '80382', null, null, null, null, null, '2019-03-29 13:47:16', '2019-03-29 13:47:16', null, null, '2019-03-29 13:47:16', null, null);
INSERT INTO `col_user` VALUES ('652', '27081', null, null, null, null, null, '2019-03-29 15:10:51', '2019-03-29 15:10:51', null, null, '2019-03-29 15:10:51', null, null);
INSERT INTO `col_user` VALUES ('653', '69106', null, null, null, null, null, '2019-03-29 23:32:24', '2019-03-29 23:32:24', null, null, '2019-03-29 23:32:24', null, null);
INSERT INTO `col_user` VALUES ('654', '36582', null, null, null, null, null, '2019-03-30 00:00:12', '2019-03-30 00:00:12', null, null, '2019-03-30 00:00:12', null, null);
INSERT INTO `col_user` VALUES ('655', '62146', null, null, null, null, null, '2019-03-30 00:00:27', '2019-03-30 00:00:27', null, null, '2019-03-30 00:00:27', null, null);
INSERT INTO `col_user` VALUES ('656', '81727', null, null, null, null, null, '2019-03-30 00:00:49', '2019-03-30 00:00:49', null, null, '2019-03-30 00:00:49', null, null);
INSERT INTO `col_user` VALUES ('657', '46468', null, null, null, null, null, '2019-03-30 00:00:57', '2019-03-30 00:00:57', null, null, '2019-03-30 00:00:57', null, null);
INSERT INTO `col_user` VALUES ('658', '42605', null, null, null, null, null, '2019-03-30 00:01:02', '2019-03-30 00:01:02', null, null, '2019-03-30 00:01:02', null, null);
INSERT INTO `col_user` VALUES ('659', '37131', null, null, null, null, null, '2019-03-30 00:14:35', '2019-03-30 00:14:35', null, null, '2019-03-30 00:14:35', null, null);
INSERT INTO `col_user` VALUES ('660', '24355', null, null, null, null, null, '2019-03-30 07:41:10', '2019-03-30 07:41:10', null, null, '2019-03-30 07:41:10', null, null);
INSERT INTO `col_user` VALUES ('661', '8459', null, null, null, null, null, '2019-03-30 15:48:27', '2019-03-30 15:48:27', null, null, '2019-03-30 15:48:27', null, null);
INSERT INTO `col_user` VALUES ('662', '5173', null, null, null, null, null, '2019-03-30 15:48:38', '2019-03-30 15:48:38', null, null, '2019-03-30 15:48:38', null, null);
INSERT INTO `col_user` VALUES ('663', '79641', null, null, null, null, null, '2019-03-30 15:48:42', '2019-03-30 15:48:42', null, null, '2019-03-30 15:48:42', null, null);
INSERT INTO `col_user` VALUES ('664', '38607', null, null, null, null, null, '2019-03-30 19:10:05', '2019-03-30 19:10:05', null, null, '2019-03-30 19:10:05', null, null);
INSERT INTO `col_user` VALUES ('665', '42489', null, null, null, null, null, '2019-03-30 20:50:24', '2019-03-30 20:50:24', null, null, '2019-03-30 20:50:24', null, null);
INSERT INTO `col_user` VALUES ('666', '14220', null, null, null, null, null, '2019-03-31 10:49:26', '2019-03-31 10:49:26', null, null, '2019-03-31 10:49:26', null, null);
INSERT INTO `col_user` VALUES ('667', '62189', null, null, null, null, null, '2019-03-31 10:50:30', '2019-03-31 10:50:30', null, null, '2019-03-31 10:50:30', null, null);
INSERT INTO `col_user` VALUES ('668', '51909', null, null, null, null, null, '2019-03-31 10:51:36', '2019-03-31 10:51:36', null, null, '2019-03-31 10:51:36', null, null);
INSERT INTO `col_user` VALUES ('669', '27260', null, null, null, null, null, '2019-03-31 10:58:35', '2019-03-31 10:58:35', null, null, '2019-03-31 10:58:35', null, null);
INSERT INTO `col_user` VALUES ('670', '86881', null, null, null, null, null, '2019-03-31 17:11:50', '2019-03-31 17:11:50', null, null, '2019-03-31 17:11:50', null, null);
INSERT INTO `col_user` VALUES ('671', '70238', null, null, null, null, null, '2019-03-31 17:12:56', '2019-03-31 17:12:56', null, null, '2019-03-31 17:12:56', null, null);
INSERT INTO `col_user` VALUES ('672', '54473', null, null, null, null, null, '2019-03-31 22:29:47', '2019-03-31 22:29:47', null, null, '2019-03-31 22:29:47', null, null);
INSERT INTO `col_user` VALUES ('673', '26480', null, null, null, null, null, '2019-03-31 22:29:57', '2019-03-31 22:29:57', null, null, '2019-03-31 22:29:57', null, null);
INSERT INTO `col_user` VALUES ('674', '49757', null, null, null, null, null, '2019-04-01 09:10:34', '2019-04-01 09:10:34', null, null, '2019-04-01 09:10:34', null, null);
INSERT INTO `col_user` VALUES ('675', '28177', null, null, null, null, null, '2019-04-01 09:10:46', '2019-04-01 09:10:46', null, null, '2019-04-01 09:10:46', null, null);
INSERT INTO `col_user` VALUES ('676', '16426', null, null, null, null, null, '2019-04-01 09:10:52', '2019-04-01 09:10:52', null, null, '2019-04-01 09:10:52', null, null);
INSERT INTO `col_user` VALUES ('677', '98077', null, null, null, null, null, '2019-04-01 09:10:56', '2019-04-01 09:10:56', null, null, '2019-04-01 09:10:56', null, null);
INSERT INTO `col_user` VALUES ('678', '80981', null, null, null, null, null, '2019-04-01 10:08:36', '2019-04-01 10:08:36', null, null, '2019-04-01 10:08:36', null, null);
INSERT INTO `col_user` VALUES ('679', '72963', null, null, null, null, null, '2019-04-01 10:08:42', '2019-04-01 10:08:42', null, null, '2019-04-01 10:08:42', null, null);
INSERT INTO `col_user` VALUES ('680', '49552', null, null, null, null, null, '2019-04-01 10:08:48', '2019-04-01 10:08:48', null, null, '2019-04-01 10:08:48', null, null);
INSERT INTO `col_user` VALUES ('681', '26472', null, null, null, null, null, '2019-04-01 10:08:53', '2019-04-01 10:08:53', null, null, '2019-04-01 10:08:53', null, null);
INSERT INTO `col_user` VALUES ('682', '66160', null, null, null, null, null, '2019-04-01 10:09:06', '2019-04-01 10:09:06', null, null, '2019-04-01 10:09:06', null, null);
INSERT INTO `col_user` VALUES ('683', '50190', null, null, null, null, null, '2019-04-01 10:09:12', '2019-04-01 10:09:12', null, null, '2019-04-01 10:09:12', null, null);
INSERT INTO `col_user` VALUES ('684', '59092', null, null, null, null, null, '2019-04-01 10:14:57', '2019-04-01 10:14:57', null, null, '2019-04-01 10:14:57', null, null);
INSERT INTO `col_user` VALUES ('685', '44226', null, null, null, null, null, '2019-04-01 10:15:00', '2019-04-01 10:15:00', null, null, '2019-04-01 10:15:00', null, null);
INSERT INTO `col_user` VALUES ('686', '58939', null, null, null, null, null, '2019-04-01 10:15:05', '2019-04-01 10:15:05', null, null, '2019-04-01 10:15:05', null, null);
INSERT INTO `col_user` VALUES ('687', '85613', null, null, null, null, null, '2019-04-01 10:15:08', '2019-04-01 10:15:08', null, null, '2019-04-01 10:15:08', null, null);
INSERT INTO `col_user` VALUES ('688', '97955', null, null, null, null, null, '2019-04-01 10:16:58', '2019-04-01 10:16:58', null, null, '2019-04-01 10:16:58', null, null);
INSERT INTO `col_user` VALUES ('689', '65053', null, null, null, null, null, '2019-04-01 10:19:49', '2019-04-01 10:19:49', null, null, '2019-04-01 10:19:49', null, null);
INSERT INTO `col_user` VALUES ('690', '21761', null, null, null, null, null, '2019-04-01 10:19:53', '2019-04-01 10:19:53', null, null, '2019-04-01 10:19:53', null, null);
INSERT INTO `col_user` VALUES ('691', '17049', null, null, null, null, null, '2019-04-01 10:20:02', '2019-04-01 10:20:02', null, null, '2019-04-01 10:20:02', null, null);
INSERT INTO `col_user` VALUES ('692', '34566', null, null, null, null, null, '2019-04-01 10:20:02', '2019-04-01 10:20:02', null, null, '2019-04-01 10:20:02', null, null);
INSERT INTO `col_user` VALUES ('693', '89052', null, null, null, null, null, '2019-04-01 10:20:06', '2019-04-01 10:20:06', null, null, '2019-04-01 10:20:06', null, null);
INSERT INTO `col_user` VALUES ('694', '65238', null, null, null, null, null, '2019-04-01 10:20:12', '2019-04-01 10:20:12', null, null, '2019-04-01 10:20:12', null, null);
INSERT INTO `col_user` VALUES ('695', '18485', null, null, null, null, null, '2019-04-01 10:25:00', '2019-04-01 10:25:00', null, null, '2019-04-01 10:25:00', null, null);
INSERT INTO `col_user` VALUES ('696', '4766', null, null, null, null, null, '2019-04-01 10:25:07', '2019-04-01 10:25:07', null, null, '2019-04-01 10:25:07', null, null);
INSERT INTO `col_user` VALUES ('697', '10956', null, null, null, null, null, '2019-04-01 10:25:08', '2019-04-01 10:25:08', null, null, '2019-04-01 10:25:08', null, null);
INSERT INTO `col_user` VALUES ('698', '22939', null, null, null, null, null, '2019-04-01 10:25:17', '2019-04-01 10:25:17', null, null, '2019-04-01 10:25:17', null, null);
INSERT INTO `col_user` VALUES ('699', '96873', null, null, null, null, null, '2019-04-01 10:25:25', '2019-04-01 10:25:25', null, null, '2019-04-01 10:25:25', null, null);
INSERT INTO `col_user` VALUES ('700', '89870', null, null, null, null, null, '2019-04-01 10:25:32', '2019-04-01 10:25:32', null, null, '2019-04-01 10:25:32', null, null);
INSERT INTO `col_user` VALUES ('701', '9619', null, null, null, null, null, '2019-04-01 10:25:43', '2019-04-01 10:25:43', null, null, '2019-04-01 10:25:43', null, null);
INSERT INTO `col_user` VALUES ('702', '50891', null, null, null, null, null, '2019-04-01 10:25:45', '2019-04-01 10:25:45', null, null, '2019-04-01 10:25:45', null, null);
INSERT INTO `col_user` VALUES ('703', '63430', null, null, null, null, null, '2019-04-01 10:25:46', '2019-04-01 10:25:46', null, null, '2019-04-01 10:25:46', null, null);
INSERT INTO `col_user` VALUES ('704', '98298', null, null, null, null, null, '2019-04-01 10:25:50', '2019-04-01 10:25:50', null, null, '2019-04-01 10:25:50', null, null);
INSERT INTO `col_user` VALUES ('705', '14754', null, null, null, null, null, '2019-04-01 10:27:10', '2019-04-01 10:27:10', null, null, '2019-04-01 10:27:10', null, null);
INSERT INTO `col_user` VALUES ('706', '28209', null, null, null, null, null, '2019-04-01 10:27:26', '2019-04-01 10:27:26', null, null, '2019-04-01 10:27:26', null, null);
INSERT INTO `col_user` VALUES ('707', '95383', null, null, null, null, null, '2019-04-01 10:27:27', '2019-04-01 10:27:27', null, null, '2019-04-01 10:27:27', null, null);
INSERT INTO `col_user` VALUES ('708', '56756', null, null, null, null, null, '2019-04-01 10:28:35', '2019-04-01 10:28:35', null, null, '2019-04-01 10:28:35', null, null);
INSERT INTO `col_user` VALUES ('709', '73349', null, null, null, null, null, '2019-04-01 10:34:14', '2019-04-01 10:34:14', null, null, '2019-04-01 10:34:14', null, null);
INSERT INTO `col_user` VALUES ('710', '864', null, null, null, null, null, '2019-04-01 10:34:14', '2019-04-01 10:34:14', null, null, '2019-04-01 10:34:14', null, null);
INSERT INTO `col_user` VALUES ('711', '18050', null, null, null, null, null, '2019-04-01 10:37:12', '2019-04-01 10:37:12', null, null, '2019-04-01 10:37:12', null, null);
INSERT INTO `col_user` VALUES ('712', '37328', null, null, null, null, null, '2019-04-01 10:50:16', '2019-04-01 10:50:16', null, null, '2019-04-01 10:50:16', null, null);
INSERT INTO `col_user` VALUES ('713', '6418', null, null, null, null, null, '2019-04-01 10:50:17', '2019-04-01 10:50:17', null, null, '2019-04-01 10:50:17', null, null);
INSERT INTO `col_user` VALUES ('714', '47770', null, null, null, null, null, '2019-04-01 10:50:18', '2019-04-01 10:50:18', null, null, '2019-04-01 10:50:18', null, null);
INSERT INTO `col_user` VALUES ('715', '34626', null, null, null, null, null, '2019-04-01 10:51:56', '2019-04-01 10:51:56', null, null, '2019-04-01 10:51:56', null, null);
INSERT INTO `col_user` VALUES ('716', '44573', null, null, null, null, null, '2019-04-01 11:08:35', '2019-04-01 11:08:35', null, null, '2019-04-01 11:08:35', null, null);
INSERT INTO `col_user` VALUES ('717', '72737', null, null, null, null, null, '2019-04-01 11:08:44', '2019-04-01 11:08:44', null, null, '2019-04-01 11:08:44', null, null);
INSERT INTO `col_user` VALUES ('718', '34848', null, null, null, null, null, '2019-04-01 11:09:00', '2019-04-01 11:09:00', null, null, '2019-04-01 11:09:00', null, null);
INSERT INTO `col_user` VALUES ('719', '6635', null, null, null, null, null, '2019-04-01 11:09:24', '2019-04-01 11:09:24', null, null, '2019-04-01 11:09:24', null, null);
INSERT INTO `col_user` VALUES ('720', '6791', null, null, null, null, null, '2019-04-01 11:58:12', '2019-04-01 11:58:12', null, null, '2019-04-01 11:58:12', null, null);
INSERT INTO `col_user` VALUES ('721', null, null, null, null, null, null, '2019-04-03 10:58:31', '2019-04-03 10:58:31', null, null, '2019-04-03 10:58:31', null, null);
INSERT INTO `col_user` VALUES ('722', null, null, null, null, null, null, '2019-04-03 11:07:18', '2019-04-03 11:07:18', null, null, '2019-04-03 11:07:18', null, null);
INSERT INTO `col_user` VALUES ('723', null, null, null, null, null, null, '2019-04-03 11:07:21', '2019-04-03 11:07:21', null, null, '2019-04-03 11:07:21', null, null);
INSERT INTO `col_user` VALUES ('724', null, null, null, null, null, null, '2019-04-03 11:07:58', '2019-04-03 11:07:58', null, null, '2019-04-03 11:07:58', null, null);
INSERT INTO `col_user` VALUES ('725', null, null, null, null, null, null, '2019-04-03 11:12:17', '2019-04-03 11:12:17', null, null, '2019-04-03 11:12:17', null, null);
INSERT INTO `col_user` VALUES ('726', null, null, null, null, null, null, '2019-04-03 11:13:57', '2019-04-03 11:13:57', null, null, '2019-04-03 11:13:57', null, null);
INSERT INTO `col_user` VALUES ('727', null, null, null, null, null, null, '2019-04-03 11:14:23', '2019-04-03 11:14:23', null, null, '2019-04-03 11:14:23', null, null);
INSERT INTO `col_user` VALUES ('728', null, null, null, null, null, null, '2019-04-03 11:42:14', '2019-04-03 11:42:14', null, null, '2019-04-03 11:42:14', null, null);
INSERT INTO `col_user` VALUES ('729', null, null, null, null, null, null, '2019-04-03 11:49:41', '2019-04-03 11:49:41', null, null, '2019-04-03 11:49:41', null, null);
INSERT INTO `col_user` VALUES ('730', null, null, null, null, null, null, '2019-04-03 11:54:47', '2019-04-03 11:54:47', null, null, '2019-04-03 11:54:47', null, null);
INSERT INTO `col_user` VALUES ('731', null, null, null, null, null, null, '2019-04-03 13:14:47', '2019-04-03 13:14:47', null, null, '2019-04-03 13:14:47', null, null);
INSERT INTO `col_user` VALUES ('732', null, null, null, null, null, null, '2019-04-03 13:17:26', '2019-04-03 13:17:26', null, null, '2019-04-03 13:17:26', null, null);
INSERT INTO `col_user` VALUES ('733', null, null, null, null, null, null, '2019-04-03 13:17:57', '2019-04-03 13:17:57', null, null, '2019-04-03 13:17:57', null, null);
INSERT INTO `col_user` VALUES ('734', '15180', null, null, null, null, null, '2019-04-03 13:38:08', '2019-04-03 13:38:08', null, null, '2019-04-03 13:38:08', null, null);
INSERT INTO `col_user` VALUES ('735', '57791', null, null, null, null, null, '2019-04-03 14:58:49', '2019-04-03 14:58:49', null, null, '2019-04-03 14:58:49', null, null);
INSERT INTO `col_user` VALUES ('736', '20763', null, null, null, null, null, '2019-04-03 15:02:29', '2019-04-03 15:02:29', null, null, '2019-04-03 15:02:29', null, null);
INSERT INTO `col_user` VALUES ('737', '11590', null, null, null, null, null, '2019-04-03 15:08:20', '2019-04-03 15:08:20', null, null, '2019-04-03 15:08:20', null, null);
INSERT INTO `col_user` VALUES ('738', '35133', null, null, null, null, null, '2019-04-03 15:08:29', '2019-04-03 15:08:29', null, null, '2019-04-03 15:08:29', null, null);
INSERT INTO `col_user` VALUES ('739', '98968', null, null, null, null, null, '2019-04-03 15:08:44', '2019-04-03 15:08:44', null, null, '2019-04-03 15:08:44', null, null);
INSERT INTO `col_user` VALUES ('740', '11649', null, null, null, null, null, '2019-04-03 15:11:33', '2019-04-03 15:11:33', null, null, '2019-04-03 15:11:33', null, null);
INSERT INTO `col_user` VALUES ('741', '99554', null, null, null, null, null, '2019-04-03 15:11:38', '2019-04-03 15:11:38', null, null, '2019-04-03 15:11:38', null, null);
INSERT INTO `col_user` VALUES ('742', '12988', null, null, null, null, null, '2019-04-03 15:11:43', '2019-04-03 15:11:43', null, null, '2019-04-03 15:11:43', null, null);
INSERT INTO `col_user` VALUES ('743', '94567', null, null, null, null, null, '2019-04-03 15:13:16', '2019-04-03 15:13:16', null, null, '2019-04-03 15:13:16', null, null);
INSERT INTO `col_user` VALUES ('744', '94145', null, null, null, null, null, '2019-04-03 15:13:23', '2019-04-03 15:13:23', null, null, '2019-04-03 15:13:23', null, null);
INSERT INTO `col_user` VALUES ('745', '40671', null, null, null, null, null, '2019-04-03 15:13:50', '2019-04-03 15:13:50', null, null, '2019-04-03 15:13:50', null, null);
INSERT INTO `col_user` VALUES ('746', '44762', null, null, null, null, null, '2019-04-03 15:13:54', '2019-04-03 15:13:54', null, null, '2019-04-03 15:13:54', null, null);
INSERT INTO `col_user` VALUES ('747', '47659', null, null, null, null, null, '2019-04-03 15:29:30', '2019-04-03 15:29:30', null, null, '2019-04-03 15:29:30', null, null);
INSERT INTO `col_user` VALUES ('748', '19544', null, null, null, null, null, '2019-04-03 15:30:02', '2019-04-03 15:30:02', null, null, '2019-04-03 15:30:02', null, null);
INSERT INTO `col_user` VALUES ('749', '59685', null, null, null, null, null, '2019-04-03 15:30:09', '2019-04-03 15:30:09', null, null, '2019-04-03 15:30:09', null, null);
INSERT INTO `col_user` VALUES ('750', '68583', null, null, null, null, null, '2019-04-03 15:30:49', '2019-04-03 15:30:49', null, null, '2019-04-03 15:30:49', null, null);
INSERT INTO `col_user` VALUES ('751', '22090', null, null, null, null, null, '2019-04-03 15:30:53', '2019-04-03 15:30:53', null, null, '2019-04-03 15:30:53', null, null);
INSERT INTO `col_user` VALUES ('752', '95294', null, null, null, null, null, '2019-04-03 15:30:57', '2019-04-03 15:30:57', null, null, '2019-04-03 15:30:57', null, null);
INSERT INTO `col_user` VALUES ('753', '48433', null, null, null, null, null, '2019-04-03 15:33:00', '2019-04-03 15:33:00', null, null, '2019-04-03 15:33:00', null, null);
INSERT INTO `col_user` VALUES ('754', '36144', null, null, null, null, null, '2019-04-04 10:07:34', '2019-04-04 10:07:34', null, null, '2019-04-04 10:07:34', null, null);
INSERT INTO `col_user` VALUES ('755', '71013', null, null, null, null, null, '2019-04-04 10:07:50', '2019-04-04 10:07:50', null, null, '2019-04-04 10:07:50', null, null);
INSERT INTO `col_user` VALUES ('756', '94005', null, null, null, null, null, '2019-04-04 10:08:20', '2019-04-04 10:08:20', null, null, '2019-04-04 10:08:20', null, null);
INSERT INTO `col_user` VALUES ('757', '49233', null, null, null, null, null, '2019-04-04 10:08:28', '2019-04-04 10:08:28', null, null, '2019-04-04 10:08:28', null, null);
INSERT INTO `col_user` VALUES ('758', '46936', null, null, null, null, null, '2019-04-04 10:19:13', '2019-04-04 10:19:13', null, null, '2019-04-04 10:19:13', null, null);
INSERT INTO `col_user` VALUES ('759', '67570', null, null, null, null, null, '2019-04-04 10:19:39', '2019-04-04 10:19:39', null, null, '2019-04-04 10:19:39', null, null);
INSERT INTO `col_user` VALUES ('760', '53319', null, null, null, null, null, '2019-04-04 10:20:12', '2019-04-04 10:20:12', null, null, '2019-04-04 10:20:12', null, null);
INSERT INTO `col_user` VALUES ('761', '1919', null, null, null, null, null, '2019-04-04 10:20:25', '2019-04-04 10:20:25', null, null, '2019-04-04 10:20:25', null, null);
INSERT INTO `col_user` VALUES ('762', '53012', null, null, null, null, null, '2019-04-04 10:20:33', '2019-04-04 10:20:33', null, null, '2019-04-04 10:20:33', null, null);
INSERT INTO `col_user` VALUES ('763', '76699', null, null, null, null, null, '2019-04-04 10:23:05', '2019-04-04 10:23:05', null, null, '2019-04-04 10:23:05', null, null);
INSERT INTO `col_user` VALUES ('764', '66379', null, null, null, null, null, '2019-04-04 10:23:08', '2019-04-04 10:23:08', null, null, '2019-04-04 10:23:08', null, null);
INSERT INTO `col_user` VALUES ('765', '4983', null, null, null, null, null, '2019-04-04 10:23:18', '2019-04-04 10:23:18', null, null, '2019-04-04 10:23:18', null, null);
INSERT INTO `col_user` VALUES ('766', '22036', null, null, null, null, null, '2019-04-04 10:23:23', '2019-04-04 10:23:23', null, null, '2019-04-04 10:23:23', null, null);
INSERT INTO `col_user` VALUES ('767', '9457', null, null, null, null, null, '2019-04-04 10:23:54', '2019-04-04 10:23:54', null, null, '2019-04-04 10:23:54', null, null);
INSERT INTO `col_user` VALUES ('768', '44438', null, null, null, null, null, '2019-04-04 10:24:32', '2019-04-04 10:24:32', null, null, '2019-04-04 10:24:32', null, null);
INSERT INTO `col_user` VALUES ('769', '64405', null, null, null, null, null, '2019-04-04 10:24:34', '2019-04-04 10:24:34', null, null, '2019-04-04 10:24:34', null, null);
INSERT INTO `col_user` VALUES ('770', '7613', null, null, null, null, null, '2019-04-04 10:26:23', '2019-04-04 10:26:23', null, null, '2019-04-04 10:26:23', null, null);
INSERT INTO `col_user` VALUES ('771', '70216', null, null, null, null, null, '2019-04-04 10:26:36', '2019-04-04 10:26:36', null, null, '2019-04-04 10:26:36', null, null);
INSERT INTO `col_user` VALUES ('773', 'oStH1t-2Z-BmX33Mo0IeP0NRpiUg', null, null, null, null, null, '2019-04-04 14:21:11', '2019-04-04 14:21:11', null, null, '2019-04-16 09:02:05', null, null);
INSERT INTO `col_user` VALUES ('774', 'oStH1t-2Z-BmX33Mo0IeP0NRpiUg', null, null, null, null, null, '2019-04-04 14:31:26', '2019-04-04 14:31:26', null, null, '2019-04-04 14:31:26', null, null);
INSERT INTO `col_user` VALUES ('775', 'oStH1t-2Z-BmX33Mo0IeP0NRpiUg', null, null, null, null, null, '2019-04-04 14:44:40', '2019-04-04 14:44:40', null, null, '2019-04-04 14:44:40', null, null);
INSERT INTO `col_user` VALUES ('776', 'oStH1t-2Z-BmX33Mo0IeP0NRpiUg', null, null, null, null, null, '2019-04-04 14:50:48', '2019-04-04 14:50:48', null, null, '2019-04-04 14:50:48', null, null);
INSERT INTO `col_user` VALUES ('777', 'oStH1t-2Z-BmX33Mo0IeP0NRpiUg', null, null, null, null, null, '2019-04-04 14:51:31', '2019-04-04 14:51:31', null, null, '2019-04-04 14:51:31', null, null);
INSERT INTO `col_user` VALUES ('778', 'oStH1t-2Z-BmX33Mo0IeP0NRpiUg', null, null, null, null, null, '2019-04-04 15:28:05', '2019-04-04 15:28:05', null, null, '2019-04-04 15:28:05', null, null);
INSERT INTO `col_user` VALUES ('779', 'oStH1t-5F-jRtiCo2hNc10uRvhOQ', null, null, null, null, null, '2019-04-04 20:18:16', '2019-04-04 20:18:16', null, null, '2019-04-09 08:45:07', null, null);
INSERT INTO `col_user` VALUES ('780', 'oStH1t-9-glG9if8y4teUmSr4Atc', null, null, null, null, null, '2019-04-05 09:15:11', '2019-04-05 09:15:11', null, null, '2019-04-05 09:15:11', null, null);
INSERT INTO `col_user` VALUES ('781', 'oStH1t5mt1GZEIiqp18ZsBWDuLyU', null, null, null, null, null, '2019-04-05 12:35:13', '2019-04-05 12:35:13', null, null, '2019-04-05 12:35:19', null, null);
INSERT INTO `col_user` VALUES ('782', 'oStH1tz2ETgCzSS5AKzk3mjkXnEo', null, null, null, null, null, '2019-04-05 16:24:58', '2019-04-05 16:24:58', null, null, '2019-04-05 16:24:58', null, null);
INSERT INTO `col_user` VALUES ('783', 'oStH1tyam1X16teEsJvCou5E7EGc', null, null, null, null, null, '2019-04-05 20:04:12', '2019-04-05 20:04:12', null, null, '2019-04-05 20:04:15', null, null);
INSERT INTO `col_user` VALUES ('784', 'oStH1t4oactaPbswBVi6J9Gc0PfY', null, null, null, null, null, '2019-04-05 21:42:49', '2019-04-05 21:42:49', null, null, '2019-04-05 21:42:49', null, null);
INSERT INTO `col_user` VALUES ('785', 'oStH1t8OPKcXSebZWCHdq_vwvGPM', null, null, null, null, null, '2019-04-07 00:47:24', '2019-04-07 00:47:24', null, null, '2019-04-07 10:39:59', null, null);
INSERT INTO `col_user` VALUES ('786', 'oStH1txkLetlh4deD-RIDSAVZAvY', null, null, null, null, null, '2019-04-07 04:31:20', '2019-04-07 04:31:20', null, null, '2019-04-07 04:31:20', null, null);
INSERT INTO `col_user` VALUES ('787', 'oStH1tw36j_ZniN8wkrDX2HiGJ6E', null, null, null, null, null, '2019-04-08 10:03:06', '2019-04-08 10:03:06', null, null, '2019-04-15 09:32:04', null, null);
INSERT INTO `col_user` VALUES ('788', 'oStH1t47Am5cbRdN-4SHuAxztsnQ', null, null, null, null, null, '2019-04-09 13:50:12', '2019-04-09 13:50:12', null, null, '2019-04-10 15:21:10', null, null);
INSERT INTO `col_user` VALUES ('789', 'oStH1t7DXrkDk-T_CJ3nVil_hATs', null, null, null, null, null, '2019-04-09 14:49:14', '2019-04-09 14:49:14', null, null, '2019-04-09 14:49:14', null, null);
INSERT INTO `col_user` VALUES ('790', 'oStH1t6RtF21RIJMGWBsj8xEHARU', null, null, null, null, null, '2019-04-09 14:50:34', '2019-04-09 14:50:34', null, null, '2019-04-09 14:50:45', null, null);
INSERT INTO `col_user` VALUES ('791', 'oStH1tytdeqrUYA6FeY9IX3a4038', null, null, null, null, null, '2019-04-11 13:49:43', '2019-04-11 13:49:43', null, null, '2019-04-11 13:49:56', null, null);
INSERT INTO `col_user` VALUES ('792', 'oStH1t8K9MJEkOUNIf4wLq59_uOk', null, null, null, null, null, '2019-04-12 10:49:38', '2019-04-12 10:49:38', null, null, '2019-04-12 10:52:31', null, null);
INSERT INTO `col_user` VALUES ('793', 'oStH1t2LSVLvfeUCq395oiBTi-C4', null, null, null, null, null, '2019-04-14 16:30:55', '2019-04-14 16:30:55', null, null, '2019-04-14 16:31:07', null, null);
INSERT INTO `col_user` VALUES ('794', 'oStH1t1knMGLKwrOMMgkonWQCTBU', null, null, null, null, null, '2019-04-15 16:12:43', '2019-04-15 16:12:43', null, null, '2019-04-15 16:12:55', null, null);
INSERT INTO `col_user` VALUES ('795', 'oStH1t0uad5RFaVuklEmhu_kE3O0', null, null, null, null, null, '2019-04-16 08:30:30', '2019-04-16 08:30:30', null, null, '2019-04-16 08:30:39', null, null);
INSERT INTO `col_user` VALUES ('796', 'oStH1t17w1tXaGi-iH_WfXmFSTQY', null, null, null, null, null, '2019-04-16 09:25:34', '2019-04-16 09:25:34', null, null, '2019-04-16 09:41:36', null, null);
INSERT INTO `col_user` VALUES ('797', 'oStH1tzkBz3_U3eilyP-YhLj7hsI', null, null, null, null, null, '2019-04-16 10:13:13', '2019-04-16 10:13:13', null, null, '2019-04-16 10:13:20', null, null);
INSERT INTO `col_user` VALUES ('798', 'oStH1tw_6B8F7Tgbqav-DhY0AEyk', null, null, null, null, null, '2019-04-16 10:32:29', '2019-04-16 10:32:29', null, null, '2019-04-16 10:32:29', null, null);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200084C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000A6E65744164647265737371007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', null, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200084C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000A6E65744164647265737371007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'PC-20170408SVKM1553499309450', '1553499491698', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', null, '1553480120000', '-1', '5', 'PAUSED', 'CRON', '1553480104000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_area_city
-- ----------------------------
DROP TABLE IF EXISTS `sys_area_city`;
CREATE TABLE `sys_area_city` (
  `ID` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `NAME` varchar(50) DEFAULT NULL COMMENT '区域名称',
  `PID` decimal(12,0) DEFAULT NULL COMMENT '上级区域ID',
  `SORT` decimal(8,0) DEFAULT NULL COMMENT '显示排序',
  `ALEVEL` decimal(8,0) DEFAULT NULL COMMENT '区域级别，1-省份/直辖市、2-城市、3-区县',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=820008 DEFAULT CHARSET=utf8 COMMENT='地区据字典表';

-- ----------------------------
-- Records of sys_area_city
-- ----------------------------
INSERT INTO `sys_area_city` VALUES ('110000', '北京市', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('110100', '市辖区', '110000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('110101', '东城区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110102', '西城区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110103', '崇文区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110104', '宣武区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110105', '朝阳区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110106', '丰台区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110107', '石景山区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110108', '海淀区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110109', '门头沟区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110111', '房山区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110112', '通州区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110113', '顺义区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110114', '昌平区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110115', '大兴区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110116', '怀柔区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110117', '平谷区', '110100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110200', '县', '110000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('110228', '密云县', '110200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('110229', '延庆县', '110200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120000', '天津市', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('120100', '市辖区', '120000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('120101', '和平区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120102', '河东区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120103', '河西区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120104', '南开区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120105', '河北区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120106', '红桥区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120107', '塘沽区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120108', '汉沽区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120109', '大港区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120110', '东丽区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120111', '西青区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120112', '津南区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120113', '北辰区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120114', '武清区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120115', '宝坻区', '120100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120200', '县', '120000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('120221', '宁河县', '120200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120223', '静海县', '120200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('120225', '蓟　县', '120200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130000', '河北省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('130100', '石家庄市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130101', '市辖区', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130102', '长安区', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130103', '桥东区', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130104', '桥西区', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130105', '新华区', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130107', '井陉矿区', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130108', '裕华区', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130121', '井陉县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130123', '正定县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130124', '栾城县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130125', '行唐县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130126', '灵寿县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130127', '高邑县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130128', '深泽县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130129', '赞皇县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130130', '无极县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130131', '平山县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130132', '元氏县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130133', '赵　县', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130181', '辛集市', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130182', '藁城市', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130183', '晋州市', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130184', '新乐市', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130185', '鹿泉市', '130100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130200', '唐山市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130201', '市辖区', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130202', '路南区', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130203', '路北区', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130204', '古冶区', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130205', '开平区', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130207', '丰南区', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130208', '丰润区', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130223', '滦　县', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130224', '滦南县', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130225', '乐亭县', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130227', '迁西县', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130229', '玉田县', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130230', '唐海县', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130281', '遵化市', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130283', '迁安市', '130200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130300', '秦皇岛市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130301', '市辖区', '130300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130302', '海港区', '130300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130303', '山海关区', '130300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130304', '北戴河区', '130300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130321', '青龙满族自治县', '130300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130322', '昌黎县', '130300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130323', '抚宁县', '130300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130324', '卢龙县', '130300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130400', '邯郸市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130401', '市辖区', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130402', '邯山区', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130403', '丛台区', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130404', '复兴区', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130406', '峰峰矿区', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130421', '邯郸县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130423', '临漳县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130424', '成安县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130425', '大名县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130426', '涉　县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130427', '磁　县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130428', '肥乡县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130429', '永年县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130430', '邱　县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130431', '鸡泽县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130432', '广平县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130433', '馆陶县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130434', '魏　县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130435', '曲周县', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130481', '武安市', '130400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130500', '邢台市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130501', '市辖区', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130502', '桥东区', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130503', '桥西区', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130521', '邢台县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130522', '临城县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130523', '内丘县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130524', '柏乡县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130525', '隆尧县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130526', '任　县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130527', '南和县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130528', '宁晋县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130529', '巨鹿县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130530', '新河县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130531', '广宗县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130532', '平乡县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130533', '威　县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130534', '清河县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130535', '临西县', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130581', '南宫市', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130582', '沙河市', '130500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130600', '保定市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130601', '市辖区', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130602', '新市区', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130603', '北市区', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130604', '南市区', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130621', '满城县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130622', '清苑县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130623', '涞水县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130624', '阜平县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130625', '徐水县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130626', '定兴县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130627', '唐　县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130628', '高阳县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130629', '容城县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130630', '涞源县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130631', '望都县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130632', '安新县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130633', '易　县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130634', '曲阳县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130635', '蠡　县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130636', '顺平县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130637', '博野县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130638', '雄　县', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130681', '涿州市', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130682', '定州市', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130683', '安国市', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130684', '高碑店市', '130600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130700', '张家口市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130701', '市辖区', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130702', '桥东区', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130703', '桥西区', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130705', '宣化区', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130706', '下花园区', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130721', '宣化县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130722', '张北县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130723', '康保县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130724', '沽源县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130725', '尚义县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130726', '蔚　县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130727', '阳原县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130728', '怀安县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130729', '万全县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130730', '怀来县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130731', '涿鹿县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130732', '赤城县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130733', '崇礼县', '130700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130800', '承德市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130801', '市辖区', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130802', '双桥区', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130803', '双滦区', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130804', '鹰手营子矿区', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130821', '承德县', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130822', '兴隆县', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130823', '平泉县', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130824', '滦平县', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130825', '隆化县', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130826', '丰宁满族自治县', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130827', '宽城满族自治县', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130828', '围场满族蒙古族自治县', '130800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130900', '沧州市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('130901', '市辖区', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130902', '新华区', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130903', '运河区', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130921', '沧　县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130922', '青　县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130923', '东光县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130924', '海兴县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130925', '盐山县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130926', '肃宁县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130927', '南皮县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130928', '吴桥县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130929', '献　县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130930', '孟村回族自治县', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130981', '泊头市', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130982', '任丘市', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130983', '黄骅市', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('130984', '河间市', '130900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131000', '廊坊市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('131001', '市辖区', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131002', '安次区', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131003', '广阳区', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131022', '固安县', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131023', '永清县', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131024', '香河县', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131025', '大城县', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131026', '文安县', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131028', '大厂回族自治县', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131081', '霸州市', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131082', '三河市', '131000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131100', '衡水市', '130000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('131101', '市辖区', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131102', '桃城区', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131121', '枣强县', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131122', '武邑县', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131123', '武强县', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131124', '饶阳县', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131125', '安平县', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131126', '故城县', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131127', '景　县', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131128', '阜城县', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131181', '冀州市', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('131182', '深州市', '131100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140000', '山西省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('140100', '太原市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140101', '市辖区', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140105', '小店区', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140106', '迎泽区', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140107', '杏花岭区', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140108', '尖草坪区', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140109', '万柏林区', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140110', '晋源区', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140121', '清徐县', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140122', '阳曲县', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140123', '娄烦县', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140181', '古交市', '140100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140200', '大同市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140201', '市辖区', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140202', '城　区', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140203', '矿　区', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140211', '南郊区', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140212', '新荣区', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140221', '阳高县', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140222', '天镇县', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140223', '广灵县', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140224', '灵丘县', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140225', '浑源县', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140226', '左云县', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140227', '大同县', '140200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140300', '阳泉市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140301', '市辖区', '140300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140302', '城　区', '140300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140303', '矿　区', '140300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140311', '郊　区', '140300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140321', '平定县', '140300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140322', '盂　县', '140300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140400', '长治市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140401', '市辖区', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140402', '城　区', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140411', '郊　区', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140421', '长治县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140423', '襄垣县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140424', '屯留县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140425', '平顺县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140426', '黎城县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140427', '壶关县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140428', '长子县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140429', '武乡县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140430', '沁　县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140431', '沁源县', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140481', '潞城市', '140400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140500', '晋城市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140501', '市辖区', '140500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140502', '城　区', '140500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140521', '沁水县', '140500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140522', '阳城县', '140500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140524', '陵川县', '140500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140525', '泽州县', '140500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140581', '高平市', '140500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140600', '朔州市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140601', '市辖区', '140600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140602', '朔城区', '140600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140603', '平鲁区', '140600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140621', '山阴县', '140600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140622', '应　县', '140600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140623', '右玉县', '140600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140624', '怀仁县', '140600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140700', '晋中市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140701', '市辖区', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140702', '榆次区', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140721', '榆社县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140722', '左权县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140723', '和顺县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140724', '昔阳县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140725', '寿阳县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140726', '太谷县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140727', '祁　县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140728', '平遥县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140729', '灵石县', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140781', '介休市', '140700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140800', '运城市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140801', '市辖区', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140802', '盐湖区', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140821', '临猗县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140822', '万荣县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140823', '闻喜县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140824', '稷山县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140825', '新绛县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140826', '绛　县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140827', '垣曲县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140828', '夏　县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140829', '平陆县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140830', '芮城县', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140881', '永济市', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140882', '河津市', '140800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140900', '忻州市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('140901', '市辖区', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140902', '忻府区', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140921', '定襄县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140922', '五台县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140923', '代　县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140924', '繁峙县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140925', '宁武县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140926', '静乐县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140927', '神池县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140928', '五寨县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140929', '岢岚县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140930', '河曲县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140931', '保德县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140932', '偏关县', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('140981', '原平市', '140900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141000', '临汾市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('141001', '市辖区', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141002', '尧都区', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141021', '曲沃县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141022', '翼城县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141023', '襄汾县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141024', '洪洞县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141025', '古　县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141026', '安泽县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141027', '浮山县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141028', '吉　县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141029', '乡宁县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141030', '大宁县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141031', '隰　县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141032', '永和县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141033', '蒲　县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141034', '汾西县', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141081', '侯马市', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141082', '霍州市', '141000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141100', '吕梁市', '140000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('141101', '市辖区', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141102', '离石区', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141121', '文水县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141122', '交城县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141123', '兴　县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141124', '临　县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141125', '柳林县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141126', '石楼县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141127', '岚　县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141128', '方山县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141129', '中阳县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141130', '交口县', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141181', '孝义市', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('141182', '汾阳市', '141100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150000', '内蒙古自治区', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('150100', '呼和浩特市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150101', '市辖区', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150102', '新城区', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150103', '回民区', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150104', '玉泉区', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150105', '赛罕区', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150121', '土默特左旗', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150122', '托克托县', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150123', '和林格尔县', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150124', '清水河县', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150125', '武川县', '150100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150200', '包头市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150201', '市辖区', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150202', '东河区', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150203', '昆都仑区', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150204', '青山区', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150205', '石拐区', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150206', '白云矿区', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150207', '九原区', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150221', '土默特右旗', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150222', '固阳县', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150300', '乌海市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150301', '市辖区', '150300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150302', '海勃湾区', '150300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150303', '海南区', '150300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150304', '乌达区', '150300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150400', '赤峰市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150401', '市辖区', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150402', '红山区', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150403', '元宝山区', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150404', '松山区', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150421', '阿鲁科尔沁旗', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150422', '巴林左旗', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150423', '巴林右旗', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150424', '林西县', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150425', '克什克腾旗', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150426', '翁牛特旗', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150428', '喀喇沁旗', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150429', '宁城县', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150430', '敖汉旗', '150400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150500', '通辽市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150501', '市辖区', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150502', '科尔沁区', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150521', '科尔沁左翼中旗', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150522', '科尔沁左翼后旗', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150523', '开鲁县', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150524', '库伦旗', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150525', '奈曼旗', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150526', '扎鲁特旗', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150581', '霍林郭勒市', '150500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150600', '鄂尔多斯市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150602', '东胜区', '150600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150621', '达拉特旗', '150600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150622', '准格尔旗', '150600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150623', '鄂托克前旗', '150600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150624', '鄂托克旗', '150600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150625', '杭锦旗', '150600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150626', '乌审旗', '150600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150627', '伊金霍洛旗', '150600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150700', '呼伦贝尔市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150701', '市辖区', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150702', '海拉尔区', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150721', '阿荣旗', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150723', '鄂伦春自治旗', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150724', '鄂温克族自治旗', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150725', '陈巴尔虎旗', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150726', '新巴尔虎左旗', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150727', '新巴尔虎右旗', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150781', '满洲里市', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150782', '牙克石市', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150783', '扎兰屯市', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150784', '额尔古纳市', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150785', '根河市', '150700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150800', '巴彦淖尔市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150801', '市辖区', '150800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150802', '临河区', '150800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150821', '五原县', '150800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150822', '磴口县', '150800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150823', '乌拉特前旗', '150800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150824', '乌拉特中旗', '150800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150825', '乌拉特后旗', '150800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150826', '杭锦后旗', '150800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150900', '乌兰察布市', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('150901', '市辖区', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150902', '集宁区', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150921', '卓资县', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150922', '化德县', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150923', '商都县', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150924', '兴和县', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150925', '凉城县', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150926', '察哈尔右翼前旗', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150927', '察哈尔右翼中旗', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150928', '察哈尔右翼后旗', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150929', '四子王旗', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('150981', '丰镇市', '150900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152200', '兴安盟', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('152201', '乌兰浩特市', '152200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152202', '阿尔山市', '152200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152221', '科尔沁右翼前旗', '152200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152222', '科尔沁右翼中旗', '152200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152223', '扎赉特旗', '152200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152224', '突泉县', '152200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152500', '锡林郭勒盟', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('152501', '二连浩特市', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152502', '锡林浩特市', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152522', '阿巴嘎旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152523', '苏尼特左旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152524', '苏尼特右旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152525', '东乌珠穆沁旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152526', '西乌珠穆沁旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152527', '太仆寺旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152528', '镶黄旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152529', '正镶白旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152530', '正蓝旗', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152531', '多伦县', '152500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152900', '阿拉善盟', '150000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('152921', '阿拉善左旗', '152900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152922', '阿拉善右旗', '152900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('152923', '额济纳旗', '152900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210000', '辽宁省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('210100', '沈阳市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210101', '市辖区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210102', '和平区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210103', '沈河区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210104', '大东区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210105', '皇姑区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210106', '铁西区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210111', '苏家屯区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210112', '浑南区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210113', '新城子区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210114', '于洪区', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210122', '辽中县', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210123', '康平县', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210124', '法库县', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210181', '新民市', '210100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210200', '大连市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210201', '市辖区', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210202', '中山区', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210203', '西岗区', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210204', '沙河口区', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210211', '甘井子区', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210212', '旅顺口区', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210213', '金州区', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210224', '长海县', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210281', '瓦房店市', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210282', '普兰店市', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210283', '庄河市', '210200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210300', '鞍山市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210301', '市辖区', '210300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210302', '铁东区', '210300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210303', '铁西区', '210300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210304', '立山区', '210300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210311', '千山区', '210300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210321', '台安县', '210300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210323', '岫岩满族自治县', '210300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210381', '海城市', '210300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210400', '抚顺市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210401', '市辖区', '210400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210402', '新抚区', '210400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210403', '东洲区', '210400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210404', '望花区', '210400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210411', '顺城区', '210400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210421', '抚顺县', '210400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210422', '新宾满族自治县', '210400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210423', '清原满族自治县', '210400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210500', '本溪市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210501', '市辖区', '210500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210502', '平山区', '210500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210503', '溪湖区', '210500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210504', '明山区', '210500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210505', '南芬区', '210500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210521', '本溪满族自治县', '210500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210522', '桓仁满族自治县', '210500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210600', '丹东市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210601', '市辖区', '210600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210602', '元宝区', '210600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210603', '振兴区', '210600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210604', '振安区', '210600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210624', '宽甸满族自治县', '210600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210681', '东港市', '210600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210682', '凤城市', '210600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210700', '锦州市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210701', '市辖区', '210700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210702', '古塔区', '210700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210703', '凌河区', '210700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210711', '太和区', '210700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210726', '黑山县', '210700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210727', '义　县', '210700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210781', '凌海市', '210700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210782', '北宁市', '210700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210800', '营口市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210801', '市辖区', '210800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210802', '站前区', '210800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210803', '西市区', '210800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210804', '鲅鱼圈区', '210800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210811', '老边区', '210800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210881', '盖州市', '210800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210882', '大石桥市', '210800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210900', '阜新市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('210901', '市辖区', '210900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210902', '海州区', '210900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210903', '新邱区', '210900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210904', '太平区', '210900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210905', '清河门区', '210900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210911', '细河区', '210900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210921', '阜新蒙古族自治县', '210900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('210922', '彰武县', '210900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211000', '辽阳市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('211001', '市辖区', '211000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211002', '白塔区', '211000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211003', '文圣区', '211000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211004', '宏伟区', '211000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211005', '弓长岭区', '211000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211011', '太子河区', '211000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211021', '辽阳县', '211000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211081', '灯塔市', '211000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211100', '盘锦市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('211101', '市辖区', '211100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211102', '双台子区', '211100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211103', '兴隆台区', '211100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211121', '大洼县', '211100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211122', '盘山县', '211100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211200', '铁岭市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('211201', '市辖区', '211200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211202', '银州区', '211200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211204', '清河区', '211200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211221', '铁岭县', '211200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211223', '西丰县', '211200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211224', '昌图县', '211200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211281', '调兵山市', '211200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211282', '开原市', '211200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211300', '朝阳市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('211301', '市辖区', '211300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211302', '双塔区', '211300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211303', '龙城区', '211300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211321', '朝阳县', '211300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211322', '建平县', '211300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211381', '北票市', '211300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211382', '凌源市', '211300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211400', '葫芦岛市', '210000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('211401', '市辖区', '211400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211402', '连山区', '211400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211403', '龙港区', '211400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211404', '南票区', '211400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211421', '绥中县', '211400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211422', '建昌县', '211400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('211481', '兴城市', '211400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220000', '吉林省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('220100', '长春市', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('220101', '市辖区', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220102', '南关区', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220103', '宽城区', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220104', '朝阳区', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220105', '二道区', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220106', '绿园区', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220112', '双阳区', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220122', '农安县', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220181', '九台市', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220182', '榆树市', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220183', '德惠市', '220100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220200', '吉林市', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('220201', '市辖区', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220202', '昌邑区', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220203', '龙潭区', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220204', '船营区', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220211', '丰满区', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220221', '永吉县', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220281', '蛟河市', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220282', '桦甸市', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220283', '舒兰市', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220284', '磐石市', '220200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220300', '四平市', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('220301', '市辖区', '220300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220302', '铁西区', '220300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220303', '铁东区', '220300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220322', '梨树县', '220300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220323', '伊通满族自治县', '220300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220381', '公主岭市', '220300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220382', '双辽市', '220300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220400', '辽源市', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('220401', '市辖区', '220400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220402', '龙山区', '220400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220403', '西安区', '220400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220421', '东丰县', '220400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220422', '东辽县', '220400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220500', '通化市', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('220501', '市辖区', '220500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220502', '东昌区', '220500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220503', '二道江区', '220500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220521', '通化县', '220500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220523', '辉南县', '220500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220524', '柳河县', '220500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220581', '梅河口市', '220500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220582', '集安市', '220500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220600', '白山市', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('220601', '市辖区', '220600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220602', '八道江区', '220600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220621', '抚松县', '220600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220622', '靖宇县', '220600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220623', '长白朝鲜族自治县', '220600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220625', '江源县', '220600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220681', '临江市', '220600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220700', '松原市', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('220701', '市辖区', '220700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220702', '宁江区', '220700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220722', '长岭县', '220700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220723', '乾安县', '220700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220724', '扶余县', '220700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220800', '白城市', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('220801', '市辖区', '220800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220802', '洮北区', '220800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220821', '镇赉县', '220800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220822', '通榆县', '220800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220881', '洮南市', '220800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('220882', '大安市', '220800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('222400', '延边朝鲜族自治州', '220000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('222401', '延吉市', '222400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('222402', '图们市', '222400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('222403', '敦化市', '222400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('222404', '珲春市', '222400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('222405', '龙井市', '222400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('222406', '和龙市', '222400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('222424', '汪清县', '222400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('222426', '安图县', '222400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230000', '黑龙江省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('230100', '哈尔滨市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230101', '市辖区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230102', '道里区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230103', '南岗区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230104', '道外区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230106', '香坊区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230107', '动力区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230108', '平房区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230109', '松北区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230111', '呼兰区', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230123', '依兰县', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230124', '方正县', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230125', '宾　县', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230126', '巴彦县', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230127', '木兰县', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230128', '通河县', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230129', '延寿县', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230181', '阿城市', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230182', '双城市', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230183', '尚志市', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230184', '五常市', '230100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230200', '齐齐哈尔市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230201', '市辖区', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230202', '龙沙区', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230203', '建华区', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230204', '铁锋区', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230205', '昂昂溪区', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230206', '富拉尔基区', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230207', '碾子山区', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230208', '梅里斯达斡尔族区', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230221', '龙江县', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230223', '依安县', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230224', '泰来县', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230225', '甘南县', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230227', '富裕县', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230229', '克山县', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230230', '克东县', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230231', '拜泉县', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230281', '讷河市', '230200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230300', '鸡西市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230301', '市辖区', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230302', '鸡冠区', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230303', '恒山区', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230304', '滴道区', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230305', '梨树区', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230306', '城子河区', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230307', '麻山区', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230321', '鸡东县', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230381', '虎林市', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230382', '密山市', '230300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230400', '鹤岗市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230401', '市辖区', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230402', '向阳区', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230403', '工农区', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230404', '南山区', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230405', '兴安区', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230406', '东山区', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230407', '兴山区', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230421', '萝北县', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230422', '绥滨县', '230400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230500', '双鸭山市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230501', '市辖区', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230502', '尖山区', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230503', '岭东区', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230505', '四方台区', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230506', '宝山区', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230521', '集贤县', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230522', '友谊县', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230523', '宝清县', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230524', '饶河县', '230500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230600', '大庆市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230601', '市辖区', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230602', '萨尔图区', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230603', '龙凤区', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230604', '让胡路区', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230605', '红岗区', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230606', '大同区', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230621', '肇州县', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230622', '肇源县', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230623', '林甸县', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230700', '伊春市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230701', '市辖区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230702', '伊春区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230703', '南岔区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230704', '友好区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230705', '西林区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230706', '翠峦区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230707', '新青区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230708', '美溪区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230709', '金山屯区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230710', '五营区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230711', '乌马河区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230712', '汤旺河区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230713', '带岭区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230714', '乌伊岭区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230715', '红星区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230716', '上甘岭区', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230722', '嘉荫县', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230781', '铁力市', '230700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230800', '佳木斯市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230801', '市辖区', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230802', '永红区', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230803', '向阳区', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230804', '前进区', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230805', '东风区', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230811', '郊　区', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230822', '桦南县', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230826', '桦川县', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230828', '汤原县', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230833', '抚远县', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230881', '同江市', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230882', '富锦市', '230800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230900', '七台河市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('230901', '市辖区', '230900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230902', '新兴区', '230900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230903', '桃山区', '230900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230904', '茄子河区', '230900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('230921', '勃利县', '230900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231000', '牡丹江市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('231001', '市辖区', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231002', '东安区', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231003', '阳明区', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231004', '爱民区', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231005', '西安区', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231024', '东宁县', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231025', '林口县', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231081', '绥芬河市', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231083', '海林市', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231084', '宁安市', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231085', '穆棱市', '231000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231100', '黑河市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('231101', '市辖区', '231100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231102', '爱辉区', '231100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231121', '嫩江县', '231100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231123', '逊克县', '231100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231124', '孙吴县', '231100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231181', '北安市', '231100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231182', '五大连池市', '231100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231200', '绥化市', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('231201', '市辖区', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231202', '北林区', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231221', '望奎县', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231222', '兰西县', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231223', '青冈县', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231224', '庆安县', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231225', '明水县', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231226', '绥棱县', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231281', '安达市', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231282', '肇东市', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('231283', '海伦市', '231200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('232700', '大兴安岭地区', '230000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('232721', '呼玛县', '232700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('232722', '塔河县', '232700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('232723', '漠河县', '232700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310000', '上海市', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('310100', '市辖区', '310000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('310101', '黄浦区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310103', '卢湾区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310104', '徐汇区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310105', '长宁区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310106', '静安区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310107', '普陀区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310108', '闸北区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310109', '虹口区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310110', '杨浦区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310112', '闵行区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310113', '宝山区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310114', '嘉定区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310115', '浦东新区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310116', '金山区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310117', '松江区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310118', '青浦区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310119', '南汇区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310120', '奉贤区', '310100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('310200', '县', '310000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('310230', '崇明县', '310200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320000', '江苏省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('320100', '南京市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320101', '市辖区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320102', '玄武区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320103', '白下区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320104', '秦淮区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320105', '建邺区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320106', '鼓楼区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320107', '下关区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320111', '浦口区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320113', '栖霞区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320114', '雨花台区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320115', '江宁区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320116', '六合区', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320124', '溧水县', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320125', '高淳县', '320100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320200', '无锡市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320201', '市辖区', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320202', '崇安区', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320203', '南长区', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320204', '北塘区', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320205', '锡山区', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320206', '惠山区', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320211', '滨湖区', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320281', '江阴市', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320282', '宜兴市', '320200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320300', '徐州市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320301', '市辖区', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320302', '鼓楼区', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320303', '云龙区', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320304', '九里区', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320305', '贾汪区', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320311', '泉山区', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320321', '丰　县', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320322', '沛　县', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320323', '铜山县', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320324', '睢宁县', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320381', '新沂市', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320382', '邳州市', '320300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320400', '常州市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320401', '市辖区', '320400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320402', '天宁区', '320400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320404', '钟楼区', '320400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320405', '戚墅堰区', '320400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320411', '新北区', '320400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320412', '武进区', '320400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320481', '溧阳市', '320400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320482', '金坛市', '320400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320500', '苏州市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320501', '市辖区', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320502', '沧浪区', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320503', '平江区', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320504', '金阊区', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320505', '虎丘区', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320506', '吴中区', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320507', '相城区', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320581', '常熟市', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320582', '张家港市', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320583', '昆山市', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320584', '吴江市', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320585', '太仓市', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320586', '姑苏区', '320500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320600', '南通市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320601', '市辖区', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320602', '崇川区', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320611', '港闸区', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320621', '海安县', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320623', '如东县', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320681', '启东市', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320682', '如皋市', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320683', '通州市', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320684', '海门市', '320600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320700', '连云港市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320701', '市辖区', '320700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320703', '连云区', '320700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320705', '新浦区', '320700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320706', '海州区', '320700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320721', '赣榆县', '320700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320722', '东海县', '320700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320723', '灌云县', '320700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320724', '灌南县', '320700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320800', '淮安市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320801', '市辖区', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320802', '清河区', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320803', '楚州区', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320804', '淮阴区', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320811', '清浦区', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320826', '涟水县', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320829', '洪泽县', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320830', '盱眙县', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320831', '金湖县', '320800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320900', '盐城市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('320901', '市辖区', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320902', '亭湖区', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320903', '盐都区', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320921', '响水县', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320922', '滨海县', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320923', '阜宁县', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320924', '射阳县', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320925', '建湖县', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320981', '东台市', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('320982', '大丰市', '320900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321000', '扬州市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('321001', '市辖区', '321000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321002', '广陵区', '321000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321003', '邗江区', '321000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321011', '郊　区', '321000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321023', '宝应县', '321000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321081', '仪征市', '321000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321084', '高邮市', '321000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321088', '江都市', '321000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321100', '镇江市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('321101', '市辖区', '321100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321102', '京口区', '321100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321111', '润州区', '321100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321112', '丹徒区', '321100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321181', '丹阳市', '321100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321182', '扬中市', '321100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321183', '句容市', '321100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321200', '泰州市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('321201', '市辖区', '321200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321202', '海陵区', '321200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321203', '高港区', '321200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321281', '兴化市', '321200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321282', '靖江市', '321200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321283', '泰兴市', '321200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321284', '姜堰市', '321200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321300', '宿迁市', '320000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('321301', '市辖区', '321300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321302', '宿城区', '321300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321311', '宿豫区', '321300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321322', '沭阳县', '321300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321323', '泗阳县', '321300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('321324', '泗洪县', '321300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330000', '浙江省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('330100', '杭州市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330101', '市辖区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330102', '上城区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330103', '下城区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330104', '江干区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330105', '拱墅区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330106', '西湖区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330108', '滨江区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330109', '萧山区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330110', '余杭区', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330122', '桐庐县', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330127', '淳安县', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330182', '建德市', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330183', '富阳市', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330185', '临安市', '330100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330200', '宁波市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330201', '市辖区', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330203', '海曙区', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330204', '江东区', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330205', '江北区', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330206', '北仑区', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330211', '镇海区', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330212', '鄞州区', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330225', '象山县', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330226', '宁海县', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330281', '余姚市', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330282', '慈溪市', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330283', '奉化市', '330200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330300', '温州市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330301', '市辖区', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330302', '鹿城区', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330303', '龙湾区', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330304', '瓯海区', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330322', '洞头县', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330324', '永嘉县', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330326', '平阳县', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330327', '苍南县', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330328', '文成县', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330329', '泰顺县', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330381', '瑞安市', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330382', '乐清市', '330300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330400', '嘉兴市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330401', '市辖区', '330400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330402', '秀城区', '330400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330411', '秀洲区', '330400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330421', '嘉善县', '330400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330424', '海盐县', '330400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330481', '海宁市', '330400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330482', '平湖市', '330400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330483', '桐乡市', '330400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330500', '湖州市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330501', '市辖区', '330500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330502', '吴兴区', '330500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330503', '南浔区', '330500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330521', '德清县', '330500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330522', '长兴县', '330500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330523', '安吉县', '330500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330600', '绍兴市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330601', '市辖区', '330600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330602', '越城区', '330600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330621', '绍兴县', '330600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330624', '新昌县', '330600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330681', '诸暨市', '330600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330682', '上虞市', '330600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330683', '嵊州市', '330600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330700', '金华市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330701', '市辖区', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330702', '婺城区', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330703', '金东区', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330723', '武义县', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330726', '浦江县', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330727', '磐安县', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330781', '兰溪市', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330782', '义乌市', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330783', '东阳市', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330784', '永康市', '330700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330800', '衢州市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330801', '市辖区', '330800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330802', '柯城区', '330800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330803', '衢江区', '330800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330822', '常山县', '330800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330824', '开化县', '330800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330825', '龙游县', '330800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330881', '江山市', '330800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330900', '舟山市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('330901', '市辖区', '330900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330902', '定海区', '330900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330903', '普陀区', '330900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330921', '岱山县', '330900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('330922', '嵊泗县', '330900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331000', '台州市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('331001', '市辖区', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331002', '椒江区', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331003', '黄岩区', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331004', '路桥区', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331021', '玉环县', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331022', '三门县', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331023', '天台县', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331024', '仙居县', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331081', '温岭市', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331082', '临海市', '331000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331100', '丽水市', '330000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('331101', '市辖区', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331102', '莲都区', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331121', '青田县', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331122', '缙云县', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331123', '遂昌县', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331124', '松阳县', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331125', '云和县', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331126', '庆元县', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331127', '景宁畲族自治县', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('331181', '龙泉市', '331100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340000', '安徽省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('340100', '合肥市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('340101', '市辖区', '340100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340102', '瑶海区', '340100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340103', '庐阳区', '340100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340104', '蜀山区', '340100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340111', '包河区', '340100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340121', '长丰县', '340100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340122', '肥东县', '340100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340123', '肥西县', '340100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340200', '芜湖市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('340201', '市辖区', '340200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340202', '镜湖区', '340200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340203', '马塘区', '340200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340204', '新芜区', '340200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340207', '鸠江区', '340200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340221', '芜湖县', '340200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340222', '繁昌县', '340200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340223', '南陵县', '340200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340300', '蚌埠市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('340301', '市辖区', '340300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340302', '龙子湖区', '340300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340303', '蚌山区', '340300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340304', '禹会区', '340300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340311', '淮上区', '340300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340321', '怀远县', '340300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340322', '五河县', '340300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340323', '固镇县', '340300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340400', '淮南市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('340401', '市辖区', '340400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340402', '大通区', '340400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340403', '田家庵区', '340400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340404', '谢家集区', '340400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340405', '八公山区', '340400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340406', '潘集区', '340400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340421', '凤台县', '340400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340500', '马鞍山市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('340501', '市辖区', '340500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340502', '金家庄区', '340500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340503', '花山区', '340500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340504', '雨山区', '340500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340521', '当涂县', '340500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340600', '淮北市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('340601', '市辖区', '340600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340602', '杜集区', '340600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340603', '相山区', '340600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340604', '烈山区', '340600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340621', '濉溪县', '340600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340700', '铜陵市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('340701', '市辖区', '340700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340702', '铜官山区', '340700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340703', '狮子山区', '340700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340711', '郊　区', '340700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340721', '铜陵县', '340700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340800', '安庆市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('340801', '市辖区', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340802', '迎江区', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340803', '大观区', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340811', '郊　区', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340822', '怀宁县', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340823', '枞阳县', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340824', '潜山县', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340825', '太湖县', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340826', '宿松县', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340827', '望江县', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340828', '岳西县', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('340881', '桐城市', '340800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341000', '黄山市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341001', '市辖区', '341000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341002', '屯溪区', '341000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341003', '黄山区', '341000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341004', '徽州区', '341000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341021', '歙　县', '341000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341022', '休宁县', '341000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341023', '黟　县', '341000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341024', '祁门县', '341000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341100', '滁州市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341101', '市辖区', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341102', '琅琊区', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341103', '南谯区', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341122', '来安县', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341124', '全椒县', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341125', '定远县', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341126', '凤阳县', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341181', '天长市', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341182', '明光市', '341100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341200', '阜阳市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341201', '市辖区', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341202', '颍州区', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341203', '颍东区', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341204', '颍泉区', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341221', '临泉县', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341222', '太和县', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341225', '阜南县', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341226', '颍上县', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341282', '界首市', '341200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341300', '宿州市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341301', '市辖区', '341300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341302', '墉桥区', '341300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341321', '砀山县', '341300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341322', '萧　县', '341300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341323', '灵璧县', '341300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341324', '泗　县', '341300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341400', '巢湖市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341401', '市辖区', '341400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341402', '居巢区', '341400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341421', '庐江县', '341400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341422', '无为县', '341400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341423', '含山县', '341400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341424', '和　县', '341400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341500', '六安市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341501', '市辖区', '341500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341502', '金安区', '341500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341503', '裕安区', '341500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341521', '寿　县', '341500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341522', '霍邱县', '341500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341523', '舒城县', '341500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341524', '金寨县', '341500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341525', '霍山县', '341500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341600', '亳州市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341601', '市辖区', '341600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341602', '谯城区', '341600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341621', '涡阳县', '341600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341622', '蒙城县', '341600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341623', '利辛县', '341600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341700', '池州市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341701', '市辖区', '341700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341702', '贵池区', '341700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341721', '东至县', '341700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341722', '石台县', '341700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341723', '青阳县', '341700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341800', '宣城市', '340000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('341801', '市辖区', '341800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341802', '宣州区', '341800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341821', '郎溪县', '341800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341822', '广德县', '341800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341823', '泾　县', '341800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341824', '绩溪县', '341800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341825', '旌德县', '341800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('341881', '宁国市', '341800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350000', '福建省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('350100', '福州市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350101', '市辖区', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350102', '鼓楼区', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350103', '台江区', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350104', '仓山区', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350105', '马尾区', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350111', '晋安区', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350121', '闽侯县', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350122', '连江县', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350123', '罗源县', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350124', '闽清县', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350125', '永泰县', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350128', '平潭县', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350181', '福清市', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350182', '长乐市', '350100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350200', '厦门市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350201', '市辖区', '350200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350203', '思明区', '350200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350205', '海沧区', '350200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350206', '湖里区', '350200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350211', '集美区', '350200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350212', '同安区', '350200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350213', '翔安区', '350200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350300', '莆田市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350301', '市辖区', '350300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350302', '城厢区', '350300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350303', '涵江区', '350300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350304', '荔城区', '350300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350305', '秀屿区', '350300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350322', '仙游县', '350300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350400', '三明市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350401', '市辖区', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350402', '梅列区', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350403', '三元区', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350421', '明溪县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350423', '清流县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350424', '宁化县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350425', '大田县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350426', '尤溪县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350427', '沙　县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350428', '将乐县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350429', '泰宁县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350430', '建宁县', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350481', '永安市', '350400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350500', '泉州市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350501', '市辖区', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350502', '鲤城区', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350503', '丰泽区', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350504', '洛江区', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350505', '泉港区', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350521', '惠安县', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350524', '安溪县', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350525', '永春县', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350526', '德化县', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350527', '金门县', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350581', '石狮市', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350582', '晋江市', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350583', '南安市', '350500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350600', '漳州市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350601', '市辖区', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350602', '芗城区', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350603', '龙文区', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350622', '云霄县', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350623', '漳浦县', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350624', '诏安县', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350625', '长泰县', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350626', '东山县', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350627', '南靖县', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350628', '平和县', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350629', '华安县', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350681', '龙海市', '350600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350700', '南平市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350701', '市辖区', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350702', '延平区', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350721', '顺昌县', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350722', '浦城县', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350723', '光泽县', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350724', '松溪县', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350725', '政和县', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350781', '邵武市', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350782', '武夷山市', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350783', '建瓯市', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350784', '建阳市', '350700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350800', '龙岩市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350801', '市辖区', '350800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350802', '新罗区', '350800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350821', '长汀县', '350800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350822', '永定县', '350800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350823', '上杭县', '350800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350824', '武平县', '350800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350825', '连城县', '350800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350881', '漳平市', '350800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350900', '宁德市', '350000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('350901', '市辖区', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350902', '蕉城区', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350921', '霞浦县', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350922', '古田县', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350923', '屏南县', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350924', '寿宁县', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350925', '周宁县', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350926', '柘荣县', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350981', '福安市', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('350982', '福鼎市', '350900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360000', '江西省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('360100', '南昌市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360101', '市辖区', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360102', '东湖区', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360103', '西湖区', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360104', '青云谱区', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360105', '湾里区', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360111', '青山湖区', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360121', '南昌县', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360122', '新建县', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360123', '安义县', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360124', '进贤县', '360100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360200', '景德镇市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360201', '市辖区', '360200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360202', '昌江区', '360200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360203', '珠山区', '360200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360222', '浮梁县', '360200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360281', '乐平市', '360200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360300', '萍乡市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360301', '市辖区', '360300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360302', '安源区', '360300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360313', '湘东区', '360300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360321', '莲花县', '360300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360322', '上栗县', '360300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360323', '芦溪县', '360300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360400', '九江市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360401', '市辖区', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360402', '庐山区', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360403', '浔阳区', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360421', '九江县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360423', '武宁县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360424', '修水县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360425', '永修县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360426', '德安县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360427', '星子县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360428', '都昌县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360429', '湖口县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360430', '彭泽县', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360481', '瑞昌市', '360400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360500', '新余市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360501', '市辖区', '360500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360502', '渝水区', '360500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360521', '分宜县', '360500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360600', '鹰潭市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360601', '市辖区', '360600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360602', '月湖区', '360600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360622', '余江县', '360600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360681', '贵溪市', '360600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360700', '赣州市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360701', '市辖区', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360702', '章贡区', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360721', '赣　县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360722', '信丰县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360723', '大余县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360724', '上犹县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360725', '崇义县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360726', '安远县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360727', '龙南县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360728', '定南县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360729', '全南县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360730', '宁都县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360731', '于都县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360732', '兴国县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360733', '会昌县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360734', '寻乌县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360735', '石城县', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360781', '瑞金市', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360782', '南康市', '360700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360800', '吉安市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360801', '市辖区', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360802', '吉州区', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360803', '青原区', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360821', '吉安县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360822', '吉水县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360823', '峡江县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360824', '新干县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360825', '永丰县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360826', '泰和县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360827', '遂川县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360828', '万安县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360829', '安福县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360830', '永新县', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360881', '井冈山市', '360800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360900', '宜春市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('360901', '市辖区', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360902', '袁州区', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360921', '奉新县', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360922', '万载县', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360923', '上高县', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360924', '宜丰县', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360925', '靖安县', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360926', '铜鼓县', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360981', '丰城市', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360982', '樟树市', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('360983', '高安市', '360900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361000', '抚州市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('361001', '市辖区', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361002', '临川区', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361021', '南城县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361022', '黎川县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361023', '南丰县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361024', '崇仁县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361025', '乐安县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361026', '宜黄县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361027', '金溪县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361028', '资溪县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361029', '东乡县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361030', '广昌县', '361000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361100', '上饶市', '360000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('361101', '市辖区', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361102', '信州区', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361121', '上饶县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361122', '广丰县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361123', '玉山县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361124', '铅山县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361125', '横峰县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361126', '弋阳县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361127', '余干县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361128', '鄱阳县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361129', '万年县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361130', '婺源县', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('361181', '德兴市', '361100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370000', '山东省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('370100', '济南市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370101', '市辖区', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370102', '历下区', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370103', '市中区', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370104', '槐荫区', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370105', '天桥区', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370112', '历城区', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370113', '长清区', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370124', '平阴县', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370125', '济阳县', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370126', '商河县', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370181', '章丘市', '370100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370200', '青岛市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370201', '市辖区', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370202', '市南区', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370203', '市北区', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370205', '四方区', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370211', '黄岛区', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370212', '崂山区', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370213', '李沧区', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370214', '城阳区', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370281', '胶州市', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370282', '即墨市', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370283', '平度市', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370284', '胶南市', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370285', '莱西市', '370200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370300', '淄博市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370301', '市辖区', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370302', '淄川区', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370303', '张店区', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370304', '博山区', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370305', '临淄区', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370306', '周村区', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370321', '桓台县', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370322', '高青县', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370323', '沂源县', '370300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370400', '枣庄市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370401', '市辖区', '370400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370402', '市中区', '370400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370403', '薛城区', '370400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370404', '峄城区', '370400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370405', '台儿庄区', '370400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370406', '山亭区', '370400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370481', '滕州市', '370400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370500', '东营市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370501', '市辖区', '370500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370502', '东营区', '370500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370503', '河口区', '370500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370521', '垦利县', '370500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370522', '利津县', '370500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370523', '广饶县', '370500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370600', '烟台市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370601', '市辖区', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370602', '芝罘区', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370611', '福山区', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370612', '牟平区', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370613', '莱山区', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370634', '长岛县', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370681', '龙口市', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370682', '莱阳市', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370683', '莱州市', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370684', '蓬莱市', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370685', '招远市', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370686', '栖霞市', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370687', '海阳市', '370600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370700', '潍坊市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370701', '市辖区', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370702', '潍城区', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370703', '寒亭区', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370704', '坊子区', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370705', '奎文区', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370724', '临朐县', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370725', '昌乐县', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370781', '青州市', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370782', '诸城市', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370783', '寿光市', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370784', '安丘市', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370785', '高密市', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370786', '昌邑市', '370700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370800', '济宁市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370801', '市辖区', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370802', '市中区', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370811', '任城区', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370826', '微山县', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370827', '鱼台县', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370828', '金乡县', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370829', '嘉祥县', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370830', '汶上县', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370831', '泗水县', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370832', '梁山县', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370881', '曲阜市', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370882', '兖州市', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370883', '邹城市', '370800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370900', '泰安市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('370901', '市辖区', '370900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370902', '泰山区', '370900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370903', '岱岳区', '370900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370921', '宁阳县', '370900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370923', '东平县', '370900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370982', '新泰市', '370900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('370983', '肥城市', '370900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371000', '威海市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('371001', '市辖区', '371000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371002', '环翠区', '371000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371081', '文登市', '371000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371082', '荣成市', '371000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371083', '乳山市', '371000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371100', '日照市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('371101', '市辖区', '371100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371102', '东港区', '371100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371103', '岚山区', '371100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371121', '五莲县', '371100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371122', '莒　县', '371100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371200', '莱芜市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('371201', '市辖区', '371200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371202', '莱城区', '371200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371203', '钢城区', '371200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371300', '临沂市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('371301', '市辖区', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371302', '兰山区', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371311', '罗庄区', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371312', '河东区', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371321', '沂南县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371322', '郯城县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371323', '沂水县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371324', '苍山县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371325', '费　县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371326', '平邑县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371327', '莒南县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371328', '蒙阴县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371329', '临沭县', '371300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371400', '德州市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('371401', '市辖区', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371402', '德城区', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371421', '陵　县', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371422', '宁津县', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371423', '庆云县', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371424', '临邑县', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371425', '齐河县', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371426', '平原县', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371427', '夏津县', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371428', '武城县', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371481', '乐陵市', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371482', '禹城市', '371400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371500', '聊城市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('371501', '市辖区', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371502', '东昌府区', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371521', '阳谷县', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371522', '莘　县', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371523', '茌平县', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371524', '东阿县', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371525', '冠　县', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371526', '高唐县', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371581', '临清市', '371500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371600', '滨州市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('371601', '市辖区', '371600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371602', '滨城区', '371600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371621', '惠民县', '371600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371622', '阳信县', '371600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371623', '无棣县', '371600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371624', '沾化县', '371600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371625', '博兴县', '371600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371626', '邹平县', '371600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371700', '荷泽市', '370000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('371701', '市辖区', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371702', '牡丹区', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371721', '曹　县', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371722', '单　县', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371723', '成武县', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371724', '巨野县', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371725', '郓城县', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371726', '鄄城县', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371727', '定陶县', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('371728', '东明县', '371700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410000', null, null, null, null);
INSERT INTO `sys_area_city` VALUES ('410100', '郑州市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('410101', '市辖区', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410102', '中原区', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410103', '二七区', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410104', '管城回族区', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410105', '金水区', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410106', '上街区', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410108', '邙山区', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410122', '中牟县', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410181', '巩义市', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410182', '荥阳市', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410183', '新密市', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410184', '新郑市', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410185', '登封市', '410100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410200', '开封市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('410201', '市辖区', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410202', '龙亭区', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410203', '顺河回族区', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410204', '鼓楼区', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410205', '南关区', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410211', '郊　区', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410221', '杞　县', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410222', '通许县', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410223', '尉氏县', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410224', '开封县', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410225', '兰考县', '410200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410300', '洛阳市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('410301', '市辖区', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410302', '老城区', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410303', '西工区', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410304', '廛河回族区', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410305', '涧西区', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410306', '吉利区', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410307', '洛龙区', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410322', '孟津县', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410323', '新安县', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410324', '栾川县', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410325', '嵩　县', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410326', '汝阳县', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410327', '宜阳县', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410328', '洛宁县', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410329', '伊川县', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410381', '偃师市', '410300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410400', null, null, null, null);
INSERT INTO `sys_area_city` VALUES ('410401', '市辖区', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410402', '新华区', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410403', '卫东区', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410404', '石龙区', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410411', null, null, null, null);
INSERT INTO `sys_area_city` VALUES ('410421', '宝丰县', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410422', '叶　县', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410423', '鲁山县', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410425', '郏　县', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410481', '舞钢市', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410482', '汝州市', '410400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410500', '安阳市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('410501', '市辖区', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410502', '文峰区', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410503', '北关区', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410505', '殷都区', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410506', '龙安区', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410522', '安阳县', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410523', '汤阴县', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410526', '滑　县', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410527', '内黄县', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410581', '林州市', '410500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410600', '鹤壁市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('410601', '市辖区', '410600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410602', '鹤山区', '410600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410603', '山城区', '410600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410611', '淇滨区', '410600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410621', '浚　县', '410600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410622', '淇　县', '410600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410700', '新乡市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('410701', '市辖区', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410702', '红旗区', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410703', '卫滨区', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410704', '凤泉区', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410711', '牧野区', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410721', '新乡县', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410724', '获嘉县', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410725', '原阳县', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410726', '延津县', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410727', '封丘县', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410728', '长垣县', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410781', '卫辉市', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410782', '辉县市', '410700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410800', '焦作市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('410801', '市辖区', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410802', '解放区', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410803', '中站区', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410804', '马村区', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410811', '山阳区', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410821', '修武县', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410822', '博爱县', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410823', '武陟县', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410825', '温　县', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410881', '济源市', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410882', '沁阳市', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410883', '孟州市', '410800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410900', '濮阳市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('410901', '市辖区', '410900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410902', '华龙区', '410900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410922', '清丰县', '410900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410923', '南乐县', '410900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410926', '范　县', '410900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410927', '台前县', '410900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('410928', '濮阳县', '410900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411000', '许昌市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('411001', '市辖区', '411000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411002', '魏都区', '411000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411023', '许昌县', '411000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411024', '鄢陵县', '411000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411025', '襄城县', '411000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411081', '禹州市', '411000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411082', '长葛市', '411000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411100', '漯河市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('411101', '市辖区', '411100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411102', '源汇区', '411100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411103', '郾城区', '411100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411104', '召陵区', '411100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411121', '舞阳县', '411100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411122', '临颍县', '411100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411200', '三门峡市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('411201', '市辖区', '411200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411202', '湖滨区', '411200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411221', '渑池县', '411200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411222', '陕　县', '411200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411224', '卢氏县', '411200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411281', '义马市', '411200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411282', '灵宝市', '411200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411300', '南阳市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('411301', '市辖区', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411302', '宛城区', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411303', '卧龙区', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411321', '南召县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411322', '方城县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411323', '西峡县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411324', '镇平县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411325', '内乡县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411326', '淅川县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411327', '社旗县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411328', '唐河县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411329', '新野县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411330', '桐柏县', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411381', '邓州市', '411300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411400', '商丘市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('411401', '市辖区', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411402', '梁园区', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411403', '睢阳区', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411421', '民权县', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411422', '睢　县', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411423', '宁陵县', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411424', '柘城县', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411425', '虞城县', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411426', '夏邑县', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411481', '永城市', '411400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411500', '信阳市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('411501', '市辖区', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411502', '师河区', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411503', '平桥区', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411521', '罗山县', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411522', '光山县', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411523', '新　县', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411524', '商城县', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411525', '固始县', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411526', '潢川县', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411527', '淮滨县', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411528', '息　县', '411500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411600', '周口市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('411601', '市辖区', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411602', '川汇区', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411621', '扶沟县', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411622', '西华县', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411623', '商水县', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411624', '沈丘县', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411625', '郸城县', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411626', '淮阳县', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411627', '太康县', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411628', '鹿邑县', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411681', '项城市', '411600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411700', '驻马店市', '410000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('411701', '市辖区', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411702', '驿城区', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411721', '西平县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411722', '上蔡县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411723', '平舆县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411724', '正阳县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411725', '确山县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411726', '泌阳县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411727', '汝南县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411728', '遂平县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('411729', '新蔡县', '411700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420000', '湖北省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('420100', '武汉市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('420101', '市辖区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420102', '江岸区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420103', '江汉区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420104', '乔口区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420105', '汉阳区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420106', '武昌区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420107', '青山区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420111', '洪山区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420112', '东西湖区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420113', '汉南区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420114', '蔡甸区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420115', '江夏区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420116', '黄陂区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420117', '新洲区', '420100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420200', '黄石市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('420201', '市辖区', '420200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420202', '黄石港区', '420200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420203', '西塞山区', '420200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420204', '下陆区', '420200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420205', '铁山区', '420200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420222', '阳新县', '420200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420281', '大冶市', '420200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420300', '十堰市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('420301', '市辖区', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420302', '茅箭区', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420303', '张湾区', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420321', '郧　县', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420322', '郧西县', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420323', '竹山县', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420324', '竹溪县', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420325', '房　县', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420381', '丹江口市', '420300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420500', '宜昌市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('420501', '市辖区', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420502', '西陵区', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420503', '伍家岗区', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420504', '点军区', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420505', '猇亭区', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420506', '夷陵区', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420525', '远安县', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420526', '兴山县', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420527', '秭归县', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420528', '长阳土家族自治县', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420529', '五峰土家族自治县', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420581', '宜都市', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420582', '当阳市', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420583', '枝江市', '420500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420600', '襄樊市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('420601', '市辖区', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420602', '襄城区', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420606', '樊城区', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420607', '襄阳区', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420624', '南漳县', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420625', '谷城县', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420626', '保康县', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420682', '老河口市', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420683', '枣阳市', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420684', '宜城市', '420600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420700', '鄂州市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('420701', '市辖区', '420700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420702', '梁子湖区', '420700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420703', '华容区', '420700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420704', '鄂城区', '420700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420800', '荆门市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('420801', '市辖区', '420800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420802', '东宝区', '420800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420804', '掇刀区', '420800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420821', '京山县', '420800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420822', '沙洋县', '420800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420881', '钟祥市', '420800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420900', '孝感市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('420901', '市辖区', '420900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420902', '孝南区', '420900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420921', '孝昌县', '420900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420922', '大悟县', '420900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420923', '云梦县', '420900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420981', '应城市', '420900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420982', '安陆市', '420900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('420984', '汉川市', '420900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421000', '荆州市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('421001', '市辖区', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421002', '沙市区', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421003', '荆州区', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421022', '公安县', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421023', '监利县', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421024', '江陵县', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421081', '石首市', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421083', '洪湖市', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421087', '松滋市', '421000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421100', '黄冈市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('421101', '市辖区', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421102', '黄州区', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421121', '团风县', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421122', '红安县', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421123', '罗田县', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421124', '英山县', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421125', '浠水县', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421126', '蕲春县', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421127', '黄梅县', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421181', '麻城市', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421182', '武穴市', '421100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421200', '咸宁市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('421201', '市辖区', '421200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421202', '咸安区', '421200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421221', '嘉鱼县', '421200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421222', '通城县', '421200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421223', '崇阳县', '421200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421224', '通山县', '421200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421281', '赤壁市', '421200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421300', '随州市', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('421301', '市辖区', '421300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421302', '曾都区', '421300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('421381', '广水市', '421300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('422800', '恩施土家族苗族自治州', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('422801', '恩施市', '422800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('422802', '利川市', '422800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('422822', '建始县', '422800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('422823', '巴东县', '422800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('422825', '宣恩县', '422800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('422826', '咸丰县', '422800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('422827', '来凤县', '422800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('422828', '鹤峰县', '422800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('429000', '省直辖行政单位', '420000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('429004', '仙桃市', '429000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('429005', '潜江市', '429000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('429006', '天门市', '429000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('429021', '神农架林区', '429000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430000', '湖南省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('430100', '长沙市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430101', '市辖区', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430102', '芙蓉区', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430103', '天心区', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430104', '岳麓区', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430105', '开福区', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430111', '雨花区', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430121', '长沙县', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430122', '望城县', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430124', '宁乡县', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430181', '浏阳市', '430100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430200', '株洲市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430201', '市辖区', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430202', '荷塘区', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430203', '芦淞区', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430204', '石峰区', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430211', '天元区', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430221', '株洲县', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430223', '攸　县', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430224', '茶陵县', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430225', '炎陵县', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430281', '醴陵市', '430200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430300', '湘潭市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430301', '市辖区', '430300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430302', '雨湖区', '430300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430304', '岳塘区', '430300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430321', '湘潭县', '430300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430381', '湘乡市', '430300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430382', '韶山市', '430300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430400', '衡阳市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430401', '市辖区', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430405', '珠晖区', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430406', '雁峰区', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430407', '石鼓区', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430408', '蒸湘区', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430412', '南岳区', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430421', '衡阳县', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430422', '衡南县', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430423', '衡山县', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430424', '衡东县', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430426', '祁东县', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430481', '耒阳市', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430482', '常宁市', '430400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430500', '邵阳市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430501', '市辖区', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430502', '双清区', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430503', '大祥区', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430511', '北塔区', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430521', '邵东县', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430522', '新邵县', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430523', '邵阳县', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430524', '隆回县', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430525', '洞口县', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430527', '绥宁县', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430528', '新宁县', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430529', '城步苗族自治县', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430581', '武冈市', '430500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430600', '岳阳市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430601', '市辖区', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430602', '岳阳楼区', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430603', '云溪区', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430611', '君山区', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430621', '岳阳县', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430623', '华容县', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430624', '湘阴县', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430626', '平江县', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430681', '汨罗市', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430682', '临湘市', '430600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430700', '常德市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430701', '市辖区', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430702', '武陵区', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430703', '鼎城区', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430721', '安乡县', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430722', '汉寿县', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430723', '澧　县', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430724', '临澧县', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430725', '桃源县', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430726', '石门县', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430781', '津市市', '430700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430800', '张家界市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430801', '市辖区', '430800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430802', '永定区', '430800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430811', '武陵源区', '430800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430821', '慈利县', '430800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430822', '桑植县', '430800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430900', '益阳市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('430901', '市辖区', '430900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430902', '资阳区', '430900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430903', '赫山区', '430900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430921', '南　县', '430900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430922', '桃江县', '430900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430923', '安化县', '430900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('430981', '沅江市', '430900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431000', '郴州市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('431001', '市辖区', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431002', '北湖区', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431003', '苏仙区', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431021', '桂阳县', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431022', '宜章县', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431023', '永兴县', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431024', '嘉禾县', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431025', '临武县', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431026', '汝城县', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431027', '桂东县', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431028', '安仁县', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431081', '资兴市', '431000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431100', '永州市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('431101', '市辖区', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431102', '芝山区', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431103', '冷水滩区', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431121', '祁阳县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431122', '东安县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431123', '双牌县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431124', '道　县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431125', '江永县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431126', '宁远县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431127', '蓝山县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431128', '新田县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431129', '江华瑶族自治县', '431100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431200', '怀化市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('431201', '市辖区', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431202', '鹤城区', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431221', '中方县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431222', '沅陵县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431223', '辰溪县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431224', '溆浦县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431225', '会同县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431226', '麻阳苗族自治县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431227', '新晃侗族自治县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431228', '芷江侗族自治县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431229', '靖州苗族侗族自治县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431230', '通道侗族自治县', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431281', '洪江市', '431200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431300', '娄底市', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('431301', '市辖区', '431300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431302', '娄星区', '431300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431321', '双峰县', '431300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431322', '新化县', '431300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431381', '冷水江市', '431300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('431382', '涟源市', '431300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('433100', '湘西土家族苗族自治州', '430000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('433101', '吉首市', '433100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('433122', '泸溪县', '433100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('433123', '凤凰县', '433100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('433124', '花垣县', '433100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('433125', '保靖县', '433100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('433126', '古丈县', '433100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('433127', '永顺县', '433100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('433130', '龙山县', '433100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440000', '广东省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('440100', '广州市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440101', '市辖区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440102', '东山区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440103', '荔湾区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440104', '越秀区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440105', '海珠区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440106', '天河区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440107', '芳村区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440111', '白云区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440112', '黄埔区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440113', '番禺区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440114', '花都区', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440183', '增城市', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440184', '从化市', '440100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440200', '韶关市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440201', '市辖区', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440203', '武江区', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440204', '浈江区', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440205', '曲江区', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440222', '始兴县', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440224', '仁化县', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440229', '翁源县', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440232', '乳源瑶族自治县', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440233', '新丰县', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440281', '乐昌市', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440282', '南雄市', '440200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440300', '深圳市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440301', '市辖区', '440300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440303', '罗湖区', '440300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440304', '福田区', '440300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440305', '南山区', '440300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440306', '宝安区', '440300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440307', '龙岗区', '440300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440308', '盐田区', '440300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440400', '珠海市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440401', '市辖区', '440400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440402', '香洲区', '440400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440403', '斗门区', '440400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440404', '金湾区', '440400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440500', '汕头市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440501', '市辖区', '440500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440507', '龙湖区', '440500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440511', '金平区', '440500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440512', '濠江区', '440500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440513', '潮阳区', '440500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440514', '潮南区', '440500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440515', '澄海区', '440500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440523', '南澳县', '440500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440600', '佛山市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440601', '市辖区', '440600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440604', '禅城区', '440600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440605', '南海区', '440600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440606', '顺德区', '440600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440607', '三水区', '440600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440608', '高明区', '440600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440700', '江门市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440701', '市辖区', '440700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440703', '蓬江区', '440700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440704', '江海区', '440700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440705', '新会区', '440700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440781', '台山市', '440700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440783', '开平市', '440700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440784', '鹤山市', '440700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440785', '恩平市', '440700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440800', '湛江市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440801', '市辖区', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440802', '赤坎区', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440803', '霞山区', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440804', '坡头区', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440811', '麻章区', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440823', '遂溪县', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440825', '徐闻县', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440881', '廉江市', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440882', '雷州市', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440883', '吴川市', '440800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440900', '茂名市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('440901', '市辖区', '440900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440902', '茂南区', '440900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440903', '茂港区', '440900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440923', '电白县', '440900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440981', '高州市', '440900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440982', '化州市', '440900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('440983', '信宜市', '440900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441200', '肇庆市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('441201', '市辖区', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441202', '端州区', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441203', '鼎湖区', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441223', '广宁县', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441224', '怀集县', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441225', '封开县', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441226', '德庆县', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441283', '高要市', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441284', '四会市', '441200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441300', '惠州市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('441301', '市辖区', '441300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441302', '惠城区', '441300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441303', '惠阳区', '441300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441322', '博罗县', '441300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441323', '惠东县', '441300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441324', '龙门县', '441300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441400', '梅州市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('441401', '市辖区', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441402', '梅江区', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441421', '梅　县', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441422', '大埔县', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441423', '丰顺县', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441424', '五华县', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441426', '平远县', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441427', '蕉岭县', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441481', '兴宁市', '441400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441500', '汕尾市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('441501', '市辖区', '441500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441502', '城　区', '441500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441521', '海丰县', '441500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441523', '陆河县', '441500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441581', '陆丰市', '441500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441600', '河源市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('441601', '市辖区', '441600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441602', '源城区', '441600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441621', '紫金县', '441600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441622', '龙川县', '441600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441623', '连平县', '441600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441624', '和平县', '441600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441625', '东源县', '441600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441700', '阳江市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('441701', '市辖区', '441700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441702', '江城区', '441700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441721', '阳西县', '441700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441723', '阳东县', '441700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441781', '阳春市', '441700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441800', '清远市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('441801', '市辖区', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441802', '清城区', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441821', '佛冈县', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441823', '阳山县', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441825', '连山壮族瑶族自治县', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441826', '连南瑶族自治县', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441827', '清新县', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441881', '英德市', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441882', '连州市', '441800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('441900', '东莞市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('442000', '中山市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('445100', '潮州市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('445101', '市辖区', '445100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445102', '湘桥区', '445100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445121', '潮安县', '445100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445122', '饶平县', '445100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445200', '揭阳市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('445201', '市辖区', '445200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445202', '榕城区', '445200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445221', '揭东县', '445200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445222', '揭西县', '445200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445224', '惠来县', '445200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445281', '普宁市', '445200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445300', '云浮市', '440000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('445301', '市辖区', '445300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445302', '云城区', '445300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445321', '新兴县', '445300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445322', '郁南县', '445300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445323', '云安县', '445300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('445381', '罗定市', '445300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450000', '广西壮族自治区', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('450100', '南宁市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450101', '市辖区', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450102', '兴宁区', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450103', '青秀区', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450105', '江南区', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450107', '西乡塘区', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450108', '良庆区', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450109', '邕宁区', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450122', '武鸣县', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450123', '隆安县', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450124', '马山县', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450125', '上林县', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450126', '宾阳县', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450127', '横　县', '450100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450200', '柳州市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450201', '市辖区', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450202', '城中区', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450203', '鱼峰区', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450204', '柳南区', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450205', '柳北区', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450221', '柳江县', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450222', '柳城县', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450223', '鹿寨县', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450224', '融安县', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450225', '融水苗族自治县', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450226', '三江侗族自治县', '450200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450300', '桂林市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450301', '市辖区', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450302', '秀峰区', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450303', '叠彩区', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450304', '象山区', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450305', '七星区', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450311', '雁山区', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450321', '阳朔县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450322', '临桂县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450323', '灵川县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450324', '全州县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450325', '兴安县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450326', '永福县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450327', '灌阳县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450328', '龙胜各族自治县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450329', '资源县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450330', '平乐县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450331', '荔蒲县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450332', '恭城瑶族自治县', '450300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450400', '梧州市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450401', '市辖区', '450400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450403', '万秀区', '450400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450404', '蝶山区', '450400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450405', '长洲区', '450400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450421', '苍梧县', '450400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450422', '藤　县', '450400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450423', '蒙山县', '450400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450481', '岑溪市', '450400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450500', '北海市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450501', '市辖区', '450500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450502', '海城区', '450500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450503', '银海区', '450500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450512', '铁山港区', '450500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450521', '合浦县', '450500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450600', '防城港市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450601', '市辖区', '450600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450602', '港口区', '450600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450603', '防城区', '450600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450621', '上思县', '450600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450681', '东兴市', '450600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450700', '钦州市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450701', '市辖区', '450700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450702', '钦南区', '450700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450703', '钦北区', '450700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450721', '灵山县', '450700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450722', '浦北县', '450700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450800', '贵港市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450801', '市辖区', '450800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450802', '港北区', '450800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450803', '港南区', '450800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450804', '覃塘区', '450800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450821', '平南县', '450800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450881', '桂平市', '450800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450900', '玉林市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('450901', '市辖区', '450900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450902', '玉州区', '450900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450921', '容　县', '450900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450922', '陆川县', '450900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450923', '博白县', '450900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450924', '兴业县', '450900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('450981', '北流市', '450900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451000', '百色市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('451001', '市辖区', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451002', '右江区', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451021', '田阳县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451022', '田东县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451023', '平果县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451024', '德保县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451025', '靖西县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451026', '那坡县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451027', '凌云县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451028', '乐业县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451029', '田林县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451030', '西林县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451031', '隆林各族自治县', '451000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451100', '贺州市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('451101', '市辖区', '451100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451102', '八步区', '451100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451121', '昭平县', '451100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451122', '钟山县', '451100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451123', '富川瑶族自治县', '451100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451200', '河池市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('451201', '市辖区', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451202', '金城江区', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451221', '南丹县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451222', '天峨县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451223', '凤山县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451224', '东兰县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451225', '罗城仫佬族自治县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451226', '环江毛南族自治县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451227', '巴马瑶族自治县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451228', '都安瑶族自治县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451229', '大化瑶族自治县', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451281', '宜州市', '451200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451300', '来宾市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('451301', '市辖区', '451300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451302', '兴宾区', '451300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451321', '忻城县', '451300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451322', '象州县', '451300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451323', '武宣县', '451300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451324', '金秀瑶族自治县', '451300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451381', '合山市', '451300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451400', '崇左市', '450000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('451401', '市辖区', '451400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451402', '江洲区', '451400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451421', '扶绥县', '451400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451422', '宁明县', '451400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451423', '龙州县', '451400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451424', '大新县', '451400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451425', '天等县', '451400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('451481', '凭祥市', '451400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('460000', '海南省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('460100', '海口市', '460000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('460101', '市辖区', '460100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('460105', '秀英区', '460100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('460106', '龙华区', '460100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('460107', '琼山区', '460100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('460108', '美兰区', '460100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('460200', '三亚市', '460000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('460201', '市辖区', '460200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469000', '省直辖县级行政单位', '460000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('469001', '五指山市', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469002', '琼海市', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469003', '儋州市', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469005', '文昌市', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469006', '万宁市', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469007', '东方市', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469025', '定安县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469026', '屯昌县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469027', '澄迈县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469028', '临高县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469030', '白沙黎族自治县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469031', '昌江黎族自治县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469033', '乐东黎族自治县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469034', '陵水黎族自治县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469035', '保亭黎族苗族自治县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469036', '琼中黎族苗族自治县', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469037', '西沙群岛', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469038', '南沙群岛', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('469039', '中沙群岛的岛礁及其海域', '469000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500000', '重庆市', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('500100', '市辖区', '500000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('500101', '万州区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500102', '涪陵区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500103', '渝中区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500104', '大渡口区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500105', '江北区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500106', '沙坪坝区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500107', '九龙坡区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500108', '南岸区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500109', '北碚区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500110', '万盛区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500111', '双桥区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500112', '渝北区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500113', '巴南区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500114', '黔江区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500115', '长寿区', '500100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500200', '县', '500000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('500222', '綦江县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500223', '潼南县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500224', '铜梁县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500225', '大足县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500226', '荣昌县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500227', '璧山县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500228', '梁平县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500229', '城口县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500230', '丰都县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500231', '垫江县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500232', '武隆县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500233', '忠　县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500234', '开　县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500235', '云阳县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500236', '奉节县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500237', '巫山县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500238', '巫溪县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500240', '石柱土家族自治县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500241', '秀山土家族苗族自治县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500242', '酉阳土家族苗族自治县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500243', '彭水苗族土家族自治县', '500200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500300', '市', '500000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('500381', '江津市', '500300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500382', '合川市', '500300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500383', '永川市', '500300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('500384', '南川市', '500300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510000', '四川省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('510100', '成都市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('510101', '市辖区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510104', '锦江区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510105', '青羊区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510106', '金牛区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510107', '武侯区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510108', '成华区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510112', '龙泉驿区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510113', '青白江区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510114', '新都区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510115', '温江区', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510121', '金堂县', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510122', '双流县', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510124', '郫　县', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510129', '大邑县', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510131', '蒲江县', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510132', '新津县', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510181', '都江堰市', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510182', '彭州市', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510183', '邛崃市', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510184', '崇州市', '510100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510300', '自贡市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('510301', '市辖区', '510300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510302', '自流井区', '510300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510303', '贡井区', '510300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510304', '大安区', '510300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510311', '沿滩区', '510300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510321', '荣　县', '510300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510322', '富顺县', '510300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510400', '攀枝花市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('510401', '市辖区', '510400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510402', '东　区', '510400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510403', '西　区', '510400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510411', '仁和区', '510400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510421', '米易县', '510400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510422', '盐边县', '510400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510500', '泸州市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('510501', '市辖区', '510500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510502', '江阳区', '510500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510503', '纳溪区', '510500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510504', '龙马潭区', '510500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510521', '泸　县', '510500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510522', '合江县', '510500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510524', '叙永县', '510500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510525', '古蔺县', '510500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510600', '德阳市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('510601', '市辖区', '510600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510603', '旌阳区', '510600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510623', '中江县', '510600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510626', '罗江县', '510600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510681', '广汉市', '510600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510682', '什邡市', '510600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510683', '绵竹市', '510600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510700', '绵阳市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('510701', '市辖区', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510703', '涪城区', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510704', '游仙区', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510722', '三台县', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510723', '盐亭县', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510724', '安　县', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510725', '梓潼县', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510726', '北川羌族自治县', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510727', '平武县', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510781', '江油市', '510700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510800', '广元市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('510801', '市辖区', '510800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510802', '市中区', '510800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510811', '元坝区', '510800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510812', '朝天区', '510800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510821', '旺苍县', '510800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510822', '青川县', '510800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510823', '剑阁县', '510800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510824', '苍溪县', '510800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510900', '遂宁市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('510901', '市辖区', '510900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510903', '船山区', '510900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510904', '安居区', '510900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510921', '蓬溪县', '510900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510922', '射洪县', '510900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('510923', '大英县', '510900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511000', '内江市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511001', '市辖区', '511000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511002', '市中区', '511000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511011', '东兴区', '511000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511024', '威远县', '511000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511025', '资中县', '511000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511028', '隆昌县', '511000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511100', '乐山市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511101', '市辖区', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511102', '市中区', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511111', '沙湾区', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511112', '五通桥区', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511113', '金口河区', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511123', '犍为县', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511124', '井研县', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511126', '夹江县', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511129', '沐川县', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511132', '峨边彝族自治县', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511133', '马边彝族自治县', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511181', '峨眉山市', '511100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511300', '南充市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511301', '市辖区', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511302', '顺庆区', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511303', '高坪区', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511304', '嘉陵区', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511321', '南部县', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511322', '营山县', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511323', '蓬安县', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511324', '仪陇县', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511325', '西充县', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511381', '阆中市', '511300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511400', '眉山市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511401', '市辖区', '511400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511402', '东坡区', '511400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511421', '仁寿县', '511400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511422', '彭山县', '511400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511423', '洪雅县', '511400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511424', '丹棱县', '511400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511425', '青神县', '511400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511500', '宜宾市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511501', '市辖区', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511502', '翠屏区', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511521', '宜宾县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511522', '南溪县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511523', '江安县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511524', '长宁县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511525', '高　县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511526', '珙　县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511527', '筠连县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511528', '兴文县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511529', '屏山县', '511500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511600', '广安市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511601', '市辖区', '511600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511602', '广安区', '511600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511621', '岳池县', '511600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511622', '武胜县', '511600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511623', '邻水县', '511600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511681', '华莹市', '511600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511700', '达州市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511701', '市辖区', '511700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511702', '通川区', '511700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511721', '达　县', '511700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511722', '宣汉县', '511700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511723', '开江县', '511700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511724', '大竹县', '511700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511725', '渠　县', '511700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511781', '万源市', '511700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511800', '雅安市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511801', '市辖区', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511802', '雨城区', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511821', '名山县', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511822', '荥经县', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511823', '汉源县', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511824', '石棉县', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511825', '天全县', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511826', '芦山县', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511827', '宝兴县', '511800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511900', '巴中市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('511901', '市辖区', '511900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511902', '巴州区', '511900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511921', '通江县', '511900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511922', '南江县', '511900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('511923', '平昌县', '511900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('512000', '资阳市', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('512001', '市辖区', '512000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('512002', '雁江区', '512000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('512021', '安岳县', '512000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('512022', '乐至县', '512000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('512081', '简阳市', '512000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('513221', '汶川县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513222', '理　县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513223', '茂　县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513224', '松潘县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513225', '九寨沟县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513226', '金川县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513227', '小金县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513228', '黑水县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513229', '马尔康县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513230', '壤塘县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513231', '阿坝县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513232', '若尔盖县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513233', '红原县', '513200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513300', '甘孜藏族自治州', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('513321', '康定县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513322', '泸定县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513323', '丹巴县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513324', '九龙县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513325', '雅江县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513326', '道孚县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513327', '炉霍县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513328', '甘孜县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513329', '新龙县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513330', '德格县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513331', '白玉县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513332', '石渠县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513333', '色达县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513334', '理塘县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513335', '巴塘县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513336', '乡城县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513337', '稻城县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513338', '得荣县', '513300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513400', '凉山彝族自治州', '510000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('513401', '西昌市', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513422', '木里藏族自治县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513423', '盐源县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513424', '德昌县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513425', '会理县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513426', '会东县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513427', '宁南县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513428', '普格县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513429', '布拖县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513430', '金阳县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513431', '昭觉县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513432', '喜德县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513433', '冕宁县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513434', '越西县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513435', '甘洛县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513436', '美姑县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('513437', '雷波县', '513400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520000', '贵州省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('520100', '贵阳市', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('520101', '市辖区', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520102', '南明区', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520103', '云岩区', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520111', '花溪区', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520112', '乌当区', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520113', '白云区', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520114', '小河区', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520121', '开阳县', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520122', '息烽县', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520123', '修文县', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520181', '清镇市', '520100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520200', '六盘水市', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('520201', '钟山区', '520200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520203', '六枝特区', '520200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520221', '水城县', '520200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520222', '盘　县', '520200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520300', '遵义市', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('520301', '市辖区', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520302', '红花岗区', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520303', '汇川区', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520321', '遵义县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520322', '桐梓县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520323', '绥阳县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520324', '正安县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520327', '凤冈县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520328', '湄潭县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520329', '余庆县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520330', '习水县', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520381', '赤水市', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520382', '仁怀市', '520300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520400', '安顺市', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('520401', '市辖区', '520400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520402', '西秀区', '520400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520421', '平坝县', '520400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520422', '普定县', '520400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520424', '关岭布依族苗族自治县', '520400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('520425', '紫云苗族布依族自治县', '520400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522200', '铜仁地区', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('522201', '铜仁市', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522222', '江口县', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522223', '玉屏侗族自治县', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522224', '石阡县', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522225', '思南县', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522226', '印江土家族苗族自治县', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522227', '德江县', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522228', '沿河土家族自治县', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522229', '松桃苗族自治县', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522230', '万山特区', '522200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('522301', '兴义市', '522300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522322', '兴仁县', '522300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522323', '普安县', '522300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522324', '晴隆县', '522300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522325', '贞丰县', '522300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522326', '望谟县', '522300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522327', '册亨县', '522300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522328', '安龙县', '522300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522400', '毕节地区', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('522401', '毕节市', '522400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522422', '大方县', '522400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522423', '黔西县', '522400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522424', '金沙县', '522400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522425', '织金县', '522400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522426', '纳雍县', '522400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522427', '威宁彝族回族苗族自治县', '522400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522428', '赫章县', '522400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('522601', '凯里市', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522622', '黄平县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522623', '施秉县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522624', '三穗县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522625', '镇远县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522626', '岑巩县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522627', '天柱县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522628', '锦屏县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522629', '剑河县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522630', '台江县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522631', '黎平县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522632', '榕江县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522633', '从江县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522634', '雷山县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522635', '麻江县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522636', '丹寨县', '522600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522700', '黔南布依族苗族自治州', '520000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('522701', '都匀市', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522702', '福泉市', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522722', '荔波县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522723', '贵定县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522725', '瓮安县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522726', '独山县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522727', '平塘县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522728', '罗甸县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522729', '长顺县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522730', '龙里县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522731', '惠水县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('522732', '三都水族自治县', '522700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530000', '云南省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('530100', '昆明市', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('530101', '市辖区', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530102', '五华区', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530103', '盘龙区', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530111', '官渡区', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530112', '西山区', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530113', '东川区', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530121', '呈贡县', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530122', '晋宁县', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530124', '富民县', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530125', '宜良县', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530126', '石林彝族自治县', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530127', '嵩明县', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530129', '寻甸回族彝族自治县', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530181', '安宁市', '530100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530300', '曲靖市', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('530301', '市辖区', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530302', '麒麟区', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530321', '马龙县', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530322', '陆良县', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530323', '师宗县', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530324', '罗平县', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530325', '富源县', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530326', '会泽县', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530328', '沾益县', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530381', '宣威市', '530300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530400', '玉溪市', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('530401', '市辖区', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530402', '红塔区', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530421', '江川县', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530422', '澄江县', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530423', '通海县', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530424', '华宁县', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530425', '易门县', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530426', '峨山彝族自治县', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530427', '新平彝族傣族自治县', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530500', '保山市', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('530501', '市辖区', '530500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530502', '隆阳区', '530500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530521', '施甸县', '530500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530522', '腾冲县', '530500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530523', '龙陵县', '530500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530524', '昌宁县', '530500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530600', '昭通市', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('530601', '市辖区', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530602', '昭阳区', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530621', '鲁甸县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530622', '巧家县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530623', '盐津县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530624', '大关县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530625', '永善县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530626', '绥江县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530627', '镇雄县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530628', '彝良县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530629', '威信县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530630', '水富县', '530600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530700', '丽江市', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('530701', '市辖区', '530700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530702', '古城区', '530700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530721', '玉龙纳西族自治县', '530700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530722', '永胜县', '530700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530723', '华坪县', '530700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530724', '宁蒗彝族自治县', '530700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530800', '思茅市', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('530801', '市辖区', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530802', '翠云区', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530821', '普洱哈尼族彝族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530822', '墨江哈尼族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530823', '景东彝族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530824', '景谷傣族彝族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530828', '澜沧拉祜族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530829', '西盟佤族自治县', '530800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530900', '临沧市', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('530901', '市辖区', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530902', '临翔区', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530921', '凤庆县', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530922', '云　县', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530923', '永德县', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530924', '镇康县', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530926', '耿马傣族佤族自治县', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('530927', '沧源佤族自治县', '530900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532300', '楚雄彝族自治州', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('532301', '楚雄市', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532322', '双柏县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532323', '牟定县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532324', '南华县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532325', '姚安县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532326', '大姚县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532327', '永仁县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532328', '元谋县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532329', '武定县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532331', '禄丰县', '532300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('532501', '个旧市', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532502', '开远市', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532522', '蒙自县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532523', '屏边苗族自治县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532524', '建水县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532525', '石屏县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532526', '弥勒县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532527', '泸西县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532528', '元阳县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532529', '红河县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532531', '绿春县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532532', '河口瑶族自治县', '532500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532600', '文山壮族苗族自治州', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('532621', '文山县', '532600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532622', '砚山县', '532600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532623', '西畴县', '532600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532624', '麻栗坡县', '532600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532625', '马关县', '532600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532626', '丘北县', '532600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532627', '广南县', '532600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532628', '富宁县', '532600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532800', '西双版纳傣族自治州', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('532801', '景洪市', '532800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532822', '勐海县', '532800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532823', '勐腊县', '532800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532900', '大理白族自治州', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('532901', '大理市', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532922', '漾濞彝族自治县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532923', '祥云县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532924', '宾川县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532925', '弥渡县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532926', '南涧彝族自治县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532927', '巍山彝族回族自治县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532928', '永平县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532929', '云龙县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532930', '洱源县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532931', '剑川县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('532932', '鹤庆县', '532900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('533102', '瑞丽市', '533100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533103', '潞西市', '533100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533122', '梁河县', '533100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533123', '盈江县', '533100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533124', '陇川县', '533100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533300', '怒江傈僳族自治州', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('533321', '泸水县', '533300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533323', '福贡县', '533300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533325', '兰坪白族普米族自治县', '533300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533400', '迪庆藏族自治州', '530000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('533421', '香格里拉县', '533400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533422', '德钦县', '533400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('533423', '维西傈僳族自治县', '533400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540000', '西藏自治区', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('540100', '拉萨市', '540000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('540101', '市辖区', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540102', '城关区', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540121', '林周县', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540122', '当雄县', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540123', '尼木县', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540124', '曲水县', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540125', '堆龙德庆县', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540126', '达孜县', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('540127', '墨竹工卡县', '540100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542100', '昌都地区', '540000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('542121', '昌都县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542122', '江达县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542123', '贡觉县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542124', '类乌齐县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542125', '丁青县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542126', '察雅县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542127', '八宿县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542128', '左贡县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542129', '芒康县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542132', '洛隆县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542133', '边坝县', '542100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542200', '山南地区', '540000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('542221', '乃东县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542222', '扎囊县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542223', '贡嘎县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542224', '桑日县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542225', '琼结县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542226', '曲松县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542227', '措美县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542228', '洛扎县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542229', '加查县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542231', '隆子县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542232', '错那县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542233', '浪卡子县', '542200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542300', '日喀则地区', '540000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('542301', '日喀则市', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542322', '南木林县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542323', '江孜县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542324', '定日县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542325', '萨迦县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542326', '拉孜县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542327', '昂仁县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542328', '谢通门县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542329', '白朗县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542330', '仁布县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542331', '康马县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542332', '定结县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542333', '仲巴县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542334', '亚东县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542335', '吉隆县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542336', '聂拉木县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542337', '萨嘎县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542338', '岗巴县', '542300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542400', '那曲地区', '540000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('542421', '那曲县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542422', '嘉黎县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542423', '比如县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542424', '聂荣县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542425', '安多县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542426', '申扎县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542427', '索　县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542428', '班戈县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542429', '巴青县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542430', '尼玛县', '542400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542500', '阿里地区', '540000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('542521', '普兰县', '542500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542522', '札达县', '542500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542523', '噶尔县', '542500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542524', '日土县', '542500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542525', '革吉县', '542500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542526', '改则县', '542500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542527', '措勤县', '542500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542600', '林芝地区', '540000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('542621', '林芝县', '542600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542622', '工布江达县', '542600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542623', '米林县', '542600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542624', '墨脱县', '542600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542625', '波密县', '542600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542626', '察隅县', '542600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('542627', '朗　县', '542600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610000', '陕西省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('610100', '西安市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610101', '市辖区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610102', '新城区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610103', '碑林区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610104', '莲湖区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610111', '灞桥区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610112', '未央区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610113', '雁塔区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610114', '阎良区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610115', '临潼区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610116', '长安区', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610122', '蓝田县', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610124', '周至县', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610125', '户　县', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610126', '高陵县', '610100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610200', '铜川市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610201', '市辖区', '610200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610202', '王益区', '610200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610203', '印台区', '610200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610204', '耀州区', '610200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610222', '宜君县', '610200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610300', '宝鸡市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610301', '市辖区', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610302', '渭滨区', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610303', '金台区', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610304', '陈仓区', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610322', '凤翔县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610323', '岐山县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610324', '扶风县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610326', '眉　县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610327', '陇　县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610328', '千阳县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610329', '麟游县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610330', '凤　县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610331', '太白县', '610300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610400', '咸阳市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610401', '市辖区', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610402', '秦都区', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610403', '杨凌区', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610404', '渭城区', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610422', '三原县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610423', '泾阳县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610424', '乾　县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610425', '礼泉县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610426', '永寿县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610427', '彬　县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610428', '长武县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610429', '旬邑县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610430', '淳化县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610431', '武功县', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610481', '兴平市', '610400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610500', '渭南市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610501', '市辖区', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610502', '临渭区', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610521', '华　县', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610522', '潼关县', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610523', '大荔县', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610524', '合阳县', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610525', '澄城县', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610526', '蒲城县', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610527', '白水县', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610528', '富平县', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610581', '韩城市', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610582', '华阴市', '610500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610600', '延安市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610601', '市辖区', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610602', '宝塔区', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610621', '延长县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610622', '延川县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610623', '子长县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610624', '安塞县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610625', '志丹县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610626', '吴旗县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610627', '甘泉县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610628', '富　县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610629', '洛川县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610630', '宜川县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610631', '黄龙县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610632', '黄陵县', '610600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610700', '汉中市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610701', '市辖区', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610702', '汉台区', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610721', '南郑县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610722', '城固县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610723', '洋　县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610724', '西乡县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610725', '勉　县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610726', '宁强县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610727', '略阳县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610728', '镇巴县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610729', '留坝县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610730', '佛坪县', '610700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610800', '榆林市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610801', '市辖区', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610802', '榆阳区', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610821', '神木县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610822', '府谷县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610823', '横山县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610824', '靖边县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610825', '定边县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610826', '绥德县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610827', '米脂县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610828', '佳　县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610829', '吴堡县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610830', '清涧县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610831', '子洲县', '610800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610900', '安康市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('610901', '市辖区', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610902', '汉滨区', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610921', '汉阴县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610922', '石泉县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610923', '宁陕县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610924', '紫阳县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610925', '岚皋县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610926', '平利县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610927', '镇坪县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610928', '旬阳县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('610929', '白河县', '610900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('611000', '商洛市', '610000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('611001', '市辖区', '611000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('611002', '商州区', '611000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('611021', '洛南县', '611000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('611022', '丹凤县', '611000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('611023', '商南县', '611000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('611024', '山阳县', '611000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('611025', '镇安县', '611000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('611026', '柞水县', '611000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620000', '甘肃省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('620100', '兰州市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620101', '市辖区', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620102', '城关区', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620103', '七里河区', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620104', '西固区', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620105', '安宁区', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620111', '红古区', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620121', '永登县', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620122', '皋兰县', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620123', '榆中县', '620100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620200', '嘉峪关市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620201', '市辖区', '620200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620300', '金昌市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620301', '市辖区', '620300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620302', '金川区', '620300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620321', '永昌县', '620300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620400', '白银市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620401', '市辖区', '620400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620402', '白银区', '620400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620403', '平川区', '620400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620421', '靖远县', '620400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620422', '会宁县', '620400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620423', '景泰县', '620400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620500', '天水市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620501', '市辖区', '620500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620502', '秦城区', '620500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620503', '北道区', '620500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620521', '清水县', '620500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620522', '秦安县', '620500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620523', '甘谷县', '620500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620524', '武山县', '620500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620525', '张家川回族自治县', '620500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620600', '武威市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620601', '市辖区', '620600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620602', '凉州区', '620600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620621', '民勤县', '620600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620622', '古浪县', '620600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620623', '天祝藏族自治县', '620600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620700', '张掖市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620701', '市辖区', '620700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620702', '甘州区', '620700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620721', '肃南裕固族自治县', '620700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620722', '民乐县', '620700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620723', '临泽县', '620700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620724', '高台县', '620700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620725', '山丹县', '620700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620800', '平凉市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620801', '市辖区', '620800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620802', '崆峒区', '620800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620821', '泾川县', '620800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620822', '灵台县', '620800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620823', '崇信县', '620800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620824', '华亭县', '620800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620825', '庄浪县', '620800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620826', '静宁县', '620800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620900', '酒泉市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('620901', '市辖区', '620900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620902', '肃州区', '620900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620921', '金塔县', '620900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620922', '安西县', '620900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620923', '肃北蒙古族自治县', '620900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620981', '玉门市', '620900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('620982', '敦煌市', '620900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621000', '庆阳市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('621001', '市辖区', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621002', '西峰区', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621021', '庆城县', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621022', '环　县', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621023', '华池县', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621024', '合水县', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621025', '正宁县', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621026', '宁　县', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621027', '镇原县', '621000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621100', '定西市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('621101', '市辖区', '621100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621102', '安定区', '621100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621121', '通渭县', '621100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621122', '陇西县', '621100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621123', '渭源县', '621100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621124', '临洮县', '621100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621125', '漳　县', '621100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621126', '岷　县', '621100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621200', '陇南市', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('621201', '市辖区', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621202', '武都区', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621221', '成　县', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621222', '文　县', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621223', '宕昌县', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621224', '康　县', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621225', '西和县', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621226', '礼　县', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621227', '徽　县', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('621228', '两当县', '621200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('622900', '临夏回族自治州', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('622901', '临夏市', '622900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('622921', '临夏县', '622900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('622922', '康乐县', '622900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('622923', '永靖县', '622900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('622924', '广河县', '622900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('622925', '和政县', '622900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('622926', '东乡族自治县', '622900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('623000', '甘南藏族自治州', '620000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('623001', '合作市', '623000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('623021', '临潭县', '623000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('623022', '卓尼县', '623000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('623023', '舟曲县', '623000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('623024', '迭部县', '623000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('623025', '玛曲县', '623000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('623026', '碌曲县', '623000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('623027', '夏河县', '623000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('630000', '青海省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('630100', '西宁市', '630000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('630101', '市辖区', '630100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('630102', '城东区', '630100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('630103', '城中区', '630100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('630104', '城西区', '630100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('630105', '城北区', '630100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('630121', '大通回族土族自治县', '630100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('630122', '湟中县', '630100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('630123', '湟源县', '630100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632100', '海东地区', '630000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('632121', '平安县', '632100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632122', '民和回族土族自治县', '632100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632123', '乐都县', '632100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632126', '互助土族自治县', '632100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632127', '化隆回族自治县', '632100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632128', '循化撒拉族自治县', '632100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632200', '海北藏族自治州', '630000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('632221', '门源回族自治县', '632200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632222', '祁连县', '632200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632223', '海晏县', '632200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632224', '刚察县', '632200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632300', '黄南藏族自治州', '630000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('632321', '同仁县', '632300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632322', '尖扎县', '632300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632323', '泽库县', '632300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632324', '河南蒙古族自治县', '632300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632500', '海南藏族自治州', '630000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('632521', '共和县', '632500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632522', '同德县', '632500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632523', '贵德县', '632500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632524', '兴海县', '632500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632525', '贵南县', '632500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632600', '果洛藏族自治州', '630000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('632621', '玛沁县', '632600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632622', '班玛县', '632600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632623', '甘德县', '632600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632624', '达日县', '632600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632625', '久治县', '632600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632626', '玛多县', '632600', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632700', '玉树藏族自治州', '630000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('632721', '玉树县', '632700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632722', '杂多县', '632700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632723', '称多县', '632700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632724', '治多县', '632700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632725', '囊谦县', '632700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632726', '曲麻莱县', '632700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('632801', '格尔木市', '632800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632802', '德令哈市', '632800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632821', '乌兰县', '632800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632822', '都兰县', '632800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('632823', '天峻县', '632800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640000', '宁夏回族自治区', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('640100', '银川市', '640000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('640101', '市辖区', '640100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640104', '兴庆区', '640100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640105', '西夏区', '640100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640106', '金凤区', '640100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640121', '永宁县', '640100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640122', '贺兰县', '640100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640181', '灵武市', '640100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640200', '石嘴山市', '640000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('640201', '市辖区', '640200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640202', '大武口区', '640200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640205', '惠农区', '640200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640221', '平罗县', '640200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640300', '吴忠市', '640000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('640301', '市辖区', '640300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640302', '利通区', '640300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640323', '盐池县', '640300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640324', '同心县', '640300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640381', '青铜峡市', '640300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640400', '固原市', '640000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('640401', '市辖区', '640400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640402', '原州区', '640400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640422', '西吉县', '640400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640423', '隆德县', '640400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640424', '泾源县', '640400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640425', '彭阳县', '640400', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640500', '中卫市', '640000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('640501', '市辖区', '640500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640502', '沙坡头区', '640500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640521', '中宁县', '640500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('640522', '海原县', '640500', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650000', '新疆维吾尔自治区', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('650100', '乌鲁木齐市', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('650101', '市辖区', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650102', '天山区', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650103', '沙依巴克区', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650104', '新市区', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650105', '水磨沟区', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650106', '头屯河区', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650107', '达坂城区', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650108', '东山区', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650121', '乌鲁木齐县', '650100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650200', '克拉玛依市', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('650201', '市辖区', '650200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650202', '独山子区', '650200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650203', '克拉玛依区', '650200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650204', '白碱滩区', '650200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('650205', '乌尔禾区', '650200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652100', '吐鲁番地区', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('652101', '吐鲁番市', '652100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652122', '鄯善县', '652100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652123', '托克逊县', '652100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652200', '哈密地区', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('652201', '哈密市', '652200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652223', '伊吾县', '652200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652300', '昌吉回族自治州', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('652301', '昌吉市', '652300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652302', '阜康市', '652300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652303', '米泉市', '652300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652323', '呼图壁县', '652300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652324', '玛纳斯县', '652300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652325', '奇台县', '652300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652327', '吉木萨尔县', '652300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652328', '木垒哈萨克自治县', '652300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('652701', '博乐市', '652700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652722', '精河县', '652700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652723', '温泉县', '652700', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('652801', '库尔勒市', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652822', '轮台县', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652823', '尉犁县', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652824', '若羌县', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652825', '且末县', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652826', '焉耆回族自治县', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652827', '和静县', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652828', '和硕县', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652829', '博湖县', '652800', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652900', '阿克苏地区', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('652901', '阿克苏市', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652922', '温宿县', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652923', '库车县', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652924', '沙雅县', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652925', '新和县', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652926', '拜城县', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652927', '乌什县', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652928', '阿瓦提县', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('652929', '柯坪县', '652900', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('653001', '阿图什市', '653000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653022', '阿克陶县', '653000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653023', '阿合奇县', '653000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653024', '乌恰县', '653000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653100', '喀什地区', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('653101', '喀什市', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653121', '疏附县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653122', '疏勒县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653123', '英吉沙县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653124', '泽普县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653125', '莎车县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653126', '叶城县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653127', '麦盖提县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653128', '岳普湖县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653129', '伽师县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653130', '巴楚县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653200', '和田地区', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('653201', '和田市', '653200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653221', '和田县', '653200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653222', '墨玉县', '653200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653223', '皮山县', '653200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653224', '洛浦县', '653200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653225', '策勒县', '653200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653226', '于田县', '653200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('653227', '民丰县', '653200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654000', '伊犁哈萨克自治州', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('654002', '伊宁市', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654003', '奎屯市', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654021', '伊宁县', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654022', '察布查尔锡伯自治县', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654023', '霍城县', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654024', '巩留县', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654025', '新源县', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654026', '昭苏县', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654027', '特克斯县', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654028', '尼勒克县', '654000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654200', '塔城地区', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('654201', '塔城市', '654200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654202', '乌苏市', '654200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654221', '额敏县', '654200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654223', '沙湾县', '654200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654224', '托里县', '654200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654225', '裕民县', '654200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654300', '阿勒泰地区', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('654301', '阿勒泰市', '654300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654321', '布尔津县', '654300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654322', '富蕴县', '654300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654323', '福海县', '654300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654324', '哈巴河县', '654300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654325', '青河县', '654300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('654326', '吉木乃县', '654300', '0', '3');
INSERT INTO `sys_area_city` VALUES ('659000', '省直辖行政单位', '650000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('659001', '石河子市', '659000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('659002', '阿拉尔市', '659000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('659003', '图木舒克市', '659000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('659004', '五家渠市', '659000', '0', '3');
INSERT INTO `sys_area_city` VALUES ('710000', '台湾省', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('710001', '台湾', '710000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('710002', '台湾', '710001', '0', '3');
INSERT INTO `sys_area_city` VALUES ('810000', '香港特别行政区', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('810001', '香港特别行政区', '810000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('810002', '香港特别行政区', '810001', '0', '3');
INSERT INTO `sys_area_city` VALUES ('820000', '澳门特别行政区', '0', '0', '1');
INSERT INTO `sys_area_city` VALUES ('820001', '澳门特别行政区', '820000', '0', '2');
INSERT INTO `sys_area_city` VALUES ('820002', '澳门特别行政区', '820001', '0', '3');
INSERT INTO `sys_area_city` VALUES ('820007', '测试名称', '110100', '1', '2');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('27', '1', '在线', '0', 'col_station_status', null, null, 'Y', '0', 'admin', '2019-03-25 11:07:13', '', null, '网点在线');
INSERT INTO `sys_dict_data` VALUES ('28', '2', '下线', '1', 'col_station_status', null, null, 'Y', '0', 'admin', '2019-03-25 11:07:41', '', null, '网点下线');
INSERT INTO `sys_dict_data` VALUES ('29', '1', '学生卡', '1', 'special_card_info', '', '', 'Y', '0', 'admin', '2019-03-25 16:58:57', 'admin', '2019-03-28 09:37:33', '学生卡');
INSERT INTO `sys_dict_data` VALUES ('30', '2', '老年卡', '2', 'special_card_info', '', '', 'Y', '0', 'admin', '2019-03-25 16:59:16', 'admin', '2019-03-28 09:37:40', '老年卡');
INSERT INTO `sys_dict_data` VALUES ('31', '1', '申请中', '0', 'cardUser_apply_status', null, null, 'Y', '0', 'admin', '2019-03-25 17:00:47', '', null, '申请中');
INSERT INTO `sys_dict_data` VALUES ('32', '2', '审核通过', '1', 'cardUser_apply_status', '', '', 'Y', '0', 'admin', '2019-03-25 17:00:59', 'admin', '2019-03-25 17:01:20', '审核通过');
INSERT INTO `sys_dict_data` VALUES ('33', '3', '审核不通过', '2', 'cardUser_apply_status', null, null, 'Y', '0', 'admin', '2019-03-25 17:01:11', '', null, '审核不通过');
INSERT INTO `sys_dict_data` VALUES ('34', '1', '微信', '0', 'cardUser_apply_type', null, null, 'Y', '0', 'admin', '2019-03-25 17:03:00', '', null, '微信');
INSERT INTO `sys_dict_data` VALUES ('35', '2', '支付宝', '1', 'cardUser_apply_type', null, null, 'Y', '0', 'admin', '2019-03-25 17:03:12', '', null, '支付宝');
INSERT INTO `sys_dict_data` VALUES ('36', '3', 'PC端', '2', 'cardUser_apply_type', null, null, 'Y', '0', 'admin', '2019-03-25 17:03:24', '', null, 'PC端');
INSERT INTO `sys_dict_data` VALUES ('37', '1', '已支付', '0', 'cardUser_pay_status', null, null, 'Y', '0', 'admin', '2019-03-25 17:04:40', '', null, '已支付');
INSERT INTO `sys_dict_data` VALUES ('38', '2', '未支付', '1', 'cardUser_pay_status', null, null, 'Y', '0', 'admin', '2019-03-25 17:04:53', '', null, '未支付');
INSERT INTO `sys_dict_data` VALUES ('39', '3', '支付失败', '2', 'cardUser_pay_status', null, null, 'Y', '0', 'admin', '2019-03-25 17:05:05', '', null, '支付失败');
INSERT INTO `sys_dict_data` VALUES ('40', '1', '是', '0', 'cardUser_charge_info', null, null, 'Y', '0', 'admin', '2019-03-26 08:45:53', '', null, '是');
INSERT INTO `sys_dict_data` VALUES ('41', '2', '否', '1', 'cardUser_charge_info', null, null, 'Y', '0', 'admin', '2019-03-26 08:46:09', '', null, '否');
INSERT INTO `sys_dict_data` VALUES ('42', '1', '邮寄', '0', 'cardUser_mail_type', '', '', 'Y', '0', 'admin', '2019-03-26 08:58:47', 'admin', '2019-04-02 09:59:33', '邮寄');
INSERT INTO `sys_dict_data` VALUES ('43', '2', '自取', '1', 'cardUser_mail_type', '', '', 'Y', '0', 'admin', '2019-03-26 08:59:01', 'admin', '2019-04-02 09:59:29', '自取');
INSERT INTO `sys_dict_data` VALUES ('44', '1', '微信', '0', 'cardUser_pay_type', null, null, 'Y', '0', 'admin', '2019-03-26 09:12:06', '', null, '微信');
INSERT INTO `sys_dict_data` VALUES ('45', '2', '支付宝', '1', 'cardUser_pay_type', null, null, 'Y', '0', 'admin', '2019-03-26 09:12:19', '', null, '支付宝');
INSERT INTO `sys_dict_data` VALUES ('46', '1', '测试驳回1', '0', 'cardUser_reject_info', null, null, 'Y', '0', 'admin', '2019-04-02 10:17:58', '', null, '测试驳回1');
INSERT INTO `sys_dict_data` VALUES ('47', '2', '测试驳回2', '1', 'cardUser_reject_info', null, null, 'Y', '0', 'admin', '2019-04-02 10:18:16', '', null, '测试驳回2');
INSERT INTO `sys_dict_data` VALUES ('48', '4', '制卡下载', '3', 'cardUser_apply_status', null, null, 'Y', '0', 'admin', '2019-04-02 13:04:23', '', null, '制卡下载');
INSERT INTO `sys_dict_data` VALUES ('49', '5', '制卡完成', '4', 'cardUser_apply_status', null, null, 'Y', '0', 'admin', '2019-04-02 13:04:40', '', null, '制卡完成');
INSERT INTO `sys_dict_data` VALUES ('50', '6', '已发货', '5', 'cardUser_apply_status', null, null, 'Y', '0', 'admin', '2019-04-02 13:05:14', '', null, '已发货');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('10', '网点状态', 'col_station_status', '0', 'admin', '2019-03-25 11:04:48', 'admin', '2019-03-25 11:05:26', '网点状态列表');
INSERT INTO `sys_dict_type` VALUES ('11', '优惠卡类型', 'special_card_info', '0', 'admin', '2019-03-25 16:57:38', '', null, '优惠卡类型');
INSERT INTO `sys_dict_type` VALUES ('12', '申请状态', 'cardUser_apply_status', '0', 'admin', '2019-03-25 17:00:23', '', null, '申请状态');
INSERT INTO `sys_dict_type` VALUES ('13', '申请方式', 'cardUser_apply_type', '0', 'admin', '2019-03-25 17:02:13', '', null, '申请方式');
INSERT INTO `sys_dict_type` VALUES ('14', '支付状态', 'cardUser_pay_status', '0', 'admin', '2019-03-25 17:04:24', '', null, '支付状态');
INSERT INTO `sys_dict_type` VALUES ('15', '是否充值', 'cardUser_charge_info', '0', 'admin', '2019-03-26 08:45:36', '', null, '是否充值');
INSERT INTO `sys_dict_type` VALUES ('16', '邮寄自取', 'cardUser_mail_type', '0', 'admin', '2019-03-26 08:58:19', '', null, '邮寄自取');
INSERT INTO `sys_dict_type` VALUES ('17', '支付方式', 'cardUser_pay_type', '0', 'admin', '2019-03-26 09:11:50', '', null, '支付方式');
INSERT INTO `sys_dict_type` VALUES ('18', '驳回原因', 'cardUser_reject_info', '0', 'admin', '2019-04-02 10:04:11', '', null, '驳回原因');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=350 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-21 11:08:43');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 09:02:08');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 09:13:48');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 09:57:07');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-03-22 10:00:32');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 10:00:36');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 10:25:17');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 11:01:20');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 11:04:15');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 11:08:31');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-22 13:40:15');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-22 13:40:20');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-22 13:40:24');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 14:10:37');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 14:17:32');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 14:55:23');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 14:58:35');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 15:30:32');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 15:37:28');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 15:57:04');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:17:59');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:29:56');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:34:20');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:35:01');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:36:55');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:39:53');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:43:10');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:52:47');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-22 16:57:31');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 16:57:35');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-22 17:02:07');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 11:05:45');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 11:35:28');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 12:14:45');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 13:06:56');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 13:14:24');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '10.8.8.254', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 13:25:21');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '10.8.8.254', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 13:55:15');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-24 14:21:08');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 14:21:11');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 14:31:54');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 14:41:42');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 14:49:35');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '10.8.8.254', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-24 14:54:55');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '10.8.8.254', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-24 14:54:58');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '10.8.8.254', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 14:55:00');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 15:13:42');
INSERT INTO `sys_logininfor` VALUES ('147', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 15:18:19');
INSERT INTO `sys_logininfor` VALUES ('148', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 15:33:03');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 15:37:21');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 15:47:21');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-24 15:47:42');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-24 15:47:45');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-24 15:47:54');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 15:47:57');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 15:48:42');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:06:14');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:08:31');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:10:26');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:12:18');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:25:52');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-24 16:32:12');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:32:18');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:37:55');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:40:59');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:42:56');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:44:24');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 16:46:42');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-24 16:48:56');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-24 17:04:21');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 17:05:20');
INSERT INTO `sys_logininfor` VALUES ('171', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 17:08:10');
INSERT INTO `sys_logininfor` VALUES ('172', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 17:10:32');
INSERT INTO `sys_logininfor` VALUES ('173', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 17:11:21');
INSERT INTO `sys_logininfor` VALUES ('174', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-24 17:16:57');
INSERT INTO `sys_logininfor` VALUES ('175', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-24 17:19:29');
INSERT INTO `sys_logininfor` VALUES ('176', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-25 08:48:42');
INSERT INTO `sys_logininfor` VALUES ('177', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 08:49:06');
INSERT INTO `sys_logininfor` VALUES ('178', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-25 08:52:41');
INSERT INTO `sys_logininfor` VALUES ('179', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 08:52:45');
INSERT INTO `sys_logininfor` VALUES ('180', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 09:07:36');
INSERT INTO `sys_logininfor` VALUES ('181', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 09:17:54');
INSERT INTO `sys_logininfor` VALUES ('182', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 09:20:52');
INSERT INTO `sys_logininfor` VALUES ('183', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 09:21:17');
INSERT INTO `sys_logininfor` VALUES ('184', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 09:34:49');
INSERT INTO `sys_logininfor` VALUES ('185', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 09:46:09');
INSERT INTO `sys_logininfor` VALUES ('186', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 10:08:18');
INSERT INTO `sys_logininfor` VALUES ('187', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 10:48:43');
INSERT INTO `sys_logininfor` VALUES ('188', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 10:51:33');
INSERT INTO `sys_logininfor` VALUES ('189', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 10:54:52');
INSERT INTO `sys_logininfor` VALUES ('190', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 10:58:09');
INSERT INTO `sys_logininfor` VALUES ('191', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 11:01:02');
INSERT INTO `sys_logininfor` VALUES ('192', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 11:01:40');
INSERT INTO `sys_logininfor` VALUES ('193', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 11:11:20');
INSERT INTO `sys_logininfor` VALUES ('194', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 11:24:53');
INSERT INTO `sys_logininfor` VALUES ('195', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 12:52:46');
INSERT INTO `sys_logininfor` VALUES ('196', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 13:07:55');
INSERT INTO `sys_logininfor` VALUES ('197', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 13:09:18');
INSERT INTO `sys_logininfor` VALUES ('198', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 13:15:35');
INSERT INTO `sys_logininfor` VALUES ('199', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 13:40:49');
INSERT INTO `sys_logininfor` VALUES ('200', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 14:02:21');
INSERT INTO `sys_logininfor` VALUES ('201', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 14:09:46');
INSERT INTO `sys_logininfor` VALUES ('202', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 14:31:41');
INSERT INTO `sys_logininfor` VALUES ('203', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 14:41:13');
INSERT INTO `sys_logininfor` VALUES ('204', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 14:42:59');
INSERT INTO `sys_logininfor` VALUES ('205', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 14:46:59');
INSERT INTO `sys_logininfor` VALUES ('206', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 14:55:01');
INSERT INTO `sys_logininfor` VALUES ('207', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 15:01:25');
INSERT INTO `sys_logininfor` VALUES ('208', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-25 15:08:24');
INSERT INTO `sys_logininfor` VALUES ('209', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 15:08:27');
INSERT INTO `sys_logininfor` VALUES ('210', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 15:19:22');
INSERT INTO `sys_logininfor` VALUES ('211', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 15:22:40');
INSERT INTO `sys_logininfor` VALUES ('212', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 15:32:29');
INSERT INTO `sys_logininfor` VALUES ('213', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 15:33:46');
INSERT INTO `sys_logininfor` VALUES ('214', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 15:43:46');
INSERT INTO `sys_logininfor` VALUES ('215', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 15:58:20');
INSERT INTO `sys_logininfor` VALUES ('216', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 16:01:06');
INSERT INTO `sys_logininfor` VALUES ('217', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-25 16:23:00');
INSERT INTO `sys_logininfor` VALUES ('218', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 08:40:25');
INSERT INTO `sys_logininfor` VALUES ('219', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-26 09:18:45');
INSERT INTO `sys_logininfor` VALUES ('220', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-26 09:18:52');
INSERT INTO `sys_logininfor` VALUES ('221', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 09:18:55');
INSERT INTO `sys_logininfor` VALUES ('222', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 09:57:45');
INSERT INTO `sys_logininfor` VALUES ('223', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 10:07:20');
INSERT INTO `sys_logininfor` VALUES ('224', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 10:14:21');
INSERT INTO `sys_logininfor` VALUES ('225', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 10:28:00');
INSERT INTO `sys_logininfor` VALUES ('226', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 10:30:14');
INSERT INTO `sys_logininfor` VALUES ('227', 'admin', '10.8.3.117', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 10:30:34');
INSERT INTO `sys_logininfor` VALUES ('228', 'admin', '10.8.3.117', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 10:48:03');
INSERT INTO `sys_logininfor` VALUES ('229', 'admin', '10.8.3.117', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 10:52:17');
INSERT INTO `sys_logininfor` VALUES ('230', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 11:04:43');
INSERT INTO `sys_logininfor` VALUES ('231', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 11:14:02');
INSERT INTO `sys_logininfor` VALUES ('232', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 13:56:16');
INSERT INTO `sys_logininfor` VALUES ('233', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 14:32:37');
INSERT INTO `sys_logininfor` VALUES ('234', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 14:43:17');
INSERT INTO `sys_logininfor` VALUES ('235', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 15:22:31');
INSERT INTO `sys_logininfor` VALUES ('236', 'admin', '10.8.13.61', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-03-26 17:02:25');
INSERT INTO `sys_logininfor` VALUES ('237', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2019-03-26 17:20:26');
INSERT INTO `sys_logininfor` VALUES ('238', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 17:20:30');
INSERT INTO `sys_logininfor` VALUES ('239', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 18:00:46');
INSERT INTO `sys_logininfor` VALUES ('240', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 18:28:52');
INSERT INTO `sys_logininfor` VALUES ('241', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:00:55');
INSERT INTO `sys_logininfor` VALUES ('242', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:03:15');
INSERT INTO `sys_logininfor` VALUES ('243', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:14:14');
INSERT INTO `sys_logininfor` VALUES ('244', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:18:25');
INSERT INTO `sys_logininfor` VALUES ('245', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:21:12');
INSERT INTO `sys_logininfor` VALUES ('246', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:23:25');
INSERT INTO `sys_logininfor` VALUES ('247', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:25:51');
INSERT INTO `sys_logininfor` VALUES ('248', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:34:11');
INSERT INTO `sys_logininfor` VALUES ('249', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:37:09');
INSERT INTO `sys_logininfor` VALUES ('250', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:39:14');
INSERT INTO `sys_logininfor` VALUES ('251', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:41:37');
INSERT INTO `sys_logininfor` VALUES ('252', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:45:42');
INSERT INTO `sys_logininfor` VALUES ('253', 'admin', '10.8.3.117', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 19:47:42');
INSERT INTO `sys_logininfor` VALUES ('254', 'admin', '10.8.3.117', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-03-26 19:50:18');
INSERT INTO `sys_logininfor` VALUES ('255', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:51:22');
INSERT INTO `sys_logininfor` VALUES ('256', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-26 19:58:38');
INSERT INTO `sys_logininfor` VALUES ('257', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 08:39:24');
INSERT INTO `sys_logininfor` VALUES ('258', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 08:40:57');
INSERT INTO `sys_logininfor` VALUES ('259', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 09:04:49');
INSERT INTO `sys_logininfor` VALUES ('260', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 09:08:33');
INSERT INTO `sys_logininfor` VALUES ('261', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 09:18:52');
INSERT INTO `sys_logininfor` VALUES ('262', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 09:21:27');
INSERT INTO `sys_logininfor` VALUES ('263', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-27 10:21:13');
INSERT INTO `sys_logininfor` VALUES ('264', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 10:21:18');
INSERT INTO `sys_logininfor` VALUES ('265', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 10:21:40');
INSERT INTO `sys_logininfor` VALUES ('266', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-27 10:39:59');
INSERT INTO `sys_logininfor` VALUES ('267', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-27 10:40:03');
INSERT INTO `sys_logininfor` VALUES ('268', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 10:40:06');
INSERT INTO `sys_logininfor` VALUES ('269', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 11:09:05');
INSERT INTO `sys_logininfor` VALUES ('270', 'admin', '10.8.8.254', '内网IP', 'Microsoft Edge', 'Windows 10', '0', '登录成功', '2019-03-27 13:05:41');
INSERT INTO `sys_logininfor` VALUES ('271', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 15:39:38');
INSERT INTO `sys_logininfor` VALUES ('272', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-27 17:42:07');
INSERT INTO `sys_logininfor` VALUES ('273', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-27 17:42:10');
INSERT INTO `sys_logininfor` VALUES ('274', 'admin', '10.8.3.121', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 17:42:14');
INSERT INTO `sys_logininfor` VALUES ('275', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 16:53:14');
INSERT INTO `sys_logininfor` VALUES ('276', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 17:04:43');
INSERT INTO `sys_logininfor` VALUES ('277', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-03-28 17:04:47');
INSERT INTO `sys_logininfor` VALUES ('278', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 17:04:56');
INSERT INTO `sys_logininfor` VALUES ('279', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 17:12:29');
INSERT INTO `sys_logininfor` VALUES ('280', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 17:12:33');
INSERT INTO `sys_logininfor` VALUES ('281', 'admin', '10.8.3.139', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 17:27:41');
INSERT INTO `sys_logininfor` VALUES ('282', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 09:49:03');
INSERT INTO `sys_logininfor` VALUES ('283', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 09:58:36');
INSERT INTO `sys_logininfor` VALUES ('284', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 13:43:04');
INSERT INTO `sys_logininfor` VALUES ('285', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 13:44:32');
INSERT INTO `sys_logininfor` VALUES ('286', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 14:00:11');
INSERT INTO `sys_logininfor` VALUES ('287', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 14:11:39');
INSERT INTO `sys_logininfor` VALUES ('288', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-01 15:11:40');
INSERT INTO `sys_logininfor` VALUES ('289', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 08:56:24');
INSERT INTO `sys_logininfor` VALUES ('290', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 12:59:43');
INSERT INTO `sys_logininfor` VALUES ('291', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 14:04:12');
INSERT INTO `sys_logininfor` VALUES ('292', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-02 15:15:41');
INSERT INTO `sys_logininfor` VALUES ('293', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 15:15:45');
INSERT INTO `sys_logininfor` VALUES ('294', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 15:19:53');
INSERT INTO `sys_logininfor` VALUES ('295', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 15:20:33');
INSERT INTO `sys_logininfor` VALUES ('296', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 15:21:40');
INSERT INTO `sys_logininfor` VALUES ('297', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 09:35:46');
INSERT INTO `sys_logininfor` VALUES ('298', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 09:41:47');
INSERT INTO `sys_logininfor` VALUES ('299', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 09:47:26');
INSERT INTO `sys_logininfor` VALUES ('300', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 09:50:12');
INSERT INTO `sys_logininfor` VALUES ('301', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 09:54:09');
INSERT INTO `sys_logininfor` VALUES ('302', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 09:58:32');
INSERT INTO `sys_logininfor` VALUES ('303', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:01:17');
INSERT INTO `sys_logininfor` VALUES ('304', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:06:03');
INSERT INTO `sys_logininfor` VALUES ('305', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:23:55');
INSERT INTO `sys_logininfor` VALUES ('306', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:27:14');
INSERT INTO `sys_logininfor` VALUES ('307', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:30:11');
INSERT INTO `sys_logininfor` VALUES ('308', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:34:05');
INSERT INTO `sys_logininfor` VALUES ('309', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:36:20');
INSERT INTO `sys_logininfor` VALUES ('310', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:39:05');
INSERT INTO `sys_logininfor` VALUES ('311', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:43:58');
INSERT INTO `sys_logininfor` VALUES ('312', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:47:33');
INSERT INTO `sys_logininfor` VALUES ('313', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:51:07');
INSERT INTO `sys_logininfor` VALUES ('314', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:53:52');
INSERT INTO `sys_logininfor` VALUES ('315', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:55:26');
INSERT INTO `sys_logininfor` VALUES ('316', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 10:57:05');
INSERT INTO `sys_logininfor` VALUES ('317', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 11:00:25');
INSERT INTO `sys_logininfor` VALUES ('318', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 11:06:24');
INSERT INTO `sys_logininfor` VALUES ('319', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 11:09:07');
INSERT INTO `sys_logininfor` VALUES ('320', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 11:16:03');
INSERT INTO `sys_logininfor` VALUES ('321', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 11:25:44');
INSERT INTO `sys_logininfor` VALUES ('322', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 13:13:55');
INSERT INTO `sys_logininfor` VALUES ('323', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 13:33:57');
INSERT INTO `sys_logininfor` VALUES ('324', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 13:46:06');
INSERT INTO `sys_logininfor` VALUES ('325', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 13:58:51');
INSERT INTO `sys_logininfor` VALUES ('326', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 14:08:21');
INSERT INTO `sys_logininfor` VALUES ('327', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 15:09:01');
INSERT INTO `sys_logininfor` VALUES ('328', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-03 15:27:43');
INSERT INTO `sys_logininfor` VALUES ('329', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 08:53:08');
INSERT INTO `sys_logininfor` VALUES ('330', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 09:39:37');
INSERT INTO `sys_logininfor` VALUES ('331', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 14:52:02');
INSERT INTO `sys_logininfor` VALUES ('332', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 15:10:56');
INSERT INTO `sys_logininfor` VALUES ('333', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 15:25:47');
INSERT INTO `sys_logininfor` VALUES ('334', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 15:38:03');
INSERT INTO `sys_logininfor` VALUES ('335', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 15:41:23');
INSERT INTO `sys_logininfor` VALUES ('336', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 15:44:22');
INSERT INTO `sys_logininfor` VALUES ('337', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 15:49:07');
INSERT INTO `sys_logininfor` VALUES ('338', 'admin', '192.168.198.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 16:21:18');
INSERT INTO `sys_logininfor` VALUES ('339', 'admin', '192.168.198.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 16:23:23');
INSERT INTO `sys_logininfor` VALUES ('340', 'admin', '192.168.198.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 16:28:36');
INSERT INTO `sys_logininfor` VALUES ('341', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 16:36:45');
INSERT INTO `sys_logininfor` VALUES ('342', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 08:45:46');
INSERT INTO `sys_logininfor` VALUES ('343', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 09:44:05');
INSERT INTO `sys_logininfor` VALUES ('344', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 09:47:17');
INSERT INTO `sys_logininfor` VALUES ('345', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 09:50:44');
INSERT INTO `sys_logininfor` VALUES ('346', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 10:08:12');
INSERT INTO `sys_logininfor` VALUES ('347', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 10:12:55');
INSERT INTO `sys_logininfor` VALUES ('348', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-08 10:19:01');
INSERT INTO `sys_logininfor` VALUES ('349', 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-04-16 10:26:14');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1107 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '3', '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('114', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('115', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '日志导出', '500', '4', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '日志导出', '501', '3', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '任务详细', '110', '6', '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '任务导出', '110', '7', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1056', '生成查询', '114', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1057', '生成代码', '114', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1058', '取货网点', '3', '1', '/model/stationInfo', 'C', '0', 'model:stationInfo:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '取货网点菜单');
INSERT INTO `sys_menu` VALUES ('1059', '取货网点查询', '1058', '1', '#', 'F', '0', 'model:stationInfo:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1060', '取货网点新增', '1058', '2', '#', 'F', '0', 'model:stationInfo:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1061', '取货网点修改', '1058', '3', '#', 'F', '0', 'model:stationInfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1062', '取货网点删除', '1058', '4', '#', 'F', '0', 'model:stationInfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1063', '优惠卡', '3', '1', '/model/specialCardInfo', 'C', '0', 'model:specialCardInfo:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '优惠卡菜单');
INSERT INTO `sys_menu` VALUES ('1064', '优惠卡查询', '1063', '1', '#', 'F', '0', 'model:specialCardInfo:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1065', '优惠卡新增', '1063', '2', '#', 'F', '0', 'model:specialCardInfo:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1066', '优惠卡修改', '1063', '3', '#', 'F', '0', 'model:specialCardInfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1067', '优惠卡删除', '1063', '4', '#', 'F', '0', 'model:specialCardInfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1068', '地区字典', '1', '1', '/model/sysAreaCity', 'C', '0', 'model:sysAreaCity:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-03-26 15:00:49', '地区据字典菜单');
INSERT INTO `sys_menu` VALUES ('1069', '地区据字典查询', '1068', '1', '#', 'F', '0', 'model:sysAreaCity:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1070', '地区据字典新增', '1068', '2', '#', 'F', '0', 'model:sysAreaCity:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1071', '地区据字典修改', '1068', '3', '#', 'F', '0', 'model:sysAreaCity:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1072', '地区据字典删除', '1068', '4', '#', 'F', '0', 'model:sysAreaCity:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1078', '特殊优惠卡', '0', '4', '#', 'M', '0', null, 'fa fa-address-card-o', 'admin', '2019-03-25 09:01:17', '', null, '');
INSERT INTO `sys_menu` VALUES ('1079', '取货网点', '1078', '2', '/model/stationInfo', 'C', '0', 'model:stationInfo:view', '#', 'admin', '2019-03-25 09:02:16', 'admin', '2019-03-26 15:02:00', '');
INSERT INTO `sys_menu` VALUES ('1081', '优惠卡信息', '1078', '1', '/model/specialCardInfo', 'C', '0', 'model:specialCardInfo:view', '#', 'admin', '2019-03-25 09:06:50', 'admin', '2019-03-26 15:01:47', '');
INSERT INTO `sys_menu` VALUES ('1082', '前台用户', '1078', '3', '/model/user', 'C', '0', 'model:user:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-03-26 15:02:09', '前台用户菜单');
INSERT INTO `sys_menu` VALUES ('1083', '前台用户查询', '1082', '1', '#', 'F', '0', 'model:user:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1084', '前台用户新增', '1082', '2', '#', 'F', '0', 'model:user:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1085', '前台用户修改', '1082', '3', '#', 'F', '0', 'model:user:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1086', '前台用户删除', '1082', '4', '#', 'F', '0', 'model:user:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1097', '制卡信息管理', '1078', '4', '/model/cardUser', 'C', '0', 'model:cardUser:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-03-26 15:02:19', '制卡菜单');
INSERT INTO `sys_menu` VALUES ('1098', '制卡查询', '1097', '1', '#', 'F', '0', 'model:cardUser:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1099', '制卡新增', '1097', '2', '#', 'F', '0', 'model:cardUser:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1100', '制卡修改', '1097', '3', '#', 'F', '0', 'model:cardUser:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1101', '制卡删除', '1097', '4', '#', 'F', '0', 'model:cardUser:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1102', '快递信息管理', '1078', '5', '/model/address', 'C', '0', 'model:address:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2019-03-26 15:02:33', '用户快递菜单');
INSERT INTO `sys_menu` VALUES ('1103', '用户快递查询', '1102', '1', '#', 'F', '0', 'model:address:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1104', '用户快递新增', '1102', '2', '#', 'F', '0', 'model:address:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1105', '用户快递修改', '1102', '3', '#', 'F', '0', 'model:address:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES ('1106', '用户快递删除', '1102', '4', '#', 'F', '0', 'model:address:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-21 11:10:06');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/col_station_info', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-22 09:02:39');
INSERT INTO `sys_oper_log` VALUES ('102', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/col_station_info', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-22 09:14:00');
INSERT INTO `sys_oper_log` VALUES ('103', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.editSave()', '1', 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\r\n  \"roleId\" : [ \"1\" ],\r\n  \"roleName\" : [ \"管理员\" ],\r\n  \"roleKey\" : [ \"admin\" ],\r\n  \"roleSort\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"管理员\" ],\r\n  \"menuIds\" : [ \"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,1058,1059,1060,1061,1062,113,114,1056,1057,115\" ]\r\n}', '0', null, '2019-03-22 10:00:30');
INSERT INTO `sys_oper_log` VALUES ('104', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/col_special_card_info', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-22 11:04:41');
INSERT INTO `sys_oper_log` VALUES ('105', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/sys_area_city', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-22 15:31:55');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1068\" ],\r\n  \"parentId\" : [ \"3\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"地区字典\" ],\r\n  \"url\" : [ \"/model/sysAreaCity\" ],\r\n  \"perms\" : [ \"model:sysAreaCity:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-22 15:38:03');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1073', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-24 12:15:20');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1074', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-24 12:15:53');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1075', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-24 12:16:02');
INSERT INTO `sys_oper_log` VALUES ('110', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1076', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-24 12:16:10');
INSERT INTO `sys_oper_log` VALUES ('111', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1077', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-24 12:16:16');
INSERT INTO `sys_oper_log` VALUES ('112', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1073', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-24 12:16:26');
INSERT INTO `sys_oper_log` VALUES ('113', '地区据字典', '1', 'com.whty.model.web.controller.SysAreaCityController.addSave()', '1', 'admin', '研发部门', '/model/sysAreaCity/add', '127.0.0.1', '内网IP', '{\r\n  \"aLEVEL\" : [ \"1\" ],\r\n  \"nAME\" : [ \"测试\" ],\r\n  \"sORT\" : [ \"\" ]\r\n}', '0', null, '2019-03-24 13:07:14');
INSERT INTO `sys_oper_log` VALUES ('114', '地区据字典', '1', 'com.whty.model.web.controller.SysAreaCityController.addSave()', '1', 'admin', '研发部门', '/model/sysAreaCity/add', '127.0.0.1', '内网IP', '{\r\n  \"aLEVEL\" : [ \"2\" ],\r\n  \"proId\" : [ \"110000\" ],\r\n  \"nAME\" : [ \"测试\" ],\r\n  \"sORT\" : [ \"\" ]\r\n}', '0', null, '2019-03-24 13:07:41');
INSERT INTO `sys_oper_log` VALUES ('115', '地区据字典', '1', 'com.whty.model.web.controller.SysAreaCityController.addSave()', '1', 'admin', '研发部门', '/model/sysAreaCity/add', '127.0.0.1', '内网IP', '{\r\n  \"aLEVEL\" : [ \"2\" ],\r\n  \"proId\" : [ \"110000\" ],\r\n  \"nAME\" : [ \"测试\" ],\r\n  \"sORT\" : [ \"\" ]\r\n}', '0', null, '2019-03-24 13:14:54');
INSERT INTO `sys_oper_log` VALUES ('116', '地区据字典', '1', 'com.whty.model.web.controller.SysAreaCityController.addSave()', '1', 'admin', '研发部门', '/model/sysAreaCity/add', '127.0.0.1', '内网IP', '{\r\n  \"aLEVEL\" : [ \"3\" ],\r\n  \"proId\" : [ \"110000\" ],\r\n  \"cityId\" : [ \"820005\" ],\r\n  \"nAME\" : [ \"测试\" ],\r\n  \"sORT\" : [ \"\" ]\r\n}', '0', null, '2019-03-24 13:15:39');
INSERT INTO `sys_oper_log` VALUES ('117', '地区据字典', '3', 'com.whty.model.web.controller.SysAreaCityController.remove()', '1', 'admin', '研发部门', '/model/sysAreaCity/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"undefined\" ]\r\n}', '0', null, '2019-03-24 13:15:46');
INSERT INTO `sys_oper_log` VALUES ('118', '地区据字典', '3', 'com.whty.model.web.controller.SysAreaCityController.remove()', '1', 'admin', '研发部门', '/model/sysAreaCity/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"820004\" ]\r\n}', '0', null, '2019-03-24 13:24:50');
INSERT INTO `sys_oper_log` VALUES ('119', '地区据字典', '3', 'com.whty.model.web.controller.SysAreaCityController.remove()', '1', 'admin', '研发部门', '/model/sysAreaCity/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"820003\" ]\r\n}', '0', null, '2019-03-24 13:27:57');
INSERT INTO `sys_oper_log` VALUES ('120', '地区据字典', '3', 'com.whty.model.web.controller.SysAreaCityController.remove()', '1', 'admin', '研发部门', '/model/sysAreaCity/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"820006\" ]\r\n}', '0', null, '2019-03-24 13:28:03');
INSERT INTO `sys_oper_log` VALUES ('121', '地区据字典', '3', 'com.whty.model.web.controller.SysAreaCityController.remove()', '1', 'admin', '研发部门', '/model/sysAreaCity/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"820005\" ]\r\n}', '0', null, '2019-03-24 13:28:06');
INSERT INTO `sys_oper_log` VALUES ('122', '地区据字典', '2', 'com.whty.model.web.controller.SysAreaCityController.editSave()', '1', 'admin', '研发部门', '/model/sysAreaCity/edit', '127.0.0.1', '内网IP', '{\r\n  \"iD\" : [ \"421181\" ],\r\n  \"pID\" : [ \"421100\" ],\r\n  \"aLEVEL\" : [ \"3\" ],\r\n  \"proId\" : [ \"420000\" ],\r\n  \"cityId\" : [ \"421100\" ],\r\n  \"nAME\" : [ \"麻城市11\" ],\r\n  \"sORT\" : [ \"0\" ]\r\n}', '0', null, '2019-03-24 14:34:45');
INSERT INTO `sys_oper_log` VALUES ('123', '地区据字典', '2', 'com.whty.model.web.controller.SysAreaCityController.editSave()', '1', 'admin', '研发部门', '/model/sysAreaCity/edit', '127.0.0.1', '内网IP', '{\r\n  \"iD\" : [ \"421181\" ],\r\n  \"pID\" : [ \"421100\" ],\r\n  \"aLEVEL\" : [ \"3\" ],\r\n  \"proId\" : [ \"420000\" ],\r\n  \"cityId\" : [ \"421100\" ],\r\n  \"nAME\" : [ \"麻城市\" ],\r\n  \"sORT\" : [ \"0\" ]\r\n}', '0', null, '2019-03-24 14:34:54');
INSERT INTO `sys_oper_log` VALUES ('124', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/caiji/tool/gen/genCode/col_user', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-25 09:01:07');
INSERT INTO `sys_oper_log` VALUES ('125', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"特殊优惠卡\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-address-card-o\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 09:01:17');
INSERT INTO `sys_oper_log` VALUES ('126', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"取货网点\" ],\r\n  \"url\" : [ \"/model/stationInfo\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 09:02:16');
INSERT INTO `sys_oper_log` VALUES ('127', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1079\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"取货网点\" ],\r\n  \"url\" : [ \"/model/stationInfo\" ],\r\n  \"perms\" : [ \"model:stationInfo:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 09:02:41');
INSERT INTO `sys_oper_log` VALUES ('128', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"地区字典\" ],\r\n  \"url\" : [ \"/model/sysAreaCity\" ],\r\n  \"perms\" : [ \"model:sysAreaCity:view\" ],\r\n  \"orderNum\" : [ \"10\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 09:04:33');
INSERT INTO `sys_oper_log` VALUES ('129', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1080\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"地区字典\" ],\r\n  \"url\" : [ \"/model/sysAreaCity\" ],\r\n  \"perms\" : [ \"model:sysAreaCity:view\" ],\r\n  \"orderNum\" : [ \"10\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 09:05:49');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"优惠卡信息\" ],\r\n  \"url\" : [ \"/model/specialCardInfo\" ],\r\n  \"perms\" : [ \"model:specialCardInfo:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 09:06:50');
INSERT INTO `sys_oper_log` VALUES ('131', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1068\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"地区字典\" ],\r\n  \"url\" : [ \"/model/sysAreaCity\" ],\r\n  \"perms\" : [ \"model:sysAreaCity:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 09:10:51');
INSERT INTO `sys_oper_log` VALUES ('132', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1058', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-25 09:18:44');
INSERT INTO `sys_oper_log` VALUES ('133', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1059', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-25 09:18:51');
INSERT INTO `sys_oper_log` VALUES ('134', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1059', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-25 09:19:04');
INSERT INTO `sys_oper_log` VALUES ('135', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1060', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-25 09:19:22');
INSERT INTO `sys_oper_log` VALUES ('136', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/caiji/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1082\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"前台用户\" ],\r\n  \"url\" : [ \"/model/user\" ],\r\n  \"perms\" : [ \"model:user:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 09:21:47');
INSERT INTO `sys_oper_log` VALUES ('137', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/caiji/tool/gen/genCode/col_card_user', '10.8.3.121', '内网IP', '{ }', '0', null, '2019-03-25 10:52:32');
INSERT INTO `sys_oper_log` VALUES ('138', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"网点状态\" ],\r\n  \"dictType\" : [ \"col_station_status\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-25 11:04:48');
INSERT INTO `sys_oper_log` VALUES ('139', '字典类型', '2', 'com.ruoyi.web.controller.system.SysDictTypeController.editSave()', '1', 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictId\" : [ \"10\" ],\r\n  \"dictName\" : [ \"网点状态\" ],\r\n  \"dictType\" : [ \"col_station_status\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"网点状态列表\" ]\r\n}', '0', null, '2019-03-25 11:05:26');
INSERT INTO `sys_oper_log` VALUES ('140', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"在线\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"col_station_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"网点在线\" ]\r\n}', '0', null, '2019-03-25 11:07:13');
INSERT INTO `sys_oper_log` VALUES ('141', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"下线\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"col_station_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"网点下线\" ]\r\n}', '0', null, '2019-03-25 11:07:41');
INSERT INTO `sys_oper_log` VALUES ('142', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/caiji/system/menu/remove/1092', '10.8.3.121', '内网IP', '{ }', '0', null, '2019-03-25 11:27:06');
INSERT INTO `sys_oper_log` VALUES ('143', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/caiji/system/menu/remove/1087', '10.8.3.121', '内网IP', '{ }', '0', null, '2019-03-25 11:27:21');
INSERT INTO `sys_oper_log` VALUES ('144', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/caiji/system/menu/edit', '10.8.3.121', '内网IP', '{\r\n  \"menuId\" : [ \"1097\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"制卡\" ],\r\n  \"url\" : [ \"/model/cardUser\" ],\r\n  \"perms\" : [ \"model:cardUser:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 11:29:13');
INSERT INTO `sys_oper_log` VALUES ('145', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/caiji/tool/gen/genCode/col_address', '10.8.3.121', '内网IP', '{ }', '0', null, '2019-03-25 13:09:43');
INSERT INTO `sys_oper_log` VALUES ('146', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/caiji/system/menu/edit', '10.8.3.121', '内网IP', '{\r\n  \"menuId\" : [ \"1102\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"快递信息管理\" ],\r\n  \"url\" : [ \"/model/address\" ],\r\n  \"perms\" : [ \"model:address:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 13:16:20');
INSERT INTO `sys_oper_log` VALUES ('147', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/caiji/system/menu/edit', '10.8.3.121', '内网IP', '{\r\n  \"menuId\" : [ \"1097\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"制卡信息管理\" ],\r\n  \"url\" : [ \"/model/cardUser\" ],\r\n  \"perms\" : [ \"model:cardUser:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-25 13:16:49');
INSERT INTO `sys_oper_log` VALUES ('148', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/caiji/tool/gen/genCode/col_card_user', '10.8.3.121', '内网IP', '{ }', '0', null, '2019-03-25 15:44:12');
INSERT INTO `sys_oper_log` VALUES ('149', '取货网点', '1', 'com.whty.model.web.controller.StationInfoController.addSave()', '1', 'admin', '研发部门', '/model/stationInfo/add', '127.0.0.1', '内网IP', '{\r\n  \"proId\" : [ \"420000\" ],\r\n  \"cityId\" : [ \"420100\" ],\r\n  \"countyId\" : [ \"420115\" ],\r\n  \"stationName\" : [ \"江夏自提\" ],\r\n  \"stationAddress\" : [ \"\" ],\r\n  \"stationMobile\" : [ \"\" ],\r\n  \"stationConnectPerson\" : [ \"\" ],\r\n  \"stationNetTime\" : [ \"\" ],\r\n  \"stationServerInfo\" : [ \"\" ],\r\n  \"stationStatus\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-25 15:59:10');
INSERT INTO `sys_oper_log` VALUES ('150', '取货网点', '1', 'com.whty.model.web.controller.StationInfoController.addSave()', '1', 'admin', '研发部门', '/model/stationInfo/add', '127.0.0.1', '内网IP', '{\r\n  \"proId\" : [ \"420000\" ],\r\n  \"cityId\" : [ \"420100\" ],\r\n  \"countyId\" : [ \"420115\" ],\r\n  \"stationName\" : [ \"测试网点\" ],\r\n  \"stationAddress\" : [ \"华工园一路\" ],\r\n  \"stationMobile\" : [ \"13566666666\" ],\r\n  \"stationConnectPerson\" : [ \"测试\" ],\r\n  \"stationNetTime\" : [ \"08:00-18:00\" ],\r\n  \"stationServerInfo\" : [ \"\" ],\r\n  \"stationStatus\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-25 16:02:24');
INSERT INTO `sys_oper_log` VALUES ('151', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1058', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-25 16:12:10');
INSERT INTO `sys_oper_log` VALUES ('152', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"优惠卡类型\" ],\r\n  \"dictType\" : [ \"special_card_info\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"优惠卡类型\" ]\r\n}', '0', null, '2019-03-25 16:57:38');
INSERT INTO `sys_oper_log` VALUES ('153', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"学生卡\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"special_card_info\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"学生卡\" ]\r\n}', '0', null, '2019-03-25 16:58:57');
INSERT INTO `sys_oper_log` VALUES ('154', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"老年卡\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"special_card_info\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"老年卡\" ]\r\n}', '0', null, '2019-03-25 16:59:16');
INSERT INTO `sys_oper_log` VALUES ('155', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"申请状态\" ],\r\n  \"dictType\" : [ \"cardUser_apply_status\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"申请状态\" ]\r\n}', '0', null, '2019-03-25 17:00:23');
INSERT INTO `sys_oper_log` VALUES ('156', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"申请中\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"cardUser_apply_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"申请中\" ]\r\n}', '0', null, '2019-03-25 17:00:47');
INSERT INTO `sys_oper_log` VALUES ('157', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"审核通过\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"cardUser_apply_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '0', null, '2019-03-25 17:00:59');
INSERT INTO `sys_oper_log` VALUES ('158', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"审核不通过\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"cardUser_apply_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"审核不通过\" ]\r\n}', '0', null, '2019-03-25 17:01:11');
INSERT INTO `sys_oper_log` VALUES ('159', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"32\" ],\r\n  \"dictLabel\" : [ \"审核通过\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"cardUser_apply_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"审核通过\" ]\r\n}', '0', null, '2019-03-25 17:01:20');
INSERT INTO `sys_oper_log` VALUES ('160', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"申请方式\" ],\r\n  \"dictType\" : [ \"cardUser_apply_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"申请方式\" ]\r\n}', '0', null, '2019-03-25 17:02:13');
INSERT INTO `sys_oper_log` VALUES ('161', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"微信\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"cardUser_apply_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"微信\" ]\r\n}', '0', null, '2019-03-25 17:03:00');
INSERT INTO `sys_oper_log` VALUES ('162', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"支付宝\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"cardUser_apply_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"支付宝\" ]\r\n}', '0', null, '2019-03-25 17:03:12');
INSERT INTO `sys_oper_log` VALUES ('163', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"PC端\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"cardUser_apply_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"PC端\" ]\r\n}', '0', null, '2019-03-25 17:03:24');
INSERT INTO `sys_oper_log` VALUES ('164', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"支付状态\" ],\r\n  \"dictType\" : [ \"cardUser_pay_status\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"支付状态\" ]\r\n}', '0', null, '2019-03-25 17:04:24');
INSERT INTO `sys_oper_log` VALUES ('165', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"已支付\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"cardUser_pay_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"已支付\" ]\r\n}', '0', null, '2019-03-25 17:04:40');
INSERT INTO `sys_oper_log` VALUES ('166', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"未支付\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"cardUser_pay_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"未支付\" ]\r\n}', '0', null, '2019-03-25 17:04:53');
INSERT INTO `sys_oper_log` VALUES ('167', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"支付失败\" ],\r\n  \"dictValue\" : [ \"2\" ],\r\n  \"dictType\" : [ \"cardUser_pay_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"3\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"支付失败\" ]\r\n}', '0', null, '2019-03-25 17:05:05');
INSERT INTO `sys_oper_log` VALUES ('168', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"是否充值\" ],\r\n  \"dictType\" : [ \"cardUser_charge_info\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"是否充值\" ]\r\n}', '0', null, '2019-03-26 08:45:36');
INSERT INTO `sys_oper_log` VALUES ('169', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"是\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"cardUser_charge_info\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"是\" ]\r\n}', '0', null, '2019-03-26 08:45:53');
INSERT INTO `sys_oper_log` VALUES ('170', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"否\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"cardUser_charge_info\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"否\" ]\r\n}', '0', null, '2019-03-26 08:46:09');
INSERT INTO `sys_oper_log` VALUES ('171', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"邮寄自取\" ],\r\n  \"dictType\" : [ \"cardUser_mail_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"邮寄自取\" ]\r\n}', '0', null, '2019-03-26 08:58:19');
INSERT INTO `sys_oper_log` VALUES ('172', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"邮寄\" ],\r\n  \"dictValue\" : [ \"00\" ],\r\n  \"dictType\" : [ \"cardUser_mail_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"邮寄\" ]\r\n}', '0', null, '2019-03-26 08:58:47');
INSERT INTO `sys_oper_log` VALUES ('173', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"自取\" ],\r\n  \"dictValue\" : [ \"01\" ],\r\n  \"dictType\" : [ \"cardUser_mail_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"自取\" ]\r\n}', '0', null, '2019-03-26 08:59:01');
INSERT INTO `sys_oper_log` VALUES ('174', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"支付方式\" ],\r\n  \"dictType\" : [ \"cardUser_pay_type\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"支付方式\" ]\r\n}', '0', null, '2019-03-26 09:11:50');
INSERT INTO `sys_oper_log` VALUES ('175', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"微信\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"cardUser_pay_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"微信\" ]\r\n}', '0', null, '2019-03-26 09:12:06');
INSERT INTO `sys_oper_log` VALUES ('176', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"支付宝\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"cardUser_pay_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"支付宝\" ]\r\n}', '0', null, '2019-03-26 09:12:19');
INSERT INTO `sys_oper_log` VALUES ('177', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/ruoyi-admin/system/user/profile/updateAvatar', '10.8.3.117', '内网IP', '{ }', '0', null, '2019-03-26 10:48:37');
INSERT INTO `sys_oper_log` VALUES ('178', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/ruoyi-admin/system/user/profile/updateAvatar', '10.8.3.117', '内网IP', '{ }', '0', null, '2019-03-26 10:52:30');
INSERT INTO `sys_oper_log` VALUES ('179', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"userName\" : [ \"管理员\" ],\r\n  \"email\" : [ \"15107181720@163.com\" ],\r\n  \"phonenumber\" : [ \"15888888888\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 11:05:10');
INSERT INTO `sys_oper_log` VALUES ('180', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-26 11:05:29');
INSERT INTO `sys_oper_log` VALUES ('181', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"cityId\" : [ \"420100\" ],\r\n  \"countyId\" : [ \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"李四\" ],\r\n  \"stationNetTime\" : [ \"上午9点到下午5点\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"createDate\" : [ \"Sun Mar 24 00:00:00 CST 2019\" ],\r\n  \"updateDate\" : [ \"Sun Mar 24 00:00:00 CST 2019\" ],\r\n  \"stationStatus\" : [ \"0\" ],\r\n  \"delFlag\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 11:12:59');
INSERT INTO `sys_oper_log` VALUES ('182', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"122\" ],\r\n  \"cityId\" : [ \"420100\" ],\r\n  \"countyId\" : [ \"420115\" ],\r\n  \"stationName\" : [ \"兰州交通大学站\" ],\r\n  \"stationAddress\" : [ \"甘肃省兰州市安宁区安宁西路88号\" ],\r\n  \"stationMobile\" : [ \"15107181720\" ],\r\n  \"stationConnectPerson\" : [ \"张无忌\" ],\r\n  \"stationNetTime\" : [ \"上午09:00 ---下午 17:00\" ],\r\n  \"stationServerInfo\" : [ \"学生卡带领服务\" ],\r\n  \"createDate\" : [ \"Fri Jan 25 16:05:51 CST 2019\" ],\r\n  \"updateDate\" : [ \"\" ],\r\n  \"stationStatus\" : [ \"0\" ],\r\n  \"delFlag\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 11:15:31');
INSERT INTO `sys_oper_log` VALUES ('183', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"cityId\" : [ \"420100\" ],\r\n  \"countyId\" : [ \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"李四\" ],\r\n  \"stationNetTime\" : [ \"上午09:00---下午17:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"createDate\" : [ \"Sun Mar 24 00:00:00 CST 2019\" ],\r\n  \"updateDate\" : [ \"Sun Mar 24 00:00:00 CST 2019\" ],\r\n  \"stationStatus\" : [ \"0\" ],\r\n  \"delFlag\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 11:15:46');
INSERT INTO `sys_oper_log` VALUES ('184', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"123\" ],\r\n  \"cityId\" : [ \"420100\" ],\r\n  \"countyId\" : [ \"420115\" ],\r\n  \"stationName\" : [ \"兰州理工大学\" ],\r\n  \"stationAddress\" : [ \"甘肃省兰州市七里河区彭家坪路36号龚家湾\" ],\r\n  \"stationMobile\" : [ \"12789071230\" ],\r\n  \"stationConnectPerson\" : [ \"赵敏\" ],\r\n  \"stationNetTime\" : [ \"上午08:00--下午18:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"createDate\" : [ \"Fri Jan 25 16:09:21 CST 2019\" ],\r\n  \"updateDate\" : [ \"\" ],\r\n  \"stationStatus\" : [ \"0\" ],\r\n  \"delFlag\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 11:17:40');
INSERT INTO `sys_oper_log` VALUES ('185', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"cityId\" : [ \"420100\" ],\r\n  \"countyId\" : [ \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"周芷若\" ],\r\n  \"stationNetTime\" : [ \"上午09:00---下午17:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"stationStatus\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 11:18:48');
INSERT INTO `sys_oper_log` VALUES ('186', '取货网点', '1', 'com.whty.model.web.controller.StationInfoController.addSave()', '1', 'admin', '研发部门', '/model/stationInfo/add', '127.0.0.1', '内网IP', '{\r\n  \"stationName\" : [ \"元台子\" ],\r\n  \"stationAddress\" : [ \"兰州市安宁区元台子\" ],\r\n  \"stationMobile\" : [ \"18871239867\" ],\r\n  \"stationConnectPerson\" : [ \"范瑶\" ],\r\n  \"stationNetTime\" : [ \"09:00--17:30\" ],\r\n  \"stationServerInfo\" : [ \"学生卡代领服务\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 11:25:11');
INSERT INTO `sys_oper_log` VALUES ('187', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"124\" ],\r\n  \"stationName\" : [ \"元台子\" ],\r\n  \"stationAddress\" : [ \"兰州市安宁区元台子\" ],\r\n  \"stationMobile\" : [ \"18871239867\" ],\r\n  \"stationConnectPerson\" : [ \"范瑶\" ],\r\n  \"stationNetTime\" : [ \"上午09:00--下午17:30\" ],\r\n  \"stationServerInfo\" : [ \"学生卡代领服务\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 11:25:24');
INSERT INTO `sys_oper_log` VALUES ('188', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', '1', 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"loginName\" : [ \"\" ],\r\n  \"phonenumber\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 11:32:53');
INSERT INTO `sys_oper_log` VALUES ('189', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/tool/gen/genCode/col_special_card_info', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-26 13:56:39');
INSERT INTO `sys_oper_log` VALUES ('190', '优惠卡', '1', 'com.whty.model.web.controller.SpecialCardInfoController.addSave()', '1', 'admin', '研发部门', '/model/specialCardInfo/add', '127.0.0.1', '内网IP', '{\r\n  \"cardTypeName\" : [ \"老年人卡\" ],\r\n  \"cardFee\" : [ \"20\" ],\r\n  \"mailFee\" : [ \"10\" ],\r\n  \"cardType\" : [ \"异形卡\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'card_type\' at row 1\r\n### The error may involve com.whty.model.mapper.SpecialCardInfoMapper.insertSpecialCardInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into col_special_card_info    ( card_type_name,                card_fee,    mail_fee,    card_type )           values ( ?,                ?,    ?,    ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'card_type\' at row 1\n; Data truncation: Data too long for column \'card_type\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'card_type\' at row 1', '2019-03-26 14:46:27');
INSERT INTO `sys_oper_log` VALUES ('191', '优惠卡', '1', 'com.whty.model.web.controller.SpecialCardInfoController.addSave()', '1', 'admin', '研发部门', '/model/specialCardInfo/add', '127.0.0.1', '内网IP', '{\r\n  \"cardTypeName\" : [ \"老年人卡\" ],\r\n  \"cardFee\" : [ \"20\" ],\r\n  \"mailFee\" : [ \"10\" ],\r\n  \"cardType\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 14:56:23');
INSERT INTO `sys_oper_log` VALUES ('192', '优惠卡', '2', 'com.whty.model.web.controller.SpecialCardInfoController.editSave()', '1', 'admin', '研发部门', '/model/specialCardInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"111\" ],\r\n  \"cardTypeName\" : [ \"学生卡\" ],\r\n  \"cardFee\" : [ \"20\" ],\r\n  \"mailFee\" : [ \"10\" ],\r\n  \"cardType\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 14:58:17');
INSERT INTO `sys_oper_log` VALUES ('193', '优惠卡', '2', 'com.whty.model.web.controller.SpecialCardInfoController.editSave()', '1', 'admin', '研发部门', '/model/specialCardInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"112\" ],\r\n  \"cardTypeName\" : [ \"老年人卡\" ],\r\n  \"cardFee\" : [ \"20\" ],\r\n  \"mailFee\" : [ \"10\" ],\r\n  \"cardType\" : [ \"1\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-26 14:58:24');
INSERT INTO `sys_oper_log` VALUES ('194', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/1068', '127.0.0.1', '内网IP', '{ }', '0', null, '2019-03-26 15:00:03');
INSERT INTO `sys_oper_log` VALUES ('195', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1068\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"地区字典\" ],\r\n  \"url\" : [ \"/model/sysAreaCity\" ],\r\n  \"perms\" : [ \"model:sysAreaCity:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 15:00:49');
INSERT INTO `sys_oper_log` VALUES ('196', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1081\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"优惠卡信息\" ],\r\n  \"url\" : [ \"/model/specialCardInfo\" ],\r\n  \"perms\" : [ \"model:specialCardInfo:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 15:01:47');
INSERT INTO `sys_oper_log` VALUES ('197', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1079\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"取货网点\" ],\r\n  \"url\" : [ \"/model/stationInfo\" ],\r\n  \"perms\" : [ \"model:stationInfo:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 15:02:00');
INSERT INTO `sys_oper_log` VALUES ('198', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1082\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"前台用户\" ],\r\n  \"url\" : [ \"/model/user\" ],\r\n  \"perms\" : [ \"model:user:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 15:02:09');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1097\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"制卡信息管理\" ],\r\n  \"url\" : [ \"/model/cardUser\" ],\r\n  \"perms\" : [ \"model:cardUser:view\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 15:02:19');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"1102\" ],\r\n  \"parentId\" : [ \"1078\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"快递信息管理\" ],\r\n  \"url\" : [ \"/model/address\" ],\r\n  \"perms\" : [ \"model:address:view\" ],\r\n  \"orderNum\" : [ \"5\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2019-03-26 15:02:33');
INSERT INTO `sys_oper_log` VALUES ('201', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/caiji/tool/gen/genCode/col_card_user', '10.8.3.121', '内网IP', '{ }', '0', null, '2019-03-26 18:31:11');
INSERT INTO `sys_oper_log` VALUES ('202', '代码生成', '8', 'com.ruoyi.generator.controller.GenController.genCode()', '1', 'admin', '研发部门', '/caiji/tool/gen/genCode/col_address', '10.8.3.121', '内网IP', '{ }', '0', null, '2019-03-26 19:01:07');
INSERT INTO `sys_oper_log` VALUES ('203', '个人信息', '2', 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/caiji/system/user/profile/updateAvatar', '10.8.3.117', '内网IP', '{ }', '0', null, '2019-03-26 19:50:33');
INSERT INTO `sys_oper_log` VALUES ('204', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/caiji/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"proId\" : [ \"420000\", \"420000\" ],\r\n  \"cityId\" : [ \"420100\", \"420100\" ],\r\n  \"countyId\" : [ \"420106\", \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"周芷若\" ],\r\n  \"stationNetTime\" : [ \"上午09:00---下午17:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"stationStatus\" : [ \"0\", \"0\" ],\r\n  \"remarks\" : [ \"测试修改\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1\r\n### The error may involve com.whty.model.mapper.StationInfoMapper.updateStationInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update col_station_info          SET pro_id = ?,             city_id = ?,             county_id = ?,             station_name = ?,             station_address = ?,             station_mobile = ?,             station_connect_person = ?,             station_net_time = ?,             station_server_info = ?,                          update_date = ?,             station_status = ?,                          remarks = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1\n; Data truncation: Data too long for column \'station_status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1', '2019-03-27 09:05:03');
INSERT INTO `sys_oper_log` VALUES ('205', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/caiji/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"proId\" : [ \"420000\", \"420000\" ],\r\n  \"cityId\" : [ \"420100\", \"420100\" ],\r\n  \"countyId\" : [ \"420106\", \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"周芷若\" ],\r\n  \"stationNetTime\" : [ \"上午09:00---下午17:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"stationStatus\" : [ \"0\", \"0\" ],\r\n  \"remarks\" : [ \"测试修改\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1\r\n### The error may involve com.whty.model.mapper.StationInfoMapper.updateStationInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update col_station_info          SET pro_id = ?,             city_id = ?,             county_id = ?,             station_name = ?,             station_address = ?,             station_mobile = ?,             station_connect_person = ?,             station_net_time = ?,             station_server_info = ?,                          update_date = ?,             station_status = ?,                          remarks = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1\n; Data truncation: Data too long for column \'station_status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1', '2019-03-27 09:06:18');
INSERT INTO `sys_oper_log` VALUES ('206', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/caiji/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"proId\" : [ \"420000\", \"420000\" ],\r\n  \"cityId\" : [ \"420100\", \"420100\" ],\r\n  \"countyId\" : [ \"420106\", \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"周芷若\" ],\r\n  \"stationNetTime\" : [ \"上午09:00---下午17:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"stationStatus\" : [ \"0\", \"0\" ],\r\n  \"remarks\" : [ \"测试修改\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1\r\n### The error may involve com.whty.model.mapper.StationInfoMapper.updateStationInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update col_station_info          SET pro_id = ?,             city_id = ?,             county_id = ?,             station_name = ?,             station_address = ?,             station_mobile = ?,             station_connect_person = ?,             station_net_time = ?,             station_server_info = ?,                          update_date = ?,             station_status = ?,                          remarks = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1\n; Data truncation: Data too long for column \'station_status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1', '2019-03-27 09:15:22');
INSERT INTO `sys_oper_log` VALUES ('207', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/caiji/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"proId\" : [ \"420000\", \"420000\" ],\r\n  \"cityId\" : [ \"420100\", \"420100\" ],\r\n  \"countyId\" : [ \"420106\", \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"周芷若\" ],\r\n  \"stationNetTime\" : [ \"上午09:00---下午17:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"stationStatus\" : [ \"0\", \"0\" ],\r\n  \"remarks\" : [ \"测试修改\" ]\r\n}', '1', '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1\r\n### The error may involve com.whty.model.mapper.StationInfoMapper.updateStationInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update col_station_info          SET pro_id = ?,             city_id = ?,             county_id = ?,             station_name = ?,             station_address = ?,             station_mobile = ?,             station_connect_person = ?,             station_net_time = ?,             station_server_info = ?,                          update_date = ?,             station_status = ?,                          remarks = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1\n; Data truncation: Data too long for column \'station_status\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'station_status\' at row 1', '2019-03-27 09:15:56');
INSERT INTO `sys_oper_log` VALUES ('208', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/caiji/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"proId\" : [ \"420000\", \"420000\" ],\r\n  \"cityId\" : [ \"420100\", \"420100\" ],\r\n  \"countyId\" : [ \"420106\", \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"周芷若\" ],\r\n  \"stationNetTime\" : [ \"上午09:00---下午17:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"stationStatus\" : [ \"0\", \"0\" ],\r\n  \"remarks\" : [ \"测试修改\" ]\r\n}', '0', null, '2019-03-27 09:19:08');
INSERT INTO `sys_oper_log` VALUES ('209', '取货网点', '2', 'com.whty.model.web.controller.StationInfoController.editSave()', '1', 'admin', '研发部门', '/caiji/model/stationInfo/edit', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"121\" ],\r\n  \"proId\" : [ \"420000\", \"420000\" ],\r\n  \"cityId\" : [ \"420100\", \"420100\" ],\r\n  \"countyId\" : [ \"420106\", \"420106\" ],\r\n  \"stationName\" : [ \"东方红广场站\" ],\r\n  \"stationAddress\" : [ \"兰州市城关区广场南路4-6号\" ],\r\n  \"stationMobile\" : [ \"13554188089\" ],\r\n  \"stationConnectPerson\" : [ \"周芷若\" ],\r\n  \"stationNetTime\" : [ \"上午09:00---下午17:00\" ],\r\n  \"stationServerInfo\" : [ \"专业办理学生卡\" ],\r\n  \"stationStatus\" : [ \"0\", \"0\" ],\r\n  \"remarks\" : [ \"测试修改\" ]\r\n}', '0', null, '2019-03-27 09:45:35');
INSERT INTO `sys_oper_log` VALUES ('210', '取货网点', '1', 'com.whty.model.web.controller.StationInfoController.addSave()', '1', 'admin', '研发部门', '/caiji/model/stationInfo/add', '127.0.0.1', '内网IP', '{\r\n  \"proId\" : [ \"130000\" ],\r\n  \"cityId\" : [ \"130200\" ],\r\n  \"countyId\" : [ \"130202\" ],\r\n  \"stationName\" : [ \"江夏自提\" ],\r\n  \"stationAddress\" : [ \"测试\" ],\r\n  \"stationMobile\" : [ \"1345555\" ],\r\n  \"stationConnectPerson\" : [ \"张三\" ],\r\n  \"stationNetTime\" : [ \"\" ],\r\n  \"stationServerInfo\" : [ \"\" ],\r\n  \"stationStatus\" : [ \"0\" ],\r\n  \"remarks\" : [ \"\" ]\r\n}', '0', null, '2019-03-27 09:46:00');
INSERT INTO `sys_oper_log` VALUES ('211', '用户管理', '5', 'com.ruoyi.web.controller.system.SysUserController.export()', '1', 'admin', '研发部门', '/caiji/system/user/export', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"loginName\" : [ \"\" ],\r\n  \"phonenumber\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', '0', null, '2019-03-28 17:11:38');
INSERT INTO `sys_oper_log` VALUES ('212', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', '1', 'admin', '研发部门', '/caiji/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"43\" ],\r\n  \"dictLabel\" : [ \"自取\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"cardUser_mail_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"自取\" ]\r\n}', '0', null, '2019-04-02 09:59:29');
INSERT INTO `sys_oper_log` VALUES ('213', '字典数据', '2', 'com.ruoyi.web.controller.system.SysDictDataController.editSave()', '1', 'admin', '研发部门', '/caiji/system/dict/data/edit', '127.0.0.1', '内网IP', '{\r\n  \"dictCode\" : [ \"42\" ],\r\n  \"dictLabel\" : [ \"邮寄\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"cardUser_mail_type\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"邮寄\" ]\r\n}', '0', null, '2019-04-02 09:59:33');
INSERT INTO `sys_oper_log` VALUES ('214', '字典类型', '1', 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', '1', 'admin', '研发部门', '/caiji/system/dict/add', '127.0.0.1', '内网IP', '{\r\n  \"dictName\" : [ \"驳回原因\" ],\r\n  \"dictType\" : [ \"cardUser_reject_info\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"驳回原因\" ]\r\n}', '0', null, '2019-04-02 10:04:11');
INSERT INTO `sys_oper_log` VALUES ('215', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/caiji/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"测试驳回1\" ],\r\n  \"dictValue\" : [ \"0\" ],\r\n  \"dictType\" : [ \"cardUser_reject_info\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"1\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"测试驳回1\" ]\r\n}', '0', null, '2019-04-02 10:17:58');
INSERT INTO `sys_oper_log` VALUES ('216', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/caiji/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"测试驳回2\" ],\r\n  \"dictValue\" : [ \"1\" ],\r\n  \"dictType\" : [ \"cardUser_reject_info\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"2\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"测试驳回2\" ]\r\n}', '0', null, '2019-04-02 10:18:16');
INSERT INTO `sys_oper_log` VALUES ('217', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/caiji/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"制卡下载\" ],\r\n  \"dictValue\" : [ \"3\" ],\r\n  \"dictType\" : [ \"cardUser_apply_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"4\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"制卡下载\" ]\r\n}', '0', null, '2019-04-02 13:04:23');
INSERT INTO `sys_oper_log` VALUES ('218', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/caiji/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"制卡完成\" ],\r\n  \"dictValue\" : [ \"4\" ],\r\n  \"dictType\" : [ \"cardUser_apply_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"5\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"制卡完成\" ]\r\n}', '0', null, '2019-04-02 13:04:40');
INSERT INTO `sys_oper_log` VALUES ('219', '字典数据', '1', 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', '1', 'admin', '研发部门', '/caiji/system/dict/data/add', '127.0.0.1', '内网IP', '{\r\n  \"dictLabel\" : [ \"已发货\" ],\r\n  \"dictValue\" : [ \"5\" ],\r\n  \"dictType\" : [ \"cardUser_apply_status\" ],\r\n  \"cssClass\" : [ \"\" ],\r\n  \"dictSort\" : [ \"6\" ],\r\n  \"listClass\" : [ \"\" ],\r\n  \"isDefault\" : [ \"Y\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"remark\" : [ \"已发货\" ]\r\n}', '0', null, '2019-04-02 13:05:14');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-22 10:00:29', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '115');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '1056');
INSERT INTO `sys_role_menu` VALUES ('1', '1057');
INSERT INTO `sys_role_menu` VALUES ('1', '1058');
INSERT INTO `sys_role_menu` VALUES ('1', '1059');
INSERT INTO `sys_role_menu` VALUES ('1', '1060');
INSERT INTO `sys_role_menu` VALUES ('1', '1061');
INSERT INTO `sys_role_menu` VALUES ('1', '1062');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '115');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');
INSERT INTO `sys_role_menu` VALUES ('2', '1056');
INSERT INTO `sys_role_menu` VALUES ('2', '1057');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '管理员', '00', '15107181720@163.com', '15888888888', '0', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-04-16 10:33:56', 'admin', '2018-03-16 11:33:00', 'ry', '2019-04-16 10:26:14', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('f3c3b039-75a4-4c33-9ae7-d75b39a812d2', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-04-16 10:33:48', '2019-04-16 10:33:56', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');

-- ----------------------------
-- Procedure structure for my_insert
-- ----------------------------
DROP PROCEDURE IF EXISTS `my_insert`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `my_insert`()
BEGIN
   DECLARE n int DEFAULT 1;
        loopname:LOOP
            INSERT INTO `bing_num` (num) VALUES (n);
            SET n=n+1;
        IF n=100000 THEN
            LEAVE loopname;
        END IF;
        END LOOP loopname;
END
;;
DELIMITER ;
