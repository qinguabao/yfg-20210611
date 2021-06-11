package com.whty;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;

import com.yfg.common.sms.SmsService;

public class SendSms {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	@Test
	public void testsendsms() {
		String validcode = SmsService.randNum(6); // 短信验证码;
		String msg = SmsService.TEMPID[0].replace("@1@", validcode);
		System.out.println("短信内容 : " + msg);

		String res = SmsService.sendMsg("15107181720", msg);
		if ("00".equals(res)) {
			System.out.println("发送成功");
		}else {
			System.out.println("发送失败");
		}
	}
	
	@Test
	public void testgetTimeByMinute() {
		
		System.out.println("当前时间是："+sdf.format(new Date()));
		getExpectTime(10); 
	}
	
	/*
	 * 当前时间+N分钟后的时间（N分<1小时）
	 */
	Date getExpectTime(int m) {
		  Calendar nowTime = Calendar.getInstance();
		  nowTime.add(Calendar.MINUTE, m);
		 System.out.println("当前时间加上"+m+"分后的时间是："+sdf.format(nowTime.getTime()));
		  return nowTime.getTime();
	}
	
	/*
	 * "expectEndTime":1558417235000
	 */
	@Test
	public void testTimeStampToDate() {
		
		System.out.println(stampToDate("1558417235000"));
	}

	 /* 
     * 将时间戳转换为时间
     */
    public static String stampToDate(String s){
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long lt = new Long(s);
        Date date = new Date(lt);
        res = simpleDateFormat.format(date);
        return res;
    }
    /* 
     * 将时间转换为时间戳
     */    
    public static String dateToStamp(String s) throws Exception{
        String res;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = simpleDateFormat.parse(s);
        long ts = date.getTime();
        res = String.valueOf(ts);
        return res;
    }
}
