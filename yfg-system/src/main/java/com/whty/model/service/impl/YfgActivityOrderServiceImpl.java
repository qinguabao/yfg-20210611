package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.YfgActivityOrderMapper;
import com.whty.model.domain.YfgActivityOrder;
import com.whty.model.service.IYfgActivityOrderService;
import com.yfg.common.core.text.Convert;

/**
 * 活动商品订单 服务层实现
 * 
 * @author mario
 * @date 2019-08-06
 */
@Service
public class YfgActivityOrderServiceImpl implements IYfgActivityOrderService 
{
	@Autowired
	private YfgActivityOrderMapper yfgActivityOrderMapper;

	/**
     * 查询活动商品订单信息
     * 
     * @param id 活动商品订单ID
     * @return 活动商品订单信息
     */
    @Override
	public YfgActivityOrder selectYfgActivityOrderById(Integer id)
	{
	    return yfgActivityOrderMapper.selectYfgActivityOrderById(id);
	}
	
	/**
     * 查询活动商品订单列表
     * 
     * @param yfgActivityOrder 活动商品订单信息
     * @return 活动商品订单集合
     */
	@Override
	public List<YfgActivityOrder> selectYfgActivityOrderList(YfgActivityOrder yfgActivityOrder)
	{
	    return yfgActivityOrderMapper.selectYfgActivityOrderList(yfgActivityOrder);
	}
	
    /**
     * 新增活动商品订单
     * 
     * @param yfgActivityOrder 活动商品订单信息
     * @return 结果
     */
	@Override
	public int insertYfgActivityOrder(YfgActivityOrder yfgActivityOrder)
	{
	    return yfgActivityOrderMapper.insertYfgActivityOrder(yfgActivityOrder);
	}
	
	/**
     * 修改活动商品订单
     * 
     * @param yfgActivityOrder 活动商品订单信息
     * @return 结果
     */
	@Override
	public int updateYfgActivityOrder(YfgActivityOrder yfgActivityOrder)
	{
	    return yfgActivityOrderMapper.updateYfgActivityOrder(yfgActivityOrder);
	}

	/**
     * 删除活动商品订单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgActivityOrderByIds(String ids)
	{
		return yfgActivityOrderMapper.deleteYfgActivityOrderByIds(Convert.toStrArray(ids));
	}
	
}
