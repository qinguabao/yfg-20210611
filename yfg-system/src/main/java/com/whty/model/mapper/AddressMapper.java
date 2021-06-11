package com.whty.model.mapper;

import com.whty.model.domain.Address;
import java.util.List;	

/**
 * 用户快递 数据层
 * 
 * @author mario
 * @date 2019-03-25
 */
public interface AddressMapper 
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
     * 删除用户快递
     * 
     * @param id 用户快递ID
     * @return 结果
     */
	public int deleteAddressById(Integer id);
	
	/**
     * 批量删除用户快递
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteAddressByIds(String[] ids);
	
}