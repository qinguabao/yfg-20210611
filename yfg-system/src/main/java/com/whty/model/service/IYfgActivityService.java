package com.whty.model.service;

import com.whty.model.domain.YfgActivity;
import com.yfg.common.utils.MsgJson;

import java.util.List;

/**
 * 活动 服务层
 * 
 * @author mario
 * @date 2019-08-06
 */
public interface IYfgActivityService 
{
	
	
	/*
	 * 获取活动商品列表
	 */
	/*
	 * 套餐列表
	 */
	public MsgJson getActivityList();
	
	
	/**
     * 查询活动信息
     * 
     * @param id 活动ID
     * @return 活动信息
     */
	public YfgActivity selectYfgActivityById(Integer id);
	
	/**
     * 查询活动列表
     * 
     * @param yfgActivity 活动信息
     * @return 活动集合
     */
	public List<YfgActivity> selectYfgActivityList(YfgActivity yfgActivity);
	
	/**
     * 新增活动
     * 
     * @param yfgActivity 活动信息
     * @return 结果
     */
	public int insertYfgActivity(YfgActivity yfgActivity);
	
	/**
     * 修改活动
     * 
     * @param yfgActivity 活动信息
     * @return 结果
     */
	public int updateYfgActivity(YfgActivity yfgActivity);
		
	/**
     * 删除活动信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgActivityByIds(String ids);
	
}
