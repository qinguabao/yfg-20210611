package com.whty.model.service;

import com.whty.model.domain.YfgVerifcode;
import java.util.List;

/**
 * 图文验证码 服务层
 * 
 * @author mario
 * @date 2019-04-24
 */
public interface IYfgVerifcodeService 
{
	/**
     * 查询图文验证码信息
     * 
     * @param id 图文验证码ID
     * @return 图文验证码信息
     */
	public YfgVerifcode selectYfgVerifcodeById(Integer id);
	
	/**
     * 查询图文验证码列表
     * 
     * @param yfgVerifcode 图文验证码信息
     * @return 图文验证码集合
     */
	public List<YfgVerifcode> selectYfgVerifcodeList(YfgVerifcode yfgVerifcode);
	
	/**
     * 新增图文验证码
     * 
     * @param yfgVerifcode 图文验证码信息
     * @return 结果
     */
	public int insertYfgVerifcode(YfgVerifcode yfgVerifcode);
	
	/**
     * 修改图文验证码
     * 
     * @param yfgVerifcode 图文验证码信息
     * @return 结果
     */
	public int updateYfgVerifcode(YfgVerifcode yfgVerifcode);
		
	/**
     * 删除图文验证码信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgVerifcodeByIds(String ids);
	
}
