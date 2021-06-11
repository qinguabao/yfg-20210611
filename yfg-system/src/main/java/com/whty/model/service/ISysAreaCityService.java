package com.whty.model.service;

import com.whty.model.domain.SysAreaCity;
import java.util.List;

/**
 * 地区据字典 服务层
 * 
 * @author mario
 * @date 2019-03-22
 */
public interface ISysAreaCityService 
{
	/**
     * 查询地区据字典信息
     * 
     * @param iD 地区据字典ID
     * @return 地区据字典信息
     */
	public SysAreaCity selectSysAreaCityById(Integer iD);
	
	/**
     * 查询地区据字典列表
     * 
     * @param sysAreaCity 地区据字典信息
     * @return 地区据字典集合
     */
	public List<SysAreaCity> selectSysAreaCityList(SysAreaCity sysAreaCity);
	
	/**
     * 新增地区据字典
     * 
     * @param sysAreaCity 地区据字典信息
     * @return 结果
     */
	public int insertSysAreaCity(SysAreaCity sysAreaCity);
	
	/**
     * 修改地区据字典
     * 
     * @param sysAreaCity 地区据字典信息
     * @return 结果
     */
	public int updateSysAreaCity(SysAreaCity sysAreaCity);
		
	/**
     * 删除地区据字典信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteSysAreaCityByIds(String ids);
	
}
