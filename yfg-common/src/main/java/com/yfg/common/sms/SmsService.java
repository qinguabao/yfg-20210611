package com.yfg.common.sms;

import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



public class SmsService {
	
	public static String[] TEMPID = { "你好!您的验证码:{@1@}。如非本人操作，可不用理会!【云飞阁】",
			"【云飞阁】您的验证码为：{@1@}，请您在10分钟内完成验证；为保障帐号的安全，请勿转发验证码给他人。",
			"【云飞阁】您的验证码为：{@1@}，请您在10分钟内完成验证；为保障帐号的安全，请勿转发验证码给他人。",
			"【云飞阁】您的验证码为：{@1@}，请您在10分钟内完成验证；为保障帐号的安全，请勿转发验证码给他人。",
			"【云飞阁】您的验证码为：{@1@}，请您在10分钟内完成验证；为保障帐号的安全，请勿转发验证码给他人。",
			"【云飞阁】您的验证码为：{@1@}，请您在10分钟内完成验证；为保障帐号的安全，请勿转发验证码给他人。",
			"【云飞阁】您的验证码为：{@1@}，请您在10分钟内完成验证；为保障帐号的安全，请勿转发验证码给他人。", };

	
	private static Logger logger = LoggerFactory.getLogger(SmsService.class);
	
	/**
	 * 博好云信使 短信接口条用
	 * 
	 * @param mobilephone
	 * @param msg
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	
	
	public static String sendMsg(String mobilephone, String msg)
    {
		String result = "";
		String userName = "yfg2019";
		String password = "yfg@2019";

		SmsBase sb = new SmsBase("http://api.sms.cn/mt/", userName, password);
		try {
			String ret = sb.SendSms(mobilephone, msg);
			System.out.println("短信网关返回结果：" + ret);
			String[] arr = ret.split("&");
			if (arr.length > 2 && "stat=100".equals(arr[1])) {
				logger.info(mobilephone + ":" + msg + "发送成功");
				result = "00";
			} else {
				result = "01";
				logger.info(mobilephone + ":" + msg + "发送失败，" + ret);

			}
		}catch(Exception e) {
			result = "01";
			logger.info("短信发送失败");
			e.printStackTrace();
		}
		
		return result;
	}
	
	/*
	 * 获取验证码
	 */
	public static String randNum(int count) {
		StringBuilder randnumStr = new StringBuilder();
		for (int i = 0; i < count; i++) {
			Random rand = new Random();
			String temp = String.valueOf(rand.nextInt(10));
			randnumStr.append(temp);
		}
		return randnumStr.toString();
		//return "888888";
	}

}
