package com.whty.model.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.security.auth.login.LoginContext;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.tomcat.jni.User;
import org.apache.tomcat.util.descriptor.web.LoginConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.whty.model.domain.StationInfo;
import com.whty.model.domain.SysAreaCity;
import com.whty.model.service.IStationInfoService;
import com.yfg.common.annotation.Log;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;
import com.yfg.framework.util.ShiroUtils;
import com.yfg.system.domain.SysDictData;
import com.yfg.system.domain.SysUser;
import com.yfg.system.service.impl.SysDictDataServiceImpl;

/**
 * 取货网点 信息操作处理
 * 
 * @author mario
 * @date 2019-03-22
 */
@Controller
@RequestMapping("/model/stationInfo")
public class StationInfoController extends BaseController
{
    private String prefix = "model/stationInfo";
    private SimpleDateFormat df=new SimpleDateFormat("yyyy-mm-dd  HH:mm:ss");
	
	@Autowired
	private IStationInfoService stationInfoService;
	
	@Autowired
	private SysDictDataServiceImpl sysDictDataServiceImpl;
	
	@RequiresPermissions("model:stationInfo:view")
	@GetMapping()
	public String stationInfo()
	{
	    return prefix + "/stationInfo";
	}
	
	/**
	 * 查询取货网点列表
	 */
	@RequiresPermissions("model:stationInfo:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(StationInfo stationInfo)
	{
		startPage();
        List<StationInfo> list = stationInfoService.selectStationInfoList(stationInfo);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出取货网点列表
	 */
	@RequiresPermissions("model:stationInfo:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(StationInfo stationInfo)
    {
    	List<StationInfo> list = stationInfoService.selectStationInfoList(stationInfo);
        ExcelUtil<StationInfo> util = new ExcelUtil<StationInfo>(StationInfo.class);
        return util.exportExcel(list, "stationInfo");
    }
	
	/**
	 * 新增取货网点
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存取货网点
	 */
	@RequiresPermissions("model:stationInfo:add")
	@Log(title = "取货网点", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(StationInfo stationInfo)
	{		
		try {
			stationInfo.setCreateDate(df.parse(df.format(new Date())));
			SysUser user=ShiroUtils.getSysUser();
			stationInfo.setCreateBy(user.getUserId()+"");
			stationInfo.setDelFlag("0");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toAjax(stationInfoService.insertStationInfo(stationInfo));
	}

	/**
	 * 修改取货网点
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		StationInfo stationInfo = stationInfoService.selectStationInfoById(id);
		mmap.put("stationInfo", stationInfo);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存取货网点
	 */
	@RequiresPermissions("model:stationInfo:edit")
	@Log(title = "取货网点", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(StationInfo stationInfo)
	{		
		try {
			if(stationInfo.getStationStatus()!=null&&!stationInfo.getStationStatus().trim().equals("")){
				if(stationInfo.getStationStatus().length()>1){
					String status=stationInfo.getStationStatus();
					stationInfo.setStationStatus(status.substring(0, 1));
				}
			}
			stationInfo.setUpdateDate(df.parse(df.format(new Date())));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toAjax(stationInfoService.updateStationInfo(stationInfo));
	}
	
	/**
	 * 删除取货网点
	 */
	@RequiresPermissions("model:stationInfo:remove")
	@Log(title = "取货网点", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(stationInfoService.deleteStationInfoByIds(ids));
	}
	
	/**
	 * 页面初始加载下拉框选项
	 */
    @PostMapping("/findStauts")
    @ResponseBody
    public List<SysDictData> findStauts(SysAreaCity sysAreaCity)
    {
    	SysDictData sysDictData=new SysDictData();
    	sysDictData.setDictType(getRequest().getParameter("dictType"));
    	List<SysDictData> list =sysDictDataServiceImpl.selectDictDataList(sysDictData);
    	return list;
    }
	
    
}
