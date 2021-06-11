package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.YfgCommandLogMapper;
import com.whty.model.domain.YfgCommandLog;
import com.whty.model.service.IYfgCommandLogService;
import com.yfg.common.core.text.Convert;

/**
 * 指令日志 服务层实现
 * 
 * @author mario
 * @date 2019-06-15
 */
@Service
public class YfgCommandLogServiceImpl implements IYfgCommandLogService 
{
	@Autowired
	private YfgCommandLogMapper yfgCommandLogMapper;

	/**
     * 查询指令日志信息
     * 
     * @param id 指令日志ID
     * @return 指令日志信息
     */
    @Override
	public YfgCommandLog selectYfgCommandLogById(Integer id)
	{
	    return yfgCommandLogMapper.selectYfgCommandLogById(id);
	}
	
	/**
     * 查询指令日志列表
     * 
     * @param yfgCommandLog 指令日志信息
     * @return 指令日志集合
     */
	@Override
	public List<YfgCommandLog> selectYfgCommandLogList(YfgCommandLog yfgCommandLog)
	{
	    return yfgCommandLogMapper.selectYfgCommandLogList(yfgCommandLog);
	}
	
    /**
     * 新增指令日志
     * 
     * @param yfgCommandLog 指令日志信息
     * @return 结果
     */
	@Override
	public int insertYfgCommandLog(YfgCommandLog yfgCommandLog)
	{
	    return yfgCommandLogMapper.insertYfgCommandLog(yfgCommandLog);
	}
	
	/**
     * 修改指令日志
     * 
     * @param yfgCommandLog 指令日志信息
     * @return 结果
     */
	@Override
	public int updateYfgCommandLog(YfgCommandLog yfgCommandLog)
	{
	    return yfgCommandLogMapper.updateYfgCommandLog(yfgCommandLog);
	}

	/**
     * 删除指令日志对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgCommandLogByIds(String ids)
	{
		return yfgCommandLogMapper.deleteYfgCommandLogByIds(Convert.toStrArray(ids));
	}
	
}
