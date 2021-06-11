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

import com.whty.model.domain.User;
import com.whty.model.service.IUserService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 前台用户 信息操作处理
 * 
 * @author mario
 * @date 2019-03-25
 */
@Controller
@RequestMapping("/model/user")
public class UserController extends BaseController
{
    private String prefix = "model/user";
	
	@Autowired
	private IUserService userService;
	
	@RequiresPermissions("model:user:view")
	@GetMapping()
	public String user()
	{
	    return prefix + "/user";
	}
	
	/**
	 * 查询前台用户列表
	 */
	@RequiresPermissions("model:user:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(User user)
	{
		startPage();
        List<User> list = userService.selectUserList(user);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出前台用户列表
	 */
	@RequiresPermissions("model:user:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(User user)
    {
    	List<User> list = userService.selectUserList(user);
        ExcelUtil<User> util = new ExcelUtil<User>(User.class);
        return util.exportExcel(list, "user");
    }
	
	/**
	 * 新增前台用户
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存前台用户
	 */
	@RequiresPermissions("model:user:add")
	@Log(title = "前台用户", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(User user)
	{		
		return toAjax(userService.insertUser(user));
	}

	/**
	 * 修改前台用户
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		User user = userService.selectUserById(id);
		mmap.put("user", user);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存前台用户
	 */
	@RequiresPermissions("model:user:edit")
	@Log(title = "前台用户", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(User user)
	{		
		return toAjax(userService.updateUser(user));
	}
	
	/**
	 * 删除前台用户
	 */
	@RequiresPermissions("model:user:remove")
	@Log(title = "前台用户", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(userService.deleteUserByIds(ids));
	}
	
}
