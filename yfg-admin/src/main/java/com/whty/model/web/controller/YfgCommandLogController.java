package com.whty.model.web.controller;

import java.util.List;

import com.whty.model.service.IYfgDeviceService;
import com.yfg.framework.util.ShiroUtils;
import com.yfg.system.domain.SysRole;
import com.yfg.system.domain.SysUser;
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

import com.whty.model.domain.YfgCommandLog;
import com.whty.model.service.IYfgCommandLogService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 指令日志 信息操作处理
 * 
 * @author mario
 * @date 2019-06-15
 */
@Controller
@RequestMapping("/model/yfgCommandLog")
public class YfgCommandLogController extends BaseController
{
    private String prefix = "model/yfgCommandLog";
	
	@Autowired
	private IYfgCommandLogService yfgCommandLogService;
	@Autowired
	private ISysUserService sysUserService;
	@Autowired
	private IYfgDeviceService yfgDeviceService;
	
	@RequiresPermissions("model:yfgCommandLog:view")
	@GetMapping()
	public String yfgCommandLog()
	{
	    return prefix + "/yfgCommandLog";
	}
	
	/**
	 * 查询指令日志列表
	 */
	@RequiresPermissions("model:yfgCommandLog:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(YfgCommandLog yfgCommandLog)
	{

		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
			String deptIds= yfgDeviceService.selectDeviceByDeptId(user.getDeptId());
			yfgCommandLog.setDeviceIds(deptIds);
		}

		startPage();
        List<YfgCommandLog> list = yfgCommandLogService.selectYfgCommandLogList(yfgCommandLog);
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
	 * 导出指令日志列表
	 */
	@RequiresPermissions("model:yfgCommandLog:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YfgCommandLog yfgCommandLog)
    {
    	List<YfgCommandLog> list = yfgCommandLogService.selectYfgCommandLogList(yfgCommandLog);
        ExcelUtil<YfgCommandLog> util = new ExcelUtil<YfgCommandLog>(YfgCommandLog.class);
        return util.exportExcel(list, "yfgCommandLog");
    }
	
	/**
	 * 新增指令日志
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存指令日志
	 */
	@RequiresPermissions("model:yfgCommandLog:add")
	@Log(title = "指令日志", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(YfgCommandLog yfgCommandLog)
	{		
		return toAjax(yfgCommandLogService.insertYfgCommandLog(yfgCommandLog));
	}

	/**
	 * 修改指令日志
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		YfgCommandLog yfgCommandLog = yfgCommandLogService.selectYfgCommandLogById(id);
		mmap.put("yfgCommandLog", yfgCommandLog);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存指令日志
	 */
	@RequiresPermissions("model:yfgCommandLog:edit")
	@Log(title = "指令日志", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(YfgCommandLog yfgCommandLog)
	{		
		return toAjax(yfgCommandLogService.updateYfgCommandLog(yfgCommandLog));
	}
	
	/**
	 * 删除指令日志
	 */
	@RequiresPermissions("model:yfgCommandLog:remove")
	@Log(title = "指令日志", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(yfgCommandLogService.deleteYfgCommandLogByIds(ids));
	}
	
}
