package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.SysAreaCityMapper;
import com.whty.model.domain.SysAreaCity;
import com.whty.model.service.ISysAreaCityService;
import com.yfg.common.core.text.Convert;

/**
 * 地区据字典 服务层实现
 * 
 * @author mario
 * @date 2019-03-22
 */
@Service
public class SysAreaCityServiceImpl implements ISysAreaCityService 
{
	@Autowired
	private SysAreaCityMapper sysAreaCityMapper;

	/**
     * 查询地区据字典信息
     * 
     * @param iD 地区据字典ID
     * @return 地区据字典信息
     */
    @Override
	public SysAreaCity selectSysAreaCityById(Integer iD)
	{
	    return sysAreaCityMapper.selectSysAreaCityById(iD);
	}
	
	/**
     * 查询地区据字典列表
     * 
     * @param sysAreaCity 地区据字典信息
     * @return 地区据字典集合
     */
	@Override
	public List<SysAreaCity> selectSysAreaCityList(SysAreaCity sysAreaCity)
	{
		List<SysAreaCity> list=sysAreaCityMapper.selectSysAreaCityList(sysAreaCity);
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				SysAreaCity s=list.get(i);
				if(s.getPID()!=null&&!s.getPID().toString().trim().equals("0")){
					//用pName接收成功，但是无法返回到页面
					s.setUpdateBy(sysAreaCityMapper.selectSysAreaCityById(Integer.parseInt(s.getPID()+"")).getNAME());
				}else{
					s.setUpdateBy("");
				}
				list.set(i, s);
			}
		}
	    return list;
	}
	
    /**
     * 新增地区据字典
     * 
     * @param sysAreaCity 地区据字典信息
     * @return 结果
     */
	@Override
	public int insertSysAreaCity(SysAreaCity sysAreaCity)
	{
	    return sysAreaCityMapper.insertSysAreaCity(sysAreaCity);
	}
	
	/**
     * 修改地区据字典
     * 
     * @param sysAreaCity 地区据字典信息
     * @return 结果
     */
	@Override
	public int updateSysAreaCity(SysAreaCity sysAreaCity)
	{
	    return sysAreaCityMapper.updateSysAreaCity(sysAreaCity);
	}

	/**
     * 删除地区据字典对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteSysAreaCityByIds(String ids)
	{
		return sysAreaCityMapper.deleteSysAreaCityByIds(Convert.toStrArray(ids));
	}
	
}
