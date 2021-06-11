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

import com.whty.model.domain.SpecialCardInfo;
import com.whty.model.service.ISpecialCardInfoService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 优惠卡 信息操作处理
 * 
 * @author mario
 * @date 2019-03-22
 */
@Controller
@RequestMapping("/model/specialCardInfo")
public class SpecialCardInfoController extends BaseController
{
    private String prefix = "model/specialCardInfo";
	
	@Autowired
	private ISpecialCardInfoService specialCardInfoService;
	
	@RequiresPermissions("model:specialCardInfo:view")
	@GetMapping()
	public String specialCardInfo()
	{
	    return prefix + "/specialCardInfo";
	}
	
	/**
	 * 查询优惠卡列表
	 */
	@RequiresPermissions("model:specialCardInfo:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(SpecialCardInfo specialCardInfo)
	{
		startPage();
        List<SpecialCardInfo> list = specialCardInfoService.selectSpecialCardInfoList(specialCardInfo);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出优惠卡列表
	 */
	@RequiresPermissions("model:specialCardInfo:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SpecialCardInfo specialCardInfo)
    {
    	List<SpecialCardInfo> list = specialCardInfoService.selectSpecialCardInfoList(specialCardInfo);
        ExcelUtil<SpecialCardInfo> util = new ExcelUtil<SpecialCardInfo>(SpecialCardInfo.class);
        return util.exportExcel(list, "specialCardInfo");
    }
	
	/**
	 * 新增优惠卡
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存优惠卡
	 */
	@RequiresPermissions("model:specialCardInfo:add")
	@Log(title = "优惠卡", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(SpecialCardInfo specialCardInfo)
	{		
		return toAjax(specialCardInfoService.insertSpecialCardInfo(specialCardInfo));
	}

	/**
	 * 修改优惠卡
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		SpecialCardInfo specialCardInfo = specialCardInfoService.selectSpecialCardInfoById(id);
		mmap.put("specialCardInfo", specialCardInfo);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存优惠卡
	 */
	@RequiresPermissions("model:specialCardInfo:edit")
	@Log(title = "优惠卡", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(SpecialCardInfo specialCardInfo)
	{		
		return toAjax(specialCardInfoService.updateSpecialCardInfo(specialCardInfo));
	}
	
	/**
	 * 删除优惠卡
	 */
	@RequiresPermissions("model:specialCardInfo:remove")
	@Log(title = "优惠卡", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(specialCardInfoService.deleteSpecialCardInfoByIds(ids));
	}
	
}
