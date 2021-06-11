package com.whty.model.socket;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.whty.model.domain.User;
import com.whty.model.domain.YfgOrder;
import com.whty.model.service.IUserService;
import com.whty.model.service.IYfgCommandLogService;
import com.whty.model.service.IYfgDeviceService;
import com.whty.model.service.IYfgOrderService;
import com.whty.model.service.IYfgPackageService;
import com.whty.model.service.impl.UserServiceImpl;
import com.whty.model.socket.netty.service.TcpNettyServerHandlerService;
import com.whty.model.websocket.WebSocketServer;
import com.yfg.common.sms.SmsService;
import com.yfg.common.utils.MsgJson;


@Service
public class CloseOrderSerice {
	
	@Autowired
	private IYfgDeviceService yfgDeviceService;
	@Autowired
	private IYfgCommandLogService yfgCommandLogService;
	@Autowired
	private IYfgOrderService yfgOrderService ;
	@Autowired
	private IYfgPackageService yfgPackageService ;
	@Autowired
	private TcpNettyServerHandlerService tcpNettyServerHandlerService;
	@Autowired
	private IUserService userService;
	
	private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private static final Logger logger = LoggerFactory.getLogger(CloseOrderSerice.class);
	
	/*
	 * 扫描订单列表
	 *  关闭 超时订单
	 */
	public void closeRoom() {
		
		/*
		 * 1.获取所有正在使用中的订单  订单状态 3
		 */
	  YfgOrder yfgOrder =  new YfgOrder();
	  yfgOrder.setStatus("3");
	  List<YfgOrder> list = yfgOrderService.selectYfgOrderList(yfgOrder);
	  if(list!=null&&list.size()>0) {
		  for(int i=0;i<list.size();i++) {
			  logger.info("开始定时处理使用中抽烟室，需要关闭的订单");
			  //如果订单多，按照区域类型进行区分，demo阶段，处理所有订单
  			//更新吸烟室状态
			  if(compareTime(list.get(i))) {
				  logger.info("订单状态修改为6，结束订单"+list.get(i).getOrderId());
				  
				  String closeFlag = tcpNettyServerHandlerService.closeRoomByDeviceId(list.get(i).getDeviceId());
				  logger.info("关闭设备返回（00成功）："+closeFlag);
				  
				  yfgOrderService.closeDevice(list.get(i));
				  logger.info("webScoket推送订单结束信息"+list.get(i).getOrderId());
				  SendWebSocket(list.get(i));
			  }
  		
		  }

	  }
	  
	  /*
	   * 短信通知用户 请出吸烟室
	   * 1、查询状态为 6 的订单，其中 openDoorTime 为空的 
	   * 2、遍历订单 当前 时间 大于 结束时间 60s 的 通知用户出门
	   */
	  
//	  YfgOrder yfgOrderLevave =  new YfgOrder();
//	  yfgOrderLevave.setStatus("6");
//	  yfgOrderLevave.setOpenDoorTime(null);
//	  List<YfgOrder> listLevave = yfgOrderService.selectYfgOrderListToLeave(yfgOrderLevave);
//	  if(listLevave!=null&&listLevave.size()>0) {
//		  
//		  for(YfgOrder ord : listLevave) {
//			  if(compareTimeToLeave(ord)) {
//				  //开始发送短信
//				  logger.info("开始发送短信提醒用户出吸烟室");
//				  User user = userService.selectUserById(ord.getUserId());
//				  SmsService.sendMsg(user.getLoginName(), "请您及时离开，超时会导致您进入黑名单再无使用资格!【云飞阁】");
//				  logger.info("发送短信给用户提示离开吸烟室"+user.getLoginName());
//				  
//			  }
//			  
//		  }
//		  
//	  }
		
		
		
	}
	
	/*
	 * 当前时间+N分钟后的时间（N分<1小时）
	 */
	Date getExpectTime(int m) {
		  Calendar nowTime = Calendar.getInstance();
		  nowTime.add(Calendar.MINUTE, m);
		  logger.info("当前时间加上"+m+"分后的时间是："+sdf1.format(nowTime.getTime()));
		  return nowTime.getTime();
	}
	
	public Boolean compareTimeToLeave(YfgOrder yfgOrder) {
		//开始时间 yfgOrder.getStartTime()
		Date currentDate = getExpectTime(-1);
		int b= currentDate.compareTo(yfgOrder.getExpectEndTime());
		if(b>=0) {
			 logger.info("短信提醒用户出吸烟室");
			 logger.info("套餐开始时间:"+yfgOrder.getStartTime()+",套餐预计结束时间："+sdf1.format(yfgOrder.getExpectEndTime()));
			 logger.info("现在短信提醒用户时间"+sdf1.format(new Date()));
			 return true;			
		}else {
			return false;
		}
	    //logger.info("套餐开始时间"+yfgOrder.getStartTime());
		//套餐时间 分  yfgPackageService.selectYfgPackageById(yfgOrder.getPackageId()).getUseTime();
	}
	
	public void SendWebSocket(YfgOrder yfgOrder) {
		MsgJson resjson = new MsgJson();
    	JSONObject jsonObj =new JSONObject();    	
    	    resjson.setCode("0");
			resjson.setData("发送数据至web页面");
			resjson.setData(yfgOrder);        			
			jsonObj = (JSONObject) JSON.toJSON(resjson);  
			logger.info("websocket发送数据"+jsonObj.toString());
			WebSocketServer.sendInfo(jsonObj.toString());
		
	}
	
	public Boolean compareTime(YfgOrder yfgOrder) {
		//开始时间 yfgOrder.getStartTime()
		Date currentDate = new Date();
		int b= currentDate.compareTo(yfgOrder.getExpectEndTime());
		if(b>=0) {
			 logger.info("套餐开始时间:"+yfgOrder.getStartTime()+",套餐预计结束时间："+sdf1.format(yfgOrder.getExpectEndTime()));
			 logger.info("现在结束时间"+sdf1.format(currentDate));
			 return true;			
		}else {
			return false;
		}
	    //logger.info("套餐开始时间"+yfgOrder.getStartTime());
		//套餐时间 分  yfgPackageService.selectYfgPackageById(yfgOrder.getPackageId()).getUseTime();
	}

}
