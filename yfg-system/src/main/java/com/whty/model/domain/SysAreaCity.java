package com.whty.model.domain;

import java.beans.Transient;
import java.math.BigDecimal;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.yfg.common.core.domain.BaseEntity;

/**
 * 地区据字典表 sys_area_city
 * 
 * @author mario
 * @date 2019-03-22
 */
public class SysAreaCity extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** 主键 */
	private Integer iD;
	/** 区域名称 */
	private String nAME;
	/** 上级区域ID */
	private BigDecimal pID;
	/** 显示排序 */
	private BigDecimal sORT;
	/** 区域级别，1-省份/直辖市、2-城市、3-区县 */
	private BigDecimal aLEVEL;
	/**接收上级区域名称*/
	private String pName;

	public void setID(Integer iD) 
	{
		this.iD = iD;
	}

	public Integer getID() 
	{
		return iD;
	}
	public void setNAME(String nAME) 
	{
		this.nAME = nAME;
	}

	public String getNAME() 
	{
		return nAME;
	}
	public void setPID(BigDecimal pID) 
	{
		this.pID = pID;
	}

	public BigDecimal getPID() 
	{
		return pID;
	}
	public void setSORT(BigDecimal sORT) 
	{
		this.sORT = sORT;
	}

	public BigDecimal getSORT() 
	{
		return sORT;
	}
	public void setALEVEL(BigDecimal aLEVEL) 
	{
		this.aLEVEL = aLEVEL;
	}

	public BigDecimal getALEVEL() 
	{
		return aLEVEL;
	}
	@Transient
	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("iD", getID())
            .append("nAME", getNAME())
            .append("pID", getPID())
            .append("sORT", getSORT())
            .append("aLEVEL", getALEVEL())
            .append("pName", getpName())
            .toString();
    }
}
