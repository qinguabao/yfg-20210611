package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 短信验证码表 yfg_verifcode_mobile
 * 
 * @author mario
 * @date 2019-05-13
 */
public class YfgVerifcodeMobile extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 用户手机号 */
	private String mobilePhone;
	/** open_id */
	private String openId;
	/** 信短验证码 */
	private String vercode;
	/** 创建时间 */
	private Date createDate;
	/** 验证码 */
	private String code;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setMobilePhone(String mobilePhone) 
	{
		this.mobilePhone = mobilePhone;
	}

	public String getMobilePhone() 
	{
		return mobilePhone;
	}
	public void setOpenId(String openId) 
	{
		this.openId = openId;
	}

	public String getOpenId() 
	{
		return openId;
	}
	public void setVercode(String vercode) 
	{
		this.vercode = vercode;
	}

	public String getVercode() 
	{
		return vercode;
	}
	public void setCreateDate(Date createDate) 
	{
		this.createDate = createDate;
	}

	public Date getCreateDate() 
	{
		return createDate;
	}
	public void setCode(String code) 
	{
		this.code = code;
	}

	public String getCode() 
	{
		return code;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("mobilePhone", getMobilePhone())
            .append("openId", getOpenId())
            .append("vercode", getVercode())
            .append("createDate", getCreateDate())
            .append("code", getCode())
            .toString();
    }
}
