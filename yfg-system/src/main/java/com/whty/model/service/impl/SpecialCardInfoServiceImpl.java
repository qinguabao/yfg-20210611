package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.SpecialCardInfoMapper;
import com.whty.model.domain.SpecialCardInfo;
import com.whty.model.service.ISpecialCardInfoService;
import com.yfg.common.core.text.Convert;

/**
 * 优惠卡 服务层实现
 * 
 * @author mario
 * @date 2019-03-22
 */
@Service
public class SpecialCardInfoServiceImpl implements ISpecialCardInfoService 
{
	@Autowired
	private SpecialCardInfoMapper specialCardInfoMapper;

	/**
     * 查询优惠卡信息
     * 
     * @param id 优惠卡ID
     * @return 优惠卡信息
     */
    @Override
	public SpecialCardInfo selectSpecialCardInfoById(Integer id)
	{
	    return specialCardInfoMapper.selectSpecialCardInfoById(id);
	}
	
	/**
     * 查询优惠卡列表
     * 
     * @param specialCardInfo 优惠卡信息
     * @return 优惠卡集合
     */
	@Override
	public List<SpecialCardInfo> selectSpecialCardInfoList(SpecialCardInfo specialCardInfo)
	{
	    return specialCardInfoMapper.selectSpecialCardInfoList(specialCardInfo);
	}
	
    /**
     * 新增优惠卡
     * 
     * @param specialCardInfo 优惠卡信息
     * @return 结果
     */
	@Override
	public int insertSpecialCardInfo(SpecialCardInfo specialCardInfo)
	{
	    return specialCardInfoMapper.insertSpecialCardInfo(specialCardInfo);
	}
	
	/**
     * 修改优惠卡
     * 
     * @param specialCardInfo 优惠卡信息
     * @return 结果
     */
	@Override
	public int updateSpecialCardInfo(SpecialCardInfo specialCardInfo)
	{
	    return specialCardInfoMapper.updateSpecialCardInfo(specialCardInfo);
	}

	/**
     * 删除优惠卡对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteSpecialCardInfoByIds(String ids)
	{
		return specialCardInfoMapper.deleteSpecialCardInfoByIds(Convert.toStrArray(ids));
	}
	
}
