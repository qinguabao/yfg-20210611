package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;

import java.beans.Transient;
import java.util.Date;

/**
 * 订单吸烟表 yfg_order
 * 
 * @author mario
 * @date 2019-05-21
 */
public class YfgOrder extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/**  */
	private Integer id;
	/** 订单号 */
	private String orderId;
	/** 微信订单 */
	private String thirdOrderId;
	/** 创建时间 */
	private Date createDate;
	/** 设备id */
	private String deviceId;
	/** 套餐 */
	private Integer packageId;
	/** 套餐名称 */
	private String packageName;
	/** 用户 */
	private Integer userId;
	/** 微信openid */
	private String openId;
	/** 支付金额 */
	private Integer payAmount;
	/** 更新时间 */
	private Date updateTime;
	/** 开始时间 */
	private Date startTime;
	/** 预计结束时间 */
	private Date expectEndTime;
	/** 结束时间 */
	private Date endTime;
	/** 消费金额 */
	private Integer consumeAmount;
	/** 退款时间 */
	private Date refoundTime;
	/** 设备类型 */
	private String deviceType;
	/** 订单状态，0：未支付，1：支付中，2：已支付，3：使用中，4：退款成功，5：退款失败，6：订单完成(使用完成） */
	private String status;
	/** 支付通知时间 */
	private Date payNofityTime;
	/** 退款通知时间 */
	private Date refoundNofityTime;
	/** 备注 */
	private String remark;
	
	private Date openDoorTime;

	private String deviceIds;
	private User user;
	private String delFlag;

	private YfgPackage yfgPackage;

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public YfgPackage getYfgPackage() {
		return yfgPackage;
	}

	public void setYfgPackage(YfgPackage yfgPackage) {
		this.yfgPackage = yfgPackage;
	}

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
	public void setOrderId(String orderId) 
	{
		this.orderId = orderId;
	}

	public String getOrderId() 
	{
		return orderId;
	}
	public void setThirdOrderId(String thirdOrderId) 
	{
		this.thirdOrderId = thirdOrderId;
	}

	public String getThirdOrderId() 
	{
		return thirdOrderId;
	}
	public void setCreateDate(Date createDate) 
	{
		this.createDate = createDate;
	}

	public Date getCreateDate() 
	{
		return createDate;
	}
	public void setDeviceId(String deviceId) 
	{
		this.deviceId = deviceId;
	}

	public String getDeviceId() 
	{
		return deviceId;
	}
	public void setPackageId(Integer packageId) 
	{
		this.packageId = packageId;
	}

	public Integer getPackageId() 
	{
		return packageId;
	}
	public void setPackageName(String packageName) 
	{
		this.packageName = packageName;
	}

	public String getPackageName() 
	{
		return packageName;
	}
	public void setUserId(Integer userId) 
	{
		this.userId = userId;
	}

	public Integer getUserId() 
	{
		return userId;
	}
	public void setOpenId(String openId) 
	{
		this.openId = openId;
	}

	public String getOpenId() 
	{
		return openId;
	}
	public void setPayAmount(Integer payAmount) 
	{
		this.payAmount = payAmount;
	}

	public Integer getPayAmount() 
	{
		return payAmount;
	}
	public void setUpdateTime(Date updateTime) 
	{
		this.updateTime = updateTime;
	}

	public Date getUpdateTime() 
	{
		return updateTime;
	}
	public void setStartTime(Date startTime) 
	{
		this.startTime = startTime;
	}

	public Date getStartTime() 
	{
		return startTime;
	}
	public void setExpectEndTime(Date expectEndTime) 
	{
		this.expectEndTime = expectEndTime;
	}

	public Date getExpectEndTime() 
	{
		return expectEndTime;
	}
	public void setEndTime(Date endTime) 
	{
		this.endTime = endTime;
	}

	public Date getEndTime() 
	{
		return endTime;
	}
	public void setConsumeAmount(Integer consumeAmount) 
	{
		this.consumeAmount = consumeAmount;
	}

	public Integer getConsumeAmount() 
	{
		return consumeAmount;
	}
	public void setRefoundTime(Date refoundTime) 
	{
		this.refoundTime = refoundTime;
	}

	public Date getRefoundTime() 
	{
		return refoundTime;
	}
	public void setDeviceType(String deviceType) 
	{
		this.deviceType = deviceType;
	}

	public String getDeviceType() 
	{
		return deviceType;
	}
	public void setStatus(String status) 
	{
		this.status = status;
	}

	public String getStatus() 
	{
		return status;
	}
	public void setPayNofityTime(Date payNofityTime) 
	{
		this.payNofityTime = payNofityTime;
	}

	public Date getPayNofityTime() 
	{
		return payNofityTime;
	}
	public void setRefoundNofityTime(Date refoundNofityTime) 
	{
		this.refoundNofityTime = refoundNofityTime;
	}

	public Date getRefoundNofityTime() 
	{
		return refoundNofityTime;
	}
	public void setRemark(String remark) 
	{
		this.remark = remark;
	}

	public String getRemark() 
	{
		return remark;
	}
	
	

    public Date getOpenDoorTime() {
		return openDoorTime;
	}

	public void setOpenDoorTime(Date openDoorTime) {
		this.openDoorTime = openDoorTime;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("thirdOrderId", getThirdOrderId())
            .append("createDate", getCreateDate())
            .append("deviceId", getDeviceId())
            .append("packageId", getPackageId())
            .append("packageName", getPackageName())
            .append("userId", getUserId())
            .append("openId", getOpenId())
            .append("payAmount", getPayAmount())
            .append("updateTime", getUpdateTime())
            .append("startTime", getStartTime())
            .append("expectEndTime", getExpectEndTime())
            .append("endTime", getEndTime())
            .append("consumeAmount", getConsumeAmount())
            .append("refoundTime", getRefoundTime())
            .append("deviceType", getDeviceType())
            .append("status", getStatus())
            .append("payNofityTime", getPayNofityTime())
            .append("refoundNofityTime", getRefoundNofityTime())
            .append("remark", getRemark())
            .toString();
    }
}
