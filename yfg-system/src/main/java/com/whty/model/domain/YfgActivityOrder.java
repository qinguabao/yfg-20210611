package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 活动商品订单表 yfg_activity_order
 * 
 * @author mario
 * @date 2019-08-06
 */
public class YfgActivityOrder 
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 订单号 */
	private String orderId;
	/** 微信订单 */
	private String thirdOrderId;
	/** 创建时间 */
	private Date createDate;
	/** 活动id */
	private String activityId;
	/** 活动名称 */
	private String activityName;
	/** 用户 */
	private Integer userId;
	/** 微信openid */
	private String openId;
	/** 收件人 */
	private String recName;
	/** 收件手机 */
	private String recMobile;
	/** 邮编 */
	private String postCode;
	/** 收件地址 */
	private String addressContent;
	/** 快递公司 */
	private String deliveryCompany;
	/** 快递单号 */
	private String deliveryNum;
	/** 支付金额 */
	private Integer payAmount;
	/** 更新时间 */
	private Date updateTime;
	/** 开始时间 */
	private Date startTime;
	/** 消费金额 */
	private Integer consumeAmount;
	/** 退款时间 */
	private Date refoundTime;
	/** 订单状态，0：未支付，1：支付中，2：已支付，3：审核通过，4：审核不通过，5：发货，6：订单完成 */
	private String status;
	/** 支付通知时间 */
	private Date payNofityTime;
	/** 退款通知时间 */
	private Date refoundNofityTime;
	/** 备注 */
	private String remark;

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
	public void setActivityId(String activityId) 
	{
		this.activityId = activityId;
	}

	public String getActivityId() 
	{
		return activityId;
	}
	public void setActivityName(String activityName) 
	{
		this.activityName = activityName;
	}

	public String getActivityName() 
	{
		return activityName;
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
	public void setRecName(String recName) 
	{
		this.recName = recName;
	}

	public String getRecName() 
	{
		return recName;
	}
	public void setRecMobile(String recMobile) 
	{
		this.recMobile = recMobile;
	}

	public String getRecMobile() 
	{
		return recMobile;
	}
	public void setPostCode(String postCode) 
	{
		this.postCode = postCode;
	}

	public String getPostCode() 
	{
		return postCode;
	}
	public void setAddressContent(String addressContent) 
	{
		this.addressContent = addressContent;
	}

	public String getAddressContent() 
	{
		return addressContent;
	}
	public void setDeliveryCompany(String deliveryCompany) 
	{
		this.deliveryCompany = deliveryCompany;
	}

	public String getDeliveryCompany() 
	{
		return deliveryCompany;
	}
	public void setDeliveryNum(String deliveryNum) 
	{
		this.deliveryNum = deliveryNum;
	}

	public String getDeliveryNum() 
	{
		return deliveryNum;
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

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("thirdOrderId", getThirdOrderId())
            .append("createDate", getCreateDate())
            .append("activityId", getActivityId())
            .append("activityName", getActivityName())
            .append("userId", getUserId())
            .append("openId", getOpenId())
            .append("recName", getRecName())
            .append("recMobile", getRecMobile())
            .append("postCode", getPostCode())
            .append("addressContent", getAddressContent())
            .append("deliveryCompany", getDeliveryCompany())
            .append("deliveryNum", getDeliveryNum())
            .append("payAmount", getPayAmount())
            .append("updateTime", getUpdateTime())
            .append("startTime", getStartTime())
            .append("consumeAmount", getConsumeAmount())
            .append("refoundTime", getRefoundTime())
            .append("status", getStatus())
            .append("payNofityTime", getPayNofityTime())
            .append("refoundNofityTime", getRefoundNofityTime())
            .append("remark", getRemark())
            .toString();
    }
}
