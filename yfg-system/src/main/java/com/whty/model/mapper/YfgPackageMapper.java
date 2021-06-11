package com.whty.model.mapper;

import com.whty.model.domain.YfgPackage;
import java.util.List;	

/**
 * 套餐 数据层
 * 
 * @author mario
 * @date 2019-04-24
 */
public interface YfgPackageMapper 
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
     * 删除套餐
     * 
     * @param id 套餐ID
     * @return 结果
     */
	public int deleteYfgPackageById(Integer id);
	
	/**
     * 批量删除套餐
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgPackageByIds(String[] ids);
	
}