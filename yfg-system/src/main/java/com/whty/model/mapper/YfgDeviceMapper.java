package com.whty.model.mapper;

import com.whty.model.domain.YfgDevice;
import java.util.List;	

/**
 * 设备 数据层
 * 
 * @author mario
 * @date 2019-04-19
 */
public interface YfgDeviceMapper 
{
	/**
     * 查询设备信息
     * 
     * @param id 设备ID
     * @return 设备信息
     */
	public YfgDevice selectYfgDeviceById(Integer id);
	
	
	/*
	 * 设备物理编码 查询
	 */
	public YfgDevice selectYfgDeviceByDeviceId(String deviceId);
	
	
	/*
	 * 查询城市区域数量
	 */
	public String[] selectNumByCityCode(YfgDevice yfgDevice);
	
	/**
     * 查询设备列表
     * 
     * @param yfgDevice 设备信息
     * @return 设备集合
     */
	public List<YfgDevice> selectYfgDeviceList(YfgDevice yfgDevice);
	
	/**
     * 新增设备
     * 
     * @param yfgDevice 设备信息
     * @return 结果
     */
	public int insertYfgDevice(YfgDevice yfgDevice);
	
	/**
     * 修改设备
     * 
     * @param yfgDevice 设备信息
     * @return 结果
     */
	public int updateYfgDevice(YfgDevice yfgDevice);
	
	/**
     * 删除设备
     * 
     * @param id 设备ID
     * @return 结果
     */
	public int deleteYfgDeviceById(Integer id);
	
	/**
     * 批量删除设备
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgDeviceByIds(String[] ids);
	
}