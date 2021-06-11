package com.yfg.common.utils;

public class WXurl {

	
	public static final String BaseTokenUrl = "https://api.weixin.qq.com/cgi-bin/token";	//微信公众号h5 获取基础access_token

	public static final String ApiTicketUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket"; //微信公众号h5 获取api_ticket
	 
	public static final String UniformorderUrl = "https://api.mch.weixin.qq.com/pay/unifiedorder"; //微信公众号h5 统一下单访问url
	 
	public static final String CodeTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token";	//微信公众号h5 通过code换取网页授权access_token访问url


	public static final String wxAppletsGetOpenIdUrl="https://api.weixin.qq.com/sns/jscode2session"; //?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code
	public static final String WXAutoUrl = "https://api.weixin.qq.com/sns/jscode2session";	//微信小程序  通过code换取网页授权access_token访问url
	
	public static final String getTokenUrl = "https://api.weixin.qq.com/cgi-bin/token";	// 微信后台开发  获取token
	
	public static final String getUserInfo = "https://api.weixin.qq.com/cgi-bin/user/info"; // 获取用户信息
	
	public static final String RefundUrl = "https://api.mch.weixin.qq.com/secapi/pay/refund";	// 微信公众号退款
	
	public static final String transferPay = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";	// 企业支付
	

}
