package com.yfg.common.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;

import com.yfg.common.config.Global;

import sun.misc.BASE64Decoder;

public class FastUploadFileTools {
	  public static Map<String, Object> getByteInputStream(String base64Str)
	  {
	    Map map = new HashMap();
	    byte[] bytes = Base64.decodeBase64(base64Str);

	    map.put("fileInputStream", byteTostream(bytes));
	    map.put("fileLength", Integer.valueOf(bytes.length));
	    map.put("extension", "jpg");
	    return map;
	  }

	  public static Map<String, Object> getWordByteInputStream(String base64Str)
	  {
	    Map map = new HashMap();
	    byte[] bytes = Base64.decodeBase64(base64Str);

	    map.put("fileInputStream", byteTostream(bytes));
	    map.put("fileLength", Integer.valueOf(bytes.length));
	    map.put("extension", "docx");
	    return map;
	  }

	  public static final InputStream byteTostream(byte[] buf)
	  {
	    return new ByteArrayInputStream(buf);
	  }

	  public static Map<String, Object> getFileByteInputStream(String filePath)
	  {
	    Map map = new HashMap();
	    try
	    {
	      File file = new File(filePath);
	      FileInputStream inputFile = new FileInputStream(file);
	      byte[] buffer = new byte[(int)file.length()];
	      inputFile.read(buffer);
	      inputFile.close();
	      map.put("fileInputStream", byteTostream(buffer));
	      map.put("fileLength", Integer.valueOf(buffer.length));
	      map.put("extension", "jpg");
	      return map;
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return null;
	  }

	  public String encodeBase64File(String path) {
	    try {
	      File file = new File(path);
	      FileInputStream inputFile = new FileInputStream(file);
	      byte[] buffer = new byte[(int)file.length()];
	      inputFile.read(buffer);
	      inputFile.close();
	      return Base64.encodeBase64String(buffer);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return null;
	  }
	  public static Map getMwebUrl(String url,String xmlParam){
		  String jsonStr = null;
	      HttpClient httpClient = new HttpClient();
	      Map map = new HashMap();
	      try {
	    	 	PostMethod method = null;
				RequestEntity reqEntity = new StringRequestEntity(xmlParam,"text/json","UTF-8");
				method = new PostMethod(url);
				method.setRequestEntity(reqEntity);
				method.addRequestHeader("Content-Type","application/json;charset=utf-8");
				httpClient.executeMethod(method);
				StringBuffer resBodyBuf = new StringBuffer();
				byte[] responseBody = new byte[1024];
				int readCount = 0;
				BufferedInputStream is = new BufferedInputStream(method.getResponseBodyAsStream());
				while((readCount = is.read(responseBody,0,responseBody.length))!=-1){
					resBodyBuf.append(new String(responseBody,0,readCount,"utf-8"));
				}
				jsonStr = resBodyBuf.toString();
	        System.out.println(jsonStr);
	        map = WXPayUtil.xmlToMap(jsonStr);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return map;
	  }
	 


	  public final static String getMessageDigest(byte[] buffer) {
	      char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
	      try {
	          MessageDigest mdTemp = MessageDigest.getInstance("MD5");
	          mdTemp.update(buffer);
	          byte[] md = mdTemp.digest();
	          int j = md.length;
	          char str[] = new char[j * 2];
	          int k = 0;
	          for (int i = 0; i < j; i++) {
	              byte byte0 = md[i];
	              str[k++] = hexDigits[byte0 >>> 4 & 0xf];
	              str[k++] = hexDigits[byte0 & 0xf];
	          }
	          return new String(str);
	      } catch (Exception e) {
	          return null;
	      }
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
		public static String getCurrTime() {
			Date now = new Date();
			SimpleDateFormat outFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String s = outFormat.format(now);
			return s;
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

	  public static void savePic(String idPic, String fileNameStr) {
	    BASE64Decoder decoder = new BASE64Decoder();

	    FileOutputStream fos = null;
	    InputStream in = null;
	    try
	    {
	      byte[] idPicFile = decoder.decodeBuffer(idPic);
	      in = new ByteArrayInputStream(idPicFile);

	      File file = new File(Global.getProfile(), fileNameStr);

	      fos = new FileOutputStream(file);
	      byte[] b = new byte[1024];
	      int nRead = 0;
	      while ((nRead = in.read(b)) != -1) {
	        fos.write(b, 0, nRead);
	      }
	      fos.flush();
	      fos.close();
	      in.close();
	    } catch (IOException e) {
	      e.printStackTrace();
	    } finally {
	      System.out.println("生成图片异常1024");
	      try {
	        if (fos != null) {
	          fos.flush();
	          fos.close();
	        }if (in != null)
	          in.close();
	      }
	      catch (IOException e)
	      {
	        e.printStackTrace();
	      }
	    }
	  }
}
