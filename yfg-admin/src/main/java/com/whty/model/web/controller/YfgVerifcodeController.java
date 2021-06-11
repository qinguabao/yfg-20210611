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

import com.whty.model.domain.YfgVerifcode;
import com.whty.model.service.IYfgVerifcodeService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 图文验证码 信息操作处理
 * 
 * @author mario
 * @date 2019-04-24
 */
@Controller
@RequestMapping("/model/yfgVerifcode")
public class YfgVerifcodeController extends BaseController
{
    private String prefix = "model/yfgVerifcode";
	
	@Autowired
	private IYfgVerifcodeService yfgVerifcodeService;
	
	@RequiresPermissions("model:yfgVerifcode:view")
	@GetMapping()
	public String yfgVerifcode()
	{
	    return prefix + "/yfgVerifcode";
	}
	
	/**
	 * 查询图文验证码列表
	 */
	@RequiresPermissions("model:yfgVerifcode:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(YfgVerifcode yfgVerifcode)
	{
		startPage();
        List<YfgVerifcode> list = yfgVerifcodeService.selectYfgVerifcodeList(yfgVerifcode);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出图文验证码列表
	 */
	@RequiresPermissions("model:yfgVerifcode:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YfgVerifcode yfgVerifcode)
    {
    	List<YfgVerifcode> list = yfgVerifcodeService.selectYfgVerifcodeList(yfgVerifcode);
        ExcelUtil<YfgVerifcode> util = new ExcelUtil<YfgVerifcode>(YfgVerifcode.class);
        return util.exportExcel(list, "yfgVerifcode");
    }
	
	/**
	 * 新增图文验证码
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存图文验证码
	 */
	@RequiresPermissions("model:yfgVerifcode:add")
	@Log(title = "图文验证码", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(YfgVerifcode yfgVerifcode)
	{		
		return toAjax(yfgVerifcodeService.insertYfgVerifcode(yfgVerifcode));
	}

	/**
	 * 修改图文验证码
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		YfgVerifcode yfgVerifcode = yfgVerifcodeService.selectYfgVerifcodeById(id);
		mmap.put("yfgVerifcode", yfgVerifcode);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存图文验证码
	 */
	@RequiresPermissions("model:yfgVerifcode:edit")
	@Log(title = "图文验证码", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(YfgVerifcode yfgVerifcode)
	{		
		return toAjax(yfgVerifcodeService.updateYfgVerifcode(yfgVerifcode));
	}
	
	/**
	 * 删除图文验证码
	 */
	@RequiresPermissions("model:yfgVerifcode:remove")
	@Log(title = "图文验证码", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(yfgVerifcodeService.deleteYfgVerifcodeByIds(ids));
	}
	
}
