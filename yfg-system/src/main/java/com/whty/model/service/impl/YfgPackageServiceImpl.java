package com.whty.model.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.YfgPackageMapper;
import com.whty.model.domain.YfgPackage;
import com.whty.model.service.IYfgPackageService;
import com.yfg.common.core.text.Convert;

/**
 * 套餐 服务层实现
 * 
 * @author mario
 * @date 2019-04-24
 */
@Service
public class YfgPackageServiceImpl implements IYfgPackageService 
{
	@Autowired
	private YfgPackageMapper yfgPackageMapper;

	/**
     * 查询套餐信息
     * 
     * @param id 套餐ID
     * @return 套餐信息
     */
    @Override
	public YfgPackage selectYfgPackageById(Integer id)
	{
	    return yfgPackageMapper.selectYfgPackageById(id);
	}
	
	/**
     * 查询套餐列表
     * 
     * @param yfgPackage 套餐信息
     * @return 套餐集合
     */
	@Override
	public List<YfgPackage> selectYfgPackageList(YfgPackage yfgPackage)
	{
	    return yfgPackageMapper.selectYfgPackageList(yfgPackage);
	}
	
    /**
     * 新增套餐
     * 
     * @param yfgPackage 套餐信息
     * @return 结果
     */
	@Override
	public int insertYfgPackage(YfgPackage yfgPackage)
	{
		yfgPackage.setCreateDate(new Date());
		yfgPackage.setUpdateDate(new Date());
	    return yfgPackageMapper.insertYfgPackage(yfgPackage);
	}
	
	/**
     * 修改套餐
     * 
     * @param yfgPackage 套餐信息
     * @return 结果
     */
	@Override
	public int updateYfgPackage(YfgPackage yfgPackage)
	{
		yfgPackage.setUpdateDate(new Date());
	    return yfgPackageMapper.updateYfgPackage(yfgPackage);
	}

	/**
     * 删除套餐对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgPackageByIds(String ids)
	{
		return yfgPackageMapper.deleteYfgPackageByIds(Convert.toStrArray(ids));
	}
	
}
