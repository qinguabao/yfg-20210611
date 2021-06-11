package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 前台用户表 col_user
 * 
 * @author mario
 * @date 2019-05-24
 */
public class User extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 微信openId */
	private String openId;
	private String  unionid;
	/*
	小程序 openId
	 */
	private String appletsopenid;
	/** 登录名 */
	private String loginName;
	/** 密码 */
	private String passwd;
	/** 性别 */
	private String gender;
	/** 昵称 */
	private String nickName;
	/** 手机号码 */
	private String mobile;
	/** 创建时间 */
	private Date createDate;
	/** 修改时间 */
	private Date updateDate;
	/** 用户来源 */
	private String source;
	/** 城市 */
	private String city;
	/** 省 */
	private String province;
	/** 国家 */
	private String country;
	/** 图像 */
	private String headimgurl;
	/** 最后登录时间 */
	private Date lastLoginTime;
	/**  */
	private String lastIp;
	/** 备注 */
	private String remarks;
	private String delFlag;

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setOpenId(String openId) 
	{
		this.openId = openId;
	}

	public String getAppletsopenid() {
		return appletsopenid;
	}

	public void setAppletsopenid(String appletsopenid) {
		this.appletsopenid = appletsopenid;
	}

	public String getUnionid() {
		return unionid;
	}

	public void setUnionid(String unionid) {
		this.unionid = unionid;
	}

	public String getOpenId()
	{
		return openId;
	}
	public void setLoginName(String loginName) 
	{
		this.loginName = loginName;
	}

	public String getLoginName() 
	{
		return loginName;
	}
	public void setPasswd(String passwd) 
	{
		this.passwd = passwd;
	}

	public String getPasswd() 
	{
		return passwd;
	}
	public void setGender(String gender) 
	{
		this.gender = gender;
	}

	public String getGender() 
	{
		return gender;
	}
	public void setNickName(String nickName) 
	{
		this.nickName = nickName;
	}

	public String getNickName() 
	{
		return nickName;
	}
	public void setMobile(String mobile) 
	{
		this.mobile = mobile;
	}

	public String getMobile() 
	{
		return mobile;
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
	public void setSource(String source) 
	{
		this.source = source;
	}

	public String getSource() 
	{
		return source;
	}
	public void setCity(String city) 
	{
		this.city = city;
	}

	public String getCity() 
	{
		return city;
	}
	public void setProvince(String province) 
	{
		this.province = province;
	}

	public String getProvince() 
	{
		return province;
	}
	public void setCountry(String country) 
	{
		this.country = country;
	}

	public String getCountry() 
	{
		return country;
	}
	public void setHeadimgurl(String headimgurl) 
	{
		this.headimgurl = headimgurl;
	}

	public String getHeadimgurl() 
	{
		return headimgurl;
	}
	public void setLastLoginTime(Date lastLoginTime) 
	{
		this.lastLoginTime = lastLoginTime;
	}

	public Date getLastLoginTime() 
	{
		return lastLoginTime;
	}
	public void setLastIp(String lastIp) 
	{
		this.lastIp = lastIp;
	}

	public String getLastIp() 
	{
		return lastIp;
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
            .append("openId", getOpenId())
            .append("loginName", getLoginName())
            .append("passwd", getPasswd())
            .append("gender", getGender())
            .append("nickName", getNickName())
            .append("mobile", getMobile())
            .append("createDate", getCreateDate())
            .append("updateDate", getUpdateDate())
            .append("source", getSource())
            .append("city", getCity())
            .append("province", getProvince())
            .append("country", getCountry())
            .append("headimgurl", getHeadimgurl())
            .append("lastLoginTime", getLastLoginTime())
            .append("lastIp", getLastIp())
            .append("remarks", getRemarks())
            .toString();
    }
}
