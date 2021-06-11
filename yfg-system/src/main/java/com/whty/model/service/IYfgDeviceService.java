package com.whty.model.service;

import com.whty.model.domain.YfgDevice;
import java.util.List;

/**
 * 设备 服务层
 * 
 * @author mario
 * @date 2019-04-19
 */
public interface IYfgDeviceService 
{
	/**
     * 查询设备信息
     * 
     * @param id 设备ID
     * @return 设备信息
     */
	public YfgDevice selectYfgDeviceById(Integer id);


	public String selectDeviceByDeptId(Long deptId);
	
	
	/*
	 * 设备物理编码 查询
	 */
	public YfgDevice selectYfgDeviceByDeviceId(String deviceId);
	
	/**
     * 查询设备列表
     * 
     * @param yfgDevice 设备信息
     * @return 设备集合
     */
	public List<YfgDevice> selectYfgDeviceList(YfgDevice yfgDevice);
	
	
	public String[] selectNumByCityCode(YfgDevice yfgDevice);
	
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
     * 删除设备信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgDeviceByIds(String ids);
	
}
