package com.whty.model.service;

import com.whty.model.domain.YfgPackage;
import java.util.List;

/**
 * 套餐 服务层
 * 
 * @author mario
 * @date 2019-04-24
 */
public interface IYfgPackageService 
{
	/**
     * 查询套餐信息
     * 
     * @param id 套餐ID
     * @return 套餐信息
     */
	public YfgPackage selectYfgPackageById(Integer id);
	
	/**
     * 查询套餐列表
     * 
     * @param yfgPackage 套餐信息
     * @return 套餐集合
     */
	public List<YfgPackage> selectYfgPackageList(YfgPackage yfgPackage);

	/*
	  根据设备渠道 id，获取其套餐信息
	 */
//	public List<YfgPackage> selectYfgPackageListByDeptId(Long deptId);
	
	/**
     * 新增套餐
     * 
     * @param yfgPackage 套餐信息
     * @return 结果
     */
	public int insertYfgPackage(YfgPackage yfgPackage);
	
	/**
     * 修改套餐
     * 
     * @param yfgPackage 套餐信息
     * @return 结果
     */
	public int updateYfgPackage(YfgPackage yfgPackage);
		
	/**
     * 删除套餐信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgPackageByIds(String ids);
	
}
