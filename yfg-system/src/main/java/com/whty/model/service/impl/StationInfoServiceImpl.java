package com.whty.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whty.model.mapper.StationInfoMapper;
import com.whty.model.mapper.SysAreaCityMapper;
import com.whty.model.domain.StationInfo;
import com.whty.model.service.IStationInfoService;
import com.yfg.system.domain.SysDictData;
import com.yfg.system.mapper.SysDictDataMapper;
import com.yfg.common.core.text.Convert;

/**
 * 取货网点 服务层实现
 * 
 * @author mario
 * @date 2019-03-22
 */
@Service
public class StationInfoServiceImpl implements IStationInfoService 
{
	@Autowired
	private StationInfoMapper stationInfoMapper;

	@Autowired
	private SysAreaCityMapper sysAreaCityMapper;
	
	@Autowired
	private SysDictDataMapper sysDictDataMapper;
	/**
     * 查询取货网点信息
     * 
     * @param id 取货网点ID
     * @return 取货网点信息
     */
    @Override
	public StationInfo selectStationInfoById(Integer id)
	{
	    return stationInfoMapper.selectStationInfoById(id);
	}
	
	/**
     * 查询取货网点列表
     * 
     * @param stationInfo 取货网点信息
     * @return 取货网点集合
     */
	@Override
	public List<StationInfo> selectStationInfoList(StationInfo stationInfo)
	{
		if(stationInfo.getStartTime()!=null&&!stationInfo.getStartTime().trim().equals("")){
			stationInfo.setStartTime(stationInfo.getStartTime()+" 00:00:00");
		}
		if(stationInfo.getEndTime()!=null&&!stationInfo.getEndTime().trim().equals("")){
			stationInfo.setEndTime(stationInfo.getEndTime()+" 23:59:59");
		}
		if(stationInfo.getStartUpdateTime()!=null&&!stationInfo.getStartUpdateTime().trim().equals("")){
			stationInfo.setStartUpdateTime(stationInfo.getStartUpdateTime()+" 00:00:00");
		}
		if(stationInfo.getEndUpdateTime()!=null&&!stationInfo.getEndUpdateTime().trim().equals("")){
			stationInfo.setEndUpdateTime(stationInfo.getEndUpdateTime()+" 23:59:59");
		}
		stationInfo.setDelFlag("0");
		List<StationInfo> list=stationInfoMapper.selectStationInfoList(stationInfo);
		if(list.size()>0){
			for(StationInfo s:list){
				String netAddress="";
				if(s.getProId()!=null&&!s.getProId().toString().trim().equals("")){
					netAddress+=sysAreaCityMapper.selectSysAreaCityById(s.getProId()).getNAME();
				}
				if(s.getCityId()!=null&&!s.getCityId().toString().trim().equals("")){
					netAddress+=sysAreaCityMapper.selectSysAreaCityById(s.getCityId()).getNAME();
				}
				if(s.getCountyId()!=null&&!s.getCountyId().toString().trim().equals("")){
					netAddress+=sysAreaCityMapper.selectSysAreaCityById(s.getCountyId()).getNAME();
				}
				if(s.getStationStatus()!=null&&!s.getStationStatus().trim().equals("")){
					SysDictData sysDictData=new SysDictData();
			    	sysDictData.setDictType("col_station_status");
			    	sysDictData.setDictValue(s.getStationStatus());
			    	s.setStationStatus(sysDictDataMapper.selectDictDataList(sysDictData).get(0).getDictLabel());
				}
				s.setNetAddress(netAddress);
			}
		}
	    return list;
	}
	
    /**
     * 新增取货网点
     * 
     * @param stationInfo 取货网点信息
     * @return 结果
     */
	@Override
	public int insertStationInfo(StationInfo stationInfo)
	{
	    return stationInfoMapper.insertStationInfo(stationInfo);
	}
	
	/**
     * 修改取货网点
     * 
     * @param stationInfo 取货网点信息
     * @return 结果
     */
	@Override
	public int updateStationInfo(StationInfo stationInfo)
	{
	    return stationInfoMapper.updateStationInfo(stationInfo);
	}

	/**
     * 删除取货网点对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteStationInfoByIds(String ids)
	{
		return stationInfoMapper.deleteStationInfoByIds(Convert.toStrArray(ids));
	}
	
}
