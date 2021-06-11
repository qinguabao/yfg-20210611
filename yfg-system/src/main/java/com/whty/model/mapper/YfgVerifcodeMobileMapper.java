package com.whty.model.mapper;

import com.whty.model.domain.YfgVerifcodeMobile;
import java.util.List;	

/**
 * 短信验证码 数据层
 * 
 * @author mario
 * @date 2019-04-25
 */
public interface YfgVerifcodeMobileMapper 
{
	/**
     * 查询短信验证码信息
     * 
     * @param id 短信验证码ID
     * @return 短信验证码信息
     */
	public YfgVerifcodeMobile selectYfgVerifcodeMobileById(Integer id);
	
	/**
     * 查询短信验证码列表
     * 
     * @param yfgVerifcodeMobile 短信验证码信息
     * @return 短信验证码集合
     */
	public List<YfgVerifcodeMobile> selectYfgVerifcodeMobileList(YfgVerifcodeMobile yfgVerifcodeMobile);
	
	
	public List<YfgVerifcodeMobile> selectYfgVerifcodeMobileListOrderByCreateDate(YfgVerifcodeMobile yfgVerifcodeMobile);
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
     * 删除短信验证码
     * 
     * @param id 短信验证码ID
     * @return 结果
     */
	public int deleteYfgVerifcodeMobileById(Integer id);
	
	/**
     * 批量删除短信验证码
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgVerifcodeMobileByIds(String[] ids);
	
}