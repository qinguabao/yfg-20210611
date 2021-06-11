package com.whty.model.service;

import com.whty.model.domain.YfgWxToken;
import java.util.List;

/**
 * 微信token 服务层
 * 
 * @author mario
 * @date 2019-05-10
 */
public interface IYfgWxTokenService 
{
	/**
     * 查询微信token信息
     * 
     * @param id 微信tokenID
     * @return 微信token信息
     */
	public YfgWxToken selectYfgWxTokenById(Integer id);
	
	/**
     * 查询微信token列表
     * 
     * @param yfgWxToken 微信token信息
     * @return 微信token集合
     */
	public List<YfgWxToken> selectYfgWxTokenList(YfgWxToken yfgWxToken);
	
	/**
     * 新增微信token
     * 
     * @param yfgWxToken 微信token信息
     * @return 结果
     */
	public int insertYfgWxToken(YfgWxToken yfgWxToken);
	
	/**
     * 修改微信token
     * 
     * @param yfgWxToken 微信token信息
     * @return 结果
     */
	public int updateYfgWxToken(YfgWxToken yfgWxToken);
		
	/**
     * 删除微信token信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgWxTokenByIds(String ids);
	
}
