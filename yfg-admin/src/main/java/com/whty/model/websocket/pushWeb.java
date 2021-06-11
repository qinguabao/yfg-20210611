package com.whty.model.websocket;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.yfg.common.utils.MsgJson;
import com.whty.model.domain.YfgDevice;
import com.whty.model.domain.YfgOrder;
import com.whty.model.service.IYfgDeviceService;
import com.whty.model.service.IYfgOrderService;
import com.whty.model.service.impl.YfgDeviceServiceImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
public class pushWeb {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private IYfgDeviceService yfgDeviceService;
    @Autowired
    private IYfgOrderService yfgOrderService;

    @GetMapping(value = "/nfc/pushWeb")
    public Map<String, Object> pushVideoListToWeb(String message) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            WebSocketServer.sendInfo("有新客户呼入,message:" + message);
            result.put("operationResult", true);
        } catch (Exception e) {
            result.put("operationResult", true);
        }
        return result;
    }
    
    /*
       *    关闭吸烟室
       *    
     */
    @GetMapping(value = "/nfc/closeDevice")
    public JSONObject closeDevice(String deviceId) {
    	MsgJson resjson = new MsgJson();
    	JSONObject jsonObj =new JSONObject();
        try {
        	if(deviceId!=null&&!deviceId.equals("")) {    		
        			
        		YfgOrder yfgOrder = yfgOrderService.selectYfgOrderByDeviceId(deviceId);
        		if(yfgOrder!=null) {
        			
        			//更新吸烟室状态
        			yfgOrderService.closeDevice(yfgOrder);
        			
        			resjson.setCode("0");
        			resjson.setData("发送数据至web页面");
        			resjson.setData(yfgOrder);        			
        			jsonObj = (JSONObject) JSON.toJSON(resjson);  
        			WebSocketServer.sendInfo("有新客户呼入,message:" + jsonObj.toString());
        		}

        }
        	} catch (Exception e) {
             e.printStackTrace();
        }
        return jsonObj;
    }
    
    
    
    
    }

