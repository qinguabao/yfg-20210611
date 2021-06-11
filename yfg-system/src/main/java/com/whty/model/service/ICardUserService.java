package com.whty.model.service;

import com.whty.model.domain.CardUser;
import java.util.List;
import java.util.Map;

/**
 * 制卡 服务层
 * 
 * @author mario
 * @date 2019-03-25
 */
public interface ICardUserService 
{
	/**
     * 查询制卡信息
     * 
     * @param id 制卡ID
     * @return 制卡信息
     */
	public CardUser selectCardUserById(Integer id);
	
	/**
     * 查询制卡列表
     * 
     * @param cardUser 制卡信息
     * @return 制卡集合
     */
	public List<CardUser> selectCardUserList(CardUser cardUser);
	
	
	public List<Map> selectCardUserInfo(Map map);	
	/**
     * 新增制卡
     * 
     * @param cardUser 制卡信息
     * @return 结果
     */
	public int insertCardUser(CardUser cardUser);
	
	/**
     * 修改制卡
     * 
     * @param cardUser 制卡信息
     * @return 结果
     */
	public int updateCardUser(CardUser cardUser);
	
	/**
     * 修改制卡
     * 
     * @param cardUser 根据订单号修改制卡信息
     * @return 结果
     */
	public int updateOrderCode(CardUser cardUser);
		
	/**
     * 删除制卡信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteCardUserByIds(String ids);
	
	/**
	 * 通过图片路径下载图片
	 * @param cardUser
	 */
	public void exportFile(CardUser cardUser);
}
