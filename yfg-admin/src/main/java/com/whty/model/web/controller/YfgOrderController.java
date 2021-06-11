package com.whty.model.web.controller;

import java.util.List;

import com.whty.model.service.IYfgDeviceService;
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

import com.whty.model.domain.YfgOrder;
import com.whty.model.service.IYfgOrderService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 订单吸烟 信息操作处理
 * 
 * @author mario
 * @date 2019-04-24
 */
@Controller
@RequestMapping("/model/yfgOrder")
public class YfgOrderController extends BaseController
{
    private String prefix = "model/yfgOrder";
	
	@Autowired
	private IYfgOrderService yfgOrderService;
	@Autowired
	private ISysUserService sysUserService;
	@Autowired
	private ISysRoleService sysRoleService;
	@Autowired
	private IYfgDeviceService yfgDeviceService;
	
	@RequiresPermissions("model:yfgOrder:view")
	@GetMapping()
	public String yfgOrder()
	{
	    return prefix + "/yfgOrder";
	}
	
	/**
	 * 查询订单吸烟列表
	 */
	@RequiresPermissions("model:yfgOrder:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(YfgOrder yfgOrder)
	{


		SysUser user = sysUserService.selectUserById(ShiroUtils.getUserId());
		if(channelFlag(user)){
			String deptIds= yfgDeviceService.selectDeviceByDeptId(user.getDeptId());
			yfgOrder.setDeviceIds(deptIds);
		}
		startPage();
        List<YfgOrder> list = yfgOrderService.selectYfgOrderList(yfgOrder);
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
	 * 导出订单吸烟列表
	 */
	@RequiresPermissions("model:yfgOrder:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YfgOrder yfgOrder)
    {
    	List<YfgOrder> list = yfgOrderService.selectYfgOrderList(yfgOrder);
        ExcelUtil<YfgOrder> util = new ExcelUtil<YfgOrder>(YfgOrder.class);
        return util.exportExcel(list, "yfgOrder");
    }
	
	/**
	 * 新增订单吸烟
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存订单吸烟
	 */
	@RequiresPermissions("model:yfgOrder:add")
	@Log(title = "订单吸烟", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(YfgOrder yfgOrder)
	{		
		return toAjax(yfgOrderService.insertYfgOrder(yfgOrder));
	}

	/**
	 * 修改订单吸烟
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		YfgOrder yfgOrder = yfgOrderService.selectYfgOrderById(id);
		mmap.put("yfgOrder", yfgOrder);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存订单吸烟
	 */
	@RequiresPermissions("model:yfgOrder:edit")
	@Log(title = "订单吸烟", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(YfgOrder yfgOrder)
	{		
		return toAjax(yfgOrderService.updateYfgOrder(yfgOrder));
	}
	
	/**
	 * 删除订单吸烟
	 */
	@RequiresPermissions("model:yfgOrder:remove")
	@Log(title = "订单吸烟", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(yfgOrderService.deleteYfgOrderByIds(ids));
	}
	
}
