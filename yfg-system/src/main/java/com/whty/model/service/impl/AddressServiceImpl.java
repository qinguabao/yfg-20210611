package com.whty.model.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.AddressMapper;
import com.whty.model.domain.Address;
import com.whty.model.service.IAddressService;
import com.yfg.common.core.text.Convert;

/**
 * 用户快递 服务层实现
 * 
 * @author mario
 * @date 2019-03-25
 */
@Service
public class AddressServiceImpl implements IAddressService 
{
	@Autowired
	private AddressMapper addressMapper;

	/**
     * 查询用户快递信息
     * 
     * @param id 用户快递ID
     * @return 用户快递信息
     */
    @Override
	public Address selectAddressById(Integer id)
	{
	    return addressMapper.selectAddressById(id);
	}
	
	/**
     * 查询用户快递列表
     * 
     * @param address 用户快递信息
     * @return 用户快递集合
     */
	@Override
	public List<Address> selectAddressList(Address address)
	{
	    return addressMapper.selectAddressList(address);
	}
	
    /**
     * 新增用户快递
     * 
     * @param address 用户快递信息
     * @return 结果
     */
	@Override
	public int insertAddress(Address address)
	{
	    return addressMapper.insertAddress(address);
	}
	
	/**
     * 修改用户快递
     * 
     * @param address 用户快递信息
     * @return 结果
     */
	@Override
	public int updateAddress(Address address)
	{
	    return addressMapper.updateAddress(address);
	}

	/**
     * 删除用户快递对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteAddressByIds(String ids)
	{
		return addressMapper.deleteAddressByIds(Convert.toStrArray(ids));
	}
	
}
