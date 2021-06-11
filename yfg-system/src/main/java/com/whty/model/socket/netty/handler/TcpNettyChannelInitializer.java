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

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.handler.timeout.IdleStateHandler;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

/**
 * Channel Initializer
 *
 * @author zhangtianlin
 */
@Component
@Qualifier("tcpNettyChannelInitializer")
public class TcpNettyChannelInitializer extends ChannelInitializer<SocketChannel> {

	private static final StringDecoder DECODER = new StringDecoder();
	private static final StringEncoder ENCODER = new StringEncoder();

	@Autowired
	@Qualifier("tcpNettyServerHandler")
	private ChannelInboundHandlerAdapter tcpNettyServerHandler;

	@Override
	protected void initChannel(SocketChannel socketChannel) {
		ChannelPipeline pipeline = socketChannel.pipeline();

		ByteBuf delimiter = Unpooled.copiedBuffer("]".getBytes()); // 以'[****]'作为数据传输结束符
        pipeline.addLast(new DelimiterBasedFrameDecoder(1024*1024,delimiter));
//		pipeline.addLast(new DelimiterBasedFrameDecoder(1024 * 1024, false));
		// Add the text line codec combination first,

		// 入参说明: 读超时时间、写超时时间、所有类型的超时时间、时间格式
		pipeline.addLast(new IdleStateHandler(600, 600, 600, TimeUnit.SECONDS));

		// the encoder and decoder are static as these are sharable
		pipeline.addLast(DECODER);
		pipeline.addLast(ENCODER);

		pipeline.addLast(tcpNettyServerHandler);
	}
}
