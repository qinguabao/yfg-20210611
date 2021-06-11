package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 图文验证码表 yfg_verifcode
 * 
 * @author mario
 * @date 2019-04-24
 */
public class YfgVerifcode 
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 图文验证码 */
	private String code;
	/** 创建时间 */
	private Date createTime;
	/** 微信openid */
	private String wxOpneid;
	/** 手机号 */
	private String mobilephone;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setCode(String code) 
	{
		this.code = code;
	}

	public String getCode() 
	{
		return code;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}
	public void setWxOpneid(String wxOpneid) 
	{
		this.wxOpneid = wxOpneid;
	}

	public String getWxOpneid() 
	{
		return wxOpneid;
	}
	public void setMobilephone(String mobilephone) 
	{
		this.mobilephone = mobilephone;
	}

	public String getMobilephone() 
	{
		return mobilephone;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("code", getCode())
            .append("createTime", getCreateTime())
            .append("wxOpneid", getWxOpneid())
            .append("mobilephone", getMobilephone())
            .toString();
    }
}
