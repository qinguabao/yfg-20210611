package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.fasterxml.jackson.databind.ser.std.SerializableSerializer;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 活动表 yfg_activity
 * 
 * @author mario
 * @date 2019-08-06
 */
public class YfgActivity 
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 活动名称 */
	private String activityName;
	/** 活动内容 */
	private String activityContent;
	/** 原价 */
	private Integer oriPrice;
	/** 价格 */
	private Integer activityPrice;
	/** 活动开始时间 */
	private Date beginDate;
	/** 结束时间 */
	private Date endDate;
	/** 活动数量 */
	private Integer activityNum;
	/** 商品图片 */
	private String activityGoodsImg;
	/** 活动图片1 */
	private String activityImgOne;
	/** 活动图片2 */
	private String activityImgTwo;
	/** 创建时间 */
	private Date createDate;
	/** 修改时间 */
	private Date updateDate;
	/** 创建人 */
	private Long createUser;
	/** 更新人 */
	private Long updateUser;
	/** 1 删除，0 正常 */
	private String delFlag;
	/** 备注 */
	private String remarks;
	
	private String beginDateStr;
	private String  endDateStr;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setActivityName(String activityName) 
	{
		this.activityName = activityName;
	}

	public String getActivityName() 
	{
		return activityName;
	}
	public void setActivityContent(String activityContent) 
	{
		this.activityContent = activityContent;
	}

	public String getActivityContent() 
	{
		return activityContent;
	}
	public void setOriPrice(Integer oriPrice) 
	{
		this.oriPrice = oriPrice;
	}

	public Integer getOriPrice() 
	{
		return oriPrice;
	}
	public void setActivityPrice(Integer activityPrice) 
	{
		this.activityPrice = activityPrice;
	}

	public Integer getActivityPrice() 
	{
		return activityPrice;
	}
	public void setBeginDate(Date beginDate) 
	{
		this.beginDate = beginDate;
	}

	public Date getBeginDate() 
	{
		return beginDate;
	}
	public void setEndDate(Date endDate) 
	{
		this.endDate = endDate;
	}

	public Date getEndDate() 
	{
		return endDate;
	}
	public void setActivityNum(Integer activityNum) 
	{
		this.activityNum = activityNum;
	}

	public Integer getActivityNum() 
	{
		return activityNum;
	}
	public void setActivityGoodsImg(String activityGoodsImg) 
	{
		this.activityGoodsImg = activityGoodsImg;
	}

	public String getActivityGoodsImg() 
	{
		return activityGoodsImg;
	}
	public void setActivityImgOne(String activityImgOne) 
	{
		this.activityImgOne = activityImgOne;
	}

	public String getActivityImgOne() 
	{
		return activityImgOne;
	}
	public void setActivityImgTwo(String activityImgTwo) 
	{
		this.activityImgTwo = activityImgTwo;
	}

	public String getActivityImgTwo() 
	{
		return activityImgTwo;
	}
	public void setCreateDate(Date createDate) 
	{
		this.createDate = createDate;
	}

	public Date getCreateDate() 
	{
		return createDate;
	}
	public void setUpdateDate(Date updateDate) 
	{
		this.updateDate = updateDate;
	}

	public Date getUpdateDate() 
	{
		return updateDate;
	}
	
	
	
	public Long getCreateUser() {
		return createUser;
	}

	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}

	public Long getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(Long updateUser) {
		this.updateUser = updateUser;
	}

	public void setDelFlag(String delFlag) 
	{
		this.delFlag = delFlag;
	}

	public String getDelFlag() 
	{
		return delFlag;
	}
	public void setRemarks(String remarks) 
	{
		this.remarks = remarks;
	}

	public String getRemarks() 
	{
		return remarks;
	}
	
	

    public String getBeginDateStr() {
		return beginDateStr;
	}

	public void setBeginDateStr(String beginDateStr) {
		this.beginDateStr = beginDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("activityName", getActivityName())
            .append("activityContent", getActivityContent())
            .append("oriPrice", getOriPrice())
            .append("activityPrice", getActivityPrice())
            .append("beginDate", getBeginDate())
            .append("endDate", getEndDate())
            .append("activityNum", getActivityNum())
            .append("activityGoodsImg", getActivityGoodsImg())
            .append("activityImgOne", getActivityImgOne())
            .append("activityImgTwo", getActivityImgTwo())
            .append("createDate", getCreateDate())
            .append("updateDate", getUpdateDate())
            .append("createUser", getCreateUser())
            .append("updateUser", getUpdateUser())
            .append("delFlag", getDelFlag())
            .append("remarks", getRemarks())
            .toString();
    }
}
