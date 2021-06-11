package com.whty.model.socket.netty.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yfg.common.utils.MsgJson;
import com.yfg.common.utils.bean.BeanUtils;
import com.whty.model.domain.YfgCommandLog;
import com.whty.model.domain.YfgDevice;
import com.whty.model.domain.YfgOrder;
import com.whty.model.domain.YfgPackage;
import com.whty.model.pojo.TerminalInfo;
import com.whty.model.service.IYfgCommandLogService;
import com.whty.model.service.IYfgDeviceService;
import com.whty.model.service.IYfgOrderService;
import com.whty.model.service.IYfgPackageService;

import com.whty.model.websocket.WebSocketServer;


/**
 * 
 * @author zhangtianlin
 * 
 *         2019年1月10日 下午1:35:16
 * 
 *         NettyServerHandlerService.java
 */
//@Service
@Component("tcpNettyServerHandlerService")
public class TcpNettyServerHandlerService {

	private static final Logger log = LoggerFactory.getLogger(TcpNettyServerHandlerService.class);

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	
	private static Logger logger = LoggerFactory.getLogger(TcpNettyServerHandlerService.class);
	
	@Autowired
	private IYfgDeviceService yfgDeviceService;
	@Autowired
	private IYfgCommandLogService yfgCommandLogService;
	@Autowired
	private IYfgOrderService yfgOrderService ;
	@Autowired
	private IYfgPackageService yfgPackageService ;
	
	@Autowired
	private com.whty.model.socket.netty.handler.TcpNettyServerHandler tcpNettyServerHandler;

	
	private String yfgHeader="FD";
	private String yfgCityCode="0371";
	private String yfgArea = "01";
	private String yfgTail="ED";
	
	private static SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	public Map<String, Object> acceptMessageHandler(String acceptMessage,String channelId) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			if(acceptMessage.startsWith("A")&&acceptMessage.endsWith("ED")) {
				logger.info("报文缺少字符F,头部添加F");
				acceptMessage="F"+acceptMessage;
			}if(acceptMessage.startsWith("E")&&acceptMessage.endsWith("ED")) {
				logger.info("报文缺少字符F,头部添加F");
				acceptMessage="F"+acceptMessage;
			}
			if(acceptMessage.startsWith("FE")&&acceptMessage.endsWith("ED")) {
				String[] s2=acceptMessage.split("FE");
		    	
		    	System.out.println("数组0："+s2[0]);
		        System.out.println("数组1："+"FA"+s2[1]);
		        acceptMessage = "FA"+s2[1];
		         getMaintenanceInfo(acceptMessage,channelId);
		         dataMap.put("code", "99");
				
			}else {
				String[] s2=acceptMessage.split("FA");
		    	
		    	System.out.println("数组0："+s2[0]);
		        System.out.println("数组1："+"FA"+s2[1]);
		        acceptMessage = "FA"+s2[1];
				
				if(acceptMessage.startsWith("FA")&&acceptMessage.endsWith("ED")) {
					TerminalInfo terminalInfo = new TerminalInfo();
					terminalInfo = getTerminalInfo(acceptMessage,channelId);
					saveXTInfo(terminalInfo,acceptMessage);
					dataMap = BeanUtils.bean2map(terminalInfo);
					dataMap.put("code", "00");
					dataMap.put("Msg", "报文正常");
				}else {
					dataMap.put("code", "01");
					logger.info("非法报文："+acceptMessage);
					dataMap.put("Msg", "非法报文");
					
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			logger.info("报文内容："+acceptMessage);
			logger.info("解析报文异常", e);
			dataMap.put("code", "01");
			dataMap.put("Msg", "解析报文异常");
			
		}
		return dataMap;	
			
		
	}
	/*
	 * 新开接口 统计区域设备数量、查询某一设备状态、关闭设备、解锁设备、批量查询设备运行状态
	 */
	public void getMaintenanceInfo(String message,String channelId) {
		
		//FE037101440000ED
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		logger.info("Maintenance info start");
		logger.info("城市编码："+message.substring(2, 6));
		logger.info("区域编码："+message.substring(6, 8));
		logger.info("指令类型："+message.substring(8, 10));
		String citiCode=message.substring(2, 6);
		String areaCode=message.substring(6, 8);
		String commandType=message.substring(8, 10);
		if(commandType!=null&&!commandType.equals("")) {
			if(commandType.equals("44")) {
				logger.info("查询区域设备数量");
				dataMap=maintenance44(citiCode,areaCode);
				dataMap.put("code", "02");
			}if(commandType.equals("43")) {
				logger.info("查询设备运行状态");
				String deviceId=message.substring(10, 14);
				dataMap=maintenance43(citiCode,areaCode,deviceId);
				dataMap.put("code", "02");
			}if(commandType.equals("42")) {
				logger.info("关闭运行的设备");
				String deviceId=message.substring(10, 14);
				dataMap=maintenance42(citiCode,areaCode,deviceId);
				dataMap.put("code", "02");
			}if(commandType.equals("41")) {
				logger.info("开锁运行的设备");
				String deviceId=message.substring(10, 14);
				dataMap=maintenance41(citiCode,areaCode,deviceId);
				dataMap.put("code", "02");
			}if(commandType.equals("40")) {
				logger.info("批量查询设备运行状态");
				dataMap=maintenance40(citiCode,areaCode,channelId);
				dataMap.put("code", "99");
			}
			
			if(dataMap.get("code").equals("02")) {
				try {
					if(!dataMap.get("maintenanceStr").equals("")) {
						tcpNettyServerHandler.channelSend(channelId, dataMap.get("maintenanceStr").toString());
					}else {
						logger.info("maintenance维修请求报文错误");
					}
				
				}catch(Exception e) {
					logger.info("返给手机端维护信息异常",e);
				}
				
				
			}
			
		}else {
			logger.info("指令类型错误");
		}
		
	
		
	}
	
	/*
	 * 44
	 * 查询区域设备数量
	 */
	public Map<String, Object> maintenance44(String cityCode,String areaCode){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String maintenanceStr = "";
		Date datetemp = getExpectTime(-20);
		YfgDevice yfgDevice = new YfgDevice();
		yfgDevice.setCityCode(cityCode);
		yfgDevice.setUpdateDate(datetemp);
		if(areaCode!=null&&!areaCode.equals("")&&!areaCode.equals("00")) {
			yfgDevice.setArea(areaCode);	
			
			List<YfgDevice> list = yfgDeviceService.selectYfgDeviceList(yfgDevice);
			if(list!=null&&list.size()>0) {
				
					maintenanceStr = "FB"+cityCode+areaCode+formatNumToStr4(list.size())+"44"+"000000000000"+"ED";
			}else {
				maintenanceStr = "FB"+cityCode+areaCode+formatNumToStr4(0)+"44"+"000000000000"+"ED";
			}
		}else {
			
			String[] devArray = yfgDeviceService.selectNumByCityCode(yfgDevice);
			if(devArray!=null&&devArray.length>0) {
				maintenanceStr = "FB"+cityCode+formatNumToStr2(devArray.length)+"0000"+"44"+"000000000000"+"ED";	
			}else {
				maintenanceStr = "FB"+cityCode+formatNumToStr2(0)+"0000"+"44"+"000000000000"+"ED";	
			}
			
		}
	
		dataMap.put("maintenanceStr", maintenanceStr);
	
		return dataMap;
		
	}
	/*
	 * 43
	 * 查询设备运行状态
	 * 
	 */
	public Map<String, Object> maintenance43(String cityCode,String areaCode,String deviceId){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		//发生异常返回
		String maintenanceStr = "FB"+cityCode+areaCode+deviceId+"43"+"00"+"00"+
				"00"+"00"+"00"+"00"+"ED";
		String commandStr= sendCommad(deviceId, "43");
		String resultFlag= sendCommadByWork(deviceId, commandStr);
		if(resultFlag!=null&&resultFlag.equals("00")) {
			logger.info(deviceId+"该设备可用");
			try {
				Thread.sleep(5*1000);
				YfgDevice yfgDevice = new YfgDevice();
				yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
				if(yfgDevice!=null) {
//					dataMap.put("roomStatus", yfgDevice.getRoomStatus());
//					dataMap.put("roomTemperature",yfgDevice.getRoomTemperature());
//					dataMap.put("roomMoisture",yfgDevice.getRoomMoisture());
//					dataMap.put("deviceStatus",yfgDevice.getDeviceStatus());
//					dataMap.put("usbStatus",yfgDevice.getUsbStatus());
				    maintenanceStr = "FB"+cityCode+areaCode+deviceId+"43"+yfgDevice.getRoomStatus()+yfgDevice.getRoomTemperature()+
							yfgDevice.getRoomMoisture()+yfgDevice.getDeviceStatus()+yfgDevice.getUsbStatus()+"00"+"ED";
					
					
				}else {
					maintenanceStr="";
				}
			}catch(Exception e) {
				logger.info("maintenance43 查询设备异常",e);
			}
			
		}else {
			logger.info(deviceId+"该设备网络不通");
		}
		
		dataMap.put("maintenanceStr", maintenanceStr);
		return dataMap;
		
	}
	/*
	 * 42
	 * 关闭运行的设备
	 */
	public Map<String, Object> maintenance42(String cityCode,String areaCode,String deviceId){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String maintenanceStr = "FB"+cityCode+areaCode+deviceId+"42"+"GM"+"00"+
				"00"+"00"+"00"+"00"+"ED";
		YfgDevice yfgDevice = new YfgDevice();
		yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
		if(yfgDevice==null) {
	        logger.info("平台无此设备编号"+deviceId);			
			dataMap.put("maintenanceStr", "");
			return dataMap;
		}
		String closeFlag = closeRoomByDeviceId(deviceId);
	    logger.info("关闭设备返回（00成功）："+closeFlag);
	    if(closeFlag!=null&&closeFlag.equals("00")) {
	    	//开锁成功
			try {
				Thread.sleep(5*1000);
			}catch(Exception e) {
				logger.info("开锁成功后异常",e);
			}
			YfgDevice yfgDeviceTemp = new YfgDevice();
			yfgDeviceTemp = yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
	    	logger.info("关闭设备编号 ："+deviceId+"成功");
	    	maintenanceStr="FB"+cityCode+areaCode+deviceId+"42"+yfgDeviceTemp.getRoomStatus()+yfgDeviceTemp.getRoomTemperature()+
	    			yfgDeviceTemp.getRoomMoisture()+yfgDeviceTemp.getDeviceStatus()+yfgDeviceTemp.getUsbStatus()+"00"+"ED";
	    }else {
	    	logger.info("关闭设备编号 ："+deviceId+"失败");
	    	maintenanceStr="FB"+cityCode+areaCode+deviceId+"42"+yfgDevice.getRoomStatus()+yfgDevice.getRoomTemperature()+
					yfgDevice.getRoomMoisture()+yfgDevice.getDeviceStatus()+yfgDevice.getUsbStatus()+"01"+"ED";
	    }
	    dataMap.put("maintenanceStr", maintenanceStr);
		return dataMap;
		
	}
	/*
	 * 41
	 * 开锁运行的设备
	 */
	public Map<String, Object> maintenance41(String cityCode,String areaCode,String deviceId){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String maintenanceStr = "FB"+cityCode+areaCode+deviceId+"41"+"GM"+"00"+
				"00"+"00"+"00"+"00"+"ED";
		//设备打开指令
		String comd= sendCommad(deviceId,"41");
		YfgDevice yfgDevice1 = new YfgDevice();
		yfgDevice1 = yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
		if(yfgDevice1==null) {
		
			logger.info("平台无此设备编号"+deviceId);			
			dataMap.put("maintenanceStr", "");
			return dataMap;
		}
		
		String sendFlag="";
		try {
			sendFlag = tcpNettyServerHandler.channelSend(yfgDevice1, comd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dataMap.put("maintenanceStr", maintenanceStr);
			return dataMap;
		}
		//
		if(sendFlag.equals("00")) {
			//开锁成功
			try {
				Thread.sleep(5*1000);
			}catch(Exception e) {
				logger.info("开锁成功后异常",e);
			}
			YfgDevice yfgDevice = new YfgDevice();
			yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
			 maintenanceStr = "FB"+cityCode+areaCode+deviceId+"41"+yfgDevice.getRoomStatus()+yfgDevice.getRoomTemperature()+
					 yfgDevice.getRoomMoisture()+yfgDevice.getDeviceStatus()+yfgDevice.getUsbStatus()+"00"+"ED";
		}else {
			
			 maintenanceStr = "FB"+cityCode+areaCode+deviceId+"41"+yfgDevice1.getRoomStatus()+yfgDevice1.getRoomTemperature()+
					 yfgDevice1.getRoomMoisture()+yfgDevice1.getDeviceStatus()+yfgDevice1.getUsbStatus()+"01"+"ED";
		}
		dataMap.put("maintenanceStr", maintenanceStr);
		return dataMap;
		
	}
	/*
	 * 40
	 * 批量查询设备运行状态
	 */
	public Map<String, Object> maintenance40(String cityCode,String areaCode,String channelId){
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		String maintenanceStr = "FB"+cityCode+areaCode+"0000"+"40"+"000000000000"+"ED";
		
		Date datetemp = getExpectTime(-20);
		YfgDevice yfgDevice = new YfgDevice();
		yfgDevice.setCityCode(cityCode);
		if(areaCode!=null&&!areaCode.equals("")) {
			yfgDevice.setArea(areaCode);	
		}
		
		yfgDevice.setUpdateDate(datetemp);
		List<YfgDevice> list = yfgDeviceService.selectYfgDeviceList(yfgDevice);
		if(list!=null&&list.size()>0) {
			for(YfgDevice yfgDeviceTemp:list) {
				try {
					maintenanceStr = "FB"+cityCode+areaCode+yfgDeviceTemp.getDeviceId()+"40"+yfgDeviceTemp.getRoomStatus()+yfgDeviceTemp.getRoomTemperature()+
							yfgDeviceTemp.getRoomMoisture()+yfgDeviceTemp.getDeviceStatus()+yfgDeviceTemp.getUsbStatus()+"00"+"ED";
				
					tcpNettyServerHandler.channelSend(channelId, maintenanceStr);
				   Thread.sleep(1*1000);
				}catch(Exception e) {
					logger.info("批量查询设备信息异常",e);
				}
			}
			
			
		}
		dataMap.put("code", "99");  //已经批量返给信息了，无需再发送其他信息
		return dataMap;
		
	}
	/*
	 * 转化为4位字符
	 */
	String formatNumToStr4(int m) {
		
		return String.format("%04d", m);
		 
	}
	/*
	 * 转化为2位字符
	 */
   String formatNumToStr2(int m) {
		
		return String.format("%02d", m);
	}
	/*
	 * 将字符串拆分获取设备信息
	 */
	public TerminalInfo getTerminalInfo(String message,String channelId) {
		TerminalInfo terminalInfo = new TerminalInfo();
//		int mesLenth=message.length();
//		logger.info("报文长度："+mesLenth);
		logger.info("城市编码："+message.substring(2, 6));
		logger.info("区域编码："+message.substring(6, 8));
		logger.info("终端编码："+message.substring(8, 12));
		logger.info("指令类型："+message.substring(12, 14));
		logger.info("房间状态："+message.substring(14, 16));
		logger.info("房间温度："+message.substring(16, 18));
		logger.info("湿       度："+message.substring(18, 20));
		logger.info("设备状态："+message.substring(20, 22));
		logger.info("USB 状态："+message.substring(22, 24));
		logger.info("开门时间："+message.substring(24, 26));

		String commType= message.substring(12, 14);
		if(commType.equals("44")) {
			logger.info("设备编码指令");
		}if(commType.equals("43")) {
			logger.info("设备查询指令");
		}if(commType.equals("42")) {
			logger.info("设备上锁指令");
		}if(commType.equals("41")) {
			logger.info("设备开锁指令");
		}
	
		terminalInfo.setChannelId(channelId);
		terminalInfo.setCityCode(message.substring(2, 6));
		terminalInfo.setArea(message.substring(6, 8));
		terminalInfo.setTerminalId(message.substring(8, 12));
		terminalInfo.setCommStr(message.substring(12, 14));
		terminalInfo.setRoomStatus(message.substring(14, 16));
		terminalInfo.setRoomTemperature(message.substring(16, 18));
		terminalInfo.setRoomMoisture(message.substring(18, 20));
		terminalInfo.setDeviceStatus(message.substring(20, 22));
		terminalInfo.setUsbStatus(message.substring(22, 24));
		terminalInfo.setOpenTime(message.substring(24, 26));
		
		return terminalInfo;
		
	}
	
	/*
	 * 发送信息解析
	 * String recCommand=yfgHeader+yfgCityCode+yfgArea+commandType+deviceId+yfgTail;
	 */
	
	public TerminalInfo getSendTerminalInfo(String message,String channelId) {
		//String recCommand=yfgHeader+yfgCityCode+yfgArea+commandType+deviceId+yfgTail;
		
		TerminalInfo terminalInfo = new TerminalInfo();
//		int mesLenth=message.length();
//		logger.info("报文长度："+mesLenth);
		logger.info("城市编码："+message.substring(2, 6));
		logger.info("区域编码："+message.substring(6, 8));
		logger.info("指令类型："+message.substring(8, 10));
		logger.info("终端编码："+message.substring(10, 14));

		String commType= message.substring(8, 10);
		if(commType.equals("44")) {
			logger.info("设备编码指令");
		}if(commType.equals("43")) {
			logger.info("设备查询指令");
		}if(commType.equals("42")) {
			logger.info("设备上锁指令");
		}if(commType.equals("41")) {
			logger.info("设备开锁指令");
		}
	
		terminalInfo.setChannelId(channelId);
		terminalInfo.setCityCode(message.substring(2, 6));
		terminalInfo.setArea(message.substring(6, 8));
		terminalInfo.setTerminalId(message.substring(10, 14));
		terminalInfo.setCommStr(message.substring(8, 10));

		return terminalInfo;
		
	}
	
	
	
	/*
	 * 保存心跳信息
	 */
	
	@Transactional
	public void saveXTInfo(TerminalInfo terminalInfo,String acceptMessage) {
		
		YfgDevice yfgDevice = new YfgDevice();
		yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(terminalInfo.getTerminalId());
		if(yfgDevice!=null) {
			yfgDevice.setDeviceStatus(terminalInfo.getDeviceStatus());
			if(yfgDevice.getCityCode()!=null&&!yfgDevice.getCityCode().equals("")) {
				yfgDevice.setCityCode(terminalInfo.getCityCode());
			}if(yfgDevice.getArea()!=null&&!yfgDevice.getArea().equals("")) {
				yfgDevice.setArea(terminalInfo.getArea());
			}
			yfgDevice.setRoomMoisture(terminalInfo.getRoomMoisture());
			yfgDevice.setRoomStatus(terminalInfo.getRoomStatus());
			yfgDevice.setRoomTemperature(terminalInfo.getRoomTemperature());
			yfgDevice.setUsbStatus(terminalInfo.getUsbStatus());
			yfgDevice.setChannelId(terminalInfo.getChannelId());
			if(terminalInfo.getCommStr().equals("JS")) {
				yfgDevice.setOpeningTime(terminalInfo.getOpenTime());
			}
			yfgDevice.setUpdateDate(new Date());
			/*
			 * 开门、关门设置其 ,订单结束时，自动清空开关门、计时时间
			 */
			if(terminalInfo.getCommStr().equals("SD")&&terminalInfo.getRoomStatus().equals("KM")) {
				//手动 开门
				yfgDevice.setOpenDoorTime(new Date());
				//如果该设备存在 订单没有 真正结束 ，需要将订单 开门时间记录，然后将设备置为可以使用状态
//				if(yfgDevice.getOrderId()!=null) {
//					YfgOrder yfgOrder = yfgOrderService.selectYfgOrderById(yfgDevice.getOrderId());
//					if(yfgOrder!=null&&yfgOrder.getOpenDoorTime()==null) {
//						if(compareTime(yfgOrder)) {
//							//超过套餐时间开门才算正常的状态
//							logger.info("订单真正结束处理"+yfgOrder.getOrderId());
//							yfgOrder.setOpenDoorTime(new Date());
//							yfgOrderService.updateYfgOrder(yfgOrder);
//							if(yfgDevice.getStatus()!=null&&yfgDevice.getStatus().equals("2")) {
//								yfgDevice.setStatus("0");
//								logger.info("更新设备状态为0"+yfgOrder.getOrderId()+" 设备编码:"+yfgDevice.getDeviceId());
//								yfgDeviceService.updateYfgDevice(yfgDevice);
//							}
//						}
//
//					}
//				}
				
				
			}if(terminalInfo.getCommStr().equals("SD")&&terminalInfo.getRoomStatus().equals("GM")) {
				yfgDevice.setCloseDoorTime(new Date());
			}
			
			
			yfgDeviceService.updateYfgDevice(yfgDevice);
		}else {
			logger.info("后台没有配置对应的终端设备，请配置，终端id为："+terminalInfo.getTerminalId());
		}
		YfgCommandLog yfgCommandLog = new YfgCommandLog();
		yfgCommandLog.setCommandStr(acceptMessage);
		yfgCommandLog.setCommandType(terminalInfo.getCommStr());
        yfgCommandLog.setDeviceId(terminalInfo.getTerminalId());
        yfgCommandLog.setCreateTime(new Date());
        yfgCommandLog.setSendOrRes("2");
       if(terminalInfo.getCommStr().equals("XT")) {
    	   yfgCommandLog.setCommandContent("心跳报文返回");
       }if(terminalInfo.getCommStr().equals("JS")) {
    	   yfgCommandLog.setCommandContent("计时报文返回");
       }if(terminalInfo.getCommStr().equals("SD")) {
    	   yfgCommandLog.setCommandContent("手动开关门返回");
       }if(terminalInfo.getCommStr().equals("43")) {
    	   yfgCommandLog.setCommandContent("设备运行状态查询返回");
       }if(terminalInfo.getCommStr().equals("44")) {
    	   yfgCommandLog.setCommandContent("设备编码调整返回");
       }if(terminalInfo.getCommStr().equals("41")) {
    	   yfgCommandLog.setCommandContent("设备开锁返回");
       }if(terminalInfo.getCommStr().equals("42")) {
    	   yfgCommandLog.setCommandContent("设备上锁返回");
       }
       yfgCommandLog.setCityCode(terminalInfo.getCityCode());
       yfgCommandLog.setArea(terminalInfo.getArea());
       yfgCommandLog.setDeviceStatus(terminalInfo.getDeviceStatus());
       yfgCommandLog.setRoomTemperature(terminalInfo.getRoomTemperature());
       yfgCommandLog.setRoomStatus(terminalInfo.getRoomStatus());
       yfgCommandLog.setRoomMoisture(terminalInfo.getRoomMoisture());
       yfgCommandLog.setUsbStatus(terminalInfo.getUsbStatus());
       if(terminalInfo.getCommStr().equals("JS")) {
       yfgCommandLog.setOpenTime(terminalInfo.getOpenTime());
       }
       yfgCommandLog.setChannelId(terminalInfo.getChannelId());
       yfgCommandLogService.insertYfgCommandLog(yfgCommandLog);
	}
	
	
	/*
	 * 设备功能指令函数
	 * 44 设备编码
	 * 43 设备查询
	 * 42 设备上锁
	 * 41 设备开锁
	 */
	public String sendCommad(String deviceId,String commandType) {
		
		YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
		logger.info("执行方式是:"+commandType+" 设备:"+yfgDevice.getDeviceId());
		String recCommand=yfgHeader+yfgDevice.getCityCode()+yfgDevice.getArea()+commandType+yfgDevice.getDeviceId()+yfgTail;
		return recCommand;
		
	}
	
	public String closeRoomByDeviceId(String deviceId) {
		String sendFlag = "";
		String commandStr=sendCommad(deviceId,"42");
		YfgDevice yfgDevice =yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
		logger.info("***************************************************");
		logger.info(deviceId+"设备关闭，关闭指令："+commandStr);
		logger.info("***************************************************");
		try {
			sendFlag = tcpNettyServerHandler.channelSend(yfgDevice, commandStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return sendFlag;
	}
	
    public String sendCommadByWork(String deviceId,String comd) {
		
	
    	String sendFlag = "";
		YfgDevice yfgDevice =yfgDeviceService.selectYfgDeviceByDeviceId(deviceId);
		
		try {
			 sendFlag = tcpNettyServerHandler.channelSend(yfgDevice, comd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("发送指令返回："+sendFlag);
		return sendFlag;
		
	}
	
	/*
	 * 超时 10分钟 关闭终端
	 */
	public void getCloseChannelId(String channelId) {
		
		YfgDevice yfgDevice = new YfgDevice();
		yfgDevice.setChannelId(channelId);
		
		List<YfgDevice>  list = yfgDeviceService.selectYfgDeviceList(yfgDevice);
		if(list!=null&&list.size()>0) {
			logger.info("channelId获取的终端数量是："+list.size());
			logger.info("关闭终端设备id为："+list.get(0).getDeviceId());
			yfgDevice= list.get(0);
			yfgDevice.setDeviceException("终端超时");
			yfgDevice.setUpdateDate(new Date());
			yfgDeviceService.updateYfgDevice(yfgDevice);
		}
	}
	
	/*
	 * channelInactive 数据日志打印
	 */
	public void getchannelInactive(String channelId) {
		YfgDevice yfgDevice = new YfgDevice();
		yfgDevice.setChannelId(channelId);
		
		List<YfgDevice>  list = yfgDeviceService.selectYfgDeviceList(yfgDevice);
		if(list!=null&&list.size()>0) {
			logger.info("channelId获取的终端数量是："+list.size());
			logger.info("channelInactive终端设备id为："+list.get(0).getDeviceId());
			yfgDevice= list.get(0);
			yfgDevice.setDeviceException("channelInactive");
			yfgDevice.setUpdateDate(new Date());
			yfgDeviceService.updateYfgDevice(yfgDevice);
		}
		
	}
	
	/*
	 * 记录发送给终端的信息
	 */
	public void  recordSendInfo(YfgDevice yfgDevice,String SendMessage,String sendFlag) {
		
		TerminalInfo terminalInfo = getSendTerminalInfo(SendMessage,yfgDevice.getChannelId());
			YfgCommandLog yfgCommandLog = new YfgCommandLog();
			yfgCommandLog.setCommandStr(SendMessage);
			yfgCommandLog.setCommandType(terminalInfo.getCommStr());
	        yfgCommandLog.setDeviceId(terminalInfo.getTerminalId());
	        yfgCommandLog.setCreateTime(new Date());
	        yfgCommandLog.setSendOrRes("1");
	        yfgCommandLog.setSendFlag(sendFlag);
	       if(terminalInfo.getCommStr().equals("XT")) {
	    	   yfgCommandLog.setCommandContent("心跳报文发送");
	       }if(terminalInfo.getCommStr().equals("JS")) {
	    	   yfgCommandLog.setCommandContent("计时报文发送");
	       }if(terminalInfo.getCommStr().equals("SD")) {
	    	   yfgCommandLog.setCommandContent("手动开关门发送");
	       }if(terminalInfo.getCommStr().equals("43")) {
	    	   yfgCommandLog.setCommandContent("设备运行状态查询发送");
	       }if(terminalInfo.getCommStr().equals("44")) {
	    	   yfgCommandLog.setCommandContent("设备编码调整发送");
	       }if(terminalInfo.getCommStr().equals("41")) {
	    	   yfgCommandLog.setCommandContent("设备开锁发送");
	       }if(terminalInfo.getCommStr().equals("42")) {
	    	   yfgCommandLog.setCommandContent("设备上锁发送");
	       }
	       if(terminalInfo.getCommStr().equals("61")) {
	    	   yfgCommandLog.setCommandContent("6分套餐");
	       }if(terminalInfo.getCommStr().equals("62")) {
	    	   yfgCommandLog.setCommandContent("12分套餐");
	       }if(terminalInfo.getCommStr().equals("63")) {
	    	   yfgCommandLog.setCommandContent("18分套餐");
	       }if(terminalInfo.getCommStr().equals("64")) {
	    	   yfgCommandLog.setCommandContent("60分套餐");
	       }
	       yfgCommandLog.setCityCode(terminalInfo.getCityCode());
	       yfgCommandLog.setArea(terminalInfo.getArea());
	       yfgCommandLog.setChannelId(terminalInfo.getChannelId());
	       yfgCommandLogService.insertYfgCommandLog(yfgCommandLog);

	}
	
	/*
	 * 订单支付成功，打开抽烟室
	 */
	
	@Transactional
	public String openRoom(YfgOrder order) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String comd= sendCommad(order.getDeviceId(),"41");
		String sendFlag="";
		logger.info("打开设备发送指令："+comd);
		YfgDevice  yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(order.getDeviceId());
		try {
			sendFlag = tcpNettyServerHandler.channelSend(yfgDevice, comd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//更新订单信息
		if(sendFlag.equals("00")) {
			logger.info("微信支付成功打开抽烟室");
			
			try {
				Thread.sleep(2*1000);
				sendTaoCanTime(order);
			}catch(Exception e) {
				e.printStackTrace();
			}
			yfgDevice.setStatus("1"); //使用中
			yfgDevice.setOrderId(order.getId());
			yfgDevice.setOpenLockTime(new Date());
			yfgDeviceService.updateYfgDevice(yfgDevice);
			
			order.setStatus("3");
			order.setUpdateTime(new Date());			
			order.setStartTime(new Date());        	
        	YfgPackage yfgPackage =yfgPackageService.selectYfgPackageById(order.getPackageId());
        	if(yfgPackage!=null) {
        		order.setExpectEndTime(getExpectTime(yfgPackage.getUseTime()));	
        	}
			
			yfgOrderService.updateYfgOrder(order);
			//记录 发送给终端信息
//			recordSendInfo(yfgDevice,comd);	
			logger.info("用户支付成功websocket发送信息");
		    SendWebSocket(order);
		}else {
			logger.info("发送打开终端命令失败");
		}
//		//开启一个线程执行发送 套餐时间的指令 给终端 
//		logger.info("套餐新线程开始"+sdf.format(new Date()));
//		ThreadTaoCanTime th = new ThreadTaoCanTime();
//		th.setOrder(order);
//		Thread thread = new Thread(th);
//		thread.start();		
		
		return sendFlag;
		
	}
	
	
	/*
	 * 发送  套餐时间的指令 给终端  
	 * 1、获取指令
	 * 2、发送指令
	 * 3、记录成功、失败
	 */
	public void sendTaoCanTime(YfgOrder order) {
		/*
		 * commandType 6   61
		 * commandType 12  62
		 * commandType 18  63
		 * commandType 60  64
		 */
		String sendFlag = "";
		String commandType = "";
		try {
			logger.info("进入发送套餐方法001");
		
			
		YfgPackage yfgPackage = yfgPackageService.selectYfgPackageById(order.getPackageId());
		if(yfgPackage!=null&&yfgPackage.getUseTime()!=null) {
			if(yfgPackage.getUseTime()==6) {
				commandType = "61";
			}if(yfgPackage.getUseTime()==12) {
				commandType = "62";
			}if(yfgPackage.getUseTime()==18) {
				commandType = "63";
			}if(yfgPackage.getUseTime()==60) {
				commandType = "64";
			}
			
		}
		String comd= sendCommad(order.getDeviceId(),commandType);
		logger.info("套餐新线程执行设备发送指令："+comd);
		YfgDevice  yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(order.getDeviceId());
		
			sendFlag = tcpNettyServerHandler.channelSend(yfgDevice, comd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.info("套餐新线程发送指令结果是"+sendFlag);
		
	}
	
	
	/*
	 * 当前时间+N分钟后的时间（N分<1小时）
	 */
	Date getExpectTime(int m) {
		  Calendar nowTime = Calendar.getInstance();
		  nowTime.add(Calendar.MINUTE, m);
		  logger.info("当前时间加上"+m+"分后的时间是："+sdf.format(nowTime.getTime()));
		  return nowTime.getTime();
	}

	
	
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
			  if(compareTime(yfgOrder)) {
				  logger.info("订单状态修改为6，结束订单"+yfgOrder.getOrderId());
				  yfgOrderService.closeDevice(yfgOrder);
				  logger.info("webScoket推送订单结束信息"+yfgOrder.getOrderId());
				  SendWebSocket(yfgOrder);
			  }
  		
		  }

	  }
	  
		
		
		
	}
	
	public void SendWebSocket(YfgOrder yfgOrder) {
		MsgJson resjson = new MsgJson();
    	JSONObject jsonObj =new JSONObject();    	
    	    resjson.setCode("0");
			resjson.setData("发送数据至web页面");
			resjson.setData(yfgOrder);        			
			jsonObj = (JSONObject) JSON.toJSON(resjson);  
			logger.info("******************************websocket推送数据*******************");
			logger.info(jsonObj.toString());
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
	
	
//	@Test
//	public void test() {
//		TerminalInfo terminalInfo = new TerminalInfo();
//		terminalInfo = getTerminalInfo("FA037101000141GM3031YX0000ED","dsad144");
//		
//	}
	

//	@Autowired
//	private SpcPositionInfoServiceImpl positionInfoServiceImpl;

//	@Autowired
//	private SpcCardInfoServiceImpl cardInfoServiceImpl;

//	public HashMap<String, Object> acceptMessageHandler(String acceptMessage) {
//
//		HashMap<String, Object> dataMap = new HashMap<String, Object>();
//		try {
//			// 该协议中所有数据都按照[厂商*设备 ID*内容长度*内容]格式,其中厂商标识固定为两个字节,内容]
//
//			String[] splitMessage = acceptMessage.split(StringUtils.escapeExprSpecialWord("*"));
////	        String channelKey = ctx.channel().remoteAddress().toString();
////	        if(splitMessage.length != 4){ //不是接入厂商数据规格
////	        	ctx.channel().close();
////	        	log.info("channelKey:" + channelKey + ",close this client...");
////	        	return;
////	        }
//			String merchantId = splitMessage[0]; // 厂商
//			String terminalsId = splitMessage[1]; // 设备 ID
//			String msgLen = splitMessage[2]; // 内容长度固定为四个字节的 16进制码
//			String data = splitMessage[3]; // 内容
//
//			String[] splitData = data.split(StringUtils.escapeExprSpecialWord(","));
//
//			// 定位卡更新最后通讯时间
//			SpcCardInfo cardInfo = new SpcCardInfo();
//			cardInfo.setImei(terminalsId);
//			List<SpcCardInfo> listCardInfo = cardInfoServiceImpl.selectSpcCardInfoList(cardInfo);
//
//			if (listCardInfo.size() == 0) {
//				SpcCardInfo insertCardInfo = new SpcCardInfo();
//				insertCardInfo.setImei(terminalsId);
//				insertCardInfo.setLastConnTime(new Date());
//				cardInfoServiceImpl.insertSpcCardInfo(insertCardInfo);
//			} else {
//				SpcCardInfo updateCardInfo = listCardInfo.get(0);
//				updateCardInfo.setLastConnTime(new Date());
//				cardInfoServiceImpl.updateSpcCardInfo(updateCardInfo);
//			}
//
//			String commandId = splitData[0];
//			if (("UD").equals(commandId)) { // 位置数据上报
//				log.info("位置数据上报更新，设备号为：" + terminalsId);
//				SpcPositionInfo insertPositionInfo = new SpcPositionInfo();
//				insertPositionInfo.setImei(terminalsId);
//
//				String uploadTimeStr = "20" + splitData[1].substring(4, 6) + splitData[1].substring(2, 4)
//						+ splitData[1].substring(0, 2) + splitData[2];
//				Date uploadTime = sdf.parse(uploadTimeStr);
//				insertPositionInfo.setUploadTime(uploadTime); // 上送时间
//				if ("A".equals(splitData[3])) { // GPS
//					insertPositionInfo.setLocationType("1");
//				} else {
//
//				}
//				insertPositionInfo.setLatitude(splitData[4]); // 纬度
//				insertPositionInfo.setLatitudeType(splitData[5]); // 纬度表示
//				insertPositionInfo.setLongitude(splitData[6]); // 经度
//				insertPositionInfo.setLongitudeType(splitData[7]); // 经度表示
//				insertPositionInfo.setSpeed(splitData[8]); // 速度
//				insertPositionInfo.setDirection(splitData[9]); // 方向
//				insertPositionInfo.setAltitude(splitData[10]); // 海拔
//				insertPositionInfo.setSatelliteNum(Integer.parseInt(splitData[11])); // 卫星个数
//				insertPositionInfo.setGsmLevel(Integer.parseInt(splitData[12])); // 信号强度
//				insertPositionInfo.setElectricity(Integer.parseInt(splitData[13])); // 电量
//				insertPositionInfo.setDeviceStatus(splitData[16]); // 终端状态
//				// 14*步数,15*翻转次数,17*基站个数,18-41*基站信息,42*WIFI个数,43*定位精度单位为米
//				positionInfoServiceImpl.insertSpcPositionInfo(insertPositionInfo);
//
//				// 定位数据到数据库
//				SpcCardInfo updateCardInfo = new SpcCardInfo();
//				updateCardInfo.setLatitude(splitData[4]);
//				updateCardInfo.setLongitude(splitData[6]);
//				updateCardInfo.setLastPositionTime(new Date());
//				updateCardInfo.setSpeed(splitData[8]);
//				updateCardInfo.setPowerNum(splitData[13]);
//				cardInfoServiceImpl.updateSpcCardInfo(updateCardInfo);
//
//			} else if (("UD2").equals(commandId)) { // 盲点补传数据
//				log.info("盲点补传数据更新，设备号为：" + terminalsId);
//				SpcPositionInfo insertPositionInfo2 = new SpcPositionInfo();
//				insertPositionInfo2.setImei(terminalsId);
//
//				String upDateTime = "20" + splitData[1].substring(4, 6) + splitData[1].substring(2, 4)
//						+ splitData[1].substring(0, 2) + splitData[2];
//				insertPositionInfo2.setUpdateTime(sdf.parse(upDateTime)); // 上送时间
//				if ("A".equals(splitData[3])) { // GPS
//					insertPositionInfo2.setLocationType("1");
//				} else {
//
//				}
//				insertPositionInfo2.setLatitude(splitData[4]); // 纬度
//				insertPositionInfo2.setLatitudeType(splitData[5]); // 纬度表示
//				insertPositionInfo2.setLongitude(splitData[6]); // 经度
//				insertPositionInfo2.setLongitudeType(splitData[7]); // 经度表示
//				insertPositionInfo2.setSpeed(splitData[8]); // 速度
//				insertPositionInfo2.setDirection(splitData[9]); // 方向
//				insertPositionInfo2.setAltitude(splitData[10]); // 海拔
//				insertPositionInfo2.setSatelliteNum(Integer.parseInt(splitData[11])); // 卫星个数
//				insertPositionInfo2.setGsmLevel(Integer.parseInt(splitData[12])); // 信号强度
//				insertPositionInfo2.setElectricity(Integer.parseInt(splitData[13])); // 电量
//				insertPositionInfo2.setDeviceStatus(splitData[16]); // 终端状态
//				// 14*步数,15*翻转次数,17*基站个数,18-41*基站信息,42*WIFI个数,43*定位精度单位为米
//				positionInfoServiceImpl.insertSpcPositionInfo(insertPositionInfo2);
//
//				// 定位数据到数据库
//				SpcCardInfo updateCardInfo2 = new SpcCardInfo();
//				updateCardInfo2.setLatitude(splitData[4]);
//				updateCardInfo2.setLongitude(splitData[6]);
//				updateCardInfo2.setLastPositionTime(new Date());
//				updateCardInfo2.setSpeed(splitData[8]);
//				updateCardInfo2.setPowerNum(splitData[13]);
//				cardInfoServiceImpl.updateSpcCardInfo(updateCardInfo2);
//
//			} else {
//				dataMap.put("merchantId", merchantId);
//				dataMap.put("terminalsId", terminalsId);
//				dataMap.put("msgLen", msgLen);
//				dataMap.put("splitData", splitData);
//			}
//
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}

//		return dataMap;

//	}

	/***
	 * 终端接收平台指令返回的响应
	 * 
	 * @param merchantId
	 * @param terminalsId
	 * @param msgLen
	 * @param splitData
	 * @return
	 */
	public String receiveMessageHandler(String merchantId, String terminalsId, String[] splitData) {

		String returnMessage = "";
		try {
			String commandId = splitData[0];

			if (("UPLOAD").equals(commandId)) { // 数据上传间隔设置
				returnMessage = "UPLOAD";

			} else if (("CENTER").equals(commandId)) { // 中心号码设置
				returnMessage = "CENTER";

			} else if (("CALL").equals(commandId)) { // 拨打电话
				returnMessage = "CALL";

			} else if (("SOS1").equals(commandId)) { // SOS号码设置
				returnMessage = "SOS1";

			} else if (("SOS2").equals(commandId)) { // SOS号码设置
				returnMessage = "SOS2";

			} else if (("SOS3").equals(commandId)) { // SOS号码设置
				returnMessage = "SOS3";

			} else if (("SOS").equals(commandId)) { // SOS号码设置
				returnMessage = "SOS";

			} else if (("IP").equals(commandId)) { // IP端口设置
				returnMessage = "IP";

			} else if (("FACTORY").equals(commandId)) { // 恢复出厂设置
				returnMessage = "FACTORY";

			} else if (("SOSSMS").equals(commandId)) { // SOS短信报警开关
				returnMessage = "SOSSMS";

			} else if (("LOWBAT").equals(commandId)) { // 低电短信报警开关
				returnMessage = "LOWBAT";

			} else if (("SILENCETIME").equals(commandId)) { // 免打扰时间段设置
				returnMessage = "SILENCETIME";

			} else if (("VERNO").equals(commandId)) { // 版本查询
				returnMessage = "VERNO";

			} else if (("RESET").equals(commandId)) { // 重启
				returnMessage = "RESET";

			} else if (("CR").equals(commandId)) { // 定位指令
				returnMessage = "CR";

			} else if (("POWEROFF").equals(commandId)) { // 关机指令
				returnMessage = "POWEROFF";

			} else { // 其他场景

			}

//			returnMessage = assembleMessage(merchantId, terminalsId, returnMessage);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return returnMessage;

	}

	/***
	 * 返回信息组装
	 * 
	 * @param merchantId
	 * @param terminalsId
	 * @param returnMessage
	 * @return
	 */
	public String assembleMessage(String merchantId, String terminalsId, String data) {
//
//		String hexLen = DigitalTrans.patchHexString(DigitalTrans.algorismToHEXString(data.length()), 4);
//		data = merchantId + "*" + terminalsId + "*" + hexLen + "*" + data;

		return data;
	}
	

}
