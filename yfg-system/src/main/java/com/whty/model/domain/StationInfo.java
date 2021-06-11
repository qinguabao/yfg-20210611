package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.yfg.common.core.domain.BaseEntity;

import java.beans.Transient;
import java.util.Date;

/**
 * 取货网点表 col_station_info
 * 
 * @author mario
 * @date 2019-03-22
 */
public class StationInfo extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 省/直辖市*/
	private Integer proId;
	/** 城市 */
	private Integer cityId;
	/** 区县 */
	private Integer countyId;
	/** 网点名称 */
	private String stationName;
	/** 网点地址 */
	private String stationAddress;
	/** 网点联系电话 */
	private String stationMobile;
	/** 网点联系人 */
	private String stationConnectPerson;
	/** 网点服务时间 */
	private String stationNetTime;
	/** 网点服务信息 */
	private String stationServerInfo;
	/** 创建时间 */
	private Date createDate;
	/** 更新时间 */
	private Date updateDate;
	/** 网点状态 */
	private String stationStatus;
	/** 是否删除 */
	private String delFlag;
	/** 备注 */
	private String remarks;
	/** 接收创建时间搜索条件*/
    private String startTime;
    private String endTime;
    /** 接收修改时间搜索条件*/
    private String startUpdateTime;
    private String endUpdateTime;

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	
	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
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
	public void setStationName(String stationName) 
	{
		this.stationName = stationName;
	}

	public String getStationName() 
	{
		return stationName;
	}
	public void setStationAddress(String stationAddress) 
	{
		this.stationAddress = stationAddress;
	}

	public String getStationAddress() 
	{
		return stationAddress;
	}
	public void setStationMobile(String stationMobile) 
	{
		this.stationMobile = stationMobile;
	}

	public String getStationMobile() 
	{
		return stationMobile;
	}
	public void setStationConnectPerson(String stationConnectPerson) 
	{
		this.stationConnectPerson = stationConnectPerson;
	}

	public String getStationConnectPerson() 
	{
		return stationConnectPerson;
	}
	public void setStationNetTime(String stationNetTime) 
	{
		this.stationNetTime = stationNetTime;
	}

	public String getStationNetTime() 
	{
		return stationNetTime;
	}
	public void setStationServerInfo(String stationServerInfo) 
	{
		this.stationServerInfo = stationServerInfo;
	}

	public String getStationServerInfo() 
	{
		return stationServerInfo;
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
	public void setStationStatus(String stationStatus) 
	{
		this.stationStatus = stationStatus;
	}

	public String getStationStatus() 
	{
		return stationStatus;
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
	@Transient
    public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	@Transient
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Transient
	public String getStartUpdateTime() {
		return startUpdateTime;
	}

	public void setStartUpdateTime(String startUpdateTime) {
		this.startUpdateTime = startUpdateTime;
	}
	@Transient
	public String getEndUpdateTime() {
		return endUpdateTime;
	}

	public void setEndUpdateTime(String endUpdateTime) {
		this.endUpdateTime = endUpdateTime;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("cityId", getCityId())
            .append("countyId", getCountyId())
            .append("stationName", getStationName())
            .append("stationAddress", getStationAddress())
            .append("stationMobile", getStationMobile())
            .append("stationConnectPerson", getStationConnectPerson())
            .append("stationNetTime", getStationNetTime())
            .append("stationServerInfo", getStationServerInfo())
            .append("createDate", getCreateDate())
            .append("updateDate", getUpdateDate())
            .append("stationStatus", getStationStatus())
            .append("delFlag", getDelFlag())
            .append("remarks", getRemarks())
            .append("remarks", getRemarks())
            .toString();
    }
}
