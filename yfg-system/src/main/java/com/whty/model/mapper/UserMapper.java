package com.whty.model.mapper;

import com.whty.model.domain.User;
import java.util.List;	

/**
 * 前台用户 数据层
 * 
 * @author mario
 * @date 2019-03-25
 */
public interface UserMapper 
{
	/**
     * 查询前台用户信息
     * 
     * @param id 前台用户ID
     * @return 前台用户信息
     */
	public User selectUserById(Integer id);
	
	/**
     * 查询前台用户信息
     * 
     * @param id 前台用户ID
     * @return 前台用户信息
     */
	public List<User> selectUserByOpenId(String openId);


	public List<User> selectUserByAppletsOpenId(String openId);
	
	
	/**
     * 查询前台用户列表
     * 
     * @param user 前台用户信息
     * @return 前台用户集合
     */
	public List<User> selectUserList(User user);
	
	/**
     * 新增前台用户
     * 
     * @param user 前台用户信息
     * @return 结果
     */
	public int insertUser(User user);
	
	/**
     * 修改前台用户
     * 
     * @param user 前台用户信息
     * @return 结果
     */
	public int updateUser(User user);
	
	/**
     * 删除前台用户
     * 
     * @param id 前台用户ID
     * @return 结果
     */
	public int deleteUserById(Integer id);
	
	/**
     * 批量删除前台用户
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteUserByIds(String[] ids);
	
}