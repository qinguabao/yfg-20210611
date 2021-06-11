package com.whty.model.web.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whty.model.domain.Address;
import com.whty.model.service.IAddressService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 用户快递 信息操作处理
 * 
 * @author mario
 * @date 2019-03-25
 */
@Controller
@RequestMapping("/model/address")
public class AddressController extends BaseController
{
    private String prefix = "model/address";
	
	@Autowired
	private IAddressService addressService;
	
	@RequiresPermissions("model:address:view")
	@GetMapping()
	public String address()
	{
	    return prefix + "/address";
	}
	
	/**
	 * 查询用户快递列表
	 */
	@RequiresPermissions("model:address:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Address address)
	{
		startPage();
        List<Address> list = addressService.selectAddressList(address);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出用户快递列表
	 */
	@RequiresPermissions("model:address:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Address address)
    {
    	List<Address> list = addressService.selectAddressList(address);
        ExcelUtil<Address> util = new ExcelUtil<Address>(Address.class);
        return util.exportExcel(list, "address");
    }
	
	/**
	 * 新增用户快递
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存用户快递
	 */
	@RequiresPermissions("model:address:add")
	@Log(title = "用户快递", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Address address)
	{		
		return toAjax(addressService.insertAddress(address));
	}

	/**
	 * 修改用户快递
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		Address address = addressService.selectAddressById(id);
		mmap.put("address", address);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存用户快递
	 */
	@RequiresPermissions("model:address:edit")
	@Log(title = "用户快递", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Address address)
	{		
		return toAjax(addressService.updateAddress(address));
	}
	
	/**
	 * 删除用户快递
	 */
	@RequiresPermissions("model:address:remove")
	@Log(title = "用户快递", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(addressService.deleteAddressByIds(ids));
	}
	
}
