-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.53 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 startapi-go 的数据库结构
CREATE DATABASE IF NOT EXISTS `startapi-go` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `startapi-go`;

-- 导出  表 startapi-go.api 结构
CREATE TABLE IF NOT EXISTS `api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '接口名称',
  `uri` char(50) NOT NULL DEFAULT '' COMMENT 'URI',
  `method_type` char(4) NOT NULL DEFAULT 'get' COMMENT '请求类型 get post',
  `desc` text NOT NULL COMMENT '接口描述',
  `request_param` text NOT NULL COMMENT '请求参数',
  `result_param` text NOT NULL COMMENT '返回参数',
  `request_code` text NOT NULL COMMENT '请求代码示例',
  `result_code` text NOT NULL COMMENT '返回代码示例',
  `is_authed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要授权',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序，数字越大越靠前',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='接口列表';

-- 正在导出表  startapi-go.api 的数据：1 rows
DELETE FROM `api`;
/*!40000 ALTER TABLE `api` DISABLE KEYS */;
INSERT INTO `api` (`id`, `category_id`, `title`, `uri`, `method_type`, `desc`, `request_param`, `result_param`, `request_code`, `result_code`, `is_authed`, `sort`, `deleted`) VALUES
	(32, 5, '统一下单', 'pay/unifiedorder', 'POST', '除被扫支付场景以外，商户系统先调用该接口在微信支付服务后台生成预支付交易单，返回正确的预支付交易回话标识后再按扫码、JSAPI、APP等不同场景生成交易串调起支付。', '{"0":{"data_type":"string","default_val":"","desc":"微信支付分配的公众账号ID（企业号corpid即为此appId）","field":"appid","is_required":"1"},"1":{"data_type":"string","default_val":"","desc":"微信支付分配的商户号","field":"mch_id","is_required":"1"},"10":{"data_type":"string","default_val":"","desc":"异步接收微信支付结果通知的回调地址，通知url必须为外网可访问的url，不能携带参数","field":"notify_url","is_required":"1"},"11":{"data_type":"string","default_val":"","desc":"取值如下：JSAPI，NATIVE，APP等","field":"trade_type","is_required":"1"},"2":{"data_type":"string","default_val":"","desc":"自定义参数","field":"device_info","is_required":"0"},"3":{"data_type":"string","default_val":"","desc":"随机字符串，长度要求在32位以内","field":"nonce_str","is_required":"1"},"4":{"data_type":"string","default_val":"","desc":"通过签名算法计算得出的签名值","field":"sign","is_required":"1"},"5":{"data_type":"string","default_val":"MD5","desc":"签名类型，默认为MD5，支持HMAC-SHA256和MD5","field":"sign_type","is_required":"0"},"6":{"data_type":"string","default_val":"","desc":"商品简单描述","field":"body","is_required":"1"},"7":{"data_type":"string","default_val":"","desc":"商户系统内部订单号","field":"out_trade_no","is_required":"1"},"8":{"data_type":"int","default_val":"","desc":"订单总金额，单位为分","field":"total_fee","is_required":"1"},"9":{"data_type":"string","default_val":"","desc":"APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP","field":"spbill_create_ip","is_required":"1"}}', '{"0":{"data_type":"string","default_val":"","desc":"SUCCESS/FAIL 此字段是通信标识，非交易标识，交易是否成功需要查看result_code来判断","field":"return_code","is_required":"1"},"1":{"data_type":"string","default_val":"","desc":"返回信息，如非空，为错误原因","field":"return_msg","is_required":"0"},"2":{"data_type":"string","default_val":"","desc":"调用接口提交的公众账号ID","field":"appid","is_required":"1"},"3":{"data_type":"string","default_val":"","desc":"调用接口提交的商户号","field":"mch_id","is_required":"1"},"4":{"data_type":"string","default_val":"","desc":"自定义参数，可以为请求支付的终端设备号等","field":"device_info","is_required":"0"},"5":{"data_type":"string","default_val":"","desc":"微信返回的随机字符串","field":"nonce_str","is_required":"1"},"6":{"data_type":"string","default_val":"","desc":"微信返回的签名值","field":"sign","is_required":"1"}}', '<xml>\r\n   <appid>wx2421b1c4370ec43b</appid>\r\n   <attach>支付测试</attach>\r\n   <body>JSAPI支付测试</body>\r\n   <mch_id>10000100</mch_id>\r\n   <nonce_str>1add1a30ac87aa2db72f57a2375d8fec</nonce_str>\r\n   <notify_url>http://wxpay.wxutil.com/pub_v2/pay/notify.v2.php</notify_url>\r\n   <openid>oUpF8uMuAJO_M2pxb1Q9zNjWeS6o</openid>\r\n   <out_trade_no>1415659990</out_trade_no>\r\n   <spbill_create_ip>14.23.150.211</spbill_create_ip>\r\n   <total_fee>1</total_fee>\r\n   <trade_type>JSAPI</trade_type>\r\n   <sign>0CB01533B8C1EF103065174F50BCA001</sign>\r\n</xml>', '<xml>\r\n   <return_code><![CDATA[SUCCESS]]></return_code>\r\n   <return_msg><![CDATA[OK]]></return_msg>\r\n   <appid><![CDATA[wx2421b1c4370ec43b]]></appid>\r\n   <mch_id><![CDATA[10000100]]></mch_id>\r\n   <nonce_str><![CDATA[IITRi8Iabbblz1Jc]]></nonce_str>\r\n   <openid><![CDATA[oUpF8uMuAJO_M2pxb1Q9zNjWeS6o]]></openid>\r\n   <sign><![CDATA[7921E432F65EB8ED0CE9755F0E86D72F]]></sign>\r\n   <result_code><![CDATA[SUCCESS]]></result_code>\r\n   <prepay_id><![CDATA[wx201411101639507cbf6ffd8b0779950874]]></prepay_id>\r\n   <trade_type><![CDATA[JSAPI]]></trade_type>\r\n</xml>', 0, 0, 0),
	(34, 6, '提交刷卡支付', 'pay/micropay', 'POST', '收银员使用扫码设备读取微信用户刷卡授权码以后，二维码或条码信息传送至商户收银台，由商户收银台或者商户后台调用该接口发起支付。', '{"0":{"data_type":"string","default_val":"","desc":"微信分配的公众账号ID","field":"appid","is_required":"1"},"1":{"data_type":"string","default_val":"","desc":"微信支付分配的商户号","field":"mch_id","is_required":"1"},"10":{"data_type":"string","default_val":"","desc":"扫码支付授权码，设备读取用户微信中的条码或者二维码信息","field":"auth_code","is_required":"1"},"2":{"data_type":"string","default_val":"","desc":"终端设备号","field":"device_info","is_required":"0"},"3":{"data_type":"string","default_val":"","desc":"随机字符串，不长于32位","field":"nonce_str","is_required":"1"},"4":{"data_type":"string","default_val":"","desc":"签名","field":"sign","is_required":"1"},"5":{"data_type":"string","default_val":"MD5","desc":"签名类型，目前支持HMAC-SHA256和MD5，默认为MD5","field":"sign_type","is_required":"0"},"6":{"data_type":"string","default_val":"","desc":"商品简单描述","field":"body","is_required":"1"},"7":{"data_type":"string","default_val":"","desc":"商户系统内部订单号","field":"out_trade_no","is_required":"1"},"8":{"data_type":"int","default_val":"","desc":"订单总金额，单位为分","field":"total_fee","is_required":"1"},"9":{"data_type":"string","default_val":"","desc":"调用微信支付API的机器IP","field":"spbill_create_ip","is_required":"1"}}', '{"0":{"data_type":"string","default_val":"","desc":"SUCCESS/FAIL  此字段是通信标识，非交易标识，交易是否成功需要查看result_code来判断","field":"return_code","is_required":"1"},"1":{"data_type":"string","default_val":"","desc":"返回信息，如非空，为错误原因 ","field":"return_msg","is_required":"0"}}', '<xml>\r\n   <appid>wx2421b1c4370ec43b</appid>\r\n   <attach>订单额外描述</attach>\r\n   <auth_code>120269300684844649</auth_code>\r\n   <body>刷卡支付测试</body>\r\n   <device_info>1000</device_info>\r\n   <goods_tag></goods_tag>\r\n   <mch_id>10000100</mch_id>\r\n   <nonce_str>8aaee146b1dee7cec9100add9b96cbe2</nonce_str>\r\n   <out_trade_no>1415757673</out_trade_no>\r\n   <spbill_create_ip>14.17.22.52</spbill_create_ip>\r\n   <time_expire></time_expire>\r\n   <total_fee>1</total_fee>\r\n   <sign>C29DB7DB1FD4136B84AE35604756362C</sign>\r\n</xml>', '<xml>\r\n   <return_code><![CDATA[SUCCESS]]></return_code>\r\n   <return_msg><![CDATA[OK]]></return_msg>\r\n   <appid><![CDATA[wx2421b1c4370ec43b]]></appid>\r\n   <mch_id><![CDATA[10000100]]></mch_id>\r\n   <device_info><![CDATA[1000]]></device_info>\r\n   <nonce_str><![CDATA[GOp3TRyMXzbMlkun]]></nonce_str>\r\n   <sign><![CDATA[D6C76CB785F07992CDE05494BB7DF7FD]]></sign>\r\n   <result_code><![CDATA[SUCCESS]]></result_code>\r\n   <openid><![CDATA[oUpF8uN95-Ptaags6E_roPHg7AG0]]></openid>\r\n   <is_subscribe><![CDATA[Y]]></is_subscribe>\r\n   <trade_type><![CDATA[MICROPAY]]></trade_type>\r\n   <bank_type><![CDATA[CCB_DEBIT]]></bank_type>\r\n   <total_fee>1</total_fee>\r\n   <coupon_fee>0</coupon_fee>\r\n   <fee_type><![CDATA[CNY]]></fee_type>\r\n   <transaction_id><![CDATA[1008450740201411110005820873]]></transaction_id>\r\n   <out_trade_no><![CDATA[1415757673]]></out_trade_no>\r\n   <attach><![CDATA[订单额外描述]]></attach>\r\n   <time_end><![CDATA[20141111170043]]></time_end>\r\n</xml>', 0, 0, 0);
/*!40000 ALTER TABLE `api` ENABLE KEYS */;

-- 导出  表 startapi-go.category 结构
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(20) NOT NULL DEFAULT '' COMMENT '分类名称',
  `desc` text NOT NULL COMMENT '分类描述',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序，数字越大越靠前',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='接口分类';

-- 正在导出表  startapi-go.category 的数据：2 rows
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `title`, `desc`, `sort`, `deleted`) VALUES
	(5, '公众号支付', '本文阅读对象：商户系统（在线购物平台、人工收银系统、自动化智能收银系统或其他）集成微信支付涉及的技术架构师，研发工程师，测试工程师，系统运维工程师。', 0, 0),
	(6, '刷卡支付', '刷卡支付', 0, 0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
