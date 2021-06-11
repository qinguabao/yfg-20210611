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
package com.whty.model.socket.netty.repository;

import io.netty.channel.Channel;
import io.netty.channel.ChannelId;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.annotation.ManagedBean;



/**
 * Channel Repository using HashMap
 *
 * @author zhangtianlin
 */
@ManagedBean
public class TcpChannelRepository {
	private ConcurrentMap<ChannelId, Channel> channelCache = new ConcurrentHashMap<ChannelId, Channel>();

	public TcpChannelRepository put(ChannelId channelId, Channel channel) {
		channelCache.put(channelId, channel);
		return this;
	}
	
	
	
//	  public ChannelRepository put(String key, Channel value) {
//	        channelCache.put(key, value);
//	        return this;
//	    }

	    public Channel get(String key) {
	        return channelCache.get(key);
	    }

	public Channel get(ChannelId channelId) {

		Channel channel = channelCache.get(channelId);

		return channel;
	}

	public void remove(ChannelId channelId) {

		this.channelCache.remove(channelId);

	}

	public int size() {
		return this.channelCache.size();
	}
}
