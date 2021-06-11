package com.yfg.common.utils;

public class ConstantUtil {
	/**
	 * 天喻微信支付
	 */
	/*public static final String APP_ID = "wx416ea1eb9139b9ab";//yum
	public static final String MCHID = "1244777202";//yum
	 public static final  String APP_SECRET="b4624c36b6795d1d99dcf0547af5444c";//yum
	 public static String PARTNER_KEY = "728b330b3642f871ac7e336f00225de4";*/

	/**
	  * 昆山市民卡微信支付
	  * com.netmarch.android.ksboard
	  */
/*	public static final String APP_ID = "wx9c726de816458260";
	public static final String MCHID = "1363917902";
	public static final  String APP_SECRET="836b201d475a7f81ca18cedc14084877";
	public static String PARTNER = "1363917902";*/
	/**
	 * 昆山市民卡闪充微信支付
	 */
	public static final String APP_ID = "wx3763a03a972c215a";
	public static final String MCHID = "1283292601";
	public static final  String APP_SECRET="c609426ad5479e09368bfb2ad674691a";
	public static String PARTNER = "1380242902";
	//在财付通里面自己设置
//	public static String PARTNER_KEY = "b68160da04284184529d69510b9725f4";
	public static String PARTNER_KEY = "1422efbeee685a4b21925c2d956c6550";
	
	public static String SUB_APP_ID = "wx624631d6f66dc83b";

	public static String APP_KEY = "L8LrMqqeGRxST5reouB0K66CaYAWpqhAVsq7ggKkxHCOastWksvuX1uvmvQclxaHoYd3ElNBrNO2DHnnzgfVG9Qs473M3DTOZug5er46FhuGofumV8H2FVR9qkjSlC5K";
//	public static String APP_KEY = "WQhMm+UomT9uMK3JJfnVlcHTW4pNBwVKN1/elmYrnBGTPAEtSTU8Ev6A8A9VZ8RC";
	
	public static String SUB_MCHID = "1248339201";

	public static String TOKENURL = "https://api.weixin.qq.com/cgi-bin/token";
	public static String GRANT_TYPE = "client_credential";
	public static String EXPIRE_ERRCODE = "42001";
	public static String FAIL_ERRCODE = "40001";

	
	public static String GATEURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
	public static String QUERYURL= "https://api.mch.weixin.qq.com/pay/orderquery";
	public static String REFUNDURL= "https://api.mch.weixin.qq.com/secapi/pay/refund";
	public static String REFUNDSELECT = "https://api.mch.weixin.qq.com/pay/refundquery";
	public static String ACCESS_TOKEN = "access_token";
	public static String ERRORCODE = "errcode";
	public static String SIGN_METHOD = "sha1";
	public static String packageValue = "bank_type=WX&body=%B2%E2%CA%D4&fee_type=1&input_charset=GBK&notify_url=http%3A%2F%2F127.0.0.1%3A8180%2Ftenpay_api_b2c%2FpayNotifyUrl.jsp&out_trade_no=2051571832&partner=1900000109&sign=10DA99BCB3F63EF23E4981B331B0A3EF&spbill_create_ip=127.0.0.1&time_expire=20131222091010&total_fee=1";
	public static String traceid = "testtraceid001";

	// 微信对账地址
	public static String ACCOUNT_CHECK_URL = "https://api.mch.weixin.qq.com/pay/downloadbill";

	// 微信订单查询地址、
	public static String SELECT_URL = "https://api.mch.weixin.qq.com/pay/orderquery";
	
	
	//微信退款的地址
	public static String REFUNDQUERYURL = "https://api.mch.weixin.qq.com/pay/refundquery";
	
	//补登机心跳请求发送的间隔时间      以分钟为单位
	public static String INTERVALTIME = "15";
}
