package com.yfg.common.utils.wx;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;

import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.AlgorithmParameters;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.alibaba.fastjson.*;
import com.yfg.common.config.Global;
import com.yfg.common.utils.WxGet;
import org.bouncycastle.util.encoders.Base64;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class WxUtils {

	
	private static Logger log = LoggerFactory.getLogger(WxUtils.class);



	public static String getUserInfo(String encryptedData, String sessionKey, String iv){
		// 被加密的数据
		byte[] dataByte = Base64.decode(encryptedData);
		// 加密秘钥
		byte[] keyByte = Base64.decode(sessionKey);
		// 偏移量
		byte[] ivByte = Base64.decode(iv);

		try {
			// 如果密钥不足16位，那么就补足.  这个if 中的内容很重要
			int base = 16;
			if (keyByte.length % base != 0) {
				int groups = keyByte.length / base + (keyByte.length % base != 0 ? 1 : 0);
				byte[] temp = new byte[groups * base];
				Arrays.fill(temp, (byte) 0);
				System.arraycopy(keyByte, 0, temp, 0, keyByte.length);
				keyByte = temp;
			}
			// 初始化
			Security.addProvider(new BouncyCastleProvider());
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS7Padding","BC");
			SecretKeySpec spec = new SecretKeySpec(keyByte, "AES");
			AlgorithmParameters parameters = AlgorithmParameters.getInstance("AES");
			parameters.init(new IvParameterSpec(ivByte));
			cipher.init(Cipher.DECRYPT_MODE, spec, parameters);// 初始化
			byte[] resultByte = cipher.doFinal(dataByte);
			if (null != resultByte && resultByte.length > 0) {
				String result = new String(resultByte, "UTF-8");
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public static String byteToHex(final byte[] hash) {
		Formatter formatter = new Formatter();
		for (byte b : hash)
		{
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}

	/**
	 * 生成UUID
	 * @return
	 */
	public static String create_nonce_str() {
		return UUID.randomUUID().toString();
	}

	/**
	 * 生成不带-的UUID
	 * @return
	 */
	public static String createUUID() {
		return UUID.randomUUID().toString().replaceAll("-","");
	}

	/**
	 * 生成时间戳
	 * @return
	 */
	public static String create_timestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}

	/**
	 * 生成时间戳
	 * @return
	 */
	public static String createTimestamp() {
		return Long.toString(System.currentTimeMillis());
	}

	/**
	 * 对转义html反转
	 * @param str
	 * @return
	 */
	public static String stringEscapeUtilsUnescapeHtml(String str){
		return StringEscapeUtils.unescapeHtml(str);
	}

	/**
	 * 判断文件是否存在
	 * @param url
	 * @return
	 */
	public static Boolean fileIsExists(String url){
		File file=new File(url);
		Boolean flag = file.exists();
		file = null;
		return flag;
	}

	/**
	 * 解析xml
	 * @param xml
	 * @return
	 * @throws Exception
	 */
	public static Element createElement(String xml) throws Exception{
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		StringReader sr = new StringReader(xml);
		InputSource is = new InputSource(sr);
		Document document = db.parse(is);
		return document.getDocumentElement();
	}


	/**
	 *根据xml节点名获取节点内容
	 * @return
	 * @throws Exception
	 */
	public static String getXmlValueByName(Element element,String name) {
		String value =  null;
		try {
			value = element.getElementsByTagName(name).item(0).getTextContent();
		}catch (Exception e){
			log.error("没有获取到相关xml节点信息:"+e);
		}
		return value;
	}

	public static String getShareTitle(){
		Calendar c = Calendar.getInstance();
		String str = "";
		str += c.get(Calendar.HOUR_OF_DAY)+":"+c.get(Calendar.MINUTE);
		return str;
	}

	public static int getRandomByLen(int len){
		return (int)((Math.random())*len);
	}

	public static String decodeURIComponent(String s){
		try {
			return URLDecoder.decode(s,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String encodeURIComponent(String s){
		try {
			String str = URLEncoder.encode(s,"utf-8");
			return str;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String replaceUrl(String url){
		url = url.replaceAll(":","%3a");
		url = url.replaceAll("/","%2f");
		return url;
	}

	/**
	 * base64加密
	 * @param str
	 * @return
	 */
	public static String BASE64Encoder(String str){
		BASE64Encoder encoder = new BASE64Encoder();
		byte[] textByte = new byte[0];
		try {
			textByte = str.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encoder.encode(textByte);
	}

	/**
	 * base64解密
	 * @throws IOException
	 */
	public static String BASE64Decoder(String str){
		BASE64Decoder decoder = new BASE64Decoder();
		String s = null;
		try {
			s = new String(decoder.decodeBuffer(str), "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return s;
	}

//	public static String getCityByIp(HttpServletRequest request){
//		String ip = request.getRemoteAddr();
//		String result = WxGet.sendGet("http://ip.taobao.com/service/getIpInfo.php?ip="+ip,800);
//
//		log.info("获取城市接口==========ip="+ip+"\nresult="+result);
//		if(result!=null){
//			try{
//				JSONObject jsonObject = JSONObject.parseObject(result);
//				String data = (String) jsonObject.getString("data");
//				jsonObject = JSONObject.parseObject(data);
//				String city = (String) jsonObject.getString("city");
//				return city;
//			}catch (Exception e){
//				return null;
//			}
//		}
//
//		return null;
//
//	}

	public static boolean isWeixin(HttpServletRequest request){
		String userAgent = request.getHeader("user-agent").toLowerCase();
		return userAgent == null || userAgent.indexOf("micromessenger") == -1 ? false : true;
	}
	
	public static String getAccessToken() {

//		String secret = wxPublicNumberEntity.getAppSecret();
//		String appid = wxPublicNumberEntity.getAppId();
		
		String appid = Global.getAppId();
		String secret = Global.getAppSecret();
		String param = "appid="+appid +"&secret="+secret+"&grant_type=client_credential";

		String result = WxGet.sendGet("https://api.weixin.qq.com/cgi-bin/token", param);
		JSONObject jsonObject = JSONObject.parseObject(result);
		String access_token = null;

		String errcode = null;
		
		try {
			access_token = jsonObject.getString("access_token");
		} catch (Exception e) {
			log.error("获取access_token失败");
			try {
				errcode = jsonObject.getString("errcode");
//				if(errcode!=null && !"".equals(errcode) && ("48004".equals(errcode) || "50002".equals(errcode))){
//					//公众号接口被封了
//					wxPublicNumberEntity.setStatus("1");
//					wxPublicNumberManager.updateWxPublicNumber(wxPublicNumberEntity);
//				}
				log.error("错误码:"+errcode);
			} catch (Exception e1) {

			}
		}

		return access_token;
	}
	
	public static String getticket(String token){
		String param = "access_token="+token+"&type=jsapi";
		String result = WxGet.sendGet("https://api.weixin.qq.com/cgi-bin/ticket/getticket",param);
		JSONObject jsonObject = JSONObject.parseObject(result);
		String ticket = null;
		
		try {
			ticket = jsonObject.getString("ticket");
		} catch (Exception e) {
			// TODO: handle exception
			log.error("获取ticket失败");
			e.printStackTrace();
		}
		return ticket;
	}

	public static Map<String,String> getSignature(String access_token,String ticket,String url) {
		if (StringUtils.isNotBlank(access_token) && StringUtils.isNotBlank(ticket)) {
			Map<String, String> ret = new HashMap<String, String>();
			String nonce_str = create_nonce_str();
			String timestamp = create_timestamp();
			String string1;
			String signature = "";

			String s = null;
			try {
				s = java.net.URLDecoder.decode(url, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				log.error("对url解码失败------" + e);
				return null;
			}

			//注意这里参数名必须全部小写，且必须有序
			string1 = "jsapi_ticket=" + ticket +
					"&noncestr=" + nonce_str +
					"&timestamp=" + timestamp +
					"&url=" + s;
			try {
				MessageDigest crypt = MessageDigest.getInstance("SHA-1");
				crypt.reset();
				crypt.update(string1.getBytes("UTF-8"));
				signature = byteToHex(crypt.digest());
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				return null;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return null;
			}

			ret.put("url", s);
			ret.put("nonceStr", nonce_str);
			ret.put("timestamp", timestamp);
			ret.put("signature", signature);
			return ret;
		}
		return null;
	}

	/**
	 * 获取路径下的所有文件夹及文件
	 * @param strPath
	 * @return
	 */
	public static List<Map> getAllByPath(String strPath){
		File fileDir = new File(strPath);
		List<Map> fileList = new ArrayList<>();
		Map map = null;
		if (null != fileDir && fileDir.isDirectory()){
			File[] files = fileDir.listFiles();

			if (null != files) {
				for (int i = 0; i < files.length; i++) {
					String strFileName = files[i].getAbsolutePath();
					if (null != strFileName
						&& !strFileName.endsWith(".ico")
						&& !strFileName.endsWith(".xml")
						&& !strFileName.endsWith(".yml")
						&& !strFileName.endsWith("sqls")
						&& !strFileName.endsWith("META-INF")
						&& !strFileName.endsWith("net")
						&& !strFileName.endsWith("mapper")
						&& !strFileName.endsWith("velocity")
					) {
						map = new HashMap();
						if(files[i].isDirectory()){
							map.put("isDirectory",true);
						}else{
							map.put("isDirectory",false);
						}
						map.put("fileName",files[i].getName());
						map.put("absolutePath",files[i].getAbsolutePath());
						fileList.add(map);
					}
				}
			}
		}
		return fileList;
	}

	public static List<File> getFileList(String strPath) {
		File fileDir = new File(strPath);
		List<File> fileList = new ArrayList<>();
		if (null != fileDir && fileDir.isDirectory()) {
			File[] files = fileDir.listFiles();

			if (null != files) {
				for (int i = 0; i < files.length; i++) {
					// 如果是文件夹 继续读取
					if (files[i].isDirectory()) {
						getFileList(files[i].getAbsolutePath());
					} else {
						String strFileName = files[i].getAbsolutePath();
						if (null != strFileName &&
								(strFileName.endsWith(".js") ||strFileName.endsWith(".html"))) {
							System.out.println("---" + strFileName);
							fileList.add(files[i]);
						}
					}
				}

			} else {
				if (null != fileDir) {
					String strFileName = fileDir.getAbsolutePath();
					// 排除jar cmd 和 xlsx （根据需求需要）
					if (null != strFileName &&
							(strFileName.endsWith(".js") ||strFileName.endsWith(".html"))) {
						System.out.println("---" + strFileName);
						fileList.add(fileDir);
					}
				}
			}
		}
	// 定义的全去文件列表的变量
		return fileList;
	}

//	/**
//	 * 读取文件内容
//	 * @return
//	 */
//	public static String readFileToString(String path) {
//		String encoding = "UTF-8";
//		File file = new File(path);
//		FileInputStream inputStream = null;
//		InputStreamReader inputStreamReader = null;
//		String fileContent = "";
//		try {
//			inputStream = new FileInputStream(file);
//			inputStreamReader = new InputStreamReader(inputStream,encoding);
//			char[] bytes = new char[12];
//			int len = 0;
//
//			while ((len=inputStreamReader.read(bytes))!=-1){
//				String str = new String(bytes,0,len);
//				fileContent += str;
//			}
//
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}finally {
//			if(inputStream!=null){
//				try {
//					inputStream.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//			if(inputStreamReader!=null){
//				try {
//					inputStreamReader.close();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//		return fileContent;
//	}

	/**
	 * 读取文件内容
	 * @return
	 */
	public static String readFileToString(String path) {
		String encoding = "UTF-8";
		File file = new File(path);
		FileInputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader reader = null;
		String fileContent = "";
		String result = "";
		try {
			inputStream = new FileInputStream(file);
			inputStreamReader = new InputStreamReader(inputStream,encoding);

			char[] bytes = new char[12];
			int len = 0;

			while ((len=inputStreamReader.read(bytes))!=-1){
				String str = new String(bytes,0,len);
				fileContent += str;
			}
//			reader = new BufferedReader(inputStreamReader);
//			while ((result = reader.readLine()) != null) {
//				fileContent += result;
//			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(inputStream!=null){
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(inputStreamReader!=null){
				try {
					inputStreamReader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(reader!=null){
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return fileContent;
	}

	/**
	 * 替换文件内容
	 * @param path
	 * @throws IOException
	 */
	public static Boolean coverFileContent(String path,String fileContent){
		File fileOut = new File(path);
		OutputStreamWriter outStream = null;
		BufferedWriter writer = null;
		try {
			outStream = new OutputStreamWriter(new FileOutputStream(fileOut),
                    "UTF-8");
			writer = new BufferedWriter(outStream);
			writer.write(fileContent);
			writer.flush();
			return true;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if (outStream != null) {
					outStream.close();
				}
				if (writer != null) {
					writer.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

//	/**
//	 * 替换文件内容
//	 * @param path
//	 * @throws IOException
//	 */
//	public static Boolean coverFileContent(String path,String fileContent){
//		try {
//			BufferedWriter out = new BufferedWriter(new FileWriter(path));
//			out.write(fileContent);
//			out.close();
//			return true;
//		} catch (IOException e) {
//			return false;
//		}
//	}

	public static String getPathOfDir(String dirName){
		return Thread.currentThread().getContextClassLoader().getResource("").getPath()
				+dirName;
	}

//	@Test
//	public void test() throws IOException {
////		List<File> fileList = getFileList(
////				Thread.currentThread().getContextClassLoader().getResource("").getPath()
////				+"templates/webapp/","");
////		System.out.println(fileList);
////		String fileContent = readFileToString(getPathOfDir("/"));
////		List<Map> fileList = Utils.getAllByPath(Utils.getPathOfDir("/static"));
////		System.out.println(fileList);
//
//		String url = "/109292-uign_gwong11ong.e";
//		boolean isHtmlUrl = url.matches("^/[\\w-_]*.e$");
//		System.out.println(isHtmlUrl);
////		String result = WxGet.sendGet("http://api.tjagriculture.com/jcapi.php?url=www.baidu.com");
////		System.out.println("result="+"0".equals(result.trim()));
//	}

}
