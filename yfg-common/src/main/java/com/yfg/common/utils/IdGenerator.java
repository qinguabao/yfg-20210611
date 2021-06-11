/**
 *
 */
package com.yfg.common.utils;

import java.util.Random;

import org.apache.commons.lang3.StringUtils;




/**
 * @author Administrator
 *
 */
public class IdGenerator {
	public static String getRanId(){
    	//时间戳
    	String dateStr = "";
    	try {
			dateStr = DateUtil.getNowPlusTimeMill();
		} catch (Exception e) {
		//生成时间戳失败，用默认17位全0
			dateStr = StringUtils.leftPad("", 15, "0");
		}
    	return dateStr+getString(15);

    }
	
	public static String getRanId18(){
    	//时间戳
    	String dateStr = "";
    	try {
			dateStr = DateUtil.getNowPlusTimeMill();
		} catch (Exception e) {
		//生成时间戳失败，用默认17位全0
			dateStr = StringUtils.leftPad("", 15, "0");
		}
    	return dateStr;

    }

    /**
     * 获取指定位数的随机数
     *
     * @param len
     *            指定位数
     * @return 随机数
     */
    public static String getString(int len) {
        Random rm = new Random();
        double pross = (2 + rm.nextDouble()) * Math.pow(10, len);
        String fixLenthString = String.valueOf(pross);
        String x = fixLenthString.replace(".", "");
        x = x.replaceAll("E" + len, "");
        x = StringUtils.leftPad(x.substring(1), len, '0');// 防止位数过小
        return x.substring(0, len);
    }
    
    public static String getRandomCharacterAndNumber(int length) {  
        String val = "";  
        Random random = new Random();  
        for (int i = 0; i < length; i++) {  
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num"; // 输出字母还是数字  
   
            if ("char".equalsIgnoreCase(charOrNum)) // 字符串  
            {  
                int choice = random.nextInt(2) % 2 == 0 ? 65 : 97; // 取得大写字母还是小写字母  
                val += (char) (choice + random.nextInt(26));  
                  
            } else if ("num".equalsIgnoreCase(charOrNum)) // 数字  
            {  
                val += String.valueOf(random.nextInt(10));  
            }  
        }  
        return val;  
    }  
    
}
