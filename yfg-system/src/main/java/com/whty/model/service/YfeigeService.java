package com.whty.model.service;

import com.yfg.common.utils.MsgJson;

public interface YfeigeService {
	
	/*
	 * 获取 openid
	 */
	public MsgJson getAccessToken(String code);

	/*
	获取小程序 openid
	 */
	public MsgJson getAppletsAccessToken(String code);

	/*
	 获取小程序密文
	 */
	public MsgJson getAppletsmiwen(String userId,String encryptedData,String iv);



	/*
	 * 套餐列表
	 */
	public MsgJson getPackageList(String deviceId);
	
	/*
	 * 抽烟室是否可用
	 */
	public MsgJson SmokeIsUse(String device_id);
	
	/*
	 * 发送短信验证码
	 */
	public MsgJson sendSmsCode(String mobilephone, String openId,String yzm);
	/*
	 * 验证是否可以发送验证码
	 */
	public MsgJson judgeSendSms(String mobilephone, String openId);
	
	/*
	 * 验证短信验证码
	 */
	public MsgJson verifSmsCode(String loginName,String smscode,String openId);
	

	/*
	 *1010 
	 * 创建订单
	 * 用户、设备、套餐
	 */
	public MsgJson createOrder(String userId,String device_id,String packageId,String openId);
	
	
	/*
	 * 用户是否在使用抽烟室
	 */
	public MsgJson useSmokeRoomYesOrNo(String userId,String openId);
	
	/*
	 * 打开 吸烟室
	 * 参数：
	 * 用户 openId
	 * 设备 device_id
	 * 套餐 package_id
	 */
	public MsgJson openSmokeRoot(String type,String openId,String device_id,String package_id,String  userId);
	
	/*
	 * 订单列表
	 */
	public MsgJson OrderList(String userId,String openId);
	
	
	/*
	 * 订单列表
	 */
	public MsgJson activityOrderList(String userId,String openId);
	
	
	/*
	 * 打开吸烟室 
	 */
	public MsgJson openOrderRoom(String orderId,String userId,String openId);
	
	/*
	 * 退款
	 */
	
	/*
	 * 订单列表
	 */
	public MsgJson refoundOrder(String orderId);
    /*
	
    /*
     *
     * 关闭吸烟室
     */
	
	/*
	 * 订单费用
	 */
	
	
	/*
	 * 微信支付下单
	 */
	
	/*
	 * 微信扫一扫
	 * js加密接口
	 */
	public MsgJson getSignature(String url);
	
	
	/*
	 * 创建订单
	 */
	public MsgJson createActivityOrder(String openId,String activity_id,String  userId,String recName,String recMobile,String recAddress, String recPostcode);
	
}
