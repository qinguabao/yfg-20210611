package com.whty.model.mapper;

import com.whty.model.domain.YfgOrder;
import java.util.List;	

/**
 * 订单吸烟 数据层
 * 
 * @author mario
 * @date 2019-04-24
 */
public interface YfgOrderMapper 
{
	/**
     * 查询订单吸烟信息
     * 
     * @param id 订单吸烟ID
     * @return 订单吸烟信息
     */
	public YfgOrder selectYfgOrderById(Integer id);
	
	/**
     * 查询订单吸烟列表
     * 
     * @param yfgOrder 订单吸烟信息
     * @return 订单吸烟集合
     */
	public List<YfgOrder> selectYfgOrderList(YfgOrder yfgOrder);
	
	
	/*
	 * 超时 不出吸烟室的人 短信提醒出门
	 */
	public List<YfgOrder>  selectYfgOrderListToLeave(YfgOrder yfgOrder);
	
	/*
	 * 找出设备最新的订单
	 * 并且endTime is null
	 */
	public List<YfgOrder> selectYfgOrderListByUpdateDate(YfgOrder yfgOrder);
	
	/**
     * 新增订单吸烟
     * 
     * @param yfgOrder 订单吸烟信息
     * @return 结果
     */
	public int insertYfgOrder(YfgOrder yfgOrder);
	
	/**
     * 修改订单吸烟
     * 
     * @param yfgOrder 订单吸烟信息
     * @return 结果
     */
	public int updateYfgOrder(YfgOrder yfgOrder);
	
	/**
     * 删除订单吸烟
     * 
     * @param id 订单吸烟ID
     * @return 结果
     */
	public int deleteYfgOrderById(Integer id);
	
	/**
     * 批量删除订单吸烟
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgOrderByIds(String[] ids);
	
}