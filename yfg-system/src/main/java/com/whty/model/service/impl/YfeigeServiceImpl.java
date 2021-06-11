package com.whty.model.service.impl;

import java.security.AlgorithmParameters;
import java.security.Security;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.SortedMap;
import java.util.TreeMap;

import com.yfg.system.domain.SysDept;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.yfg.common.config.Global;
import com.yfg.common.sms.SmsService;
import com.yfg.common.utils.FastUploadFileTools;
import com.yfg.common.utils.MsgJson;
import com.yfg.common.utils.WXPayUtil;
import com.yfg.common.utils.WXurl;
import com.yfg.common.utils.WxGet;
import com.yfg.common.utils.wx.WxUtils;
import com.whty.model.domain.User;
import com.whty.model.domain.YfgActivity;
import com.whty.model.domain.YfgActivityOrder;
import com.whty.model.domain.YfgDevice;
import com.whty.model.domain.YfgOrder;
import com.whty.model.domain.YfgPackage;
import com.whty.model.domain.YfgVerifcode;
import com.whty.model.domain.YfgVerifcodeMobile;
import com.whty.model.domain.YfgWxToken;
import com.whty.model.service.IUserService;
import com.whty.model.service.IYfgActivityOrderService;
import com.whty.model.service.IYfgActivityService;
import com.whty.model.service.IYfgDeviceService;
import com.whty.model.service.IYfgOrderService;
import com.whty.model.service.IYfgPackageService;
import com.whty.model.service.IYfgVerifcodeMobileService;
import com.whty.model.service.IYfgVerifcodeService;
import com.whty.model.service.IYfgWxTokenService;
import com.whty.model.service.YfeigeService;
import com.whty.model.socket.netty.service.TcpNettyServerHandlerService;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


@Service
public class YfeigeServiceImpl implements YfeigeService {
	
	private static Logger logger = LoggerFactory.getLogger(YfeigeServiceImpl.class);
	@Autowired
	private IUserService userService;
	@Autowired
	private IYfgDeviceService yfgDeviceService;
	
	@Autowired
	private IYfgPackageService yfgPackageService;
	@Autowired
	private IYfgOrderService yfgOrderService;
	@Autowired
	private IYfgVerifcodeService yfgVerifcodeService;
	@Autowired
	private IYfgVerifcodeMobileService yfgVerifcodeMobileService;
	
	@Autowired
	private IYfgWxTokenService yfgWxTokenService;
	@Autowired
	private IYfgActivityService YfgActivityService;
	@Autowired
	private IYfgActivityOrderService yfgActivityOrderService;
	
	@Autowired
	private TcpNettyServerHandlerService tcpNettyServerHandlerService;


	
	/**
	 * 通过code获取openid
	 * 
	 * https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
 */
	@Override
	public MsgJson getAccessToken(String code) {
		MsgJson json = new MsgJson();
		try {
			String appid = Global.getAppId();
			String secret = Global.getAppSecret();

			String param = "appid=" + appid + "&secret=" + secret + "&code=" + code
					+ "&grant_type=authorization_code";
			String result = WxGet.sendGet(WXurl.CodeTokenUrl, param);

			JSONObject jsonObject = JSONObject.parseObject(result);
			String openid = jsonObject.getString("openid");

			if (!"".equals(openid) && openid != null) {
				JSONObject jsontemp = getUserInfo(openid,jsonObject.getString("access_token"));
				
			
				List<User> list = userService.selectUserByOpenId(openid);
				if(list!=null&&list.size()>0) {
					logger.info("openid："+openid+" 已经存在");
					
				}else {
					User user = new User();
					user.setOpenId(openid);
					user.setCreateDate(new Date());
					user.setNickName(jsontemp.getString("nickname"));
					user.setGender(jsontemp.getString("sex"));
					user.setCity(jsontemp.getString("city"));
					user.setProvince(jsontemp.getString("province"));
					user.setCountry(jsontemp.getString("country"));
					user.setHeadimgurl(jsontemp.getString("headimgurl"));
					
					userService.insertUser(user);
					
				
				}
				
				
				json.setMsg("获取openId成功");
				json.setCode("0");
				json.setData(openid);
			} else {
				json.setMsg("获取openId失败,"+jsonObject.getString("errmsg"));
				json.setCode("1");
			}

		} catch (Exception e) {
			json.setMsg("获取openId失败");
			json.setCode("1");
		}
		return json;
	}


	/*
      小程序
	 */
	@Override
	public MsgJson getAppletsAccessToken(String code){

		MsgJson json = new MsgJson();
		try {
			String appid = Global.getAppletsAppId();
			String secret = Global.getppletsAppSecret();
			//?appid=APPID&secret=SECRET&js_code=JSCODE&grant_type=authorization_code
			String param = "appid=" + appid + "&secret=" + secret + "&js_code=" + code
					+ "&grant_type=authorization_code";
			String result = WxGet.sendGet(WXurl.wxAppletsGetOpenIdUrl, param);
            System.out.println("小程序获取用户 openid返回结果:"+result);

//            String result ="{\"session_key\":\"pd3LfTBSYg0O8HbAio5k1Q==\",\"openid\":\"opKsZ4-smJAoICliRYd2pl-_YBh8\"}";
			JSONObject jsonObject = JSONObject.parseObject(result);
			String openid = jsonObject.getString("openid");

			if (!"".equals(openid) && openid != null) {
//				JSONObject jsontemp = getUserInfo(openid,jsonObject.getString("access_token"));


				List<User> list = userService.selectUserByAppletsOpenId(openid);
				if(list!=null&&list.size()>0) {
					logger.info("openid："+openid+" 已经存在");
					//判断 sessionKey 是否最新
					if(list.get(0).getRemarks().equals(jsonObject.getString("session_key"))){

					}else {
						User userTemp = list.get(0);
						userTemp.setRemarks(jsonObject.getString("session_key"));
						userService.updateUser(userTemp);
					}

				}else {
					User user = new User();
					user.setAppletsopenid(openid);
					user.setSource("2");
					user.setCreateDate(new Date());
					if(jsonObject.containsKey("unionid")) {
						user.setUnionid(jsonObject.getString("unionid"));
					}
					if(jsonObject.containsKey("session_key")){
						user.setRemarks(jsonObject.getString("session_key"));
					}

//					user.setNickName(jsontemp.getString("nickname"));
//					user.setGender(jsontemp.getString("sex"));
//					user.setCity(jsontemp.getString("city"));
//					user.setProvince(jsontemp.getString("province"));
//					user.setCountry(jsontemp.getString("country"));
//					user.setHeadimgurl(jsontemp.getString("headimgurl"));

					userService.insertUser(user);


				}

				List<User> listuser = userService.selectUserByAppletsOpenId(openid);
				User user = listuser.get(0);

				json.setMsg("获取openId成功");
				json.setCode("0");
				json.setData(user.getId());
			} else {

				json.setMsg("获取openId失败,"+jsonObject.getString("errmsg"));
				json.setCode("1");
			}

		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("获取openId失败");
			json.setCode("1");
		}
		return json;


	}

	/*
	解密小程序数据
	 */
	@Override
	public MsgJson getAppletsmiwen(String userId,String encryptedData,String iv){
		MsgJson json = new MsgJson();
		User user = userService.selectUserById(Integer.parseInt(userId));
		String result ="";
		if(user!=null){
			System.out.println("参与解密的 sessionKey:"+user.getRemarks());
			result = WxUtils.getUserInfo(encryptedData,user.getRemarks(),iv);
			System.out.println("解密的信息:"+result);
			JSONObject jsonObject = JSONObject.parseObject(result);

			json.setMsg("解密数据成功");
			json.setCode("0");
			json.setData(jsonObject.get("phoneNumber"));

			user.setMobile(jsonObject.getString("phoneNumber"));
			userService.updateUser(user);

		}else {
			json.setMsg("根据用户id获取用户失败");
			json.setCode("1");
		}

		return json;


	}



	
	//获取 微信用户信息
	//https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
	/*
	 * openid	用户的唯一标识
nickname	用户昵称
sex	用户的性别，值为1时是男性，值为2时是女性，值为0时是未知
province	用户个人资料填写的省份
city	普通用户个人资料填写的城市
country	国家，如中国为CN
headimgurl	用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。
privilege	用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）
unionid
	 */
	public JSONObject getUserInfo(String openid,String access_token) {
		
		//
		try {
			String url="https://api.weixin.qq.com/sns/userinfo";
			
			String param = "access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
			logger.info("获取微信用户信息url："+url);
			String result = WxGet.sendGet(url, param);
			logger.info("获取微信用户信息是："+result);
			
			JSONObject jsonObject = JSONObject.parseObject(result);
			String nickname = jsonObject.getString("nickname");
			String sex = jsonObject.getString("sex");

			return jsonObject;
		}catch(Exception e) {
			e.printStackTrace();
			logger.info("");
			return null;
		}
		
	}
	
	@Override
	public MsgJson openSmokeRoot(String type, String openId, String device_id,String package_id,String  userId) {
		
		MsgJson json = new MsgJson();
		/*
		 * 1、
		 * 2、创建订单
		 * 3、微信支付
		 * 4、微信支付异步通知 成功 打开物理设备
		 */
		YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(device_id);
		if(yfgDevice!=null) {
			YfgPackage yfgPackage = yfgPackageService.selectYfgPackageById(Integer.parseInt(package_id));
			if(yfgPackage==null) {
				json.setCode("1");
				json.setMsg("套餐id不存在");
				return json;
			}
			String payMoney = yfgPackage.getUseMoney();
			// 判断设备是否可用
			if(yfgDevice.getStatus().equals("1")) {
				json.setMsg("设备id"+device_id+"正在使用中... ");
				json.setCode("1");
				return json;
			}if(yfgDevice.getStatus().equals("2")) {
				json.setMsg("设备id"+device_id+"正在使用中... ");
				json.setCode("1");
				return json;
			}
			
			//socket 报文查询该设备是否可用
			String commandStr= tcpNettyServerHandlerService.sendCommad(yfgDevice.getDeviceId(), "43");
			String resultFlag= tcpNettyServerHandlerService.sendCommadByWork(yfgDevice.getDeviceId(), commandStr);
			if(resultFlag!=null&&resultFlag.equals("01")) {
				json.setMsg("设备id"+device_id+"网络异常... ");
				json.setCode("1");
				return json;
				
			}
			if(!type.equals("01")){
				User user = userService.selectUserById(Integer.parseInt(userId));
				openId = user.getAppletsopenid();
			}
			JSONObject resJson = addOrder(type,openId,yfgPackage,yfgDevice, userId);
			if(resJson.get("code").equals("0")) {
				json.setData(resJson);
				json.setCode("0");
				json.setMsg(resJson.getString("returnMsg"));
			}else {
				json.setCode("1");
				json.setMsg(resJson.getString("returnMsg"));
				return json;
			}
			
		}else {
			json.setMsg("设备id"+device_id+"不存在 ");
			json.setCode("1");
			return json;
		}
		
		return json;
	}
	
	
	/*
	 * 
	 */
	
	/**
	 * 微信支付统一下单
	 * @throws ParseException 
	 *
	 */
	public com.alibaba.fastjson.JSONObject addOrder(String type, String openId,YfgPackage yfgPackage,YfgDevice yfgDevice,String userId) {
		
		logger.info("========================微信统一下单接口");
		com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
		String APPID = "";
		String notifyUrl="";
		if(type.equals("01")){
			 APPID =Global.getAppId();
			 notifyUrl="http://yfg.flyoge.com/yfg/yfgInter/notify";
		} else {
			APPID =Global.getAppletsAppId();
			notifyUrl="http://yfg.flyoge.com/yfg/yfgInter/notify";
		}

		String MERID =Global.getMchId();
		String SIGNKEY = Global.getMchidKey();
 		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";// 微信统一下单接口
/* 		String notifyUrl="http://collection.qinguobao.xyz/caiji/nfc/notify";
*/
 		
		String spbill_create_ip = "127.0.0.1";
	
		String scene_info = "'h5_info':{'type':'Wap','wap_url':'www.baidu.com','wap_name': '云飞阁'}";
		String tradeType = "JSAPI";// H5支付标记
		String MD5 = "MD5";// 虽然官方文档不是必须参数，但是不送有时候会验签失败
		String subject = "云飞阁";// 前端上送的支付主题
/*		String total_amount = request.getParameter("pay_amount");// 前端上送的支付金额
		String timestamp = String.valueOf(System.currentTimeMillis() / 1000);*/
		// 金额转化为分为单位 微信支付以分为单位
	   String payMoney = yfgPackage.getUseMoney();
		String deviceInfo = "WEB";
		/*
		 * int randomNum = (int) (Math.random() * 1999 + 5000);
		 */ String out_trade_no = FastUploadFileTools.getOrderNum();
		// 随机数
		String nonce_str = FastUploadFileTools.getMessageDigest(String.valueOf(new Random().nextInt(10000)).getBytes());
	    //组装参数
	    SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();		
	    packageParams.put("appid",APPID);  
	    packageParams.put("body", subject); 
	    packageParams.put("device_info", deviceInfo);
	    packageParams.put("mch_id", MERID);
	    packageParams.put("nonce_str", nonce_str);
	    packageParams.put("notify_url", notifyUrl);  
	    packageParams.put("out_trade_no", out_trade_no);//订单号
	    packageParams.put("scene_info", scene_info);//订单号
	    packageParams.put("sign_type", "MD5");//订单号	    
	    packageParams.put("spbill_create_ip", spbill_create_ip);
	    packageParams.put("total_fee", payMoney);  //金额数目,这里的需要转换成分,而不是元
	    packageParams.put("trade_type", tradeType); 
	    packageParams.put("openid", openId);
	    String sign = WXPayUtil.createSign("UTF-8",packageParams);
	    packageParams.put("sign", sign);
	    
	 // 封装xml报文
	 		String xml = "<xml>" + "<appid>" + APPID + "</appid>" 
	 		        +"<body>" + subject + "</body>"
	 				+"<device_info>" + deviceInfo + "</device_info>" 
	 				+ "<mch_id>" + MERID + "</mch_id>"  
	 				+"<nonce_str>"+ nonce_str + "</nonce_str>" 
	 				+ "<notify_url>" + notifyUrl + "</notify_url>"
	 				+ "<out_trade_no>" + out_trade_no + "</out_trade_no>" 
	 				+ "<scene_info>" + scene_info + "</scene_info>" 
	 				+ "<sign_type>MD5</sign_type>" 
	 				+ "<spbill_create_ip>"+ spbill_create_ip + "</spbill_create_ip>"
	 				+ "<total_fee>" + payMoney + "</total_fee>"
	 				+ "<trade_type>" + tradeType + "</trade_type>" 
	 				+ "<openid>" + openId + "</openid>" 
	 				+"<sign>"+ sign + "</sign>" + "</xml>";
			logger.info("xml是================" + xml);
	 		String mweb_url = "";
	 		Map map = new HashMap();
	 		try {
	 			// 预下单 获取接口地址
	 			map = FastUploadFileTools.getMwebUrl(createOrderURL, xml);
	 			String return_code = (String) map.get("return_code");
	 			String return_msg = (String) map.get("return_msg");
	 			if ("SUCCESS".equals(return_code) && "OK".equals(return_msg)) {
	 				mweb_url = (String) map.get("mweb_url");// 调微信支付接口地址
	 				logger.info("统一支付下单成功，mweb_url是================" + mweb_url);
	 			} else {
	 				logger.info("统一支付接口获取预支付订单出错");
	 				retjson.put("returnMsg", "支付错误");
	 				retjson.put("code", "1");
	 				return retjson;
	 			}
	 		} catch (Exception e) {
	 			logger.info("统一支付接口获取预支付订单出错");
	 			retjson.put("code", "1");
 				retjson.put("returnMsg", "统一支付接口获取预支付订单出错");
 				return retjson;
	 		}
		    //组装参数
			String nonce_str1 = FastUploadFileTools.getMessageDigest(String.valueOf(new Random().nextInt(10000)).getBytes());
		    Object timeStamp=System.currentTimeMillis()/1000;
			SortedMap<Object, Object> pack = new TreeMap<Object, Object>();		
			String prepayId="prepay_id="+(String) map.get("prepay_id");
		    pack.put("appId",APPID);  
		    pack.put("nonceStr", nonce_str1);
		    pack.put("package",prepayId); 
		    pack.put("signType", "MD5");
		    System.out.println("timeStamp："+timeStamp.toString());
		    pack.put("timeStamp", timeStamp.toString());
		    System.out.println("返回给前台的map"+pack);
		    String paySign1 = WXPayUtil.createSign("UTF-8",pack);
		    System.out.println("返回给前台的签名"+paySign1);
	 			 		
	 		retjson.put("mwebUrl",mweb_url);	
	 		retjson.put("appid", APPID);
	 		retjson.put("timeStamp", timeStamp.toString());
	 		retjson.put("nonceStr",nonce_str1);
	 	/*	retjson.put("nonce_str", (String) map.get("nonce_str"));*/
	 		retjson.put("package", prepayId); 
	 	/*	retjson.put("package", (String) map.get("prepay_id"));*/
	 		retjson.put("signType", "MD5");
	 		retjson.put("paySign",(String) map.get("sign"));
	 		retjson.put("open_id", openId);
	 		retjson.put("paySign1", paySign1);
	 		retjson.put("returnMsg", "SUCCESS");
	 		retjson.put("code", "0");
	 		//创建订单

	 		YfgOrder yfgOrder = new YfgOrder(); 
			yfgOrder.setDeviceId(yfgDevice.getDeviceId());
			yfgOrder.setPackageName(yfgPackage.getName());
			yfgOrder.setOpenId(openId);
			yfgOrder.setCreateDate(new Date());
			yfgOrder.setOrderId(out_trade_no);
			yfgOrder.setThirdOrderId(map.get("prepay_id").toString());
			yfgOrder.setStatus("1");
			yfgOrder.setPackageId(yfgPackage.getId());
			yfgOrder.setPayAmount(Integer.parseInt(payMoney));
			yfgOrder.setRemark("微信支付创建预支付订单");
			yfgOrder.setUserId(Integer.parseInt(userId));
	 		yfgOrderService.insertYfgOrder(yfgOrder);
        	logger.info("微信统一下单返回的参数是"+retjson);
		return retjson;

	}
	@Override
	public MsgJson OrderList(String userId, String openId) {
		
		MsgJson json = new MsgJson();
		json.setCode("0");
		json.setMsg("获取订单信息成功");
		if(openId!=null&&!openId.equals("")) {
			YfgOrder yfgOrder = new YfgOrder(); 
			yfgOrder.setOpenId(openId);
			List<YfgOrder> list = yfgOrderService.selectYfgOrderList(yfgOrder);
			json.setData(list);
			
		}else {
			if(userId!=null&&!userId.equals("")) {
				YfgOrder yfgOrder = new YfgOrder(); 
				yfgOrder.setUserId(Integer.parseInt(userId));
				List<YfgOrder> list = yfgOrderService.selectYfgOrderList(yfgOrder);
				json.setData(list);
			}else {
				json.setMsg("userIdid、openId 不能为空 ");
				json.setCode("1");	
				return json;
				
			}
		}
		
		return json;
	}
	
	
	
	@Override
	public MsgJson activityOrderList(String userId, String openId) {
		
		MsgJson json = new MsgJson();
		json.setCode("0");
		json.setMsg("获取订单信息成功");
		if(openId!=null&&!openId.equals("")) {
			YfgActivityOrder yfgOrder = new YfgActivityOrder(); 
			yfgOrder.setOpenId(openId);
			List<YfgActivityOrder> list = yfgActivityOrderService.selectYfgActivityOrderList(yfgOrder);
			json.setData(list);
			
		}else {
			if(userId!=null&&!userId.equals("")) {
				YfgActivityOrder yfgOrder = new YfgActivityOrder(); 
				yfgOrder.setUserId(Integer.parseInt(userId));
				List<YfgActivityOrder> list = yfgActivityOrderService.selectYfgActivityOrderList(yfgOrder);
				json.setData(list);
			}else {
				json.setMsg("userIdid、openId 不能为空 ");
				json.setCode("1");	
				return json;
				
			}
		}
		
		return json;
	}
	
	@Override
	public MsgJson refoundOrder(String orderId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public MsgJson getPackageList(String deviceId) {
		MsgJson json = new MsgJson();
		json.setCode("0");
		json.setMsg("获取套餐信息成功");
		YfgPackage yfgPackageTemp = new YfgPackage();
		List<YfgPackage> yfgPackageList = null;
		if(deviceId!=null&&!deviceId.equals("")){
			YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
			yfgPackageTemp.setDeptId(yfgDevice.getDeptId());

		}else {
			yfgPackageTemp.setRemarks("云飞阁");

		}

		yfgPackageList = yfgPackageService.selectYfgPackageList(yfgPackageTemp);
		if(yfgPackageList!=null&&yfgPackageList.size()>0) {
			for(YfgPackage yfgPackage1:yfgPackageList) {
				try {
					Float tempMoney=Float.parseFloat(yfgPackage1.getUseMoney())/100;
					yfgPackage1.setUseMoney(tempMoney.toString());
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("套餐金额转换错误");
				}
			
				
			}
			json.setData(yfgPackageList);
		}else {
			json.setCode("1");
			json.setMsg("没有配置套餐");
		}
		return json;
	}
	@Override
	public MsgJson SmokeIsUse(String device_id) {
		MsgJson json = new MsgJson();
		if(device_id!=null&&!device_id.equals("")) {
			YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(device_id);
			if(yfgDevice!=null&&yfgDevice.getStatus()!=null&&yfgDevice.getStatus().equals("0")) {
				//socket 报文查询该设备是否可用
				try {
					String commandStr= tcpNettyServerHandlerService.sendCommad(yfgDevice.getDeviceId(), "43");
					String resultFlag= tcpNettyServerHandlerService.sendCommadByWork(yfgDevice.getDeviceId(), commandStr);


				if(resultFlag!=null&&resultFlag.equals("00")) {
					json.setCode("0");
					json.setMsg("该设备可用");
				}else {
					json.setCode("1");
					json.setMsg("该设备网络不通");
				}
				}catch (Exception e){
					e.printStackTrace();
					json.setCode("1");
					json.setMsg("该设备断线或网络不通");

				}
				
			}else {
				json.setCode("1");
				json.setMsg("设备编码"+device_id+"不可用");
			}
		}else {
			json.setCode("1");
			json.setMsg("deviceId传入错误");
		}
		
		return json;
	}

	
	
	/*
	 * 发送短信验证码
	 * (java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public MsgJson sendSmsCode(String mobilephone, String openId, String yzm) {
		MsgJson json = new MsgJson();
//		if (StringUtils.isBlank(yzm)) {
//			
//			json.setMsg("请输入验证码");
//			json.setCode("1");		
//			return json;
//		}
//
//		// 验证验证码
//		YfgVerifcode yfgVerifcodetemp = new YfgVerifcode();
//		yfgVerifcodetemp.setWxOpneid(openId);
//		List<YfgVerifcode> list = yfgVerifcodeService.selectYfgVerifcodeList(yfgVerifcodetemp);
//		if (list == null) {
//	    	json.setMsg("验证码有误");
//			json.setCode("1");		
//			return json;
//		}
//
//		if (!list.get(0).getCode().equalsIgnoreCase(yzm)) {		
//			json.setMsg("验证码有误");
//			json.setCode("1");	
//			return json;	
//		}
		
		String validcode = SmsService.randNum(6); // 短信验证码;
		String msg = SmsService.TEMPID[0].replace("{@1@}", validcode);
		logger.info("短信内容 : " + msg);

		String res = SmsService.sendMsg(mobilephone, msg);
		if ("00".equals(res)) {
			YfgVerifcodeMobile yfgVerifcodeMobile =new YfgVerifcodeMobile();
			yfgVerifcodeMobile.setMobilePhone(mobilephone);
			yfgVerifcodeMobile.setOpenId(openId);
			yfgVerifcodeMobile.setVercode(validcode);
			yfgVerifcodeMobile.setCreateDate(new Date());
			yfgVerifcodeMobileService.insertYfgVerifcodeMobile(yfgVerifcodeMobile);
			json.setMsg("发送成功");
			json.setCode("0");		
			return json;
		} else {
//			map.put("msg", "短信发送失败,请稍后发送!");
//			map.put("success", false);
			json.setMsg("短信发送失败,请稍后发送!");
			json.setCode("1");		
			return json;
		}
	}
	@Override
	public MsgJson verifSmsCode(String loginName,String smscode,String openId ) {
		MsgJson json = new MsgJson();
		// 验证短信验证码
		boolean verification = yfgVerifcodeMobileService.Verification(loginName, smscode);
		if (verification) {			
			User user = new User();
			if (StringUtils.isNotBlank(openId)) {
				user.setOpenId(openId);
			}			
	
			List<User> list = userService.selectUserList(user);
			if(list!=null&&list.size()>0) {
//				list.get(0).setOpenId(openId);
				String lastLoginName= list.get(0).getLoginName();
//				list.get(0).setRemarks("上次登录的手机号码是:"+lastLoginName);
				list.get(0).setLoginName(loginName);
				list.get(0).setLastLoginTime(new Date());
				userService.updateUser(list.get(0));
			}else {
				if (StringUtils.isNotBlank(openId)) {
					user.setOpenId(openId);
				}
				user.setLoginName(loginName);
				user.setCreateDate(new Date());
				user.setLastLoginTime(new Date());
				userService.insertUser(user);
			}
			User user1 = new User();
			user1.setLoginName(loginName);
			List<User> listResult = userService.selectUserList(user1);
			json.setData(listResult.get(0));
			json.setMsg("验证码验证 成功!");
			json.setCode("0");		
			return json;
	}else {
		json.setMsg("验证码验证 成功失败!");
		json.setCode("1");		
		return json;
	}
	}
	
	
	/*
	 * 判断用户是否可以发送验证码
	 */
	@Override
	public MsgJson judgeSendSms(String mobilephone, String openId) {
		MsgJson json = new MsgJson();
	
		boolean verification = false;
		if(mobilephone!=null&&!mobilephone.equals("")) {
			if(mobilephone.length()!=11) {
				json.setMsg(mobilephone+"手机号码错误");
				json.setCode("1");		
				return json;
				
			}
			verification = yfgVerifcodeMobileService.Verification(mobilephone);
		}if(openId!=null&&!openId.equals("")) {
			verification = yfgVerifcodeMobileService.Verification(openId);
		}

		//  logger.info("短信在有效时间范围内不允许再发"+success);	
		if(verification) {
			//短信在有效期内，不允许再次发送
			json.setMsg("短信在有效时间范围内不允许再发");
			json.setCode("1");		
			return json;
		}else {
			//允许发送
			json.setMsg("允许发送验证码");
			json.setCode("0");		
			return json;
		}
	}
	@Override
	public MsgJson createOrder(String userId, String device_id, String packageId,String openId) {

		MsgJson json = new MsgJson();
		/*
		 * 1、
		 * 2、创建订单
		 * 3、微信支付
		 * 4、微信支付异步通知 成功 打开物理设备
		 */
		YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(device_id);
		if(yfgDevice!=null) {
			YfgPackage yfgPackage = yfgPackageService.selectYfgPackageById(Integer.parseInt(packageId));
			if(yfgPackage==null) {
				json.setCode("1");
				json.setMsg("套餐id不存在");
				return json;
			}
			String payMoney = yfgPackage.getUseMoney();
			json = createOrder1(userId,payMoney,yfgDevice, openId);
			return json;
		}else {
			json.setCode("1");
			json.setMsg("设备id不存在");
			return json;
		}		

	}
	
	/**
	 * 微信支付统一下单
	 * @throws ParseException 
	 *
	 */
	public MsgJson createOrder1(String userId,String payMoney,YfgDevice yfgDevice,String openId) {
		
		MsgJson json = new MsgJson();
		logger.info("========================创建订单");
		JSONObject objson =  new JSONObject();
		
		String out_trade_no = FastUploadFileTools.getOrderNum();
        YfgOrder yfgOrder = new YfgOrder(); 
        yfgOrder.setUserId(Integer.parseInt(userId));
			yfgOrder.setDeviceId(yfgDevice.getDeviceId());
			if(openId!=null&&!openId.equals("")) {
				yfgOrder.setOpenId(openId);	
			}			
			yfgOrder.setCreateDate(new Date());
			yfgOrder.setOrderId(out_trade_no);
//			yfgOrder.setThirdOrderId(map.get("prepay_id").toString());
			yfgOrder.setStatus("0");
			yfgOrder.setPayAmount(Integer.parseInt(payMoney));
	 		yfgOrderService.insertYfgOrder(yfgOrder);
	 		
	 		json.setCode("0");
	 		objson.put("orderId", out_trade_no);
	 		objson.put("payMoney", payMoney);
        	
		return json;

	}

	
	//yfgWxTokenService
	@Override
	public MsgJson getSignature(String url) {
	
		MsgJson json = new MsgJson();
		logger.info("js网页签名");
		if(url==null || "".equals(url)){
			json.setCode("1");
			json.setMsg("url不能为空");
			return json;
		}		
		url = url.replace("&amp;", "&");
	//type =1 
		YfgWxToken YfgTokenTemp = new YfgWxToken();
		YfgTokenTemp.setType("1");
		String access_token = null;
		String ticket = null;
		List<YfgWxToken> list = yfgWxTokenService.selectYfgWxTokenList(YfgTokenTemp);
		Date nowDate = new Date();
		if(list!=null&&list.size()>0) {
			YfgWxToken yfgWxToken= list.get(0);
			Date updateDate = yfgWxToken.getUpdateTime();
			
			if((nowDate.getTime()-updateDate.getTime())>(7100*1000)){//token已过期,重新获取token
				access_token = WxUtils.getAccessToken();
				ticket = WxUtils.getticket(access_token);
				yfgWxToken.setAccessToken(access_token);
				yfgWxToken.setJsapiTicket(ticket);
				yfgWxToken.setUpdateTime(nowDate);
				if(StringUtils.isNotBlank(access_token) && StringUtils.isNotBlank(ticket)){
					yfgWxTokenService.updateYfgWxToken(yfgWxToken);
				}
				logger.info("获取access_token或者ticket失败,ticket="+ticket+",access_token="+access_token);
			}else{
				access_token = yfgWxToken.getAccessToken();
				ticket = yfgWxToken.getJsapiTicket();
			}
			
		}else {
			access_token = WxUtils.getAccessToken();
			ticket = WxUtils.getticket(access_token);
			YfgWxToken wxToken = new YfgWxToken();
			wxToken.setAccessToken(access_token);
			wxToken.setJsapiTicket(ticket);
			wxToken.setUpdateTime(nowDate);
			wxToken.setType("1");
			if(access_token!=null && !"".equals(access_token) &&ticket!=null && !"".equals(ticket)){
				yfgWxTokenService.insertYfgWxToken(wxToken);
			}
			logger.info("获取access_token或者ticket失败,ticket="+ticket+",access_token="+access_token);
		}
		Map map = WxUtils.getSignature(access_token,ticket,url);
		if(map!=null){
			json.setCode("0");
			json.setData(map);
			
		}else{
			json.setCode("1");
			json.setMsg("获取token失败");
		}
		return json;
	}

	@Override
	public MsgJson useSmokeRoomYesOrNo(String userId, String openId) {
		/*
		 *  userId 主要判断条件
		 */
		MsgJson json = new MsgJson();
		
		YfgOrder yfgOrder = new YfgOrder();
		if(userId!=null&&!userId.equals("")&&openId!=null&&!openId.equals("")) {			
			yfgOrder.setUserId(Integer.parseInt(userId));
			yfgOrder.setOpenId(openId);			
		}else if(userId!=null&&!userId.equals("")){
			yfgOrder.setUserId(Integer.parseInt(userId));
		}else if(openId!=null&&!openId.equals("")) {
			yfgOrder.setOpenId(openId);			
		}
		List<YfgOrder> list = yfgOrderService.useSomkeYesOrNo(yfgOrder);
		if(list!=null&&list.size()>0) {
			json.setCode("0");
			json.setMsg("该用户正在使用抽烟室");
			json.setData(list);
		}else {
			json.setCode("1");
			json.setMsg("该用户没有正在使用抽烟室");
			
		}		
		return json;
	}

	@Override
	public MsgJson createActivityOrder(String openId, String activity_id, String userId,String recName,String recMobile,String recAddress, String recPostcode) {
		MsgJson json = new MsgJson();
		/*
		 * 1、
		 * 2、创建订单
		 * 3、微信支付
		 */
		YfgActivity yfgActivity = new YfgActivity();
		yfgActivity = YfgActivityService.selectYfgActivityById(Integer.parseInt(activity_id));
		if(yfgActivity==null) {
			json.setCode("1");
			json.setMsg("活动商品id不存在");
			return json;
		}
		
		JSONObject resJson = createActivityOrderInfo(userId,yfgActivity,openId, recName, recMobile, recAddress,  recPostcode);
		if(resJson.get("code").equals("0")) {
			json.setData(resJson);
			json.setCode("0");
			json.setMsg(resJson.getString("returnMsg"));
		}else {
			json.setCode("1");
			json.setMsg(resJson.getString("returnMsg"));
			return json;
		}
		
		return json;
	}
	
	/**
	 * 活动商品 订单
	 *
	 */
	public JSONObject  createActivityOrderInfo(String userId,YfgActivity yfgActivity ,String openId,String recName,String recMobile,String recAddress, String recPostcode) {
		
		MsgJson json = new MsgJson();
		logger.info("========================创建订单");
		JSONObject objson =  new JSONObject();
		
		String out_trade_no = FastUploadFileTools.getOrderNum();
		
		
		logger.info("========================微信统一下单接口");
		com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
		
		String APPID =  Global.getAppId();		
		String MERID =Global.getMchId();
		String SIGNKEY = Global.getMchidKey();
 		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";// 微信统一下单接口
/* 		String notifyUrl="http://collection.qinguobao.xyz/caiji/nfc/notify";
*/ 		String notifyUrl="http://yfg.flyoge.com/yfg/yfgInter/activityNotify";
 		
		String spbill_create_ip = "127.0.0.1";
	
		String scene_info = "'h5_info':{'type':'Wap','wap_url':'www.baidu.com','wap_name': '云飞阁'}";
		String tradeType = "JSAPI";// H5支付标记
		String MD5 = "MD5";// 虽然官方文档不是必须参数，但是不送有时候会验签失败
		String subject = "云飞阁";// 前端上送的支付主题
/*		String total_amount = request.getParameter("pay_amount");// 前端上送的支付金额
		String timestamp = String.valueOf(System.currentTimeMillis() / 1000);*/
		// 金额转化为分为单位 微信支付以分为单位
	    String payMoney = yfgActivity.getActivityPrice().toString();
		String deviceInfo = "WEB";
	
		// 随机数
		String nonce_str = FastUploadFileTools.getMessageDigest(String.valueOf(new Random().nextInt(10000)).getBytes());
	    //组装参数
	    SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();		
	    packageParams.put("appid",APPID);  
	    packageParams.put("body", subject); 
	    packageParams.put("device_info", deviceInfo);
	    packageParams.put("mch_id", MERID);
	    packageParams.put("nonce_str", nonce_str);
	    packageParams.put("notify_url", notifyUrl);  
	    packageParams.put("out_trade_no", out_trade_no);//订单号
	    packageParams.put("scene_info", scene_info);//订单号
	    packageParams.put("sign_type", "MD5");//订单号	    
	    packageParams.put("spbill_create_ip", spbill_create_ip);
	    packageParams.put("total_fee", payMoney);  //金额数目,这里的需要转换成分,而不是元
	    packageParams.put("trade_type", tradeType); 
	    packageParams.put("openid", openId);
	    String sign = WXPayUtil.createSign("UTF-8",packageParams);
	    packageParams.put("sign", sign);
	    
	 // 封装xml报文
	 		String xml = "<xml>" + "<appid>" + APPID + "</appid>" 
	 		        +"<body>" + subject + "</body>"
	 				+"<device_info>" + deviceInfo + "</device_info>" 
	 				+ "<mch_id>" + MERID + "</mch_id>"  
	 				+"<nonce_str>"+ nonce_str + "</nonce_str>" 
	 				+ "<notify_url>" + notifyUrl + "</notify_url>"
	 				+ "<out_trade_no>" + out_trade_no + "</out_trade_no>" 
	 				+ "<scene_info>" + scene_info + "</scene_info>" 
	 				+ "<sign_type>MD5</sign_type>" 
	 				+ "<spbill_create_ip>"+ spbill_create_ip + "</spbill_create_ip>"
	 				+ "<total_fee>" + payMoney + "</total_fee>"
	 				+ "<trade_type>" + tradeType + "</trade_type>" 
	 				+ "<openid>" + openId + "</openid>" 
	 				+"<sign>"+ sign + "</sign>" + "</xml>";
			logger.info("xml是================" + xml);
	 		String mweb_url = "";
	 		Map map = new HashMap();
	 		try {
	 			// 预下单 获取接口地址
	 			map = FastUploadFileTools.getMwebUrl(createOrderURL, xml);
	 			String return_code = (String) map.get("return_code");
	 			String return_msg = (String) map.get("return_msg");
	 			if ("SUCCESS".equals(return_code) && "OK".equals(return_msg)) {
	 				mweb_url = (String) map.get("mweb_url");// 调微信支付接口地址
	 				logger.info("统一支付下单成功，mweb_url是================" + mweb_url);
	 			} else {
	 				logger.info("统一支付接口获取预支付订单出错");
	 				retjson.put("returnMsg", "支付错误");
	 				retjson.put("code", "1");
	 				return retjson;
	 			}
	 		} catch (Exception e) {
	 			logger.info("统一支付接口获取预支付订单出错");
	 			retjson.put("code", "1");
 				retjson.put("returnMsg", "统一支付接口获取预支付订单出错");
 				return retjson;
	 		}
		    //组装参数
			String nonce_str1 = FastUploadFileTools.getMessageDigest(String.valueOf(new Random().nextInt(10000)).getBytes());
		    Object timeStamp=System.currentTimeMillis()/1000;
			SortedMap<Object, Object> pack = new TreeMap<Object, Object>();		
			String prepayId="prepay_id="+(String) map.get("prepay_id");
		    pack.put("appId",APPID);  
		    pack.put("nonceStr", nonce_str1);
		    pack.put("package",prepayId); 
		    pack.put("signType", "MD5");
		    System.out.println("timeStamp："+timeStamp.toString());
		    pack.put("timeStamp", timeStamp.toString());
		    System.out.println("返回给前台的map"+pack);
		    String paySign1 = WXPayUtil.createSign("UTF-8",pack);
		    System.out.println("返回给前台的签名"+paySign1);
	 			 		
	 		retjson.put("mwebUrl",mweb_url);	
	 		retjson.put("appid", APPID);
	 		retjson.put("timeStamp", timeStamp.toString());
	 		retjson.put("nonceStr",nonce_str1);
	 	/*	retjson.put("nonce_str", (String) map.get("nonce_str"));*/
	 		retjson.put("package", prepayId); 
	 	/*	retjson.put("package", (String) map.get("prepay_id"));*/
	 		retjson.put("signType", "MD5");
	 		retjson.put("paySign",(String) map.get("sign"));
	 		retjson.put("open_id", openId);
	 		retjson.put("paySign1", paySign1);
	 		retjson.put("returnMsg", "SUCCESS");
	 		retjson.put("code", "0");
	 		//创建订单

        YfgActivityOrder yfgActivityOrder = new YfgActivityOrder(); 
        yfgActivityOrder.setUserId(Integer.parseInt(userId));
		if(openId!=null&&!openId.equals("")) {
			yfgActivityOrder.setOpenId(openId);	
		 }			
		yfgActivityOrder.setCreateDate(new Date());
		yfgActivityOrder.setOrderId(out_trade_no);
		
		yfgActivityOrder.setRecName(recName);
		yfgActivityOrder.setRecMobile(recMobile);
		yfgActivityOrder.setAddressContent(recAddress);
		yfgActivityOrder.setPostCode(recPostcode);

		yfgActivityOrder.setStatus("1");
		yfgActivityOrder.setThirdOrderId(map.get("prepay_id").toString());
		yfgActivityOrder.setPayAmount(yfgActivity.getActivityPrice());
		yfgActivityOrder.setActivityId(yfgActivity.getId().toString());
		yfgActivityOrder.setActivityName(yfgActivity.getActivityName());
		
		yfgActivityOrder.setRemark("微信支付创建活动商品订单");
		yfgActivityOrderService.insertYfgActivityOrder(yfgActivityOrder);
	 		
	 	logger.info("微信统一下单返回的参数是"+retjson);
	    return retjson;

	}

	@Override
	public MsgJson openOrderRoom(String orderId, String userId, String openId) {
		/*
		 * 1.查询订单
		 * 2、根据订单获取设备状态，打开设备
		 * 3、判断订单
		 */
		MsgJson json = new MsgJson();
		YfgOrder yfgOrder  = new YfgOrder();
		yfgOrder.setOrderId(orderId);
		yfgOrder.setUserId(Integer.parseInt(userId));
	    List<YfgOrder> list = yfgOrderService.selectYfgOrderList(yfgOrder);
	    if(list!=null&&list.size()>0) {
	    	
	    	YfgOrder yfgOrderTmp = list.get(0);
	    	if(yfgOrderTmp.getStatus()!=null&&yfgOrderTmp.getStatus().equals("2")) {
	    		YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(yfgOrderTmp.getDeviceId());
	    		if(yfgDevice!=null&&!yfgDevice.getStatus().equals("1")) {
	    			//开门
	    		
	    			String flag = tcpNettyServerHandlerService.openRoom(yfgOrderTmp);
	    			
	    			if(flag.equals("00")) {
	    			    				
	    			    YfgOrder yfgOrderResult = yfgOrderService.selectYfgOrderById(yfgOrderTmp.getId());
	    				
	    				logger.info("设备打开成功");
	    				json.setCode("0");
	    				json.setMsg("该用户设备打开成功");
	    				json.setData(yfgOrderResult);
	    			}
	    			
	    		}else {
	    			logger.info("当前设备不可用");
	    			json.setCode("1");
    				json.setMsg("当前设备不可用");
	    		}
	    		
	    	}else {
	    		logger.info("订单状态为："+yfgOrderTmp.getStatus()+",不允许开门");
	    		json.setCode("1");
				json.setMsg("订单状态为："+yfgOrderTmp.getStatus()+",不允许开门");
	    	}
	    }else {
	    	logger.info("未查询到订单信息");
	    	json.setCode("1");
			json.setMsg("未查询到订单信息");
	    }
		
		return json;
	}
	      

}
