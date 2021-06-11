package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 微信token表 yfg_wx_token
 * 
 * @author mario
 * @date 2019-05-10
 */
public class YfgWxToken extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 微信token */
	private String accessToken;
	/** 微信jsapi_ticket */
	private String jsapiTicket;
	/** 创建时间 */
	private Date createTime;
	/** 更新时间 */
	private Date updateTime;
	/** 1微信公众号，2小程序 */
	private String type;
	/** 公众号appid */
	private String appId;
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
	public void setAccessToken(String accessToken) 
	{
		this.accessToken = accessToken;
	}

	public String getAccessToken() 
	{
		return accessToken;
	}
	public void setJsapiTicket(String jsapiTicket) 
	{
		this.jsapiTicket = jsapiTicket;
	}

	public String getJsapiTicket() 
	{
		return jsapiTicket;
	}
	public void setCreateTime(Date createTime) 
	{
		this.createTime = createTime;
	}

	public Date getCreateTime() 
	{
		return createTime;
	}
	public void setUpdateTime(Date updateTime) 
	{
		this.updateTime = updateTime;
	}

	public Date getUpdateTime() 
	{
		return updateTime;
	}
	public void setType(String type) 
	{
		this.type = type;
	}

	public String getType() 
	{
		return type;
	}
	public void setAppId(String appId) 
	{
		this.appId = appId;
	}

	public String getAppId() 
	{
		return appId;
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
            .append("accessToken", getAccessToken())
            .append("jsapiTicket", getJsapiTicket())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("type", getType())
            .append("appId", getAppId())
            .append("remarks", getRemarks())
            .toString();
    }
}
