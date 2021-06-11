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

import com.whty.model.domain.YfgVerifcodeMobile;
import com.whty.model.service.IYfgVerifcodeMobileService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 短信验证码 信息操作处理
 * 
 * @author mario
 * @date 2019-04-25
 */
@Controller
@RequestMapping("/model/yfgVerifcodeMobile")
public class YfgVerifcodeMobileController extends BaseController
{
    private String prefix = "model/yfgVerifcodeMobile";
	
	@Autowired
	private IYfgVerifcodeMobileService yfgVerifcodeMobileService;
	
	@RequiresPermissions("model:yfgVerifcodeMobile:view")
	@GetMapping()
	public String yfgVerifcodeMobile()
	{
	    return prefix + "/yfgVerifcodeMobile";
	}
	
	/**
	 * 查询短信验证码列表
	 */
	@RequiresPermissions("model:yfgVerifcodeMobile:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(YfgVerifcodeMobile yfgVerifcodeMobile)
	{
		startPage();
        List<YfgVerifcodeMobile> list = yfgVerifcodeMobileService.selectYfgVerifcodeMobileList(yfgVerifcodeMobile);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出短信验证码列表
	 */
	@RequiresPermissions("model:yfgVerifcodeMobile:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YfgVerifcodeMobile yfgVerifcodeMobile)
    {
    	List<YfgVerifcodeMobile> list = yfgVerifcodeMobileService.selectYfgVerifcodeMobileList(yfgVerifcodeMobile);
        ExcelUtil<YfgVerifcodeMobile> util = new ExcelUtil<YfgVerifcodeMobile>(YfgVerifcodeMobile.class);
        return util.exportExcel(list, "yfgVerifcodeMobile");
    }
	
	/**
	 * 新增短信验证码
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存短信验证码
	 */
	@RequiresPermissions("model:yfgVerifcodeMobile:add")
	@Log(title = "短信验证码", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(YfgVerifcodeMobile yfgVerifcodeMobile)
	{		
		return toAjax(yfgVerifcodeMobileService.insertYfgVerifcodeMobile(yfgVerifcodeMobile));
	}

	/**
	 * 修改短信验证码
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		YfgVerifcodeMobile yfgVerifcodeMobile = yfgVerifcodeMobileService.selectYfgVerifcodeMobileById(id);
		mmap.put("yfgVerifcodeMobile", yfgVerifcodeMobile);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存短信验证码
	 */
	@RequiresPermissions("model:yfgVerifcodeMobile:edit")
	@Log(title = "短信验证码", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(YfgVerifcodeMobile yfgVerifcodeMobile)
	{		
		return toAjax(yfgVerifcodeMobileService.updateYfgVerifcodeMobile(yfgVerifcodeMobile));
	}
	
	/**
	 * 删除短信验证码
	 */
	@RequiresPermissions("model:yfgVerifcodeMobile:remove")
	@Log(title = "短信验证码", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(yfgVerifcodeMobileService.deleteYfgVerifcodeMobileByIds(ids));
	}
	
}
