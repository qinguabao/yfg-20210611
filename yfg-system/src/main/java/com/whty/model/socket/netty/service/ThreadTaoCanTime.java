package com.whty.model.socket.netty.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.whty.model.domain.YfgOrder;

public class ThreadTaoCanTime implements Runnable {

	private YfgOrder order;
	private static Logger logger = LoggerFactory.getLogger(ThreadTaoCanTime.class);
	@Autowired
	private TcpNettyServerHandlerService tcpNettyServerHandlerService;

	public YfgOrder getOrder() {
		return order;
	}



	public void setOrder(YfgOrder order) {
		this.order = order;
	}






	@Override
	public void run() {
		try {
			Thread.sleep(5*1000);
			SimpleDateFormat sd = new SimpleDateFormat("YYYY-mm-dd HH:MM:ss");
			logger.info("begin-套餐新线程开始执行"+sd.format(new Date()));
			if(order!=null) {
				logger.info("订单号"+order.getOrderId());
			}
			tcpNettyServerHandlerService.sendTaoCanTime(order);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	

	
	   
	
}
