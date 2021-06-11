package com.whty;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ThreadTaocan implements Runnable {

	private String result;
	
	
	
	public String getResult() {
		return result;
	}



	public void setResult(String result) {
		this.result = result;
	}



	@Override
	public void run() {
		try {
			Thread.sleep(5*1000);
			 SimpleDateFormat sd = new SimpleDateFormat("YYYY-mm-dd HH:MM:ss");
			System.out.println("|||||||||||获取的结果是"+result+"。"+sd.format(new Date()));	
		}catch(Exception e) {
			
		}
		
		
	}

	
	   
	
}
