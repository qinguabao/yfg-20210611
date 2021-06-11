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

import com.whty.model.domain.YfgPackage;
import com.whty.model.service.IYfgPackageService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 套餐 信息操作处理
 * 
 * @author mario
 * @date 2019-04-24
 */
@Controller
@RequestMapping("/model/yfgPackage")
public class YfgPackageController extends BaseController
{
    private String prefix = "model/yfgPackage";
	
	@Autowired
	private IYfgPackageService yfgPackageService;
	@Autowired
	private ISysUserService sysUserService;
	@Autowired
	private ISysRoleService sysRoleService;
	
	@RequiresPermissions("model:yfgPackage:view")
	@GetMapping()
	public String yfgPackage()
	{
	    return prefix + "/yfgPackage";
	}
	
	/**
	 * 查询套餐列表
	 */
	@RequiresPermissions("model:yfgPackage:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(YfgPackage yfgPackage)
	{

		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
			yfgPackage.setDeptId(user.getDeptId());
		}
		startPage();
        List<YfgPackage> list = yfgPackageService.selectYfgPackageList(yfgPackage);
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
	 * 导出套餐列表
	 */
	@RequiresPermissions("model:yfgPackage:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YfgPackage yfgPackage)
    {
    	List<YfgPackage> list = yfgPackageService.selectYfgPackageList(yfgPackage);
        ExcelUtil<YfgPackage> util = new ExcelUtil<YfgPackage>(YfgPackage.class);
        return util.exportExcel(list, "yfgPackage");
    }
	
	/**
	 * 新增套餐
	 */
	@GetMapping("/add")
	public String add()
	{

		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
//			mmap.put("channel_flag","1");
			return prefix + "/channelAdd";
		}else{
			return prefix + "/add";
		}
//	    return prefix + "/add";
	}
	
	/**
	 * 新增保存套餐
	 */
	@RequiresPermissions("model:yfgPackage:add")
	@Log(title = "套餐", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(YfgPackage yfgPackage)
	{
		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
			yfgPackage.setDeptId(user.getDeptId());
		}
		
		return toAjax(yfgPackageService.insertYfgPackage(yfgPackage));
	}

	/**
	 * 修改套餐
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		YfgPackage yfgPackage = yfgPackageService.selectYfgPackageById(id);
		mmap.put("yfgPackage", yfgPackage);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存套餐
	 */
	@RequiresPermissions("model:yfgPackage:edit")
	@Log(title = "套餐", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(YfgPackage yfgPackage)
	{		
		return toAjax(yfgPackageService.updateYfgPackage(yfgPackage));
	}
	
	/**
	 * 删除套餐
	 */
	@RequiresPermissions("model:yfgPackage:remove")
	@Log(title = "套餐", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(yfgPackageService.deleteYfgPackageByIds(ids));
	}
	
}
