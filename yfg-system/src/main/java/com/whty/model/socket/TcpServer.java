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
package com.whty.model.socket;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


import javax.annotation.PreDestroy;
import java.net.InetSocketAddress;

/**
 * Main Server
 *
 * @author Jibeom Jung
 */

@Component
@Qualifier("tcpNettyServerInitializer")
public class TcpServer  implements Runnable {

	@Qualifier("tcpServerBootstrap")
	private final ServerBootstrap serverBootstrap;

	@Qualifier("tcpSocketAddress")
	private final InetSocketAddress tcpSocketAddress;

	private Channel serverChannel;

	public void start() throws Exception 
	{
		
		this.serverChannel = this.serverBootstrap.bind(this.tcpSocketAddress).sync().channel().closeFuture().sync().channel();
	}

	@PreDestroy
	public void stop() {
		if (this.serverChannel != null) {
			this.serverChannel.close();
			this.serverChannel.parent().close();
		}
	}

	public Channel getServerChannel() {
		return serverChannel;
	}

	public void setServerChannel(Channel serverChannel) {
		this.serverChannel = serverChannel;
	}

	public ServerBootstrap getServerBootstrap() {
		return serverBootstrap;
	}

	public InetSocketAddress getTcpSocketAddress() {
		return tcpSocketAddress;
	}

	public TcpServer(ServerBootstrap serverBootstrap, InetSocketAddress tcpSocketAddress) {
		this.serverBootstrap = serverBootstrap;
		this.tcpSocketAddress = tcpSocketAddress;
	}

	@Override
	public void run() {
		try {
			start();
		}catch(Exception e) {
			System.out.println("启动netty服务异常");
			e.printStackTrace();
		}
		
	}

}