package com.whty;

import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
//import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.context.annotation.Import;
import org.springframework.jmx.support.RegistrationPolicy;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.tobato.fastdfs.FdfsClientConfig;
import com.whty.model.domain.SysAreaCity;
import com.whty.model.service.ISysAreaCityService;
import com.yfg.common.utils.FastDFSClientWrapper;
import com.yfg.common.utils.FastUploadFileTools;


@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
//@RunWith(SpringJUnit4ClassRunner.class)
//@SpringBootTest(classes = {TestFastDfs.class})// 指定启动类
@MapperScan({"com.ruoyi.*.mapper","com.whty.*.mapper"})

@EnableMBeanExport(registration = RegistrationPolicy.IGNORE_EXISTING)
@Import(FdfsClientConfig.class)

@ComponentScan(basePackages={"com.whty.*","com.ruoyi.*","com.github"})
public class TestFastDfs {

 @Autowired
 private ISysAreaCityService sysAreaCityService;
 @Autowired
 private FastDFSClientWrapper fastDFSClientWrapper;
 
    @Test
    public void testAddUser() {
    	SysAreaCity sysAreaCity = new SysAreaCity();
    	sysAreaCity.setCreateTime(new Date());
    	sysAreaCity.setNAME("测试名称");
    	sysAreaCity.setPID(new BigDecimal(110100));
    	sysAreaCity.setSORT(new BigDecimal(1));
    	sysAreaCity.setALEVEL(new BigDecimal(2));
    	
    	
    	System.out.println("开启测试类");
    	sysAreaCityService.insertSysAreaCity(sysAreaCity);
    	System.out.println(sysAreaCityService.selectSysAreaCityById(110102));
  
    }
    /*
     * 上传文件
     */
    public void fastDfsBase64(){
    	try{
    //StorePath storePath = storageClient.uploadFile((InputStream) map.get("fileInputStream") ,Long.valueOf( map.get("fileLength").toString()), (String) map.get("extension"), null);
    	      
//    		Map<String,Object> map =new HashMap<String,Object>();
//    		map.put("fileInputStream", fastDFSClientWrapper.encodeBase64File("D:\\学生信息-1\\002\\2.jpg"));
//    		map.put("fileLength", arg1);
//    		map.put("extension", arg1);
    		Map<String,Object> map = FastUploadFileTools.getFileByteInputStream("D:\\学生信息-1\\002\\2.jpg");
        	System.out.println(fastDFSClientWrapper.uploadFileByBase64(map));;
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    }
 

}

