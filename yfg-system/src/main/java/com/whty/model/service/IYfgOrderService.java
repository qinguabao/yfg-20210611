package com.whty.model.service;

import com.whty.model.domain.YfgOrder;
import java.util.List;

/**
 * 订单吸烟 服务层
 * 
 * @author mario
 * @date 2019-04-24
 */
public interface IYfgOrderService 
{
	/**
     * 查询订单吸烟信息
     * 
     * @param id 订单吸烟ID
     * @return 订单吸烟信息
     */
	public YfgOrder selectYfgOrderById(Integer id);
	
	
	
	/*
	 * 设备编码 找出对应的订单
	 */
	
	public YfgOrder selectYfgOrderByDeviceId(String  DeviceId);
	
	
	/*
	 * 关闭抽烟室
	 */
	public void closeDevice(YfgOrder yfgOrder);
	
	
	public List<YfgOrder> useSomkeYesOrNo(YfgOrder yfgOrder);
	
	/**
     * 查询订单吸烟列表
     * 
     * @param yfgOrder 订单吸烟信息
     * @return 订单吸烟集合
     */
	public List<YfgOrder> selectYfgOrderList(YfgOrder yfgOrder);
	
	
	public List<YfgOrder> selectYfgOrderListToLeave(YfgOrder yfgOrder);
	
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
     * 删除订单吸烟信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgOrderByIds(String ids);
	
}
