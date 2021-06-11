/*
 * Copyright 2015 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.whty.model.socket.netty.handler;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelId;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.timeout.IdleState;
import io.netty.handler.timeout.IdleStateEvent;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.whty.model.domain.YfgDevice;
import com.whty.model.socket.netty.repository.ChannelRepository;
import com.whty.model.socket.netty.repository.TcpChannelIdRepository;
import com.whty.model.socket.netty.repository.TcpChannelRepository;
import com.whty.model.socket.netty.service.TcpNettyServerHandlerService;
import com.yfg.common.utils.StringUtils;



/***
 * 
 * @author mario
 * 
 *         2019年1月2日 下午2:26:44
 * 
 *         NettyServerHandler.java
 * 
 *         event handler to process receiving messages
 * 
 */
@Component
@ChannelHandler.Sharable
public class TcpNettyServerHandler extends ChannelInboundHandlerAdapter {

	private static final Logger log = LoggerFactory.getLogger(TcpNettyServerHandler.class);

//	private final TcpChannelRepository tcpChannelRepository;
//
//	private final TcpChannelIdRepository tcpChannelIdRepository; 
	
	private final com.whty.model.socket.netty.repository.ChannelRepository channelRepository;

	@Autowired
	private TcpNettyServerHandlerService nettyServerHandlerService;

	/** 空闲次数 */
	private AtomicInteger idle_count = new AtomicInteger(1);
	/** 发送次数 */
	private AtomicInteger count = new AtomicInteger(1);

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		if (log.isInfoEnabled()) {
			log.info("有新的终端连接上来了...");
		}
		Assert.notNull(this.channelRepository,
				"[Assertion failed] - TcpChannelRepository is required; it must not be null");

		ctx.fireChannelActive();
		if (log.isDebugEnabled()) {
			log.debug("Address：" + ctx.channel().remoteAddress());
		}

//		ChannelId channelId = ctx.channel().id();
//		tcpChannelRepository.put(channelId, ctx.channel());
		String  terminalsId = ctx.channel().id().toString();
		channelRepository.put(terminalsId,ctx.channel());

		if (log.isInfoEnabled()) {
			log.info("New channelId is {}", terminalsId);
		}

		if (log.isInfoEnabled()) {
			log.info("Binded Channel Count is {}", this.channelRepository.size());
		}

	}

	/**
	 * Netty sends data to terminal
	 * 
	 * @param dataMap
	 */
	public String channelSend(YfgDevice yfgDevice, String cmd) throws Exception {

		log.info("发送的给终端的 key:"+yfgDevice.getChannelId());
	    
		log.info("终端个数为："+this.channelRepository.size());
		Channel channel = this.channelRepository.get(yfgDevice.getChannelId());

		if (null==channel) { // 没有连接在线
			log.info("Failed,没有找到通道");
			nettyServerHandlerService.recordSendInfo(yfgDevice, cmd,"01");
			return "01";
		} else { // 设备连接在线
			log.info("ChannelId:" + yfgDevice.getChannelId() + ",Channel:" + channel + ",Address:" + channel.remoteAddress());
			
				channel.writeAndFlush(cmd);
				log.info("Success 互联网平台接口发送：" + cmd);
				nettyServerHandlerService.recordSendInfo(yfgDevice, cmd,"00");
				return "00";
			}

		}
	
	/**
	 * Netty sends data to terminal
	 * 
	 * @param dataMap
	 */
	public String channelSend(String channelId, String cmd) throws Exception {

		log.info("发送的给终端的 key:"+channelId);
	    
		log.info("终端个数为："+this.channelRepository.size());
		Channel channel = this.channelRepository.get(channelId);

		if (null==channel) { // 没有连接在线
			log.info("Failed,没有找到通道");
//			nettyServerHandlerService.recordSendInfo(yfgDevice, cmd,"01");
			return "01";
		} else { // 设备连接在线
			log.info("ChannelId:" + channelId + ",Channel:" + channel + ",Address:" + channel.remoteAddress());
			
				channel.writeAndFlush(cmd);
				log.info("Success 互联网平台接口发送：" + cmd);
//				nettyServerHandlerService.recordSendInfo(yfgDevice, cmd,"00");
				return "00";
			}

		}

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {

		String acceptMessage = ((String) msg).substring(1);
		if (log.isInfoEnabled()) {
			log.info("Netty服务器收到的报文为:" + acceptMessage);
		}

		Map<String, Object> dataMap = nettyServerHandlerService.acceptMessageHandler(acceptMessage,ctx.channel().id().toString());
	    String sendMessage ="";
		if(dataMap.get("code").equals("00")) {
			log.info("返回解析正常");
//			sendMessage="normal";
			if(dataMap.get("commStr")!=null&&dataMap.get("commStr").equals("XT")) {
				sendMessage = "FD"+dataMap.get("cityCode")+dataMap.get("area")+"40"+dataMap.get("terminalId")+"ED";
			}else {
				sendMessage="";
			}
			
			log.info("返回给终端的信息是："+sendMessage);
		}else if(dataMap.get("code").equals("99")) {
			log.info("maintenance返回信息");
//			sendMessage= (String) dataMap.get("maintenanceStr");
			sendMessage="";
		}else {
			log.info("******************返回解析异常******************");
			sendMessage="";
		}

		if (StringUtils.isNotEmpty(sendMessage)) { // 返回终端消息

			ctx.channel().writeAndFlush(sendMessage+"\n\r");
			if (log.isInfoEnabled()) {
				log.info("Netty服务器返回的报文为:" + sendMessage);
			}
		}

	}

	/**
	 * 超时处理 如果5秒没有接受客户端的心跳，就触发; 如果超过两次，则直接关闭;
	 */
	@Override
	public void userEventTriggered(ChannelHandlerContext ctx, Object obj) throws Exception {
		if (obj instanceof IdleStateEvent) {
			IdleStateEvent event = (IdleStateEvent) obj;
			// 如果读通道处于空闲状态，说明没有接收到心跳命令
			if (IdleState.READER_IDLE.equals(event.state())) {
//                log.info("已经5秒没有接收到客户端的信息了");
				if (idle_count.get() > 1) {
//                    log.info("关闭这个不活跃的channel");
					System.out.println("当前连接的客户端数量：" + this.channelRepository.size());
					nettyServerHandlerService.getCloseChannelId(ctx.channel().id().toString());
//                    ctx.channel().close(); //主动关闭连接
				}
				idle_count.getAndIncrement();
			}
		} else {
			super.userEventTriggered(ctx, obj);
		}
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		log.error(cause.getMessage(), cause);
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) {

		Assert.notNull(this.channelRepository,
				"[Assertion failed] - TcpChannelRepository is required; it must not be null");
		Assert.notNull(ctx, "[Assertion failed] - ChannelHandlerContext is required; it must not be null");

		ChannelId channelId = ctx.channel().id();
		nettyServerHandlerService.getchannelInactive(channelId.toString());
//		this.tcpChannelRepository.remove(channelId);

		if (log.isInfoEnabled()) {
			log.info("The Channel " + channelId + " was closed...");
		}

		if (log.isDebugEnabled()) {
			log.debug("Binded Channel Count is " + this.channelRepository.size());
		}
	}

	public TcpNettyServerHandler(ChannelRepository channelRepository) {
		this.channelRepository = channelRepository;

	}
}
