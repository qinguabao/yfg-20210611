package com.whty;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.context.annotation.Import;
import org.springframework.jmx.support.RegistrationPolicy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.CollectionUtils;
import com.github.tobato.fastdfs.FdfsClientConfig;


    @SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
	@RunWith(SpringJUnit4ClassRunner.class)
    @SpringBootTest(classes = {SpringBootTestOne.class})// 指定启动类
    @MapperScan({"com.whty.*.mapper","com.yfg.*.mapper"})
    @Import(FdfsClientConfig.class)
    @EnableMBeanExport(registration = RegistrationPolicy.IGNORE_EXISTING)
    @ComponentScan(basePackages={"com.whty.*","com.yfg.*"})
	public class SpringBootTestOne {

	
	    @Test
	    public void testAddUser() {
	    	
	    }
	    
	  
       
       

}


