package com.whty.model.service;

import com.whty.model.domain.YfgActivityOrder;
import java.util.List;

/**
 * 活动商品订单 服务层
 * 
 * @author mario
 * @date 2019-08-06
 */
public interface IYfgActivityOrderService 
{
	/**
     * 查询活动商品订单信息
     * 
     * @param id 活动商品订单ID
     * @return 活动商品订单信息
     */
	public YfgActivityOrder selectYfgActivityOrderById(Integer id);
	
	/**
     * 查询活动商品订单列表
     * 
     * @param yfgActivityOrder 活动商品订单信息
     * @return 活动商品订单集合
     */
	public List<YfgActivityOrder> selectYfgActivityOrderList(YfgActivityOrder yfgActivityOrder);
	
	/**
     * 新增活动商品订单
     * 
     * @param yfgActivityOrder 活动商品订单信息
     * @return 结果
     */
	public int insertYfgActivityOrder(YfgActivityOrder yfgActivityOrder);
	
	/**
     * 修改活动商品订单
     * 
     * @param yfgActivityOrder 活动商品订单信息
     * @return 结果
     */
	public int updateYfgActivityOrder(YfgActivityOrder yfgActivityOrder);
		
	/**
     * 删除活动商品订单信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgActivityOrderByIds(String ids);
	
}
