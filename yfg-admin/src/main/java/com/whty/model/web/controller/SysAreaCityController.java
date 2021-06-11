package com.whty.model.web.controller;

import java.math.BigDecimal;
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

import com.whty.model.domain.SysAreaCity;
import com.whty.model.service.ISysAreaCityService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;

/**
 * 地区据字典 信息操作处理
 * 
 * @author mario
 * @date 2019-03-22
 */
@Controller
@RequestMapping("/model/sysAreaCity")
public class SysAreaCityController extends BaseController
{
    private String prefix = "model/sysAreaCity";
	
	@Autowired
	private ISysAreaCityService sysAreaCityService;
	
	
	//提交svn测试
	@RequiresPermissions("model:sysAreaCity:view")
	@GetMapping()
	public String sysAreaCity()
	{
	    return prefix + "/sysAreaCity";
	}
	
	/**
	 * 查询地区据字典列表
	 */
	@RequiresPermissions("model:sysAreaCity:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(SysAreaCity sysAreaCity)
	{
		startPage();
        List<SysAreaCity> list = sysAreaCityService.selectSysAreaCityList(sysAreaCity);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出地区据字典列表
	 */
	@RequiresPermissions("model:sysAreaCity:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysAreaCity sysAreaCity)
    {
    	List<SysAreaCity> list = sysAreaCityService.selectSysAreaCityList(sysAreaCity);
        ExcelUtil<SysAreaCity> util = new ExcelUtil<SysAreaCity>(SysAreaCity.class);
        return util.exportExcel(list, "sysAreaCity");
    }
	
	/**
	 * 新增地区据字典
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存地区据字典
	 */
	@RequiresPermissions("model:sysAreaCity:add")
	@Log(title = "地区据字典", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(SysAreaCity sysAreaCity)
	{		
		if(sysAreaCity!=null){
			if(sysAreaCity.getALEVEL()!=null){
				if(sysAreaCity.getALEVEL().toString().equals("1")){
					sysAreaCity.setPID(new BigDecimal(0));
				}
				if(sysAreaCity.getALEVEL().toString().equals("2")){
					if(getRequest().getParameter("proId")!=null){
						sysAreaCity.setPID(new BigDecimal(getRequest().getParameter("proId")));
					}
					
				}
				if(sysAreaCity.getALEVEL().toString().equals("3")){
					if(getRequest().getParameter("cityId")!=null){
						sysAreaCity.setPID(new BigDecimal(getRequest().getParameter("cityId")));
					}
					
				}
			}
			if(sysAreaCity.getALEVEL()!=null&&sysAreaCity.getALEVEL().toString().equals("1")){
				sysAreaCity.setPID(new BigDecimal(0));
			}
		}
		return toAjax(sysAreaCityService.insertSysAreaCity(sysAreaCity));
	}

	/**
	 * 修改地区据字典
	 */
	@GetMapping("/edit/{iD}")
	public String edit(@PathVariable("iD") Integer iD, ModelMap mmap)
	{
		SysAreaCity sysAreaCity = sysAreaCityService.selectSysAreaCityById(iD);
		mmap.put("sysAreaCity", sysAreaCity);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存地区据字典
	 */
	@RequiresPermissions("model:sysAreaCity:edit")
	@Log(title = "地区据字典", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(SysAreaCity sysAreaCity)
	{		
		return toAjax(sysAreaCityService.updateSysAreaCity(sysAreaCity));
	}
	
	/**
	 * 删除地区据字典
	 */
	@RequiresPermissions("model:sysAreaCity:remove")
	@Log(title = "地区据字典", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(sysAreaCityService.deleteSysAreaCityByIds(ids));
	}
	
	/**
	 * 页面初始加载下拉框选项
	 */
    @PostMapping("/findPro")
    @ResponseBody
    public List<SysAreaCity> findPro(SysAreaCity sysAreaCity)
    {
    	List<SysAreaCity> list = sysAreaCityService.selectSysAreaCityList(sysAreaCity);
    	return list;
    }
    
}
