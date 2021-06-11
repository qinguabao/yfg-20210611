package com.whty.model.web.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.whty.model.domain.Address;
import com.whty.model.domain.CardUser;
import com.whty.model.domain.SpecialCardInfo;
import com.whty.model.domain.StationInfo;
import com.whty.model.domain.SysAreaCity;
import com.whty.model.domain.User;
import com.whty.model.domain.YfgActivityOrder;
import com.whty.model.domain.YfgOrder;
import com.whty.model.domain.YfgPackage;
import com.whty.model.service.IAddressService;
import com.whty.model.service.ICardUserService;
import com.whty.model.service.ISpecialCardInfoService;
import com.whty.model.service.IStationInfoService;
import com.whty.model.service.ISysAreaCityService;
import com.whty.model.service.IUserService;
import com.whty.model.service.IYfgActivityOrderService;
import com.whty.model.service.IYfgActivityService;
import com.whty.model.service.IYfgOrderService;
import com.whty.model.service.IYfgPackageService;
import com.whty.model.service.IYfgVerifcodeService;
import com.whty.model.sms.CodeUtil;
import com.whty.model.socket.netty.service.TcpNettyServerHandlerService;
import com.yfg.common.config.Global;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.utils.FastDFSClientWrapper;
import com.yfg.common.utils.FastUploadFileTools;
import com.yfg.common.utils.HttpsConnection;
import com.yfg.common.utils.MsgJson;
import com.yfg.common.utils.WXPayUtil;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.SortedMap;
import java.util.TreeMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@CrossOrigin(origins = "*",
maxAge = 3600,
methods = {RequestMethod.GET, RequestMethod.POST})
@Api("入口")
@RestController
@RequestMapping({ "/yfgInter/*" })
public class InterfaceController extends BaseController {

	@Autowired
	private ISpecialCardInfoService specialCardInfoService;

	@Autowired
	private IStationInfoService stationInfoService;

	@Autowired
	private ISysAreaCityService sysAreaCityService;
	private static Logger logger = LoggerFactory.getLogger(InterfaceController.class);
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


	@Autowired
	private IUserService userService;

	@Autowired
	private ICardUserService cardUserService;

	@Autowired
	private FastDFSClientWrapper fastDFSClientWrapper;

	@Autowired
	private IAddressService addressService;
	
	
	/*
	 * 云飞阁
	 */
	@Autowired
	private IYfgOrderService yfgOrderService ;
	@Autowired
	private com.whty.model.service.YfeigeService YfeigeService;
	@Autowired
	private IYfgVerifcodeService yfgVerifcodeService ;
	@Autowired
	private IYfgPackageService yfgPackageService;
	@Autowired
	private TcpNettyServerHandlerService tcpNettyServerHandlerService;
	@Autowired
	private IYfgActivityOrderService yfgActivityOrderService;
	
	@Autowired
	private IYfgActivityService yfgActivityService;
	
	

		@RequestMapping(value = "yfg", method = RequestMethod.POST)
		@ResponseBody
	    public JSONObject praseMsg(@RequestBody String json)
	    {
	    
	    	String resMsg="";
	    	JSONObject jsonObj =new JSONObject();
	    	try {
	    		JSONObject msg=JSON.parseObject(json);
		    	logger.info("app传入参数："+msg);
		    	String txncode=msg.getString("txncode");
		    	if(txncode==null||txncode.equals("")) {
		    		logger.info("txncode 业务码传入错误");
		    		jsonObj.put("code", "1");
		    		jsonObj.put("data", "");
		    		jsonObj.put("msg", "txncode 业务码传入错误");
		    		return jsonObj;
		    	}
		    	MsgJson resjson = new MsgJson();
		    	switch(txncode)
		    	{                // 获取 用户openId
		    	  case "1001" : resjson=YfeigeService.getAccessToken(msg.getString("code")); break;
		    	                // 打开吸烟室
		    	  case "1002"  : resjson=YfeigeService.openSmokeRoot("01",msg.getString("openId"),msg.getString("deviceId"),msg.getString("packageId"),msg.getString("userId"));  break;
		    	  				//我的订单
		    	  case "1003"  : resjson=YfeigeService.OrderList(msg.getString("userId"),msg.getString("openId"));break; 
		    	                 //用户是否再使用抽烟室
		    	  case "1004"  :  resjson=YfeigeService.useSmokeRoomYesOrNo(msg.getString("userId"),msg.getString("openId"));break; 
		    	  				//获取套餐列表
		    	  case "1005"  :  resjson=YfeigeService.getPackageList(null);break;
		    	                //抽烟室是否可用
		    	  case "1006"  :  resjson=YfeigeService.SmokeIsUse(msg.getString("deviceId"));break;
		    	                 //发送短信验证码
		    	  case "1007"  :  resjson=YfeigeService.sendSmsCode(msg.getString("mobilephone"), msg.getString("openId"), msg.getString("yzm"));break;
		    	                 //验证验证码
		    	  case "1008"  :  resjson=YfeigeService.verifSmsCode(msg.getString("mobilephone"), msg.getString("smscode"), msg.getString("openId"));break;
		    	                  //是否可以再次发送验证码
		    	  case "1009"  :  resjson=YfeigeService.judgeSendSms(msg.getString("mobilephone"), msg.getString("openId"));break;
		    	  
		    	  case "1010"  : resjson=YfeigeService.openSmokeRoot("01",msg.getString("openId"),msg.getString("deviceId"),msg.getString("packageId"),msg.getString("userId"));  break;
		    	 //js功能授权 加密
		    	  case "1011"  : resjson=YfeigeService.getSignature(msg.getString("url"));  break;  
		    	  //获取活动商品列表
		    	  case "1012" : resjson = yfgActivityService.getActivityList();break;
		    	  //创建订单
		    	  case "1013" : resjson = YfeigeService.createActivityOrder(msg.getString("openId"), msg.getString("activity_id"), msg.getString("userId"),msg.getString("recName"),msg.getString("recMobile"),msg.getString("recAddress"),msg.getString("recPostcode"));break;
		    	   //查询订单列表		    	  
		    	  case "1014": resjson = YfeigeService.activityOrderList(msg.getString("userId"),msg.getString("openId"));break; 
		    	   //支付成功，打开吸烟室失败		    	  
		    	  case "1015": resjson = YfeigeService.openOrderRoom(msg.getString("orderId"),msg.getString("userId"),msg.getString("openId"));break; 
		    	}
		    	jsonObj = (JSONObject) JSON.toJSON(resjson);  
		    	logger.info("app返回数据："+jsonObj);
	    	}catch(Exception e) {
	    	    logger.info("接口异常99", e);
	    		jsonObj.put("code", "1");
	    		jsonObj.put("data", "");
	    		jsonObj.put("msg", "系统接口异常");
	    		return jsonObj;
	    	}
	    	
	        return jsonObj;
	    }



	    /*
	    将接口进行全部翻新
	     */
		@RequestMapping(value = "yfgnew", method = RequestMethod.POST)
		@ResponseBody
		public JSONObject praseMsgNew(@RequestBody String json)
		{

			String resMsg="";
			JSONObject jsonObj =new JSONObject();
			try {
				JSONObject msg=JSON.parseObject(json);
				logger.info("小程序传入参数："+msg);
				String txncode=msg.getString("txncode");
				if(txncode==null||txncode.equals("")) {
					logger.info("txncode 业务码传入错误");
					jsonObj.put("code", "1");
					jsonObj.put("data", "");
					jsonObj.put("msg", "txncode 业务码传入错误");
					return jsonObj;
				}
				MsgJson resjson = new MsgJson();
				switch(txncode)
				{                // 获取 用户openId
					case "2001" : resjson=YfeigeService.getAppletsAccessToken(msg.getString("code")); break;
					// 打开吸烟室
					case "2002"  : resjson=YfeigeService.openSmokeRoot("02",msg.getString("openId"),msg.getString("deviceId"),msg.getString("packageId"),msg.getString("userId"));  break;
					//我的订单
					case "2003"  : resjson=YfeigeService.OrderList(msg.getString("userId"),msg.getString("openId"));break;
					//用户是否再使用抽烟室
					case "2004"  :  resjson=YfeigeService.useSmokeRoomYesOrNo(msg.getString("userId"),msg.getString("openId"));break;
					//获取套餐列表
					case "2005"  :  resjson=YfeigeService.getPackageList(msg.getString("deviceId"));break;
					//抽烟室是否可用
					case "2006"  :  resjson=YfeigeService.SmokeIsUse(msg.getString("deviceId"));break;
					//发送短信验证码
					case "2007"  :  resjson=YfeigeService.sendSmsCode(msg.getString("mobilephone"), msg.getString("openId"), msg.getString("yzm"));break;
					//验证验证码
					case "2008"  :  resjson=YfeigeService.verifSmsCode(msg.getString("mobilephone"), msg.getString("smscode"), msg.getString("openId"));break;
					//是否可以再次发送验证码
					case "2009"  :  resjson=YfeigeService.judgeSendSms(msg.getString("mobilephone"), msg.getString("openId"));break;

					case "2010"  : resjson=YfeigeService.openSmokeRoot("02",msg.getString("openId"),msg.getString("deviceId"),msg.getString("packageId"),msg.getString("userId"));  break;
					//js功能授权 加密
					case "2011"  : resjson=YfeigeService.getSignature(msg.getString("url"));  break;
					//获取活动商品列表
					case "2012" : resjson = yfgActivityService.getActivityList();break;
					//创建订单
					case "2013" : resjson = YfeigeService.createActivityOrder(msg.getString("openId"), msg.getString("activity_id"), msg.getString("userId"),msg.getString("recName"),msg.getString("recMobile"),msg.getString("recAddress"),msg.getString("recPostcode"));break;
					//查询订单列表
					case "2014": resjson = YfeigeService.activityOrderList(msg.getString("userId"),msg.getString("openId"));break;
					//支付成功，打开吸烟室失败
					case "2015": resjson = YfeigeService.openOrderRoom(msg.getString("orderId"),msg.getString("userId"),msg.getString("openId"));break;
                    //String userId,String encryptedData,String iv
					case "2016": resjson = YfeigeService.getAppletsmiwen(msg.getString("userId"),msg.getString("encryptedData"),msg.getString("iv"));break;
				}
				jsonObj = (JSONObject) JSON.toJSON(resjson);
				logger.info("app返回数据："+jsonObj);
			}catch(Exception e) {
				logger.info("接口异常99", e);
				jsonObj.put("code", "1");
				jsonObj.put("data", "");
				jsonObj.put("msg", "系统接口异常");
				return jsonObj;
			}

			return jsonObj;
		}

		
		/**
		 * 获取验证码
		 * 
		 * @param mobilePhone
		 * @param openId
		 * @return
		 */
		@RequestMapping(value = "msgCode")
		public void getMsgCode(HttpServletResponse response,@RequestParam(value = "openId") String openId) {
			// 获取验证码
			CodeUtil.getValid(response, openId,yfgVerifcodeService);
		}

	


		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	/**
	 * 微信支付查询订单状态
	 * @throws ParseException 
	 *
	 */
	@RequestMapping({ "/orderQuery" })
	@ResponseBody
	public String orderQuery(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
		logger.info("========================微信支付查询接口");
		com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
		if((request.getParameter("open_id") == null) || "".equals(request.getParameter("open_id"))){
			retjson.put("returnMsg", "ERROR"); 
			return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
		}
		User use = new User();
		use.setOpenId(request.getParameter("open_id"));
		List users = this.userService.selectUserList(use);
		if (users.size() == 0) {
			retjson.put("returnMsg", "用户不存在！");
			logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
			return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
		}
		String APPID = "wx28538c98b1199c61";
		String MERID = "1255375001";
		String SIGNKEY = "whtyjlxpsh20190415whty0123456789";
 		String createOrderURL = "https://api.mch.weixin.qq.com/pay/orderqueryr";// 微信查询订单接口
 		/*String notifyUrl="http://collection.qinguobao.xyz/caiji/nfc/notify";
*/ 		
 		String notifyUrl="http://whty.tyjulink.com/caiji/nfc/notify";
		String spbill_create_ip = getIpAddr(request);
		System.out.println("spbill_create_ip=" + spbill_create_ip);
		String scene_info = "'h5_info':{'type':'Wap','wap_url':'www.baidu.com','wap_name': '采集系统支付'}";
		String tradeType = "JSAPI";// H5支付标记
		String MD5 = "MD5";// 虽然官方文档不是必须参数，但是不送有时候会验签失败
		String subject = "学生信息采集支付";// 前端上送的支付主题
/*		String total_amount = request.getParameter("pay_amount");// 前端上送的支付金额
		String timestamp = String.valueOf(System.currentTimeMillis() / 1000);*/
		// 金额转化为分为单位 微信支付以分为单位
		String finalmoney = request.getParameter("pay_amount");
		String deviceInfo = "WEB";
		/*
		 * int randomNum = (int) (Math.random() * 1999 + 5000);
		 */ String out_trade_no = FastUploadFileTools.getOrderNum();
		// 随机数
		String nonce_str = FastUploadFileTools.getMessageDigest(String.valueOf(new Random().nextInt(10000)).getBytes());
	    //组装参数
	    SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();		
	    packageParams.put("appid",APPID);
	    packageParams.put("mch_id", MERID);
	    packageParams.put("out_trade_no ", request.getParameter("order_code"));
	    packageParams.put("nonce_str", nonce_str);
	  /*  packageParams.put("body", subject); 
	    packageParams.put("device_info", deviceInfo);
	    packageParams.put("notify_url", notifyUrl);  
	    packageParams.put("out_trade_no", out_trade_no);//订单号
	    packageParams.put("scene_info", scene_info);//订单号*/
	    packageParams.put("sign_type", "MD5");//订单号	    
/*	    packageParams.put("spbill_create_ip", spbill_create_ip);
	    packageParams.put("total_fee", finalmoney);  //金额数目,这里的需要转换成分,而不是元
	    packageParams.put("trade_type", tradeType);
	    packageParams.put("openid", request.getParameter("open_id")); */
	    String sign = WXPayUtil.createSign("UTF-8",packageParams);
	    packageParams.put("sign", sign);
	    
	 // 封装xml报文
	 		String xml = "<xml>" + "<appid>" + APPID + "</appid>" 
	 				+ "<mch_id>" + MERID + "</mch_id>"  
	 				+ "<out_trade_no>" + out_trade_no + "</out_trade_no>" 
	 				+"<nonce_str>"+ nonce_str + "</nonce_str>" 
	 				+ "<sign_type>MD5</sign_type>" 	 		
	 				+"<sign>"+ sign + "</sign>" + "</xml>";

	 		System.out.println("================" + xml);
	 		String mweb_url = "";
	 		Map map = new HashMap();
	 		try {
	 			map = FastUploadFileTools.getMwebUrl(createOrderURL, xml);
	 			String return_code = (String) map.get("return_code");
	 			String return_msg = (String) map.get("return_msg");
	 			if ("SUCCESS".equals(return_code) && "OK".equals(return_msg)) {
		 			String result_code=(String)map.get("result_code");
	 				if("SUCCESS".equals(result_code)){
			 			String trade_state=(String)map.get("trade_state");
			 			if("SUCCESS".equals(result_code)){
			 				logger.info("主动查询微信的结果是支付成功----"+result_code);
			 				CardUser cardUser=new CardUser();
			 				cardUser.setOrderCode(out_trade_no);
			 	        	cardUser.setPayStatus("0");
			 	        	cardUser.setPayCompleteTime(sdf.parse(sdf.format(new Date())));
			 	        	cardUser.setUpdateDate(sdf.parse(sdf.format(new Date())));
			 	        	cardUserService.updateOrderCode(cardUser);			 				
			 			}else{
			 				logger.info("主动查询微信的结果是不成功----"+result_code);
			 				retjson.put("returnMsg", "支付查询订单错误");
			 				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			 			}
	 				}else{
	 					logger.info("支付查询订单错误----"+result_code);
		 				retjson.put("returnMsg", "支付查询订单错误");
		 				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
	 				}

	 			} else {
	 				logger.info("支付查询订单错误----"+return_code);
	 				retjson.put("returnMsg", "支付查询订单错误");
	 				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
	 			}
	 		} catch (Exception e) {
	 			System.out.println("微信查询订单出错");
 				retjson.put("returnMsg", "支付错误");
 				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
	 		}
	 		retjson.put("returnMsg", "SUCCESS");
		return com.alibaba.fastjson.JSONObject.toJSONString(retjson);

	}
	
	/**
	 * 微信支付统一下单
	 * @throws ParseException 
	 *
	 */
	@RequestMapping({ "/addOrder" })
	@ResponseBody
	public String addOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
		logger.info("========================微信统一下单接口");
		com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
		if((request.getParameter("open_id") == null) || "".equals(request.getParameter("open_id"))){
			retjson.put("returnMsg", "ERROR"); 
			return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
		}
		User use = new User();
		use.setOpenId(request.getParameter("open_id"));
		List users = this.userService.selectUserList(use);
		if (users.size() == 0) {
			retjson.put("returnMsg", "用户不存在！");
			logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
			return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
		}
		String orderId=request.getParameter("orderId");
		String APPID = "wx28538c98b1199c61";
		String MERID = "1255375001";
		String SIGNKEY = "whtyjlxpsh20190415whty0123456789";
 		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";// 微信统一下单接口
/* 		String notifyUrl="http://collection.qinguobao.xyz/caiji/nfc/notify";
*/ 		String notifyUrl="http://whty.tyjulink.com/caiji/nfc/notify";
 		
		String spbill_create_ip = getIpAddr(request);
		System.out.println("spbill_create_ip=" + spbill_create_ip);
		String scene_info = "'h5_info':{'type':'Wap','wap_url':'www.baidu.com','wap_name': '采集系统支付'}";
		String tradeType = "JSAPI";// H5支付标记
		String MD5 = "MD5";// 虽然官方文档不是必须参数，但是不送有时候会验签失败
		String subject = "学生信息采集支付";// 前端上送的支付主题
/*		String total_amount = request.getParameter("pay_amount");// 前端上送的支付金额
		String timestamp = String.valueOf(System.currentTimeMillis() / 1000);*/
		// 金额转化为分为单位 微信支付以分为单位
		String finalmoney = request.getParameter("pay_amount");
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
	    packageParams.put("total_fee", finalmoney);  //金额数目,这里的需要转换成分,而不是元
	    packageParams.put("trade_type", tradeType); 
	    packageParams.put("openid", request.getParameter("open_id"));
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
	 				+ "<total_fee>" + finalmoney + "</total_fee>"
	 				+ "<trade_type>" + tradeType + "</trade_type>" 
	 				+ "<openid>" + request.getParameter("open_id") + "</openid>" 
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
	 				logger.info("mweb_url是================" + mweb_url);
	 			} else {
	 				logger.info("统一支付接口获取预支付订单出错");
	 				retjson.put("returnMsg", "支付错误");
	 				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
	 			}
	 		} catch (Exception e) {
	 			logger.info("统一支付接口获取预支付订单出错");
 				retjson.put("returnMsg", "统一支付接口获取预支付订单出错");
 				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
	 		}
		    //组装参数
			String nonce_str1 = FastUploadFileTools.getMessageDigest(String.valueOf(new Random().nextInt(10000)).getBytes());
		    Object timeStamp=System.currentTimeMillis()/1000;
			SortedMap<Object, Object> pack = new TreeMap<Object, Object>();		
			String prepayId="prepay_id="+(String) map.get("prepay_id");
		    pack.put("appId",APPID);  
		    pack.put("nonce_str", nonce_str1);
		    pack.put("package",prepayId); 
		    pack.put("signType", "MD5");
		    pack.put("timeStamp", timeStamp);
		    System.out.println("返回给前台的map"+pack);
		    String paySign1 = WXPayUtil.createSign("UTF-8",pack);
		    System.out.println("返回给前台的签名"+paySign1);
	 			 		
	 		retjson.put("mwebUrl",mweb_url);	
	 		retjson.put("appid", APPID);
	 		retjson.put("timeStamp", timeStamp);
	 		retjson.put("nonce_str",nonce_str1);
	 	/*	retjson.put("nonce_str", (String) map.get("nonce_str"));*/
	 		retjson.put("package", prepayId); 
	 	/*	retjson.put("package", (String) map.get("prepay_id"));*/
	 		retjson.put("signType", "MD5");
	 		retjson.put("paySign",(String) map.get("sign"));
	 		retjson.put("open_id", request.getParameter("open_id"));
	 		retjson.put("paySign1", paySign1);
	 		retjson.put("returnMsg", "SUCCESS");
	 		//修改表的支付状态
	    	CardUser cardUser1=new CardUser();
	    	cardUser1.setId(Integer.parseInt(orderId));
	    	cardUser1.setOrderCode(out_trade_no);
	    	cardUser1.setPayStatus("1");
	    	cardUser1.setPayTime(sdf.parse(sdf.format(new Date())));
	    	cardUser1.setPayType("0");
	    	System.out.println("============="+finalmoney);
	    	cardUser1.setChargeAmount(Integer.parseInt(finalmoney));
	    	cardUser1.setUpdateDate(sdf.parse(sdf.format(new Date())));
        	cardUserService.updateCardUser(cardUser1);
        	logger.info("微信统一下单返回的参数是"+retjson);
		return com.alibaba.fastjson.JSONObject.toJSONString(retjson);

	}
	/**
	 * 微信支付回调
	 *
	 */
	/**
	 * 微信支付回调
	 *
	 */
	@RequestMapping(value = "/notify")
	public void weixinPayNotify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("========================微信支付异步回调接口");
		BufferedReader reader = request.getReader();
        String line = "";
        Map map = new HashMap();
        String xml = "<xml><return_code><![CDATA[FAIL]]></xml>";;
		com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
        StringBuffer inputString = new StringBuffer();
        while ((line = reader.readLine()) != null) {
            inputString.append(line);
        }
        request.getReader().close();
        System.out.println("----接收到微信的回调报文---"+inputString.toString());
        if(inputString.toString().length()>0){
        	 map = WXPayUtil.xmlToMap(inputString.toString());
        }else{
        	System.out.println("接受微信报文为空");
        }
        System.out.println("map="+map);
        //下面这些参数需要的可以获取,不需要也可以不用获取
        String result_code = (String) map.get("result_code");
        String is_subscribe = (String) map.get("is_subscribe");
        String transaction_id = (String) map.get("transaction_id");
        String sign = (String) map.get("sign");
        String time_end = (String) map.get("time_end");
        String bank_type = (String) map.get("bank_type");
        String out_trade_no = (String) map.get("out_trade_no");
        String return_code = (String) map.get("return_code");
        String total_fee = (String) map.get("total_fee");
        logger.info("return_code:"+return_code);
        
        YfgOrder yfgOrder = new YfgOrder();
    	yfgOrder.setOrderId(out_trade_no);
    	yfgOrder.setPayAmount(Integer.parseInt(total_fee));
    	List<YfgOrder> list = yfgOrderService.selectYfgOrderList(yfgOrder);
    	if(list!=null&&list.size()>0) {
    		 YfgOrder order = list.get(0);
    		 if(map!=null && "SUCCESS".equals(map.get("result_code"))){//失败将支付状态改成0
    			 logger.info(out_trade_no+"订单支付成功");    
    			 if(order.getStatus().equals("2")||order.getStatus().equals("3")||order.getStatus().equals("6")) {
    				 logger.info("已支付成功**********重复推送");
    					xml = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
        	            //告诉微信端已经确认支付成功
        	            response.getWriter().write(xml);
    			 }else {
    				 order.setStatus("2");    	        	
     	        	/*
     	        	 * 然后打开抽烟室 set 状态=3
     	        	 */
//     	        	order.setStatus("3");       	
     	        	
     	        	order.setPayNofityTime(new Date());
     	        	order.setUpdateTime(new Date());
     	        	
     	        	
     	        	yfgOrderService.updateYfgOrder(order);    
     	        	tcpNettyServerHandlerService.openRoom(order);
     	        	xml = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
     	            //告诉微信端已经确认支付成功
     	            response.getWriter().write(xml); 
    			 }
    	        	    	
    	       	   
    	        }else{//失败将支付状态改成1 支付中
    	        	
    	        	logger.info(out_trade_no+"订单支付失败");    	        	
    	        	order.setStatus("1");
    	        	order.setPayNofityTime(new Date());
    	        	order.setUpdateTime(new Date());
    	         	yfgOrderService.updateYfgOrder(order);
    	        }
    	}else {
    		logger.info("系统不存在订单号"+out_trade_no+";与金额"+total_fee+"的订单");
    	}
    	
       
	}
	
	
	
	/*
	 * 微信支付 活动商品支付 
	 * activityNotify
	 */
	@RequestMapping(value = "/activityNotify")
	public void weixinPayActivityNotify(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("========================微信支付异步回调接口");
		BufferedReader reader = request.getReader();
        String line = "";
        Map map = new HashMap();
        String xml = "<xml><return_code><![CDATA[FAIL]]></xml>";;
		com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
        StringBuffer inputString = new StringBuffer();
        while ((line = reader.readLine()) != null) {
            inputString.append(line);
        }
        request.getReader().close();
        System.out.println("----接收到微信的回调报文---"+inputString.toString());
        if(inputString.toString().length()>0){
        	 map = WXPayUtil.xmlToMap(inputString.toString());
        }else{
        	System.out.println("接受微信报文为空");
        }
        System.out.println("map="+map);
        //下面这些参数需要的可以获取,不需要也可以不用获取
        String result_code = (String) map.get("result_code");
        String is_subscribe = (String) map.get("is_subscribe");
        String transaction_id = (String) map.get("transaction_id");
        String sign = (String) map.get("sign");
        String time_end = (String) map.get("time_end");
        String bank_type = (String) map.get("bank_type");
        String out_trade_no = (String) map.get("out_trade_no");
        String return_code = (String) map.get("return_code");
        String total_fee = (String) map.get("total_fee");
        logger.info("return_code:"+return_code);
        
        YfgActivityOrder yfgActivityOrder = new YfgActivityOrder();
        yfgActivityOrder.setOrderId(out_trade_no);
        yfgActivityOrder.setPayAmount(Integer.parseInt(total_fee));
    	List<YfgActivityOrder> list = yfgActivityOrderService.selectYfgActivityOrderList(yfgActivityOrder);
    	if(list!=null&&list.size()>0) {
    		YfgActivityOrder order = list.get(0);
    		 if(map!=null && "SUCCESS".equals(map.get("result_code"))){//失败将支付状态改成0
    		       
    	        	logger.info(out_trade_no+"订单支付成功");        	
    	       	    order.setStatus("2");    	        	
    	        	  	
    	        	
    	        	order.setPayNofityTime(new Date());
    	        	order.setUpdateTime(new Date());
    	        	order.setStartTime(new Date());    	        	
    	        	order.setPayNofityTime(new Date());
    	        	yfgActivityOrderService.updateYfgActivityOrder(order);   
    	        
    	        	xml = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
    	            //告诉微信端已经确认支付成功
    	            response.getWriter().write(xml);
    	        }else{//失败将支付状态改成1 支付中
    	        	
    	        	logger.info(out_trade_no+"订单支付失败");    	        	
    	        	order.setStatus("1");
    	        	order.setPayNofityTime(new Date());
    	        	order.setUpdateTime(new Date());
    	        	yfgActivityOrderService.updateYfgActivityOrder(order);   
    	        	
    	        }
    	}else {
    		logger.info("系统不存在订单号"+out_trade_no+";与金额"+total_fee+"的订单");
    	}
    	
       
	}
	
	

	/**
	 * 微信支付获取openId
	 *
	 */
	@RequestMapping({ "/getOpenid" })
	@ResponseBody
	public String getOpenid(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String resMsg = "";
		com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
		String openid = (String) request.getSession().getAttribute("openid");
		if (StringUtils.isEmpty(openid)) {
			String code = request.getParameter("code");
			if((code != null) || (!"".equals(code))){
			logger.info("微信公众号传过来的code为：" + code);
			String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + Global.getAppId() + "&secret="
					+ Global.getAppSecret() + "&code=" + code + "&grant_type=authorization_code";
			logger.info("微信公众号url：" + url);
			String WeChat_result = "";
			try {
				WeChat_result = HttpsConnection.doPost(url, null, "UTF-8", 1000, 1000, true);
				logger.info("WeChat_result:" + WeChat_result);

				net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(WeChat_result);
				logger.info("jsonObject = " + jsonObject);
				String errorCode = jsonObject.optString("errcode");
				if (StringUtils.isEmpty(errorCode)) {
					openid = jsonObject.optString("openid");
					String access_token = jsonObject.optString("access_token");
					logger.info("获取的openid------------"+openid);
					retjson.put("open_id", openid);
					retjson.put("access_token", access_token);
					retjson.put("returnMsg", "SUCCESS");
				} else {
					String errmsg = jsonObject.optString("errmsg");
					retjson.put("returnMsg",errmsg);
					logger.info(errmsg);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		}

		String currTimestamp = String.valueOf(System.currentTimeMillis());
		retjson.put("currTimestamp", currTimestamp);
		logger.info("返回的数据"+com.alibaba.fastjson.JSONObject.toJSONString(retjson));
		resMsg = com.alibaba.fastjson.JSONObject.toJSONString(retjson);
		return resMsg;
	}
	/**
	 * 获取用户实际ip
	 * @param request
	 * @return
	 */
	 public String getIpAddr(HttpServletRequest request){  
        String ipAddress = request.getHeader("x-forwarded-for");  
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getHeader("Proxy-Client-IP");  
            }  
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getHeader("WL-Proxy-Client-IP");  
            }  
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getRemoteAddr();  
                if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){  
                    //根据网卡取本机配置的IP  
                    InetAddress inet=null;  
                    try {  
                        inet = InetAddress.getLocalHost();  
                    } catch (UnknownHostException e) {  
                        e.printStackTrace();  
                    }  
                    ipAddress= inet.getHostAddress();  
                }  
            }  
            //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割  
            if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15  
                if(ipAddress.indexOf(",")>0){  
                    ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));  
                }  
            }  
            return ipAddress;   
	 }
	 
		/**
		 * 新增用户信息
		 * @param request
		 * @return
		 */
	 public String addUser(HttpServletRequest request){  
		// 用户信息新增
			com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
			if((request.getParameter("open_id") == null) || "".equals(request.getParameter("open_id"))){
				retjson.put("returnMsg", "ERROR"); 
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			User use = new User();
			try {
			List<User> u=userService.selectUserByOpenId(request.getParameter("open_id"));
			if(u.size()>0){
				use.setId(u.get(0).getId());
				use.setLastLoginTime(sdf.parse(sdf.format(new Date())));
				userService.updateUser(use);
				retjson.put("returnMsg", "SUCCESS"); 
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			use.setOpenId(request.getParameter("open_id"));
			use.setLoginName(request.getParameter("login_name"));
			use.setPasswd(request.getParameter("passwd"));
			use.setGender(request.getParameter("gender"));
			use.setNickName(request.getParameter("nick_name"));
			use.setMobile(request.getParameter("mobile"));
			use.setCreateDate(sdf.parse(sdf.format(new Date())));
			use.setUpdateDate(sdf.parse(sdf.format(new Date())));
			use.setSource(request.getParameter("source"));
			use.setCity(request.getParameter("city"));
			use.setLastLoginTime(sdf.parse(sdf.format(new Date())));
			retjson.put("returnMsg", "SUCCESS");
			} catch (ParseException e) {
				retjson.put("returnMsg", "ERROR");
				e.printStackTrace();
			}
			use.setLastIp(request.getParameter("last_ip"));
			use.setRemarks(request.getParameter("remarks"));
			this.userService.insertUser(use);
			retjson.put("returnMsg", "SUCCESS");
		return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
	 }
		/**
		 * 优惠卡查询
		 * @param request
		 * @return
		 */
	 public String selectSpecialCardInfo(HttpServletRequest request){  
			com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
			SpecialCardInfo specialCardInfo = new SpecialCardInfo();
			List list = this.specialCardInfoService.selectSpecialCardInfoList(specialCardInfo);
			return com.alibaba.fastjson.JSONObject.toJSONString(list);

	 }
		/**
		 * 订单新增
		 * @param request
		 * @return
		 * @throws IOException 
		 * @throws ParseException 
		 */
	 public String addOrderUser(HttpServletRequest request) throws IOException, ParseException{  
		// 用户订单信息新增
			com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
			User use = new User();
			if((request.getParameter("open_id") == null) || "".equals(request.getParameter("open_id"))){
				retjson.put("returnMsg", "open_id没传"); 
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			use.setOpenId(request.getParameter("open_id"));
			List users = this.userService.selectUserList(use);
			if (users.size() == 0) {
				retjson.put("returnMsg", "用户不存在！");
				logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			CardUser cardUser = new CardUser();
			cardUser.setIdCardNum(request.getParameter("id_card_num"));
			List list = this.cardUserService.selectCardUserList(cardUser);
			if (list.size() > 0) {
				retjson.put("returnMsg", "身份证已被注册！");
				logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			cardUser.setApplyName(request.getParameter("apply_name"));
			cardUser.setApplyNumber(request.getParameter("apply_number"));
			cardUser.setGender(request.getParameter("gender"));
			cardUser.setSpecialCardInfo(
					Integer.valueOf(Integer.parseInt(request.getParameter("special_card_info"))));
			cardUser.setApplyTime(sdf.parse(sdf.format(new Date())));
			cardUser.setApplyStatus("0");
			cardUser.setApplyType("0");
			cardUser.setPayAmount(Integer.valueOf(Integer.parseInt(request.getParameter("pay_amount"))));
			cardUser.setPayTime(sdf.parse(sdf.format(new Date())));
			cardUser.setPayType(request.getParameter("pay_type"));
			cardUser.setMailType(request.getParameter("mail_type"));
			if (request.getParameter("mail_type").equals("1")) {
				cardUser.setStationId(Integer.valueOf(Integer.parseInt(request.getParameter("station_id"))));
			} else {
				Address adr = new Address();
				adr.setUserId(((User) users.get(0)).getId());
				List addlist = this.addressService.selectAddressList(adr);
				adr.setMobile(request.getParameter("rec_mobile"));
				adr.setRecName(request.getParameter("rec_name"));
				adr.setRecAddress(request.getParameter("rec_address"));
				adr.setDelFlag("0");
				adr.setRemark(request.getParameter("rec_remarks"));
				if (addlist.size() != 0) {
					adr.setId(((Address) addlist.get(0)).getId());
					this.addressService.updateAddress(adr);
				} else {
					this.addressService.insertAddress(adr);
				}
				this.addressService.updateAddress(adr);
				cardUser.setAddressId(adr.getId());
			}
			cardUser.setRelationToApply(request.getParameter("relation_to_apply"));
			cardUser.setAgentName(request.getParameter("agent_name"));
			cardUser.setAgentMobile(request.getParameter("agent_mobile"));
			cardUser.setAgentAddress(request.getParameter("agent_address"));
			cardUser.setFrontUserId(((User) users.get(0)).getId());
			cardUser.setSchoolInfo(Integer.valueOf(Integer.parseInt(request.getParameter("school_info"))));
			cardUser.setExportTimes(Integer.valueOf(0));
			cardUser.setRemark(request.getParameter("remark"));
			cardUser.setCardFee(Integer.valueOf(Integer.parseInt(request.getParameter("card_fee"))));
			String fileNameStr = String.valueOf(System.currentTimeMillis());
			cardUser.setConnectMobile(request.getParameter("connect_mobile"));
			cardUser.setConnectTelphone(request.getParameter("connect_telphone"));

			if ("" != request.getParameter("image_one").toString()) {
				logger.info("人像图片二进制处理！");
				FastUploadFileTools.savePic(request.getParameter("image_one").toString(), fileNameStr + ".jpg");
				Map map = FastUploadFileTools.getFileByteInputStream(Global.getProfile() + fileNameStr + ".jpg");
				String path1 = this.fastDFSClientWrapper.uploadFileByBase64(map);
				cardUser.setImageOne(path1);
			}

			if ("" != request.getParameter("image_two").toString()) {
				logger.info("人像图片二进制处理！");
				FastUploadFileTools.savePic(request.getParameter("image_two").toString(), fileNameStr + "A.jpg");
				Map map = FastUploadFileTools.getFileByteInputStream(Global.getProfile() + fileNameStr + "A.jpg");
				String path2 = this.fastDFSClientWrapper.uploadFileByBase64(map);
				cardUser.setImageTwo(path2);
			}

			if ("" != request.getParameter("image_three").toString()) {
				logger.info("人像图片二进制处理！");
				FastUploadFileTools.savePic(request.getParameter("image_three").toString(), fileNameStr + "B.jpg");
				Map map = FastUploadFileTools.getFileByteInputStream(Global.getProfile() + fileNameStr + "B.jpg");
				String path3 = this.fastDFSClientWrapper.uploadFileByBase64(map);
				cardUser.setImageThree(path3);
			}

			if ("" != request.getParameter("image_four").toString()) {
				logger.info("人像图片二进制处理！");
				FastUploadFileTools.savePic(request.getParameter("image_four").toString(), fileNameStr + "C.jpg");
				Map map = FastUploadFileTools.getFileByteInputStream(Global.getProfile() + fileNameStr + "C.jpg");
				String path4 = this.fastDFSClientWrapper.uploadFileByBase64(map);
				cardUser.setImageFour(path4);
			}
			this.cardUserService.insertCardUser(cardUser);
			retjson.put("returnMsg", "SUCCESS");
			retjson.put("orderId", cardUser.getId());
			return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
	 }
	 
		/**
		 * 自取网点
		 * @param request
		 * @return
		 * @throws IOException 
		 * @throws ParseException 
		 */
	 public String selectAreaCity(HttpServletRequest request) throws IOException, ParseException{ 
		SysAreaCity sysAreaCity = new SysAreaCity();
		if ((request.getParameter("NAME") != null) || (!"".equals(request.getParameter("NAME")))) {
			sysAreaCity.setNAME(request.getParameter("NAME"));
		}
		if ((request.getParameter("ALEVEL") != null) || (!"".equals(request.getParameter("ALEVEL")))) {
			BigDecimal bd = new BigDecimal(request.getParameter("ALEVEL"));
			sysAreaCity.setALEVEL(bd);
		}
		if ((request.getParameter("ID") != null) || (!"".equals(request.getParameter("ID")))) {
			sysAreaCity.setID(Integer.valueOf(Integer.parseInt(request.getParameter("ID"))));
		}
		List list = this.sysAreaCityService.selectSysAreaCityList(sysAreaCity);
		return com.alibaba.fastjson.JSONObject.toJSONString(list);
	 }
	 
	 
		/**
		 * 订单信息修改
		 * @param request
		 * @return
		 * @throws IOException 
		 * @throws ParseException 
		 */
	 public String updateOrderUser(HttpServletRequest request) throws IOException, ParseException{  
		// 订单信息修改
			com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
			if((request.getParameter("open_id") == null) || "".equals(request.getParameter("open_id"))){
				retjson.put("returnMsg", "ERROR"); 
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			User use = new User();
			use.setOpenId(request.getParameter("open_id"));
			List users = this.userService.selectUserList(use);
			if (users.size() == 0) {
				retjson.put("returnMsg", "用户不存在！");
				logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			CardUser cardUser = new CardUser();
			cardUser.setIdCardNum(request.getParameter("id_card_num"));
			List list = this.cardUserService.selectCardUserList(cardUser);
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					if (((CardUser) list.get(i)).getId().intValue() != Integer
							.parseInt(request.getParameter("id"))) {
						retjson.put("returnMsg", "身份证已被注册！");
						logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
						return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
					}
				}
			}
			cardUser.setId(Integer.valueOf(Integer.parseInt(request.getParameter("id"))));
			cardUser.setApplyName(request.getParameter("apply_name"));
			cardUser.setApplyNumber(request.getParameter("apply_number"));
			cardUser.setGender(request.getParameter("gender"));
			cardUser.setSpecialCardInfo(
					Integer.valueOf(Integer.parseInt(request.getParameter("special_card_info"))));
			cardUser.setApplyTime(sdf.parse(sdf.format(new Date())));
			cardUser.setApplyStatus("0");
			cardUser.setApplyType("0");
			cardUser.setPayAmount(Integer.valueOf(Integer.parseInt(request.getParameter("pay_amount"))));
			cardUser.setApplyName("0");
			cardUser.setPayTime(sdf.parse(sdf.format(new Date())));
			cardUser.setPayType(request.getParameter("pay_type"));
			cardUser.setMailType(request.getParameter("mail_type"));
			if (request.getParameter("mail_type").equals("1")) {
				cardUser.setStationId(Integer.valueOf(Integer.parseInt(request.getParameter("station_id"))));
			} else {
				Address adr = new Address();
				adr.setUserId(((User) users.get(0)).getId());
				List addlist = this.addressService.selectAddressList(adr);
				adr.setMobile(request.getParameter("rec_mobile"));
				adr.setRecName(request.getParameter("rec_name"));
				adr.setRecAddress(request.getParameter("rec_address"));
				adr.setDelFlag("0");
				adr.setRemark(request.getParameter("rec_remarks"));
				if (addlist.size() != 0) {
					adr.setId(((Address) addlist.get(0)).getId());
					this.addressService.updateAddress(adr);
				} else {
					this.addressService.insertAddress(adr);
				}
				this.addressService.updateAddress(adr);
				cardUser.setAddressId(adr.getId());
			}
			cardUser.setRelationToApply(request.getParameter("relation_to_apply"));
			cardUser.setAgentName(request.getParameter("agent_name"));
			cardUser.setAgentMobile(request.getParameter("agent_mobile"));
			cardUser.setAgentAddress(request.getParameter("agent_address"));
			cardUser.setFrontUserId(((User) users.get(0)).getId());

			cardUser.setSchoolInfo(Integer.valueOf(Integer.parseInt(request.getParameter("school_info"))));
			cardUser.setExportTimes(Integer.valueOf(0));
			cardUser.setCardFee(Integer.valueOf(Integer.parseInt(request.getParameter("card_fee"))));
			cardUser.setRemark(request.getParameter("remark"));
			cardUser.setConnectMobile(request.getParameter("connect_mobile"));
			cardUser.setConnectTelphone(request.getParameter("connect_telphone"));
			String fileNameStr = String.valueOf(System.currentTimeMillis());

			if ("" != request.getParameter("image_one").toString()) {
				logger.info("人像图片二进制处理！");
				FastUploadFileTools.savePic(request.getParameter("image_one").toString(), fileNameStr + ".jpg");
				Map map = FastUploadFileTools
						.getFileByteInputStream(Global.getProfile() + fileNameStr + ".jpg");
				String path1 = this.fastDFSClientWrapper.uploadFileByBase64(map);
				cardUser.setImageOne(path1);
			}

			if ("" != request.getParameter("image_two").toString()) {
				logger.info("人像图片二进制处理！");
				FastUploadFileTools.savePic(request.getParameter("image_two").toString(),
						fileNameStr + "A.jpg");
				Map map = FastUploadFileTools
						.getFileByteInputStream(Global.getProfile() + fileNameStr + "A.jpg");
				String path2 = this.fastDFSClientWrapper.uploadFileByBase64(map);
				cardUser.setImageTwo(path2);
			}

			if ("" != request.getParameter("image_three").toString()) {
				logger.info("人像图片二进制处理！");
				FastUploadFileTools.savePic(request.getParameter("image_three").toString(),
						fileNameStr + "B.jpg");
				Map map = FastUploadFileTools
						.getFileByteInputStream(Global.getProfile() + fileNameStr + "B.jpg");
				String path3 = this.fastDFSClientWrapper.uploadFileByBase64(map);
				cardUser.setImageThree(path3);
			}

			if ("" != request.getParameter("image_four").toString()) {
				logger.info("人像图片二进制处理！");
				FastUploadFileTools.savePic(request.getParameter("image_four").toString(),
						fileNameStr + "C.jpg");
				Map map = FastUploadFileTools
						.getFileByteInputStream(Global.getProfile() + fileNameStr + "C.jpg");
				String path4 = this.fastDFSClientWrapper.uploadFileByBase64(map);
				cardUser.setImageFour(path4);
			}
			this.cardUserService.updateCardUser(cardUser);
			retjson.put("returnMsg", "SUCCESS");
		return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
		 
	 }
	 
		/**
		 * 订单信息查询
		 * @param request
		 * @return
		 * @throws IOException 
		 * @throws ParseException 
		 */
	 public String selectOrderUser(HttpServletRequest request) {  
		// 查询订单信息
			com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
			if((request.getParameter("open_id") == null) || "".equals(request.getParameter("open_id"))){
				retjson.put("returnMsg", "ERROR"); 
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			User use = new User();
			use.setOpenId(request.getParameter("open_id"));
			List users = this.userService.selectUserList(use);
			if (users.size() == 0) {
				retjson.put("returnMsg", "用户不存在");
				logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			Map map = new HashMap();
			map.put("front_user_id", ((User) users.get(0)).getId());
			List list1 = this.cardUserService.selectCardUserInfo(map);
			if (list1.size() == 0) {
				retjson.put("returnMsg", "暂无数据");
				logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			for (int i = 0; i < list1.size(); i++) {
				String image_one = ((Map) list1.get(i)).get("image_one").toString();
				String image_two = ((Map) list1.get(i)).get("image_two").toString();
				String image_three = ((Map) list1.get(i)).get("image_three").toString();
				((Map) list1.get(i)).put("image_one", Global.getwxPath() + image_one);
				((Map) list1.get(i)).put("image_two", Global.getwxPath() + image_two);
				((Map) list1.get(i)).put("image_three", Global.getwxPath() + image_three);
				if (null != ((Map) list1.get(i)).get("image_four")) {
					String image_four = ((Map) list1.get(i)).get("image_four").toString();
					((Map) list1.get(i)).put("image_four", Global.getwxPath() + image_four);
				}
			}
			JSONArray jsonArray3 = JSONArray.fromObject(list1);
			return jsonArray3.toString();		
	 }
		/**
		 * 自取站点信息查询
		 * @param request
		 * @return
		 * @throws IOException 
		 * @throws ParseException 
		 */
	 public String selectStationInfo(HttpServletRequest request) {		
		 StationInfo stationInfo = new StationInfo();
		List list = this.stationInfoService.selectStationInfoList(stationInfo);
		return com.alibaba.fastjson.JSONObject.toJSONString(list);
		}
	 
		/**
		 * 身份证去重
		 * @param request
		 * @return
		 * @throws IOException 
		 * @throws ParseException 
		 */
	 public String selectIdNum(HttpServletRequest request) {		
		// 查询身份证是否注册
			com.alibaba.fastjson.JSONObject retjson = new com.alibaba.fastjson.JSONObject();
			if((request.getParameter("open_id") == null) || "".equals(request.getParameter("open_id"))){
				retjson.put("returnMsg", "ERROR"); 
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			User use = new User();
			use.setOpenId(request.getParameter("open_id"));
			List users = this.userService.selectUserList(use);
			if (users.size() == 0) {
				retjson.put("returnMsg", "用户不存在！");
				logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			CardUser cardUser = new CardUser();
			cardUser.setIdCardNum(request.getParameter("id_card_num"));
			List list = this.cardUserService.selectCardUserList(cardUser);
			if (list.size() > 0) {
				retjson.put("returnMsg", "身份证已被注册！");
				logger.info("返回的数据为" + com.alibaba.fastjson.JSONObject.toJSONString(retjson));
				return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
			}
			retjson.put("returnMsg", "SUCCESS");
			return com.alibaba.fastjson.JSONObject.toJSONString(retjson);
		}
		
	 
	    @RequestMapping("/sendByKey")
	    @ResponseBody
	    public String sendByKey(HttpServletRequest request, HttpServletResponse response)
	    {
//	    	List<Address> list = addressService.selectAddressList(address);
//	        ExcelUtil<Address> util = new ExcelUtil<Address>(Address.class);
//	        return util.exportExcel(list, "address");
	    	String key=request.getParameter("key");
	    	String command=request.getParameter("command");
	    	String type=request.getParameter("type");
	    	if(key!=null&&!key.equals("")&&command!=null&&!command.equals("")){
	    	   
	    	   return	tcpNettyServerHandlerService.sendCommadByWork(key, command);
	    	}else{
	    		return "please confirm key、command is not null";
	    	}
	    	
	    }
	

}