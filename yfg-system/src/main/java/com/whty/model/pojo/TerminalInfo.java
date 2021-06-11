package com.whty.model.pojo;

public class TerminalInfo {
	
	private String channelId;
	private String headStr;
	private String cityCode; //城市编码
	private String area;   //区域
	private String terminalId;  //终端编码
	private String commStr;  //指令
	private String  roomStatus;  //门 状态
	private String  roomTemperature; // 室温
    
	private String roomMoisture; //湿度
	private String deviceStatus; //设备状态
	private String UsbStatus;
	private String openTime;
	
	private String tailStr;

	public String getHeadStr() {
		return headStr;
	}

	public void setHeadStr(String headStr) {
		this.headStr = headStr;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTerminalId() {
		return terminalId;
	}

	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}

	public String getCommStr() {
		return commStr;
	}

	public void setCommStr(String commStr) {
		this.commStr = commStr;
	}

	public String getRoomStatus() {
		return roomStatus;
	}

	public void setRoomStatus(String roomStatus) {
		this.roomStatus = roomStatus;
	}

	public String getRoomTemperature() {
		return roomTemperature;
	}

	public void setRoomTemperature(String roomTemperature) {
		this.roomTemperature = roomTemperature;
	}

	public String getRoomMoisture() {
		return roomMoisture;
	}

	public void setRoomMoisture(String roomMoisture) {
		this.roomMoisture = roomMoisture;
	}

	public String getDeviceStatus() {
		return deviceStatus;
	}

	public void setDeviceStatus(String deviceStatus) {
		this.deviceStatus = deviceStatus;
	}

	public String getUsbStatus() {
		return UsbStatus;
	}

	public void setUsbStatus(String usbStatus) {
		UsbStatus = usbStatus;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getTailStr() {
		return tailStr;
	}

	public void setTailStr(String tailStr) {
		this.tailStr = tailStr;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}
	
	
	
	

}
