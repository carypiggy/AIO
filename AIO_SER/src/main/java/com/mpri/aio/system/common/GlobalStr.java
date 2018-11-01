package com.mpri.aio.system.common;

import com.mpri.aio.common.utils.DateUtils;

/**
 * 全局常量类
* <p>Title: GlobalStr</p>  
* <p>Description: </p>  
* @author syp  
* @date 2018年9月28日
 */
public class GlobalStr {
	
	/*默认机构*/
	public static  String DEFAULT_ORG ="0";
	
	/*默认用户类型*/
	public static  String DEFAULT_USER_TYPE ="NORMAL";
	
	/*卡片未审核*/
    public static  String DEFAULT_CARD_STATUS ="NO_AUDIT";
	/*卡片未审核*/
    public static  String NO_APPLY_CARD_STATUS ="NO_APPLY";
	
	/*初始没有身份证号的密码默认密码*/
	public static  String DEFAULT_PWD = "DF"+DateUtils.getYear();
	
	/*默认证件类型*/
	public static  String DEFAULT_CARDTYPE = "IDCARD";
	
	/*默认国家*/
	public static  String DEFAULT_COUNTRY = "000000";
	
	//菜单根节点的父值定义为root
	public static final String MENU_ROOT_ID="root";
	
    /* 默认校友类型 */
    public static final String DEFAULT_SCHOOLMATE_TYPE =  "STUDENT";
    
    /*性别码表typeCode*/
    public static String SEX_TYPECODE = "SEX";

    /*证件码表typeCode*/
    public static String IDCARDTYPE_TYPECODE = "IDCARD_TYPE";
    
    /*身份证码表typeCode*/
    public static String ID_CARD = "IDCARD";
    
    /*民族码表typeCode*/
    public static String NATION = "NATION";
    
    /*校友类型码表typeCode*/
    public static String SCHOOLEMATE_TYPE = "SCHOOLEMATE_TYPE";
    
    /*联系方式码表typeCode*/
    public static String PHOTO = "PHONE";
    
    /*联系方式码表typeCode*/
    public static String EMAIL = "EMAIL";
    
    /*数据库状态*/
    public static String HOLD = "HOLD";
    public static String NORMAL ="NORMAL";
    
    
    /*捐赠状态*/
    public static String WAITING_DON = "WAITING";
    public static String NORMAL_DON ="NORMAL";
    public static String FAIL_DON = "HOLD";
    
	/*是否是籍贯*/
	public static final String IS_NATION_PLACE ="IS_NATION_PLACE";
	public static final String NO_NATION_PLACE ="NO_NATION_PLACE";
	/*学历*/
	public static final String EDU_DEGREE = "EDU_DEGREE";
	/*学位类型*/
	public static final String EDU_DEGREETYPE = "EDU_DEGREETYPE";
	/*学制*/
	public static final String EDU_SCHOOLEN = "EDU_SCHOOLEN";
    
	/*区域级别*/
	public static String COUNTRY = 	"COUNTRY";
	public static String PROVINCE = "PROVINCE";
	public static String CITY = "CITY";
	public static String TOWN = "TOWN";
	public static String SMALL_COUNTRY = "SMALL_COUNTRY";
	public static String VILLAGE = "VILLAGE";

}
