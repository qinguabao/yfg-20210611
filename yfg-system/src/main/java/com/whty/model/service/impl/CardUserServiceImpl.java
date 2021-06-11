package com.whty.model.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.whty.model.mapper.AddressMapper;
import com.whty.model.mapper.CardUserMapper;
import com.whty.model.mapper.SysAreaCityMapper;
import com.whty.model.domain.CardUser;
import com.whty.model.service.ICardUserService;
import com.yfg.common.config.Global;
import com.yfg.common.core.text.Convert;
import com.yfg.common.utils.FastDFSClientWrapper;
import com.yfg.common.utils.IdGenerator;
import com.yfg.common.utils.file.FileUtils;

/**
 * 制卡 服务层实现
 * 
 * @author mario
 * @date 2019-03-25
 */
@Service
public class CardUserServiceImpl implements ICardUserService 
{
	private static Logger logger = LoggerFactory.getLogger(CardUserServiceImpl.class);
	private SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
	@Autowired
	private CardUserMapper cardUserMapper;

	@Autowired
	private AddressMapper addressMapper;
	
	@Autowired
	private SysAreaCityMapper sysAreaCityMapper;
	
	@Autowired
	private FastDFSClientWrapper fastDFSClientWrapper;
	
	/**
     * 查询制卡信息
     * 
     * @param id 制卡ID
     * @return 制卡信息
     */
    @Override
	public CardUser selectCardUserById(Integer id)
	{
	    return cardUserMapper.selectCardUserById(id);
	}
	
	/**
     * 查询制卡列表
     * 
     * @param cardUser 制卡信息
     * @return 制卡集合
     */
	@Override
	public List<CardUser> selectCardUserList(CardUser cardUser)
	{
		if(cardUser.getStartTime()!=null&&!cardUser.getStartTime().trim().equals("")){
			cardUser.setStartTime(cardUser.getStartTime()+" 00:00:00");
		}
		if(cardUser.getEndTime()!=null&&!cardUser.getEndTime().trim().equals("")){
			cardUser.setEndTime(cardUser.getEndTime()+" 23:59:59");
		}
		if(cardUser.getStartUpdateTime()!=null&&!cardUser.getStartUpdateTime().trim().equals("")){
			cardUser.setStartUpdateTime(cardUser.getStartUpdateTime()+" 00:00:00");
		}
		if(cardUser.getEndUpdateTime()!=null&&!cardUser.getEndUpdateTime().trim().equals("")){
			cardUser.setEndUpdateTime(cardUser.getEndUpdateTime()+" 23:59:59");
		}
		List<CardUser> list=cardUserMapper.selectCardUserList(cardUser);
		if(list.size()>0){
			for(CardUser u:list){
				if(u.getAddressId()!=null){
					u.setNetAddress(addressMapper.selectAddressById(u.getAddressId()).getRecAddress());
				}
			}
		}
	    return list;
	}
	
    /**
     * 新增制卡
     * 
     * @param cardUser 制卡信息
     * @return 结果
     */
	@Override
	public int insertCardUser(CardUser cardUser)
	{
	    return cardUserMapper.insertCardUser(cardUser);
	}
	
	/**
     * 修改制卡
     * 
     * @param cardUser 制卡信息
     * @return 结果
     */
	@Override
	public int updateCardUser(CardUser cardUser)
	{
	    return cardUserMapper.updateCardUser(cardUser);
	}
	
	/**
     * 修改制卡
     * 
     * @param cardUser 根据订单状态修改制卡信息
     * @return 结果
     */
	@Override
	public int updateOrderCode(CardUser cardUser)
	{
	    return cardUserMapper.updateOrderCode(cardUser);
	}

	/**
     * 删除制卡对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteCardUserByIds(String ids)
	{
		return cardUserMapper.deleteCardUserByIds(Convert.toStrArray(ids));
	}
	/**
     * 
     * 查询制卡相关信息
     * @param id 需要制卡表的ID
     * @return 结果
     */
	@Override
	public List<Map> selectCardUserInfo(Map map) {
	    return cardUserMapper.selectCardUserInfo(map);

	}
	@Override
	@Transactional(readOnly = false)
	public void exportFile(CardUser cardUser)
	{
		String photoService=Global.getConfig("fastdFS.url");
		// 整个文件夹 最后将删除的
		String basePath = CardUser.class.getResource("/").getPath().replaceAll("%20", " ") + "tem"
				+ UUID.randomUUID();
		String filepath = basePath + "/file";
		File file = new File(basePath);
		File filef = new File(filepath);
		// 如果文件夹不存在则创建
		if(!file.exists() && !file.isDirectory())
		{
			logger.debug("//不存在");
			file.mkdir();
			filef.mkdir();
		}else
		{
			logger.debug("//目录存在");
		}
		// 导出excel
		List<String[]> datalist = new ArrayList<String[]>();
		String[] li = null;
		String picUrl = "";
		// 取excel信息
		li = new String[8];
		li[0] = "000001_";
		li[1] = cardUser.getId() + "";
		li[2] = StringUtils.isNotBlank(cardUser.getApplyName()) ? cardUser
				.getApplyName().trim() : "";
		li[3] = StringUtils.isNotBlank(cardUser.getApplyNumber()) ? cardUser
				.getApplyNumber().trim() : "";
		li[4] = StringUtils.isNotBlank(cardUser.getIdCardNum()) ? cardUser
				.getIdCardNum().trim() : "";
		String gender = "";
		if (cardUser.getGender() != null
				&& !cardUser.getGender().trim().equals("")) {
			if (cardUser.getGender().trim().equals("0")) {
				gender = "男";
			}
			if (cardUser.getGender().trim().equals("1")) {
				gender = "女";
			}
			if (cardUser.getGender().trim().equals("2")) {
				gender = "未知";
			}
		}
		li[5] = gender;
		String specialCardInfo = "";
		if (cardUser.getSpecialCardInfo() != null
				&& !cardUser.getSpecialCardInfo().toString().trim().equals("")) {
			if (cardUser.getSpecialCardInfo() == 0) {
				specialCardInfo = "学生卡";
			}
			if (cardUser.getSpecialCardInfo() == 1) {
				specialCardInfo = "老年卡";
			}
		}
		li[6] = specialCardInfo;
		li[7] = StringUtils.isNotBlank(cardUser.getConnectMobile()) ? cardUser
				.getConnectMobile().trim() : "";
		datalist.add(li);

		// 取原始图片信息
		if (cardUser.getImageThree() != null
				&& !cardUser.getImageThree().trim().equals("")) {
			picUrl = "http://" + photoService +"/"+ cardUser.getImageThree();
		}
		int index = picUrl.lastIndexOf(".") > 0 ? picUrl.lastIndexOf(".") + 1 : -1;
		String suffix= index == -1 ? null : picUrl.substring(index);
		// excel
		String[] header = new String[]
		{ "序号", "订单ID", "姓名", "学生证号码", "身份证号码", "性别", "优惠卡类型" ,"联系人电话"};
		exportexcel("orderDetail", header, datalist, filepath, cardUser.getId() + "");
		// 导出原始图片
		//int r = download(params, filepath);
		if(picUrl!=null&&!picUrl.trim().equals("")){
			download(picUrl, li[0], suffix, filepath);
		}
		try
		{
			// 打包
			ZipUtils.doCompress(filepath, basePath + "/订单文件.zip");
			// 上传
			File upfile = new File(basePath + "/订单文件.zip");
			//FileInputStream inputs = new FileInputStream(upfile);
			String pat =fastDFSClientWrapper.uploadFile(upfile);
			//String pat = FastDFS.douploadFile(null, "zip", IOUtils.toByteArray(inputs));
			//inputs.close();
			logger.debug("上传路径" + pat);
			cardUser.setBackupOne(pat);
			if(cardUser.getApplyStatus()!=null&&!cardUser.getApplyStatus().trim().equals("")&&Integer.parseInt(cardUser.getApplyStatus())<3){
				cardUser.setApplyStatus("3");
			}
			try {
				cardUser.setUpdateDate(df.parse(df.format(new Date())));
			} catch (Exception e) {
				e.printStackTrace();
			}
			cardUserMapper.updateCardUser(cardUser);
		}catch(IOException e)
		{
			logger.error("打包失败");
			e.printStackTrace();
		}
		// 删除目录
		FileUtils.deleteFile(basePath);
	}
	
	/**
	 * @Title: exportexcel
	 * @Description:
	 * @param title 工作簿名称
	 * @param header 表头
	 * @param datalist 数据
	 * @param basepath 路径
	 * @param name excel表名
	 */
	public void exportexcel(String title, String[] header, List<String[]> datalist, String basepath, String name)
	{
		// String[] h = new String[]{ "序号", "订单ID", "工号", "姓名", "性别" };
		HSSFWorkbook excel = getExcel(title, header, datalist);
		File file = new File(basepath + "/" + name + ".xls");
		FileOutputStream out = null;
		try
		{
			out = new FileOutputStream(file);
			excel.write(out);
			out.close();
		}catch(FileNotFoundException e)
		{
			logger.error("文件路径有误" + basepath + "/" + name + ".xls");
			e.printStackTrace();
		}catch(IOException e)
		{
			logger.error("excel 写入出错");
			e.printStackTrace();
		}
	}
	
	/**
	 * @Title: getExcel
	 * @Description: 根据表格信息得到一个工作簿 ，居中格式
	 * @param string
	 * @param strings hearders 表头
	 * @param datalist List<String[]> data 数据 list 内一个String[]对象对应一行数据
	 * @return HSSFWorkbook 返回一个工作簿，直接调用其write可将内容输出到OutputStream
	 */
	public static HSSFWorkbook getExcel(String title, String[] headers, List<String[]> data)
	{
		if(headers == null)
		{
			return null;
		}
		// 第一步，创建一个webbook，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet(title);
		// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
		HSSFRow rowheader = sheet.createRow(0);
		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();

		HSSFCell cell = null;
		for(int i = 0; i < headers.length; i++)
		{
			cell = rowheader.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(style);
		}

		if(data == null)
		{
			return null;
		}
		for(int i = 0; i < data.size(); i++)
		{
			HSSFRow row = sheet.createRow(i + 1);
			if(data.get(i) == null)
			{
				continue;
			}
			for(int j = 0; j < data.get(i).length; j++)
			{
				cell = row.createCell(j);
				cell.setCellValue(data.get(i)[j]);
				cell.setCellStyle(style);
			}
		}
		return wb;
	}
	
	/**
	 * @Title: download
	 * @Description: 下载单个文件到指定文件夹中
	 * @param url
	 * @param name
	 * @param suffix
	 * @param basepath
	 */
	private int download(String urls, String name, String suffix, String basepath)
	{
		try {
			//fastDFSClientWrapper.downloadFile(urls);
			File uploadFile = new File(basepath+"/"+IdGenerator.getRanId() + ".jpeg");
	    	BufferedInputStream bis = null;
	        try {
	          URL url = new URL(urls);
	          HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	          conn.setDoInput(true);
	          conn.setRequestMethod("GET");
	          bis = new BufferedInputStream(conn.getInputStream());
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	    	
	    	try {
	            BufferedOutputStream fos = new BufferedOutputStream( new FileOutputStream(uploadFile));
	            byte[] buf = new byte[8096];
	            int size = 0;
	            while ((size = bis.read(buf)) != -1)
	              fos.write(buf, 0, size);
	            fos.close();
	            bis.close();
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
		return 0;
	}
	
	public static class ZipUtils
	{
		public static void doCompress(String srcFile, String zipFile) throws IOException
		{
			doCompress(new File(srcFile), new File(zipFile));
		}

		/**
		 * 文件压缩
		 * 
		 * @param srcFile 目录或者单个文件
		 * @param zipFile 压缩后的ZIP文件
		 */
		public static void doCompress(File srcFile, File zipFile) throws IOException
		{
			ZipOutputStream out = null;
			try
			{
				out = new ZipOutputStream(new FileOutputStream(zipFile));
				doCompress(srcFile, out);
			}catch(Exception e)
			{

			}finally
			{
				out.close();// 记得关闭资源
			}
		}

		public static void doCompress(String filelName, ZipOutputStream out) throws IOException
		{
			doCompress(new File(filelName), out);
		}

		public static void doCompress(File file, ZipOutputStream out) throws IOException
		{
			doCompress(file, out, "");
		}

		public static void doCompress(File inFile, ZipOutputStream out, String dir) throws IOException
		{
			if(inFile.isDirectory())
			{
				File[] files = inFile.listFiles();
				if(files != null && files.length > 0)
				{
					for(File file : files)
					{
						String name = inFile.getName();
						if(!"".equals(dir))
						{
							name = dir + "/" + name;
						}
						ZipUtils.doCompress(file, out, name);
					}
				}
			}else
			{
				ZipUtils.doZip(inFile, out, dir);
			}
		}

		public static void doZip(File inFile, ZipOutputStream out, String dir) throws IOException
		{
			String entryName = null;
			if(!"".equals(dir))
			{
				entryName = dir + "/" + inFile.getName();
			}else
			{
				entryName = inFile.getName();
			}
			ZipEntry entry = new ZipEntry(entryName);
			out.putNextEntry(entry);

			int len = 0;
			byte[] buffer = new byte[1024];
			FileInputStream fis = new FileInputStream(inFile);
			while((len = fis.read(buffer)) > 0)
			{
				out.write(buffer, 0, len);
				out.flush();
			}
			out.closeEntry();
			fis.close();
		}

		public static void main(String[] args) throws IOException
		{
			doCompress("D:/test/detail.xls", "D:/test/d.zip");
		}

	}
}
