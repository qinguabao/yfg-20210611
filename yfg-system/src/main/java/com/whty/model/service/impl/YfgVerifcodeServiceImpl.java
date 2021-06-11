package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.YfgVerifcodeMapper;
import com.whty.model.domain.YfgVerifcode;
import com.whty.model.service.IYfgVerifcodeService;
import com.yfg.common.core.text.Convert;

/**
 * 图文验证码 服务层实现
 * 
 * @author mario
 * @date 2019-04-24
 */
@Service
public class YfgVerifcodeServiceImpl implements IYfgVerifcodeService 
{
	@Autowired
	private YfgVerifcodeMapper yfgVerifcodeMapper;

	/**
     * 查询图文验证码信息
     * 
     * @param id 图文验证码ID
     * @return 图文验证码信息
     */
    @Override
	public YfgVerifcode selectYfgVerifcodeById(Integer id)
	{
	    return yfgVerifcodeMapper.selectYfgVerifcodeById(id);
	}
	
	/**
     * 查询图文验证码列表
     * 
     * @param yfgVerifcode 图文验证码信息
     * @return 图文验证码集合
     */
	@Override
	public List<YfgVerifcode> selectYfgVerifcodeList(YfgVerifcode yfgVerifcode)
	{
	    return yfgVerifcodeMapper.selectYfgVerifcodeList(yfgVerifcode);
	}
	
    /**
     * 新增图文验证码
     * 
     * @param yfgVerifcode 图文验证码信息
     * @return 结果
     */
	@Override
	public int insertYfgVerifcode(YfgVerifcode yfgVerifcode)
	{
	    return yfgVerifcodeMapper.insertYfgVerifcode(yfgVerifcode);
	}
	
	/**
     * 修改图文验证码
     * 
     * @param yfgVerifcode 图文验证码信息
     * @return 结果
     */
	@Override
	public int updateYfgVerifcode(YfgVerifcode yfgVerifcode)
	{
	    return yfgVerifcodeMapper.updateYfgVerifcode(yfgVerifcode);
	}

	/**
     * 删除图文验证码对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgVerifcodeByIds(String ids)
	{
		return yfgVerifcodeMapper.deleteYfgVerifcodeByIds(Convert.toStrArray(ids));
	}
	
}
