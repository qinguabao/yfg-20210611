package com.whty.model.mapper;

import com.whty.model.domain.StationInfo;
import java.util.List;	

/**
 * 取货网点 数据层
 * 
 * @author mario
 * @date 2019-03-22
 */
public interface StationInfoMapper 
{
	/**
     * 查询取货网点信息
     * 
     * @param id 取货网点ID
     * @return 取货网点信息
     */
	public StationInfo selectStationInfoById(Integer id);
	
	/**
     * 查询取货网点列表
     * 
     * @param stationInfo 取货网点信息
     * @return 取货网点集合
     */
	public List<StationInfo> selectStationInfoList(StationInfo stationInfo);
	
	/**
     * 新增取货网点
     * 
     * @param stationInfo 取货网点信息
     * @return 结果
     */
	public int insertStationInfo(StationInfo stationInfo);
	
	/**
     * 修改取货网点
     * 
     * @param stationInfo 取货网点信息
     * @return 结果
     */
	public int updateStationInfo(StationInfo stationInfo);
	
	/**
     * 删除取货网点
     * 
     * @param id 取货网点ID
     * @return 结果
     */
	public int deleteStationInfoById(Integer id);
	
	/**
     * 批量删除取货网点
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteStationInfoByIds(String[] ids);
	
}