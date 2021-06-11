package com.whty.model.service;

import com.whty.model.domain.YfgVerifcodeMobile;
import java.util.List;

/**
 * 短信验证码 服务层
 * 
 * @author mario
 * @date 2019-04-25
 */
public interface IYfgVerifcodeMobileService 
{
	/**
     * 查询短信验证码信息
     * 
     * @param id 短信验证码ID
     * @return 短信验证码信息
     */
	public YfgVerifcodeMobile selectYfgVerifcodeMobileById(Integer id);
	
	public boolean Verification(String loginname,String smscode);
	
	public boolean Verification(String loginname);
	
	public boolean VerificationByOpneid(String openId);
	
	/**
     * 查询短信验证码列表
     * 
     * @param yfgVerifcodeMobile 短信验证码信息
     * @return 短信验证码集合
     */
	public List<YfgVerifcodeMobile> selectYfgVerifcodeMobileList(YfgVerifcodeMobile yfgVerifcodeMobile);
	
	/**
     * 新增短信验证码
     * 
     * @param yfgVerifcodeMobile 短信验证码信息
     * @return 结果
     */
	public int insertYfgVerifcodeMobile(YfgVerifcodeMobile yfgVerifcodeMobile);
	
	/**
     * 修改短信验证码
     * 
     * @param yfgVerifcodeMobile 短信验证码信息
     * @return 结果
     */
	public int updateYfgVerifcodeMobile(YfgVerifcodeMobile yfgVerifcodeMobile);
		
	/**
     * 删除短信验证码信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgVerifcodeMobileByIds(String ids);
	
}
