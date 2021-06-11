package com.whty.model.service;

import com.whty.model.domain.SpecialCardInfo;
import java.util.List;

/**
 * 优惠卡 服务层
 * 
 * @author mario
 * @date 2019-03-22
 */
public interface ISpecialCardInfoService 
{
	/**
     * 查询优惠卡信息
     * 
     * @param id 优惠卡ID
     * @return 优惠卡信息
     */
	public SpecialCardInfo selectSpecialCardInfoById(Integer id);
	
	/**
     * 查询优惠卡列表
     * 
     * @param specialCardInfo 优惠卡信息
     * @return 优惠卡集合
     */
	public List<SpecialCardInfo> selectSpecialCardInfoList(SpecialCardInfo specialCardInfo);
	
	/**
     * 新增优惠卡
     * 
     * @param specialCardInfo 优惠卡信息
     * @return 结果
     */
	public int insertSpecialCardInfo(SpecialCardInfo specialCardInfo);
	
	/**
     * 修改优惠卡
     * 
     * @param specialCardInfo 优惠卡信息
     * @return 结果
     */
	public int updateSpecialCardInfo(SpecialCardInfo specialCardInfo);
		
	/**
     * 删除优惠卡信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteSpecialCardInfoByIds(String ids);
	
}
