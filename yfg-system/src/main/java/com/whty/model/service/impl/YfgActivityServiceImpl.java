package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.YfgActivityMapper;
import com.whty.model.domain.YfgActivity;
import com.whty.model.domain.YfgPackage;
import com.whty.model.service.IYfgActivityService;
import com.yfg.common.config.Global;
import com.yfg.common.core.text.Convert;
import com.yfg.common.utils.MsgJson;

/**
 * 活动 服务层实现
 * 
 * @author mario
 * @date 2019-08-06
 */
@Service
public class YfgActivityServiceImpl implements IYfgActivityService 
{
	@Autowired
	private YfgActivityMapper yfgActivityMapper;

	/**
     * 查询活动信息
     * 
     * @param id 活动ID
     * @return 活动信息
     */
    @Override
	public YfgActivity selectYfgActivityById(Integer id)
	{
	    return yfgActivityMapper.selectYfgActivityById(id);
	}
	
	/**
     * 查询活动列表
     * 
     * @param yfgActivity 活动信息
     * @return 活动集合
     */
	@Override
	public List<YfgActivity> selectYfgActivityList(YfgActivity yfgActivity)
	{
	    return yfgActivityMapper.selectYfgActivityList(yfgActivity);
	}
	
    /**
     * 新增活动
     * 
     * @param yfgActivity 活动信息
     * @return 结果
     */
	@Override
	public int insertYfgActivity(YfgActivity yfgActivity)
	{
	    return yfgActivityMapper.insertYfgActivity(yfgActivity);
	}
	
	/**
     * 修改活动
     * 
     * @param yfgActivity 活动信息
     * @return 结果
     */
	@Override
	public int updateYfgActivity(YfgActivity yfgActivity)
	{
	    return yfgActivityMapper.updateYfgActivity(yfgActivity);
	}

	/**
     * 删除活动对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgActivityByIds(String ids)
	{
		return yfgActivityMapper.deleteYfgActivityByIds(Convert.toStrArray(ids));
	}

	@Override
	public MsgJson getActivityList() {
		MsgJson json = new MsgJson();
		json.setCode("0");
		json.setMsg("获取活动商品信息成功");
		YfgActivity yfgActivity = null;
		List<YfgActivity> YfgActivity = selectYfgActivityList(yfgActivity);
		if(YfgActivity!=null&&YfgActivity.size()>0) {
			for(YfgActivity yfgAc:YfgActivity) {
				if(yfgAc.getActivityGoodsImg()!=null&&!"".equals(yfgAc.getActivityGoodsImg())) {
					yfgAc.setActivityGoodsImg(Global.getActivity_pfr()+yfgAc.getActivityGoodsImg());
				}
				if(yfgAc.getActivityImgOne()!=null&&!"".equals(yfgAc.getActivityImgOne())) {
					yfgAc.setActivityImgOne(Global.getActivity_pfr()+yfgAc.getActivityImgOne());
				}
				if(yfgAc.getActivityImgTwo()!=null&&!"".equals(yfgAc.getActivityImgTwo())) {
					yfgAc.setActivityImgTwo(Global.getActivity_pfr()+yfgAc.getActivityImgTwo());
				}
				
			}
			
			json.setData(YfgActivity);
		}else {
			json.setCode("1");
			json.setMsg("没有配置活动信息");
		}
		return json;
	}
	
}
