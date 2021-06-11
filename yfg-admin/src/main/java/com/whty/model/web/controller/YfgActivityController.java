package com.whty.model.web.controller;


import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.yfg.common.annotation.Log;
import com.yfg.common.config.Global;
import com.yfg.common.enums.BusinessType;
import com.whty.model.domain.YfgActivity;
import com.whty.model.service.IYfgActivityService;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.utils.file.FileUploadUtils;
import com.yfg.common.utils.poi.ExcelUtil;
import com.yfg.framework.util.ShiroUtils;
import com.yfg.system.domain.SysUser;
import com.yfg.web.controller.system.SysProfileController;

/**
 * 活动 信息操作处理
 * 
 * @author mario
 * @date 2019-08-06
 */
@Controller
@RequestMapping("/model/yfgActivity")
public class YfgActivityController extends BaseController
{
    private String prefix = "model/yfgActivity";
    
    private static final Logger loger = LoggerFactory.getLogger(YfgActivityController.class);
	
	@Autowired
	private IYfgActivityService yfgActivityService;
	
	@RequiresPermissions("model:yfgActivity:view")
	@GetMapping()
	public String yfgActivity()
	{
	    return prefix + "/yfgActivity";
	}
	
	/**
	 * 查询活动列表
	 */
	@RequiresPermissions("model:yfgActivity:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(YfgActivity yfgActivity)
	{
		startPage();
        List<YfgActivity> list = yfgActivityService.selectYfgActivityList(yfgActivity);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出活动列表
	 */
	@RequiresPermissions("model:yfgActivity:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(YfgActivity yfgActivity)
    {
    	List<YfgActivity> list = yfgActivityService.selectYfgActivityList(yfgActivity);
        ExcelUtil<YfgActivity> util = new ExcelUtil<YfgActivity>(YfgActivity.class);
        return util.exportExcel(list, "yfgActivity");
    }
	
	/**
	 * 新增活动
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存活动
	 */
	@RequiresPermissions("model:yfgActivity:add")
	@Log(title = "活动", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(HttpServletRequest request)
	{

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		MultipartFile image1 = files.get("file1");
		MultipartFile image2 = files.get("file2");
		MultipartFile image3 = files.get("file3");

		MultipartFile image = files.get("files[]");
		String fileStr1 = "";
		String fileStr2 = "";
		String fileStr3 = "";

		YfgActivity yfgActivity = new YfgActivity();

		try {
			if (!image1.isEmpty()) {
				fileStr1 = FileUploadUtils.upload(Global.getAvatarPath(), image1);
				yfgActivity.setActivityGoodsImg(fileStr1);

			}
			if (!image2.isEmpty()) {
				fileStr2 = FileUploadUtils.upload(Global.getAvatarPath(), image2);
				yfgActivity.setActivityImgOne(fileStr2);

			}
			if (!image3.isEmpty()) {
				fileStr3 = FileUploadUtils.upload(Global.getAvatarPath(), image3);
				yfgActivity.setActivityImgTwo(fileStr3);
			}
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			String activityName = request.getParameter("activityName");
			String activityContent = request.getParameter("activityContent");
			String oriPrice = request.getParameter("oriPrice");
			String activityPrice = request.getParameter("activityPrice");
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String activityNum = request.getParameter("activityNum");
			String remarks = request.getParameter("remarks");

			yfgActivity.setActivityName(activityName);
			yfgActivity.setActivityContent(activityContent);
			if(oriPrice!=null&&!"".equals(oriPrice)) {
				yfgActivity.setOriPrice(Integer.parseInt(oriPrice));	
			}
			if(activityPrice!=null&&!"".equals(activityPrice)) {
				yfgActivity.setActivityPrice(Integer.parseInt(activityPrice));
			}if(beginDate!=null&&!"".equals(beginDate)) {
				yfgActivity.setBeginDate(sd.parse(beginDate));
			}if(endDate!=null&&!"".equals(endDate)) {
				yfgActivity.setEndDate(sd.parse(endDate));
			}if(activityNum!=null&&!"".equals(activityNum)) {
				yfgActivity.setActivityNum(Integer.parseInt(activityNum));
			}			
			yfgActivity.setRemarks(remarks);			
			yfgActivity.setCreateDate(new Date());
			yfgActivity.setCreateUser(ShiroUtils.getUserId());
			return toAjax(yfgActivityService.insertYfgActivity(yfgActivity));
		} catch (Exception e) {
			 logger.info("新增活动信息失败", e);
			 return AjaxResult.error("新增活动信息失败");
		}
	}

	/**
	 * 修改活动
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		YfgActivity yfgActivity = yfgActivityService.selectYfgActivityById(id);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		
		yfgActivity.setBeginDateStr(sd.format(yfgActivity.getBeginDate()));
		yfgActivity.setEndDateStr(sd.format(yfgActivity.getEndDate()));
		
		mmap.put("yfgActivity", yfgActivity);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存活动
	 */
	@RequiresPermissions("model:yfgActivity:edit")
	@Log(title = "活动", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(HttpServletRequest request)
	{		
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> files = multipartRequest.getFileMap();
		MultipartFile image1 = files.get("file1");
		MultipartFile image2 = files.get("file2");
		MultipartFile image3 = files.get("file3");

		MultipartFile image = files.get("files[]");
		String fileStr1 = "";
		String fileStr2 = "";
		String fileStr3 = "";

		YfgActivity yfgActivity = new YfgActivity();
		String id= request.getParameter("id");
		
		yfgActivity = yfgActivityService.selectYfgActivityById(Integer.parseInt(id));
		try {
			if (!image1.isEmpty()) {
				fileStr1 = FileUploadUtils.upload(Global.getAvatarPath(), image1);
				yfgActivity.setActivityGoodsImg(fileStr1);

			}
			if (!image2.isEmpty()) {
				fileStr2 = FileUploadUtils.upload(Global.getAvatarPath(), image2);
				yfgActivity.setActivityImgOne(fileStr2);

			}
			if (!image3.isEmpty()) {
				fileStr3 = FileUploadUtils.upload(Global.getAvatarPath(), image3);
				yfgActivity.setActivityImgTwo(fileStr3);
			}
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			String activityName = request.getParameter("activityName");
			String activityContent = request.getParameter("activityContent");
			String oriPrice = request.getParameter("oriPrice");
			String activityPrice = request.getParameter("activityPrice");
			String beginDateStr = request.getParameter("beginDateStr");
			String endDateStr = request.getParameter("endDateStr");
			String activityNum = request.getParameter("activityNum");
			String remarks = request.getParameter("remarks");

			yfgActivity.setActivityName(activityName);
			yfgActivity.setActivityContent(activityContent);
			if(oriPrice!=null&&!"".equals(oriPrice)) {
				yfgActivity.setOriPrice(Integer.parseInt(oriPrice));	
			}
			if(activityPrice!=null&&!"".equals(activityPrice)) {
				yfgActivity.setActivityPrice(Integer.parseInt(activityPrice));
			}if(beginDateStr!=null&&!"".equals(beginDateStr)) {
				yfgActivity.setBeginDate(sd.parse(beginDateStr));
			}if(endDateStr!=null&&!"".equals(endDateStr)) {
				yfgActivity.setEndDate(sd.parse(endDateStr));
			}if(activityNum!=null&&!"".equals(activityNum)) {
				yfgActivity.setActivityNum(Integer.parseInt(activityNum));
			}			
			yfgActivity.setRemarks(remarks);			
			yfgActivity.setCreateDate(new Date());
			yfgActivity.setCreateUser(ShiroUtils.getUserId());
			
			yfgActivity.setUpdateDate(new Date());
			yfgActivity.setUpdateUser(ShiroUtils.getUserId());
			return toAjax(yfgActivityService.updateYfgActivity(yfgActivity));
		
		} catch (Exception e) {
			 logger.info("新增活动信息失败", e);
			 return AjaxResult.error("新增活动信息失败");
		}
		
	}
	
	/**
	 * 删除活动
	 */
	@RequiresPermissions("model:yfgActivity:remove")
	@Log(title = "活动", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(yfgActivityService.deleteYfgActivityByIds(ids));
	}
	
   @PostMapping("/importPic")
   @ResponseBody
   public AjaxResult importPic(MultipartFile file, boolean updateSupport) throws Exception
	    {
//	        return AjaxResult.success(importPicFile(file));
//	    	 SysUser currentUser = ShiroUtils.getSysUser();
	         try
	         {
	             if (!file.isEmpty())
	             {
	                 String avatar = FileUploadUtils.upload(Global.getAvatarPath(), file);
	                
	                 return AjaxResult.success(avatar);
//	                 return avatar;
	                 
	             }
	             return error();
	         }
	         catch (Exception e)
	         {
	             logger.error("商品图片上传失败！", e);
	             return error(e.getMessage());
	         }
	    }
	    
//	    /**
//	     * 上传图片
//	     * @param inFile
//	     */
//	    public String importPicFile(MultipartFile inFile) {
//	        InputStream fileStream = null;
//	        File file = null;
//	        String importPath="";
//	        //临时文件
//	        String picType=inFile.getOriginalFilename().substring(inFile.getOriginalFilename().indexOf("."));
//	        String filePath="";
//	        String filetype=Global.getConfig("ruoyi.zipFilePath");
//	        if(filetype.equals("1")){
//	        	filePath=System.getProperty("java.io.tmpdir");
//	        }else{
//	        	filePath=filetype;
//	        }
//	        String fileName=inFile.getName() + UUID.randomUUID() + picType;
//	        Path path = Paths.get(filePath, fileName);
//	        file = path.toFile();
//	        try {
//	            fileStream = inFile.getInputStream();
//	            org.apache.commons.io.FileUtils.copyInputStreamToFile(fileStream, file);
//	            
//	            //直接解析zip
//	            //readZipFile(filePath+fileName);
//	            File zipFilePath=new File(filePath+fileName);
//	    		try {
//	    			importPath = fastDFSClientWrapper.uploadFile(zipFilePath);
//	    		} catch (IOException e) {
//	    			logger.error("上传图片异常"+e.getMessage());
//	    		}
//	        } catch (IOException e) {
//	            e.printStackTrace();
//	        } catch (Exception e) {
//	        	logger.error("上传图片异常---------------------------"+e.getMessage());
//	        	e.printStackTrace();
//			} finally {
//	            try {
//	                //关闭流
//	                fileStream.close();
//	                //删除临时文件
//	                org.apache.commons.io.FileUtils.deleteQuietly(file);
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//	        }
//	        return importPath;
//	    }
	
}
