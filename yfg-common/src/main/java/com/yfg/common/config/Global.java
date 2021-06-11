package com.yfg.common.config;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yfg.common.utils.StringUtils;
import com.yfg.common.utils.YamlUtil;

/**
 * 全局配置类
 * 
 * @author ruoyi
 */
public class Global
{
    private static final Logger log = LoggerFactory.getLogger(Global.class);

    private static String NAME = "application.yml";

    /**
     * 当前对象实例
     */
    private static Global global;

    /**
     * 保存全局属性值
     */
    private static Map<String, String> map = new HashMap<String, String>();

    private Global()
    {
    }

    /**
     * 静态工厂方法
     */
    public static synchronized Global getInstance()
    {
        if (global == null)
        {
            global = new Global();
        }
        return global;
    }

    /**
     * 获取配置
     */
    public static String getConfig(String key)
    {
        String value = map.get(key);
        if (value == null)
        {
            Map<?, ?> yamlMap = null;
            try
            {
                yamlMap = YamlUtil.loadYaml(NAME);
                value = String.valueOf(YamlUtil.getProperty(yamlMap, key));
                map.put(key, value != null ? value : StringUtils.EMPTY);
            }
            catch (FileNotFoundException e)
            {
                log.error("获取全局配置异常 {}", key);
            }
        }
        return value;
    }

    /**
     * 获取项目名称
     */
    public static String getName()
    {
        return StringUtils.nvl(getConfig("ruoyi.name"), "RuoYi");
    }

    /**
     * 获取项目版本
     */
    public static String getVersion()
    {
        return StringUtils.nvl(getConfig("ruoyi.version"), "3.2.0");
    }

    /**
     * 获取版权年份
     */
    public static String getCopyrightYear()
    {
        return StringUtils.nvl(getConfig("ruoyi.copyrightYear"), "2018");
    }

    /**
     * 获取ip地址开关
     */
    public static Boolean isAddressEnabled()
    {
        return Boolean.valueOf(getConfig("ruoyi.addressEnabled"));
    }

    /**
     * 获取文件上传路径
     */
    public static String getProfile()
    {
        return getConfig("ruoyi.profile");
    }
    
    public static String getActivity_pfr()
    {
        return getConfig("ruoyi.activity_pfr");
    }
    /**
     * 获取图片外网路径
     */
    public static String getloadPath()
    {
        return getConfig("ruoyi.loadPath");
    }
    /**
     * 微信获取图片外网路径
     */
    public static String getwxPath()
    {
        return getConfig("ruoyi.wxPath");
    }
    /**
     * 获取微信appid
     */
    public static String getAppId()
    {
        return getConfig("ruoyi.appid");
    }
    /*
    获取小程序appid
     */

    public static String getAppletsAppId()
    {
        return getConfig("ruoyi.appletsAppId");
    }
    /*
    小程序 secrt appletsAppSecret
     */
    public static String getppletsAppSecret()
    {
        return getConfig("ruoyi.appletsAppSecret");
    }

    /**
     * 微信支付下单地址
     */
    public static String getWxPayOrderUrl()
    {
        return getConfig("ruoyi.wxPayOrderUrl");
    }
    
    /**
     * 微信支付查询地址
     */
    public static String getWxPayQueryUrl()
    {
        return getConfig("ruoyi.wxPayQueryUrl");
    }
    /**
     * 获取微信appSecret
     */
    public static String getAppSecret()
    {
        return getConfig("ruoyi.appSecret");
    }
    
    /*
     * 获取商户id
     */
    public static String getMchId()
    {
        return getConfig("ruoyi.wxPaymchId");
    }
    
    /*
     * 获取商户 key
     */
    public static String getMchidKey()
    {
        return getConfig("ruoyi.wxPayapiKey");
    }
    
    /**
     * 获取头像上传路径
     */
    public static String getAvatarPath()
    {
        return getConfig("ruoyi.profile") + "avatar/";
    }
    /**
     * 微信商户号
     */
    public static String getWxPaymchId()
    {
        return getConfig("ruoyi.wxPaymchId") + "avatar/";
    }
    
    /**
     * 微信支付appId
     */
    public static String getWxPayappId()
    {
        return getConfig("ruoyi.wxPayappId") + "avatar/";
    }
    /**
     * 微信支付密钥apiKey
     */
    public static String getWxPayapiKey()
    {
        return getConfig("ruoyi.wxPayapiKey") + "avatar/";
    }
    


    
    /**
     * 获取下载路径
     */
    public static String getDownloadPath()
    {
        return getConfig("ruoyi.profile") + "download/";
    }

    /**
     * 获取上传路径
     */
    public static String getUploadPath()
    {
        return getConfig("ruoyi.profile") + "upload/";
    }
    

    /**
     * 获取上传路径
     */
    public static String getSmstimeout()
    {
        return getConfig("ruoyi.smstimeout");
    }
}
