package com.whty.model.domain;

import com.yfg.common.annotation.Excel;
import com.yfg.system.domain.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 设备表 yfg_device
 * 
 * @author mario
 * @date 2019-06-16
 */
public class YfgDevice extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 设备物理编码 */
	private String deviceId;
	/** 设备名称 */
	private String deviceName;
	/** 单价/分 */
	private Integer price;
	/** 城市编码 */
	private String cityCode;
	/** 区域 */
	private String area;
	/** 门 状态 */
	private String roomStatus;
	/** 温度 */
	private String roomTemperature;
	/** 湿度 */
	private String roomMoisture;
	/** 设备状态 */
	private String deviceStatus;
	/** USB状态 */
	private String usbStatus;
	/** 打开计时时间 */
	private String openingTime;
	/** 打开时间 */
	private Date openDoorTime;
	/** 关闭时间 */
	private Date closeDoorTime;
	/** 会话id */
	private String channelId;
	/** 异常 */
	private String deviceException;
	/** 状态（0，关闭，1，使用中,2 订单时间结束了，用户还未出来） */
	private String status;
	/** sim卡号 */
	private String simNo;
	/** 经度 */
	private String deviceX;
	/** 维度 */
	private String deviceY;
	/** 联系人 */
	private String resPerson;
	/** 电话 */
	private String connMobile;
	/** 0正常，1 删除 */
	private String delFlag;
	/** 创建时间 */
	private Date createDate;
	/** 更新时间 */
	private Date updateDate;
	/** 备注 */
	private String remarks;
	
	// 开锁时间
	private Date openLockTime;
	
	// 设备关闭时间
	private Date closeDeviceTime;

	private Integer orderId;
	
	private String aeraId;

	private Long  deptId;  //所属商户
	private String deviceType;  //设备类型


	/** 部门对象 */
	@Excel(name = "部门名称", targetAttr = "deptName", type = Excel.Type.EXPORT)
	private SysDept dept;

	public SysDept getDept()
	{
		if (dept == null)
		{
			dept = new SysDept();
		}
		return dept;
	}


	public void setDept(SysDept dept)
	{
		this.dept = dept;
	}

	public Long getDeptId()
	{
		return deptId;
	}

	public void setDeptId(Long deptId)
	{
		this.deptId = deptId;
	}

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
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
		return usbStatus;
	}

	public void setUsbStatus(String usbStatus) {
		this.usbStatus = usbStatus;
	}

	public String getOpeningTime() {
		return openingTime;
	}

	public void setOpeningTime(String openingTime) {
		this.openingTime = openingTime;
	}

	public Date getOpenDoorTime() {
		return openDoorTime;
	}

	public void setOpenDoorTime(Date openDoorTime) {
		this.openDoorTime = openDoorTime;
	}

	public Date getCloseDoorTime() {
		return closeDoorTime;
	}

	public void setCloseDoorTime(Date closeDoorTime) {
		this.closeDoorTime = closeDoorTime;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getDeviceException() {
		return deviceException;
	}

	public void setDeviceException(String deviceException) {
		this.deviceException = deviceException;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSimNo() {
		return simNo;
	}

	public void setSimNo(String simNo) {
		this.simNo = simNo;
	}

	public String getDeviceX() {
		return deviceX;
	}

	public void setDeviceX(String deviceX) {
		this.deviceX = deviceX;
	}

	public String getDeviceY() {
		return deviceY;
	}

	public void setDeviceY(String deviceY) {
		this.deviceY = deviceY;
	}

	public String getResPerson() {
		return resPerson;
	}

	public void setResPerson(String resPerson) {
		this.resPerson = resPerson;
	}

	public String getConnMobile() {
		return connMobile;
	}

	public void setConnMobile(String connMobile) {
		this.connMobile = connMobile;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getOpenLockTime() {
		return openLockTime;
	}

	public void setOpenLockTime(Date openLockTime) {
		this.openLockTime = openLockTime;
	}

	public Date getCloseDeviceTime() {
		return closeDeviceTime;
	}

	public void setCloseDeviceTime(Date closeDeviceTime) {
		this.closeDeviceTime = closeDeviceTime;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getAeraId() {
		return aeraId;
	}

	public void setAeraId(String aeraId) {
		this.aeraId = aeraId;
	}
    
	
	
}
