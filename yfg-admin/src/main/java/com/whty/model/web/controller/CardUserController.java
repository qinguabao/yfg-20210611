package com.whty.model.web.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

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

import com.whty.model.domain.CardUser;
import com.whty.model.service.ICardUserService;
import com.yfg.common.annotation.Log;
import com.yfg.common.config.Global;
import com.yfg.common.core.controller.BaseController;
import com.yfg.common.core.domain.AjaxResult;
import com.yfg.common.core.page.TableDataInfo;
import com.yfg.common.enums.BusinessType;
import com.yfg.common.utils.poi.ExcelUtil;
import com.yfg.framework.util.ShiroUtils;



/**
 * 制卡 信息操作处理
 * 
 * @author mario
 * @date 2019-03-25
 */
@Controller
@RequestMapping("/model/cardUser")
public class CardUserController extends BaseController
{
	private static Logger logger = LoggerFactory.getLogger(CardUserController.class);
    private String prefix = "model/cardUser";

    private SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
	@Autowired
	private ICardUserService cardUserService;
	
	@RequiresPermissions("model:cardUser:view")
	@GetMapping()
	public String cardUser()
	{
	    return prefix + "/cardUser";
	}
	
	/**
	 * 查询制卡列表
	 */
	@RequiresPermissions("model:cardUser:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(CardUser cardUser)
	{
		startPage();
        List<CardUser> list = cardUserService.selectCardUserList(cardUser);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出制卡列表
	 */
	@RequiresPermissions("model:cardUser:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CardUser cardUser)
    {
    	List<CardUser> list = cardUserService.selectCardUserList(cardUser);
        ExcelUtil<CardUser> util = new ExcelUtil<CardUser>(CardUser.class);
        return util.exportExcel(list, "cardUser");
    }
	
	/**
	 * 新增制卡
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存制卡
	 */
	@RequiresPermissions("model:cardUser:add")
	@Log(title = "制卡", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(CardUser cardUser)
	{		
		return toAjax(cardUserService.insertCardUser(cardUser));
	}

	/**
	 * 修改制卡
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		String picUrl=Global.getConfig("ruoyi.loadPath");
		CardUser cardUser = cardUserService.selectCardUserById(id);
		if(cardUser.getImageOne()!=null&&!cardUser.getImageOne().trim().equals("")){
			cardUser.setImageOne(picUrl+cardUser.getImageOne());
		}
		if(cardUser.getImageTwo()!=null&&!cardUser.getImageTwo().trim().equals("")){
			cardUser.setImageTwo(picUrl+cardUser.getImageTwo());
		}
		if(cardUser.getImageThree()!=null&&!cardUser.getImageThree().trim().equals("")){
			cardUser.setImageThree(picUrl+cardUser.getImageThree());
		}
		if(cardUser.getImageFour()!=null&&!cardUser.getImageFour().trim().equals("")){
			cardUser.setImageFour(picUrl+cardUser.getImageFour());
		}
		if(cardUser.getApplyTime()!=null&&!cardUser.getApplyTime().toString().trim().equals("")){
			cardUser.setApplyTimeStr(df.format(cardUser.getApplyTime()));
		}
		if(cardUser.getPayTime()!=null&&!cardUser.getPayTime().toString().trim().equals("")){
			cardUser.setPayTimeStr(df.format(cardUser.getPayTime()));
		}
		if(cardUser.getPayCompleteTime()!=null&&!cardUser.getPayCompleteTime().toString().trim().equals("")){
			cardUser.setPayCompleteTimeStr(df.format(cardUser.getPayCompleteTime()));
		}
		if(cardUser.getUpdateDate()!=null&&!cardUser.getUpdateDate().toString().trim().equals("")){
			cardUser.setUpdateDateStr(df.format(cardUser.getUpdateDate()));
		}
		if(cardUser.getCheckDate()!=null&&!cardUser.getCheckDate().toString().trim().equals("")){
			cardUser.setCheckDateStr(df.format(cardUser.getCheckDate()));
		}
		mmap.put("cardUser", cardUser);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存制卡
	 */
	@RequiresPermissions("model:cardUser:edit")
	@Log(title = "制卡", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(CardUser cardUser)
	{		
		return toAjax(cardUserService.updateCardUser(cardUser));
	}
	
	/**
	 * 删除制卡
	 */
	@RequiresPermissions("model:cardUser:remove")
	@Log(title = "制卡", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(cardUserService.deleteCardUserByIds(ids));
	}
	
	/**
	 * 审核制卡信息
	 */
	@PostMapping("/auditing")
	@ResponseBody
	public AjaxResult auditing(CardUser cardUser)
	{		
		try {
			cardUser.setUpdateDate(df.parse(df.format(new Date())));
			cardUser.setCheckDate(df.parse(df.format(new Date())));
			cardUser.setCheckUser(Integer.parseInt(ShiroUtils.getSysUser().getUserId()+""));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toAjax(cardUserService.updateCardUser(cardUser));
	}
	
	/**
	 * 下载制卡信息
	 */
	@GetMapping("/downLoadFile")
	public void downLoadFile(HttpServletResponse  response,CardUser cardUser)
	{		
		try {
			CardUser user=cardUserService.selectCardUserById(cardUser.getId());
			if(user.getBackupOne()==null||user.getBackupOne().trim().equals("")){
				cardUserService.exportFile(user);
			}
			String url="http://"+Global.getConfig("fastdFS.url")+"/"+user.getBackupOne();
			String fileName="制卡信息";
			signCntrctDownload(response,fileName,url);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据路径下载文件
	 * @param response
	 * @param fileName  文件名称
	 * @param fileUrl   文件路径
	 */
	public void signCntrctDownload(HttpServletResponse  response,String fileName,String fileUrl){
		//fileUrl="http://218.5.80.23:8021/group1/M00/00/9A/rBAAmVsopR-AFBxaAAmIRKzfR78000.zip";
	    OutputStream outputStream= null;
	    InputStream inputStream=null;
	    HttpURLConnection conn =null;
	    try {
	    	response.reset();
	    	response.setHeader("content-type", "application/octet-stream");
	    	response.setContentType("application/force-download");
	    	response.setHeader("Content-Disposition", "attachment;filename=" +new String(fileName.getBytes("utf-8"),"ISO8859-1")+".zip");
	    	outputStream= 	response.getOutputStream();
	    	URL url = new URL(fileUrl);
	    
	    	logger.info("文件路径：---------------"+fileUrl);
	    	logger.info("文件名：------------------"+fileName);
	    	
	         conn = (HttpURLConnection)url.openConnection();
//	        log.info("1、文件大小：" + conn.getContentLength());
	        //设置超时间为3秒
	        conn.setDoOutput(true);
	        conn.setConnectTimeout(30*1000);
	        //防止屏蔽程序抓取而返回403错误
	        conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
	        conn.connect();
	        logger.info("1、文件大小：" + conn.getContentLength());
	        int returnCode = conn.getResponseCode();
	        logger.info("conn返回码是："+returnCode);
	        if(conn.getResponseCode()==HttpURLConnection.HTTP_OK){
	        	   //得到输入流
		        inputStream = conn.getInputStream();
		        logger.info("inputStream is:"+inputStream);
		        if(fileUrl.length()>0&&inputStream.available()<=0){
		        	logger.error("inputStream.available 大小为"+inputStream.available());
		        }else{
		        	logger.info("inputStream.available:"+inputStream.available());
		        }
		       
		       
		        byte[] buff = new byte[inputStream.available()];
		        int len = 0;
		        while ((len = inputStream.read(buff)) != -1) {
		          outputStream.write(buff, 0, len);
		        }
		        outputStream.flush();
	        	
	        }else{	        	
	        	 inputStream = conn.getErrorStream();	        	
	        	String s1= convertStreamToString(inputStream);
	        	logger.info("conn.getErrorStream 信息是："+s1);
				
	        	
	        	
	        }
		}catch(Exception e){
			logger.error("文件下载失败",e);
	    }finally{
	    	 if(inputStream!=null){
	             try {
					inputStream.close();
				} catch (IOException e) {
					logger.error("文件下载失败",e);
				}
	         }
	         if(outputStream!=null){
	         	try {
					outputStream.close();
				} catch (IOException e) {
					logger.error("文件下载失败",e);
				}
	         }if(conn!=null){
	        	 conn.disconnect();
	         }
	    }
	}
	
	public String convertStreamToString(InputStream is) {

		BufferedReader reader = new BufferedReader(new InputStreamReader(is));

		StringBuilder sb = new StringBuilder();

		String line = null;

		try {

			while ((line = reader.readLine()) != null) {

				sb.append(line + "/n");

			}

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				is.close();

			} catch (IOException e) {

				e.printStackTrace();

			}

		}

		return sb.toString();

	}
	
	/**
	 * 制卡完成
	 */
	@PostMapping("/cardPrinting")
	@ResponseBody
	public AjaxResult cardPrinting(CardUser cardUser)
	{		
		try {
			cardUser.setApplyStatus("4");
			cardUser.setUpdateDate(df.parse(df.format(new Date())));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toAjax(cardUserService.updateCardUser(cardUser));
	}
	
	/**
	 * 发货
	 */
	@PostMapping("/editLogistics")
	@ResponseBody
	public AjaxResult editLogistics(CardUser cardUser)
	{		
		try {
			cardUser.setApplyStatus("5");
			cardUser.setUpdateDate(df.parse(df.format(new Date())));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toAjax(cardUserService.updateCardUser(cardUser));
	}
}
