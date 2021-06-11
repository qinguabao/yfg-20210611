package com.whty.model.domain;

import com.yfg.common.annotation.Excel;
import com.yfg.system.domain.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yfg.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 套餐表 yfg_package
 * 
 * @author mario
 * @date 2019-04-24
 */
public class YfgPackage extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 套餐名称 */
	private String name;
	/** 套餐时间 */
	private Integer useTime;
	/** 套餐金额 */
	private String useMoney;
	/** 创建时间 */
	private Date createDate;
	/** 更新时间 */
	private Date updateDate;
	/** 是否删除1删除，0正常 */
	private String delFlag;
	/** 套餐说明 */
	private String useDescri;
	/** 备注 */
	private String remarks;

	private Long  deptId;  //所属商户
	/** 部门对象 */
	@Excel(name = "部门名称", targetAttr = "deptName", type = Excel.Type.EXPORT)
	private SysDept dept;
	public SysDept getDept()
	{
		if (dept == null)
		{
			dept = new SysDept();
		}
		return dept;
	}


	public void setDept(SysDept dept)
	{
		this.dept = dept;
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setName(String name) 
	{
		this.name = name;
	}

	public String getName() 
	{
		return name;
	}
	public void setUseTime(Integer useTime) 
	{
		this.useTime = useTime;
	}

	public Integer getUseTime() 
	{
		return useTime;
	}
	
	
	public String getUseMoney() {
		return useMoney;
	}

	public void setUseMoney(String useMoney) {
		this.useMoney = useMoney;
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
	public void setDelFlag(String delFlag) 
	{
		this.delFlag = delFlag;
	}

	public String getDelFlag() 
	{
		return delFlag;
	}
	public void setUseDescri(String useDescri) 
	{
		this.useDescri = useDescri;
	}

	public String getUseDescri() 
	{
		return useDescri;
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
            .append("name", getName())
            .append("useTime", getUseTime())
            .append("useMoney", getUseMoney())
            .append("createDate", getCreateDate())
            .append("updateDate", getUpdateDate())
            .append("delFlag", getDelFlag())
            .append("useDescri", getUseDescri())
            .append("remarks", getRemarks())
            .toString();
    }
}
