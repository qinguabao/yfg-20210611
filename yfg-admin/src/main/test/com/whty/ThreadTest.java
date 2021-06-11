package com.whty;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

public class ThreadTest {
	
	
	
	public Integer testThread() {
		
	    int m=0;
	    SimpleDateFormat sd = new SimpleDateFormat("YYYY-mm-dd HH:MM:SS");
	    try {   	

		for(int i=0;i<20;i++) {
			System.out.println(i+"当前的时间是"+sd.format(new Date()));
			m=m+1;
		}
		
		return m;
	    }catch(Exception e) {
	    	e.printStackTrace();
	    	return m;
	    }finally{
	    	try {
	    		Thread.sleep(1000);
	    		System.out.println("当前的时间是"+sd.format(new Date()));
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    }
		
	   }
	
	
public Integer testThread2() {
		
	    int m=0;
	    SimpleDateFormat sd = new SimpleDateFormat("YYYY-mm-dd HH:MM:ss");
	 	

		for(int i=0;i<20;i++) {
			System.out.println(i+"当前的时间是"+sd.format(new Date()));
			m=m+1;
		}
		new Thread(new Runnable() {

	        @Override
	        public void run() {
                try {
                	 Thread.sleep(5*1000);
                	 System.out.println(">>>>>>>>>>当前的时间是"+sd.format(new Date()));
                	 System.out.println(">>>>>>>>>>函数返回的结果是");
                }catch(Exception e) {
                	
                }
	           
	        }
	    }).start();
		
		return m;
	    
		
	   }
	

public Integer testThread3() {
	
    int m=0;
    SimpleDateFormat sd = new SimpleDateFormat("YYYY-mm-dd HH:MM:ss");
 	

	for(int i=0;i<20;i++) {
		System.out.println(i+"当前的时间是"+sd.format(new Date()));
		m=m+1;
	}
	
	ThreadTaocan th = new ThreadTaocan();
	th.setResult(""+m);
	Thread thread = new Thread(th);
	thread.start();
	
	return m;
    
	
   }
	  @Test
	  public void test() {
		  
		  int result =  testThread3();
		  System.out.println("**********最后的结果是："+result+"*************");
		  while(1==1) {
			  System.out.print(""); 
		  }
		  
	  }


	  @Test
	public  void testjiemi(){
		String miwen = "M4VdvQCeO/OJDFuL13i7WDuiiTLkExd+gJuhC3Msa7ZiTU8CmJ1u9TjykHWOdHtLrJ8LGOwbwuhxskE0y20edkASDbFpFSAy7SL+OOtxPUzof06ac3n1PMu0BQPcAl7KIiNLqGL9Ac/EgkvP6G4rp+jT7KSm0qSY3pvQMYuSMrERoeqLIyWDXvfPjijyG9dDtAI+0wp+IMws7t6RBOgx5w==";
		String iv = "B5D5q02MUdMi+2irLoK+nA==";
		String sessionKey="RsTDQRoFt4VqyuUJGu9WOQ==";
		String result = decryptData(
				  miwen,
				sessionKey,
				iv
		  );
		  System.out.println("result = " + result);


	  }

	public static String decryptData(String encryptDataB64, String sessionKeyB64, String ivB64) {
		return new String(
				decryptOfDiyIV(
						Base64.decode(encryptDataB64),
						Base64.decode(sessionKeyB64),
						Base64.decode(ivB64)
				)
		);
	}

	private static final String KEY_ALGORITHM = "AES";
	private static final String ALGORITHM_STR = "AES/CBC/PKCS7Padding";
	private static Key key;
	private static Cipher cipher;

	private static void init(byte[] keyBytes) {
		// 如果密钥不足16位，那么就补足.  这个if 中的内容很重要
		int base = 16;
		if (keyBytes.length % base != 0) {
			int groups = keyBytes.length / base + (keyBytes.length % base != 0 ? 1 : 0);
			byte[] temp = new byte[groups * base];
			Arrays.fill(temp, (byte) 0);
			System.arraycopy(keyBytes, 0, temp, 0, keyBytes.length);
			keyBytes = temp;
		}
		// 初始化
		Security.addProvider(new BouncyCastleProvider());
		// 转化成JAVA的密钥格式
		key = new SecretKeySpec(keyBytes, KEY_ALGORITHM);
		try {
			// 初始化cipher
			cipher = Cipher.getInstance(ALGORITHM_STR, "BC");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 解密方法
	 *
	 * @param encryptedData 要解密的字符串
	 * @param keyBytes      解密密钥
	 * @param ivs           自定义对称解密算法初始向量 iv
	 * @return 解密后的字节数组
	 */
	private static byte[] decryptOfDiyIV(byte[] encryptedData, byte[] keyBytes, byte[] ivs) {
		byte[] encryptedText = null;
		init(keyBytes);
		try {
			cipher.init(Cipher.DECRYPT_MODE, key, new IvParameterSpec(ivs));
			encryptedText = cipher.doFinal(encryptedData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return encryptedText;
	}




}
	

