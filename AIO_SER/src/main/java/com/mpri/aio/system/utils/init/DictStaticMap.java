package com.mpri.aio.system.utils.init;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.mpri.aio.base.mapper.JsonMapper;
import com.mpri.aio.common.utils.CacheUtils;
import com.mpri.aio.system.model.SysDict;
import com.mpri.aio.system.service.SysDictService;

/**
 * 系统基础数据的静态存储类
 * @author Cary
 * @date 2018年8月20日
 */
public class DictStaticMap{
	
	@Autowired
	private SysDictService sysDictService;
	
	private static SysDictService sysDictServiceClone;
	
	@PostConstruct
	public void init() {
		sysDictServiceClone=sysDictService;
	}
	
	public static final String CACHE_DICT_MAP = "dictMap";
	
	public static String getDictLabel(String value, String type, String defaultValue){ 
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)){
			for (SysDict dict : getDictList(type)){
				if (type.equals(dict.getTypeCode()) && value.equals(dict.getValue())){
					return dict.getLabel();
				}
			}
		}
		
		return defaultValue;
	}
	
	public static String getDictLabels(String values, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(values)){
			List<String> valueList = Lists.newArrayList();
			for (String value : StringUtils.split(values, ",")){
				valueList.add(getDictLabel(value, type, defaultValue));
			}
			return StringUtils.join(valueList, ",");
		}
		return defaultValue;
	}

	public static String getDictValue(String label, String type, String defaultLabel){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)){
			for (SysDict dict : getDictList(type)){
				if (type.equals(dict.getTypeCode()) && label.equals(dict.getLabel())){
					return dict.getValue();
				}
			}
		}
		return defaultLabel;
	}
	
	
	public static List<SysDict> getDictList(String type){
		@SuppressWarnings("unchecked")
		Map<String, List<SysDict>> dictMap = (Map<String, List<SysDict>>)CacheUtils.get(CACHE_DICT_MAP);
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			for (SysDict dict : sysDictServiceClone.loadAllListBy(new SysDict())){
				List<SysDict> dictList = dictMap.get(dict.getTypeCode());
				if (dictList != null){
					dictList.add(dict);
				}else{
					dictMap.put(dict.getTypeCode(), Lists.newArrayList(dict));
				}
			}
			CacheUtils.put(CACHE_DICT_MAP, dictMap);
		}
		List<SysDict> dictList = dictMap.get(type);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}
		return dictList;

	}
	
	/**
	 * 返回字典列表（JSON）
	 * @param type
	 * @return
	 */
	public static String getDictListJson(String type){
		return JsonMapper.toJsonString(getDictList(type));
	}
	
	
	
	
	
}
