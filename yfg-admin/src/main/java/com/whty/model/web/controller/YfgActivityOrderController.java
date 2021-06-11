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
import com.yfg.common.annotation.Log;
import com.yfg.common.enums.BusinessType;
import com.whty.model.domain.YfgActivityOrder;
import com.whty.model.service.IYfgActivityOrderService;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 活动商品订单 信息操作处理
 * 
 * @author mario
 * @date 2019-08-06
 */
@Controller
@RequestMapping("/model/yfgActivityOrder")
public class YfgActivityOrderController extends BaseController
{
    private String prefix = "model/yfgActivityOrder";
	
	@Autowired
	private IYfgActivityOrderService yfgActivityOrderService;
	
	@RequiresPermissions("model:yfgActivityOrder:view")
	@GetMapping()
	public String yfgActivityOrder()
	{
	    return prefix + "/yfgActivityOrder";
	}
	
	/**
	 * 查询活动商品订单列表
	 */
	@RequiresPermissions("model:yfgActivityOrder:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(YfgActivityOrder yfgActivityOrder)
	{
		startPage();
        List<YfgActivityOrder> list = yfgActivityOrderService.selectYfgActivityOrderList(yfgActivityOrder);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出活动商品订单列表
	 */
	@RequiresPermissions("model:yfgActivityOrder:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YfgActivityOrder yfgActivityOrder)
    {
    	List<YfgActivityOrder> list = yfgActivityOrderService.selectYfgActivityOrderList(yfgActivityOrder);
        ExcelUtil<YfgActivityOrder> util = new ExcelUtil<YfgActivityOrder>(YfgActivityOrder.class);
        return util.exportExcel(list, "yfgActivityOrder");
    }
	
	/**
	 * 新增活动商品订单
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存活动商品订单
	 */
	@RequiresPermissions("model:yfgActivityOrder:add")
	@Log(title = "活动商品订单", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(YfgActivityOrder yfgActivityOrder)
	{		
		return toAjax(yfgActivityOrderService.insertYfgActivityOrder(yfgActivityOrder));
	}

	/**
	 * 修改活动商品订单
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		YfgActivityOrder yfgActivityOrder = yfgActivityOrderService.selectYfgActivityOrderById(id);
		mmap.put("yfgActivityOrder", yfgActivityOrder);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存活动商品订单
	 */
	@RequiresPermissions("model:yfgActivityOrder:edit")
	@Log(title = "活动商品订单", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(YfgActivityOrder yfgActivityOrder)
	{		
		return toAjax(yfgActivityOrderService.updateYfgActivityOrder(yfgActivityOrder));
	}
	
	/**
	 * 删除活动商品订单
	 */
	@RequiresPermissions("model:yfgActivityOrder:remove")
	@Log(title = "活动商品订单", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(yfgActivityOrderService.deleteYfgActivityOrderByIds(ids));
	}
	
}
