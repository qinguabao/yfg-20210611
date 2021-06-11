package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;

import java.beans.Transient;
import java.util.Date;

/**
 * 指令日志表 yfg_command_log
 * 
 * @author mario
 * @date 2019-06-16
 */
public class YfgCommandLog extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 指令类型（44,43,42,41） */
	private String commandType;
	/** 指令字符 */
	private String commandStr;
	/** 发生时间 */
	private Date createTime;
	/** 设备id */
	private String deviceId;
	/** 1,发送，2 返回 */
	private String sendOrRes;
	/** 指令内容 */
	private String commandContent;
	/** 城市编码 */
	private String cityCode;
	/** 区域 */
	private String area;
	/** 房间状态 */
	private String roomStatus;
	/** 温度 */
	private String roomTemperature;
	/** 湿度 */
	private String roomMoisture;
	/** 设备状态 */
	private String deviceStatus;
	/** usb状态 */
	private String usbStatus;
	/** 会话id */
	private String channelId;
	/** 开门时间 */
	private String openTime;
	
	private String sendFlag;

	private String deviceIds;

	@Transient
	public String getDeviceIds() {
		return deviceIds;
	}

	public void setDeviceIds(String deviceIds) {
		this.deviceIds = deviceIds;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setCommandType(String commandType) 
	{
		this.commandType = commandType;
	}

	public String getCommandType() 
	{
		return commandType;
	}
	public void setCommandStr(String commandStr) 
	{
		this.commandStr = commandStr;
	}

	public String getCommandStr() 
	{
		return commandStr;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}
	public void setDeviceId(String deviceId) 
	{
		this.deviceId = deviceId;
	}

	public String getDeviceId() 
	{
		return deviceId;
	}
	public void setSendOrRes(String sendOrRes) 
	{
		this.sendOrRes = sendOrRes;
	}

	public String getSendOrRes() 
	{
		return sendOrRes;
	}
	public void setCommandContent(String commandContent) 
	{
		this.commandContent = commandContent;
	}

	public String getCommandContent() 
	{
		return commandContent;
	}
	public void setCityCode(String cityCode) 
	{
		this.cityCode = cityCode;
	}

	public String getCityCode() 
	{
		return cityCode;
	}
	public void setArea(String area) 
	{
		this.area = area;
	}

	public String getArea() 
	{
		return area;
	}
	public void setRoomStatus(String roomStatus) 
	{
		this.roomStatus = roomStatus;
	}

	public String getRoomStatus() 
	{
		return roomStatus;
	}
	public void setRoomTemperature(String roomTemperature) 
	{
		this.roomTemperature = roomTemperature;
	}

	public String getRoomTemperature() 
	{
		return roomTemperature;
	}
	public void setRoomMoisture(String roomMoisture) 
	{
		this.roomMoisture = roomMoisture;
	}

	public String getRoomMoisture() 
	{
		return roomMoisture;
	}
	public void setDeviceStatus(String deviceStatus) 
	{
		this.deviceStatus = deviceStatus;
	}

	public String getDeviceStatus() 
	{
		return deviceStatus;
	}
	public void setUsbStatus(String usbStatus) 
	{
		this.usbStatus = usbStatus;
	}

	public String getUsbStatus() 
	{
		return usbStatus;
	}
	public void setChannelId(String channelId) 
	{
		this.channelId = channelId;
	}

	public String getChannelId() 
	{
		return channelId;
	}
	public void setOpenTime(String openTime) 
	{
		this.openTime = openTime;
	}

	public String getOpenTime() 
	{
		return openTime;
	}
	
	

    public String getSendFlag() {
		return sendFlag;
	}

	public void setSendFlag(String sendFlag) {
		this.sendFlag = sendFlag;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("commandType", getCommandType())
            .append("commandStr", getCommandStr())
            .append("createTime", getCreateTime())
            .append("deviceId", getDeviceId())
            .append("sendOrRes", getSendOrRes())
            .append("commandContent", getCommandContent())
            .append("cityCode", getCityCode())
            .append("area", getArea())
            .append("roomStatus", getRoomStatus())
            .append("roomTemperature", getRoomTemperature())
            .append("roomMoisture", getRoomMoisture())
            .append("deviceStatus", getDeviceStatus())
            .append("usbStatus", getUsbStatus())
            .append("channelId", getChannelId())
            .append("openTime", getOpenTime())
            .toString();
    }
}
