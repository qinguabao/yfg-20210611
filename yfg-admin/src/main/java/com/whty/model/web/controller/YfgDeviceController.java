package com.whty.model.web.controller;

import java.util.List;

import com.yfg.framework.util.ShiroUtils;
import com.yfg.system.domain.SysRole;
import com.yfg.system.domain.SysUser;
import com.yfg.system.service.ISysRoleService;
import com.yfg.system.service.ISysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whty.model.domain.YfgDevice;
import com.whty.model.service.IYfgDeviceService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 设备 信息操作处理
 * 
 * @author mario
 * @date 2019-04-19
 */
@Controller
@RequestMapping("/model/yfgDevice")
public class YfgDeviceController extends BaseController
{
    private String prefix = "model/yfgDevice";
	
	@Autowired
	private IYfgDeviceService yfgDeviceService;
	@Autowired
	private ISysUserService sysUserService;
	@Autowired
	private ISysRoleService sysRoleService;
	
	@RequiresPermissions("model:yfgDevice:view")
	@GetMapping()
	public String yfgDevice()
	{
	    return prefix + "/yfgDevice";
	}
	
	/**
	 * 查询设备列表
	 */
	@RequiresPermissions("model:yfgDevice:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(YfgDevice yfgDevice)
	{

		/**
		 * 1、获取当前用户是所属的角色标识符 是否为 渠道商 channel_admin；
		 * 2、若是则，查询该部门对应的设备信息，其他的设备不显示；
		 */
//		Boolean channel_flag = false;
		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
			yfgDevice.setDeptId(user.getDeptId());
		}
		startPage();
        List<YfgDevice> list = yfgDeviceService.selectYfgDeviceList(yfgDevice);
		return getDataTable(list);
	}

	public Boolean channelFlag(SysUser user){
		Boolean channel_flag = false;
//		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());

		for(SysRole role:user.getRoles()){

			if(role.getRoleKey().equals("channel_admin")){
				channel_flag = true;
				break;
			}
		}
		return channel_flag;

	}
	
	
	/**
	 * 导出设备列表
	 */
	@RequiresPermissions("model:yfgDevice:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YfgDevice yfgDevice)
    {
    	List<YfgDevice> list = yfgDeviceService.selectYfgDeviceList(yfgDevice);
        ExcelUtil<YfgDevice> util = new ExcelUtil<YfgDevice>(YfgDevice.class);
        return util.exportExcel(list, "yfgDevice");
    }
	
	/**
	 * 新增设备
	 */
	@GetMapping("/add")
	public String add(ModelMap mmap)
	{
		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
//			mmap.put("channel_flag","1");
			return prefix + "/channelAdd";
		}else{
			return prefix + "/add";
		}

	}
	
	/**
	 * 新增保存设备
	 */
	@RequiresPermissions("model:yfgDevice:add")
	@Log(title = "设备", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(YfgDevice yfgDevice)
	{
		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
			yfgDevice.setDeptId(user.getDeptId());
	     }
		if(yfgDevice.getDept()!=null){
			return toAjax(yfgDeviceService.insertYfgDevice(yfgDevice));
		}else {
			System.out.println("没有获取到部门id"+",");
			return null;
		}

	}

	/**
	 * 修改设备
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		YfgDevice yfgDevice = yfgDeviceService.selectYfgDeviceById(id);
		mmap.put("yfgDevice", yfgDevice);
		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
			mmap.put("channel_flag","1");
		}else{
			mmap.put("channel_flag","0");
		}
	    return prefix + "/edit";
	}
	
	
	/*
	 * 后台 打开设备，
	 * 
	 */
	
	/**
	 * 修改保存设备
	 */
	@RequiresPermissions("model:yfgDevice:edit")
	@Log(title = "设备", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(YfgDevice yfgDevice)
	{		
		return toAjax(yfgDeviceService.updateYfgDevice(yfgDevice));
	}
	
	/**
	 * 删除设备
	 */
	@RequiresPermissions("model:yfgDevice:remove")
	@Log(title = "设备", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(yfgDeviceService.deleteYfgDeviceByIds(ids));
	}
	
	
//	 @RequiresPermissions("system:user:resetPwd")
	    @Log(title = "重新编码", businessType = BusinessType.UPDATE)
	    @GetMapping("/bianma/{deviceId}")
	    public String bianma(@PathVariable("deviceId") String deviceId, ModelMap mmap)
	    {
	        mmap.put("device", yfgDeviceService.selectYfgDeviceByDeviceId(deviceId));
	        return prefix + "/bianma";
	    }
	
}
