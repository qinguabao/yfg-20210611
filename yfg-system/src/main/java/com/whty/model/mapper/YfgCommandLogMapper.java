package com.whty.model.mapper;

import com.whty.model.domain.YfgCommandLog;
import java.util.List;	

/**
 * 指令日志 数据层
 * 
 * @author mario
 * @date 2019-06-15
 */
public interface YfgCommandLogMapper 
{
	/**
     * 查询指令日志信息
     * 
     * @param id 指令日志ID
     * @return 指令日志信息
     */
	public YfgCommandLog selectYfgCommandLogById(Integer id);
	
	/**
     * 查询指令日志列表
     * 
     * @param yfgCommandLog 指令日志信息
     * @return 指令日志集合
     */
	public List<YfgCommandLog> selectYfgCommandLogList(YfgCommandLog yfgCommandLog);
	
	/**
     * 新增指令日志
     * 
     * @param yfgCommandLog 指令日志信息
     * @return 结果
     */
	public int insertYfgCommandLog(YfgCommandLog yfgCommandLog);
	
	/**
     * 修改指令日志
     * 
     * @param yfgCommandLog 指令日志信息
     * @return 结果
     */
	public int updateYfgCommandLog(YfgCommandLog yfgCommandLog);
	
	/**
     * 删除指令日志
     * 
     * @param id 指令日志ID
     * @return 结果
     */
	public int deleteYfgCommandLogById(Integer id);
	
	/**
     * 批量删除指令日志
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteYfgCommandLogByIds(String[] ids);
	
}