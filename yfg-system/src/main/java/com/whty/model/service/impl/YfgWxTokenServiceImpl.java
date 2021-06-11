package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.YfgWxTokenMapper;
import com.whty.model.domain.YfgWxToken;
import com.whty.model.service.IYfgWxTokenService;
import com.yfg.common.core.text.Convert;

/**
 * 微信token 服务层实现
 * 
 * @author mario
 * @date 2019-05-10
 */
@Service
public class YfgWxTokenServiceImpl implements IYfgWxTokenService 
{
	@Autowired
	private YfgWxTokenMapper yfgWxTokenMapper;

	/**
     * 查询微信token信息
     * 
     * @param id 微信tokenID
     * @return 微信token信息
     */
    @Override
	public YfgWxToken selectYfgWxTokenById(Integer id)
	{
	    return yfgWxTokenMapper.selectYfgWxTokenById(id);
	}
	
	/**
     * 查询微信token列表
     * 
     * @param yfgWxToken 微信token信息
     * @return 微信token集合
     */
	@Override
	public List<YfgWxToken> selectYfgWxTokenList(YfgWxToken yfgWxToken)
	{
	    return yfgWxTokenMapper.selectYfgWxTokenList(yfgWxToken);
	}
	
    /**
     * 新增微信token
     * 
     * @param yfgWxToken 微信token信息
     * @return 结果
     */
	@Override
	public int insertYfgWxToken(YfgWxToken yfgWxToken)
	{
	    return yfgWxTokenMapper.insertYfgWxToken(yfgWxToken);
	}
	
	/**
     * 修改微信token
     * 
     * @param yfgWxToken 微信token信息
     * @return 结果
     */
	@Override
	public int updateYfgWxToken(YfgWxToken yfgWxToken)
	{
	    return yfgWxTokenMapper.updateYfgWxToken(yfgWxToken);
	}

	/**
     * 删除微信token对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgWxTokenByIds(String ids)
	{
		return yfgWxTokenMapper.deleteYfgWxTokenByIds(Convert.toStrArray(ids));
	}
	
}
