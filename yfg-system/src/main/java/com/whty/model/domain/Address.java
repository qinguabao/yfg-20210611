package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;

/**
 * 用户快递表 col_address
 * 
 * @author mario
 * @date 2019-03-26
 */
public class Address extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 用户 */
	private Integer userId;
	/** 手机号码 */
	private String mobile;
	/** 收件人姓名 */
	private String recName;
	/** 收件人地址 */
	private String recAddress;
	/** 省份 */
	private Integer proId;
	/** 城市 */
	private Integer cityId;
	/** 区县 */
	private Integer countyId;
	/** 邮编 */
	private String postcode;
	/** 是否默认地址 */
	private String isDefault;
	/** 删除 */
	private String delFlag;
	/** 备注 */
	private String remarks;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setUserId(Integer userId) 
	{
		this.userId = userId;
	}

	public Integer getUserId() 
	{
		return userId;
	}
	public void setMobile(String mobile) 
	{
		this.mobile = mobile;
	}

	public String getMobile() 
	{
		return mobile;
	}
	public void setRecName(String recName) 
	{
		this.recName = recName;
	}

	public String getRecName() 
	{
		return recName;
	}
	public void setRecAddress(String recAddress) 
	{
		this.recAddress = recAddress;
	}

	public String getRecAddress() 
	{
		return recAddress;
	}
	public void setProId(Integer proId) 
	{
		this.proId = proId;
	}

	public Integer getProId() 
	{
		return proId;
	}
	public void setCityId(Integer cityId) 
	{
		this.cityId = cityId;
	}

	public Integer getCityId() 
	{
		return cityId;
	}
	public void setCountyId(Integer countyId) 
	{
		this.countyId = countyId;
	}

	public Integer getCountyId() 
	{
		return countyId;
	}
	public void setPostcode(String postcode) 
	{
		this.postcode = postcode;
	}

	public String getPostcode() 
	{
		return postcode;
	}
	public void setIsDefault(String isDefault) 
	{
		this.isDefault = isDefault;
	}

	public String getIsDefault() 
	{
		return isDefault;
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

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("mobile", getMobile())
            .append("recName", getRecName())
            .append("recAddress", getRecAddress())
            .append("proId", getProId())
            .append("cityId", getCityId())
            .append("countyId", getCountyId())
            .append("postcode", getPostcode())
            .append("isDefault", getIsDefault())
            .append("delFlag", getDelFlag())
            .append("remarks", getRemarks())
            .toString();
    }
}
