package com.whty.model.service;

import com.whty.model.domain.Address;
import java.util.List;

/**
 * 用户快递 服务层
 * 
 * @author mario
 * @date 2019-03-25
 */
public interface IAddressService 
{
	/**
     * 查询用户快递信息
     * 
     * @param id 用户快递ID
     * @return 用户快递信息
     */
	public Address selectAddressById(Integer id);
	
	/**
     * 查询用户快递列表
     * 
     * @param address 用户快递信息
     * @return 用户快递集合
     */
	public List<Address> selectAddressList(Address address);
	
	/**
     * 新增用户快递
     * 
     * @param address 用户快递信息
     * @return 结果
     */
	public int insertAddress(Address address);
	
	/**
     * 修改用户快递
     * 
     * @param address 用户快递信息
     * @return 结果
     */
	public int updateAddress(Address address);
		
	/**
     * 删除用户快递信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteAddressByIds(String ids);
	
}
