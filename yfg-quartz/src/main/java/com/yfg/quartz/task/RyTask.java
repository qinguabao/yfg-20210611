package com.yfg.quartz.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.whty.model.socket.CloseOrderSerice;



/**
 * 定时任务调度测试
 * 
 * @author ruoyi
 */
@Component("ryTask")
public class RyTask
{
	
	@Autowired
	private CloseOrderSerice closeOrderSerice;
	private Boolean b = false;
	
	
    public void ryParams(String params)
    {
    	try {
    		if(b==false) {
        		b=true;
        		System.out.println("执行有参方法：" + params);
                closeOrderSerice.closeRoom();
                b=false;
        	}
    	}catch(Exception e) {
    		b=false;
    		e.printStackTrace();
    		System.out.println("执行定时任务失败，错误信息如上");
    	}
    
        
    }

    public void ryNoParams()
    {
        System.out.println("执行无参方法");
    }
    
    public void closeRoom() {
    	
    	closeOrderSerice.closeRoom();
    	
    }
}
