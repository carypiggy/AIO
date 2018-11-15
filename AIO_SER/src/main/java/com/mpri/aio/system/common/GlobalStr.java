package com.mpri.aio.system.common;

import java.util.ArrayList;
import java.util.List;

import com.mpri.aio.common.utils.DateUtils;

/**
 * 全局常量类
* <p>Title: GlobalStr</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年9月28日
 */
public class GlobalStr {
    
	
	/*初始没有身份证号的密码默认密码*/
	public final static  String DEFAULT_PWD = "DF"+DateUtils.getYear();
	
	/*默认证件类型*/
	public final static  String DEFAULT_CARDTYPE = "IDCARD";
	
	/*默认国家*/
	public final static  String DEFAULT_COUNTRY = "000000";
	
	//菜单根节点的父值定义为root
	public final static String MENU_ROOT_ID="root";
	
    
    /*数据库状态*/
    public final static String HOLD = "HOLD";
    public final static String NORMAL ="NORMAL";
    
    
    
	/*区域级别*/
	public final static String COUNTRY = 	"COUNTRY";
	public final static String PROVINCE = "PROVINCE";
	public final static String CITY = "CITY";
	public final static String TOWN = "TOWN";
	public final static String SMALL_COUNTRY = "SMALL_COUNTRY";
	public final static String VILLAGE = "VILLAGE";

	
	/*邮件安全验证类型*/
	public final static String Mail_TLS = "TLS";
	public final static String Mail_SSL = "SSL";
	
	
}
