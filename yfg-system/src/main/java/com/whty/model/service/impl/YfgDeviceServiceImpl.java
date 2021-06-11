package com.whty.model.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.YfgDeviceMapper;
import com.whty.model.domain.YfgDevice;
import com.whty.model.service.IYfgDeviceService;
import com.yfg.common.core.text.Convert;

/**
 * 设备 服务层实现
 * 
 * @author mario
 * @date 2019-04-19
 */
@Service
public class YfgDeviceServiceImpl implements IYfgDeviceService 
{
	@Autowired
	private YfgDeviceMapper yfgDeviceMapper;

	/**
     * 查询设备信息
     * 
     * @param id 设备ID
     * @return 设备信息
     */
    @Override
	public YfgDevice selectYfgDeviceById(Integer id)
	{
	    return yfgDeviceMapper.selectYfgDeviceById(id);
	}

	public String selectDeviceByDeptId(Long deptId){

    	String ids = "select device_id from  yfg_device where dept_id ='"+deptId+"'";
    	return ids;

	}
	
	/**
     * 查询设备列表
     * 
     * @param yfgDevice 设备信息
     * @return 设备集合
     */
	@Override
	public List<YfgDevice> selectYfgDeviceList(YfgDevice yfgDevice)
	{
	    return yfgDeviceMapper.selectYfgDeviceList(yfgDevice);
	}
	
	@Override
	public String[] selectNumByCityCode(YfgDevice yfgDevice) {
		return yfgDeviceMapper.selectNumByCityCode(yfgDevice);
	}
	
    /**
     * 新增设备
     * 
     * @param yfgDevice 设备信息
     * @return 结果
     */
	@Override
	public int insertYfgDevice(YfgDevice yfgDevice)
	{
		yfgDevice.setCreateDate(new Date());
		yfgDevice.setUpdateDate(new Date());
	    return yfgDeviceMapper.insertYfgDevice(yfgDevice);
	}
	
	/**
     * 修改设备
     * 
     * @param yfgDevice 设备信息
     * @return 结果
     */
	@Override
	public int updateYfgDevice(YfgDevice yfgDevice)
	{
		yfgDevice.setUpdateDate(new Date());
	    return yfgDeviceMapper.updateYfgDevice(yfgDevice);
	}

	/**
     * 删除设备对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgDeviceByIds(String ids)
	{
		return yfgDeviceMapper.deleteYfgDeviceByIds(Convert.toStrArray(ids));
	}

	@Override
	public YfgDevice selectYfgDeviceByDeviceId(String deviceId) {
		return yfgDeviceMapper.selectYfgDeviceByDeviceId(deviceId);
	}
	
}
