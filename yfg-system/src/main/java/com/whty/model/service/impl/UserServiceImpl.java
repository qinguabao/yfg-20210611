package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.UserMapper;
import com.whty.model.domain.User;
import com.whty.model.service.IUserService;
import com.yfg.common.core.text.Convert;

/**
 * 前台用户 服务层实现
 * 
 * @author mario
 * @date 2019-03-25
 */
@Service
public class UserServiceImpl implements IUserService 
{
	@Autowired
	private UserMapper userMapper;

	/**
     * 查询前台用户信息
     * 
     * @param id 前台用户ID
     * @return 前台用户信息
     */
    @Override
	public User selectUserById(Integer id)
	{
	    return userMapper.selectUserById(id);
	}
	/**
     * 查询前台用户信息
     * 
     * @param  前台用户openId
     * @return 前台用户信息
     */
    @Override
	public List<User> selectUserByOpenId(String  openId)
	{
	    return userMapper.selectUserByOpenId(openId);
	}

	public List<User> selectUserByAppletsOpenId(String openId){
		return userMapper.selectUserByAppletsOpenId(openId);

	}
	
	/**
     * 查询前台用户列表
     * 
     * @param user 前台用户信息
     * @return 前台用户集合
     */
	@Override
	public List<User> selectUserList(User user)
	{
	    return userMapper.selectUserList(user);
	}
	
    /**
     * 新增前台用户
     * 
     * @param user 前台用户信息
     * @return 结果
     */
	@Override
	public int insertUser(User user)
	{
	    return userMapper.insertUser(user);
	}
	
	/**
     * 修改前台用户
     * 
     * @param user 前台用户信息
     * @return 结果
     */
	@Override
	public int updateUser(User user)
	{
	    return userMapper.updateUser(user);
	}

	/**
     * 删除前台用户对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteUserByIds(String ids)
	{
		return userMapper.deleteUserByIds(Convert.toStrArray(ids));
	}
	
}
