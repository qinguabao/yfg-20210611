package com.whty.model.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.whty.model.mapper.YfgVerifcodeMobileMapper;
import com.whty.model.domain.YfgVerifcodeMobile;
import com.whty.model.service.IYfgVerifcodeMobileService;
import com.yfg.common.config.Global;
import com.yfg.common.core.text.Convert;

/**
 * 短信验证码 服务层实现
 * 
 * @author mario
 * @date 2019-04-25
 */
@Service
public class YfgVerifcodeMobileServiceImpl implements IYfgVerifcodeMobileService 
{
	
	private static Logger logger = LoggerFactory.getLogger(YfgVerifcodeMobileServiceImpl.class);
	@Autowired
	private YfgVerifcodeMobileMapper yfgVerifcodeMobileMapper;

	/**
     * 查询短信验证码信息
     * 
     * @param id 短信验证码ID
     * @return 短信验证码信息
     */
    @Override
	public YfgVerifcodeMobile selectYfgVerifcodeMobileById(Integer id)
	{
	    return yfgVerifcodeMobileMapper.selectYfgVerifcodeMobileById(id);
	}
    
    
	@Override
	public boolean Verification(String loginname,String smscode) {
	    boolean success = false;
	    
	    YfgVerifcodeMobile YfgVerifcodeMobileTmep = new YfgVerifcodeMobile();
	    YfgVerifcodeMobileTmep.setMobilePhone(loginname);
	    YfgVerifcodeMobileTmep.setVercode(smscode);
	    List<YfgVerifcodeMobile> list=yfgVerifcodeMobileMapper.selectYfgVerifcodeMobileList(YfgVerifcodeMobileTmep);
	    if(list!=null&&list.size()>0){
	    	
	    	YfgVerifcodeMobile verificationcode=list.get(0);
	        long beginTime = verificationcode.getCreateDate().getTime();
		    String smscode_timeout = Global.getSmstimeout();
		    long endTime = beginTime+Long.parseLong(smscode_timeout)*1000;
		    logger.info("短信验证码参数newSmscode:"+smscode+"//beginTime:"+beginTime+
	                "//System.currentTimeMillis():"+System.currentTimeMillis()+"//endTime:"+endTime);
		    if(beginTime<=System.currentTimeMillis() && System.currentTimeMillis()<=endTime){
	            success = true;
	        }
	        logger.info("短信验证是否成功"+success);	    	
	    }else {
	        logger.info("Verificationcode list查询无数据");
	    }	  
	    return success;
	}
	
	@Override
	public boolean Verification(String loginname) {
	    boolean success = false;
	    
	    YfgVerifcodeMobile YfgVerifcodeMobileTmep = new YfgVerifcodeMobile();
	    YfgVerifcodeMobileTmep.setMobilePhone(loginname);
	   
	    List<YfgVerifcodeMobile> list=yfgVerifcodeMobileMapper.selectYfgVerifcodeMobileListOrderByCreateDate(YfgVerifcodeMobileTmep);
	    if(list!=null&&list.size()>0){
	    	
	    	YfgVerifcodeMobile verificationcode=list.get(0);
	        long beginTime = verificationcode.getCreateDate().getTime();
		    String smscode_timeout = Global.getSmstimeout();
		    long endTime = beginTime+Long.parseLong(smscode_timeout)*1000;
		    logger.info("短信验证码参数loginname:"+"//beginTime:"+beginTime+
	                "//System.currentTimeMillis():"+System.currentTimeMillis()+"//endTime:"+endTime);
		    if(beginTime<=System.currentTimeMillis() && System.currentTimeMillis()<=endTime){
	            success = true;
	            logger.info("短信在有效时间范围内不允许再发"+success);	
	        }else {
	        	logger.info("不在 短信在有效时间范围内 允许再发"+success);	
	        }
	            	
	    }else {
	        logger.info("Verificationcode list查询无数据");
	    }	  
	    return success;
	}

	@Override
	public boolean VerificationByOpneid(String openId) {
	    boolean success = false;
	    
	    YfgVerifcodeMobile YfgVerifcodeMobileTmep = new YfgVerifcodeMobile();
	    YfgVerifcodeMobileTmep.setOpenId(openId);
	   
	    List<YfgVerifcodeMobile> list=yfgVerifcodeMobileMapper.selectYfgVerifcodeMobileListOrderByCreateDate(YfgVerifcodeMobileTmep);
	    if(list!=null&&list.size()>0){
	    	
	    	YfgVerifcodeMobile verificationcode=list.get(0);
	        long beginTime = verificationcode.getCreateDate().getTime();
		    String smscode_timeout = Global.getSmstimeout();
		    long endTime = beginTime+Long.parseLong(smscode_timeout)*1000;
		    logger.info("短信验证码参数loginname:"+"//beginTime:"+beginTime+
	                "//System.currentTimeMillis():"+System.currentTimeMillis()+"//endTime:"+endTime);
		    if(beginTime<=System.currentTimeMillis() && System.currentTimeMillis()<=endTime){
	            success = true;
	            logger.info("短信在有效时间范围内不允许再发"+success);	
	        }else {
	        	logger.info("不在 短信在有效时间范围内 允许再发"+success);	
	        }
	            	
	    }else {
	        logger.info("Verificationcode list查询无数据");
	    }	  
	    return success;
	}
	
	/**
     * 查询短信验证码列表
     * 
     * @param yfgVerifcodeMobile 短信验证码信息
     * @return 短信验证码集合
     */
	@Override
	public List<YfgVerifcodeMobile> selectYfgVerifcodeMobileList(YfgVerifcodeMobile yfgVerifcodeMobile)
	{
	    return yfgVerifcodeMobileMapper.selectYfgVerifcodeMobileList(yfgVerifcodeMobile);
	}
	
    /**
     * 新增短信验证码
     * 
     * @param yfgVerifcodeMobile 短信验证码信息
     * @return 结果
     */
	@Override
	public int insertYfgVerifcodeMobile(YfgVerifcodeMobile yfgVerifcodeMobile)
	{
	    return yfgVerifcodeMobileMapper.insertYfgVerifcodeMobile(yfgVerifcodeMobile);
	}
	
	/**
     * 修改短信验证码
     * 
     * @param yfgVerifcodeMobile 短信验证码信息
     * @return 结果
     */
	@Override
	public int updateYfgVerifcodeMobile(YfgVerifcodeMobile yfgVerifcodeMobile)
	{
	    return yfgVerifcodeMobileMapper.updateYfgVerifcodeMobile(yfgVerifcodeMobile);
	}

	/**
     * 删除短信验证码对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteYfgVerifcodeMobileByIds(String ids)
	{
		return yfgVerifcodeMobileMapper.deleteYfgVerifcodeMobileByIds(Convert.toStrArray(ids));
	}
	
}
