package com.whty.model.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.whty.model.mapper.YfgDeviceMapper;
import com.whty.model.mapper.YfgOrderMapper;
import com.whty.model.domain.YfgDevice;
import com.whty.model.domain.YfgOrder;
import com.whty.model.service.IYfgDeviceService;
import com.whty.model.service.IYfgOrderService;
import com.yfg.common.core.text.Convert;

/**
 * 订单吸烟 服务层实现
 * 
 * @author mario
 * @date 2019-04-24
 */
@Service
public class YfgOrderServiceImpl implements IYfgOrderService 
{
	@Autowired
	private YfgOrderMapper yfgOrderMapper;
	@Autowired
	private IYfgDeviceService yfgDeviceService;
	@Autowired
	private YfgDeviceMapper yfgDeviceMapper;

	/**
     * 查询订单吸烟信息
     * 
     * @param id 订单吸烟ID
     * @return 订单吸烟信息
     */
    @Override
	public YfgOrder selectYfgOrderById(Integer id)
	{
	    return yfgOrderMapper.selectYfgOrderById(id);
	}
	
	/**
     * 查询订单吸烟列表
     * 
     * @param yfgOrder 订单吸烟信息
     * @return 订单吸烟集合
     */
	@Override
	public List<YfgOrder> selectYfgOrderList(YfgOrder yfgOrder)
	{
		yfgOrder.setDelFlag("0");
	    return yfgOrderMapper.selectYfgOrderList(yfgOrder);
	}
	
	@Override
	public List<YfgOrder> selectYfgOrderListToLeave(YfgOrder yfgOrder)
	{
		yfgOrder.setDelFlag("0");
	    return yfgOrderMapper.selectYfgOrderListToLeave(yfgOrder);
	}
	
	
    /**
     * 新增订单吸烟
     * 
     * @param yfgOrder 订单吸烟信息
     * @return 结果
     */
	@Override
	public int insertYfgOrder(YfgOrder yfgOrder)
	{
		yfgOrder.setDelFlag("0");
	    return yfgOrderMapper.insertYfgOrder(yfgOrder);
	}
	
	/**
     * 修改订单吸烟
     * 
     * @param yfgOrder 订单吸烟信息
     * @return 结果
     */
	@Override
	public int updateYfgOrder(YfgOrder yfgOrder)
	{
	    return yfgOrderMapper.updateYfgOrder(yfgOrder);
	}

	/**
     * 删除订单吸烟对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgOrderByIds(String ids)
	{
		return yfgOrderMapper.deleteYfgOrderByIds(Convert.toStrArray(ids));
	}

	@Override
	public YfgOrder selectYfgOrderByDeviceId(String DeviceId) {
		
		YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(DeviceId);
		if(yfgDevice==null) {
			return null;
		}
		YfgOrder yfgOrder = new YfgOrder();
		yfgOrder.setDeviceId(DeviceId);
		yfgOrder.setEndTime(null);
		List<YfgOrder> list = yfgOrderMapper.selectYfgOrderListByUpdateDate(yfgOrder);
		if(list!=null&&list.size()>0) {
			return list.get(0);
		}else {
			return null;
		}
	}

	@Override
	public void closeDevice(YfgOrder yfgOrder) {
		
		yfgOrder.setEndTime(new Date());
		yfgOrder.setUpdateTime(new Date());
		yfgOrder.setStatus("6");
		yfgOrderMapper.updateYfgOrder(yfgOrder);
		
		YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceByDeviceId(yfgOrder.getDeviceId());
		yfgDevice.setStatus("0");  //（0，关闭，1，使用中,2 订单时间结束了，用户还未出来） */	
		yfgDevice.setCloseDeviceTime(new Date());
		yfgDevice.setUpdateDate(new Date());
		yfgDeviceMapper.updateYfgDevice(yfgDevice);
		
		
	}
	
	@Override
	public List<YfgOrder> useSomkeYesOrNo(YfgOrder yfgOrder) {
				
		yfgOrder.setStatus("3");//使用中
		
		List<YfgOrder> list = yfgOrderMapper.selectYfgOrderList(yfgOrder);
		return list;

	}
	
}
