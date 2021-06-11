package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 优惠卡表 col_special_card_info
 * 
 * @author mario
 * @date 2019-03-26
 */
public class SpecialCardInfo extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 优惠卡名称 */
	private String cardTypeName;
	/** 省份 */
	private Integer proId;
	/** 城市 */
	private Integer cityId;
	/** 区县 */
	private Integer countyId;
	/** 卡费用 */
	private Integer cardFee;
	/** 快递费用 */
	private Integer mailFee;
	/** 卡类型 */
	private String cardType;
	/** 版面 */
	private Integer layoutId;
	/** 是否删除 */
	private String delFlag;
	/** 状态 */
	private String status;
	/** 创建时间 */
	private Date createDate;
	/** 更新时间 */
	private Date updateDate;
	/** 创建人 */
	private Integer createUser;
	/** 更新人 */
	private Date updateUser;
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
	public void setCardTypeName(String cardTypeName) 
	{
		this.cardTypeName = cardTypeName;
	}

	public String getCardTypeName() 
	{
		return cardTypeName;
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
	public void setCardFee(Integer cardFee) 
	{
		this.cardFee = cardFee;
	}

	public Integer getCardFee() 
	{
		return cardFee;
	}
	public void setMailFee(Integer mailFee) 
	{
		this.mailFee = mailFee;
	}

	public Integer getMailFee() 
	{
		return mailFee;
	}
	public void setCardType(String cardType) 
	{
		this.cardType = cardType;
	}

	public String getCardType() 
	{
		return cardType;
	}
	public void setLayoutId(Integer layoutId) 
	{
		this.layoutId = layoutId;
	}

	public Integer getLayoutId() 
	{
		return layoutId;
	}
	public void setDelFlag(String delFlag) 
	{
		this.delFlag = delFlag;
	}

	public String getDelFlag() 
	{
		return delFlag;
	}
	public void setStatus(String status) 
	{
		this.status = status;
	}

	public String getStatus() 
	{
		return status;
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
	public void setCreateUser(Integer createUser) 
	{
		this.createUser = createUser;
	}

	public Integer getCreateUser() 
	{
		return createUser;
	}
	public void setUpdateUser(Date updateUser) 
	{
		this.updateUser = updateUser;
	}

	public Date getUpdateUser() 
	{
		return updateUser;
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
            .append("cardTypeName", getCardTypeName())
            .append("proId", getProId())
            .append("cityId", getCityId())
            .append("countyId", getCountyId())
            .append("cardFee", getCardFee())
            .append("mailFee", getMailFee())
            .append("cardType", getCardType())
            .append("layoutId", getLayoutId())
            .append("delFlag", getDelFlag())
            .append("status", getStatus())
            .append("createDate", getCreateDate())
            .append("updateDate", getUpdateDate())
            .append("createUser", getCreateUser())
            .append("updateUser", getUpdateUser())
            .append("remarks", getRemarks())
            .toString();
    }
}
