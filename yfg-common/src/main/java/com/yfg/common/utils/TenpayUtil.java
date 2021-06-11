package com.yfg.common.utils;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TenpayUtil {


	public static String toString(Object obj) {
		if(obj == null)
			return "";

		return obj.toString();
	}


	public static int toInt(Object obj) {
		int a = 0;
		try {
			if (obj != null)
				a = Integer.parseInt(obj.toString());
		} catch (Exception e) {

		}
		return a;
	}


	public static String getCurrTime() {
		Date now = new Date();
		SimpleDateFormat outFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String s = outFormat.format(now);
		return s;
	}


	public static String formatDate(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String strDate = formatter.format(date);
		return strDate;
	}


	/**
	 * 生成指定长度的随机数
	 * @author 吴敏  
	 * @version 创建时间：2016-7-22  下午3:20:10
	 * @param length  指定长度
	 * @return
	 */
	public static int buildRandom(int length) {
		int num = 1;
		double random = Math.random();
		if (random < 0.1) {
			random = random + 0.1;
		}
		for (int i = 0; i < length; i++) {
			num = num * 10;
		}
		return (int) ((random * num));
	}


	public static String getCharacterEncoding(HttpServletRequest request,
			HttpServletResponse response) {

		if(null == request || null == response) {
			return "gbk";
		}

		String enc = request.getCharacterEncoding();
		if(null == enc || "".equals(enc)) {
			enc = response.getCharacterEncoding();
		}

		if(null == enc || "".equals(enc)) {
			enc = "gbk";
		}

		return enc;
	}


	public static long getUnixTime(Date date) {
		if( null == date ) {
			return 0;
		}

		return date.getTime()/1000;
	}


	public static String date2String(Date date, String formatType) {
		SimpleDateFormat sdf = new SimpleDateFormat(formatType);
		return sdf.format(date);
	}
	
	/**
	 * 自动生成订单号21位，此处用时间加随机数生成，商户根据自己情况调整，只要保持全局唯一就行
	 * 
	 * @return
	 */
	public static String getOrderNum() {
		// 当前时间 17
		String currTime = getCurrTime();
		// 随机数 4
		String strRandom = buildRandom(4) + "";
		// 订单号 = 当前时间 + 随机数
		String orderNum = currTime + strRandom;
		return orderNum;
	}
	
	public static String FormatBizQueryParaMap(Map<String, String> paraMap,
			boolean urlencode) throws Exception {

		String buff = "";
		try {
			List<Map.Entry<String, String>> infoIds = new ArrayList<Map.Entry<String, String>>(
					paraMap.entrySet());

			Collections.sort(infoIds,
					new Comparator<Map.Entry<String, String>>() {
						public int compare(Map.Entry<String, String> o1,
								Map.Entry<String, String> o2) {
							return (o1.getKey()).toLowerCase().compareTo(
									o2.getKey().toLowerCase());
						}
					});

			for (int i = 0; i < infoIds.size(); i++) {
				Map.Entry<String, String> item = infoIds.get(i);
				//System.out.println(item.getKey());
				if (item.getKey() != null && !item.getKey().equals("")) {
					
					String key = item.getKey();
					String val = item.getValue();
					if (urlencode) {
						val = URLEncoder.encode(val, "utf-8");

					}
					buff += key.toLowerCase() + "=" + val + "&";

				}
			}
			System.out.println(buff);
			if (buff.isEmpty() == false) {
				buff = buff.substring(0, buff.length() - 1);
			}
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return buff;
	}

}
