package com.mpri.aio.system.utils;

import java.util.ArrayList;
import java.util.List;

import com.mpri.aio.system.vo.FormSelectDatas;

/**
 * 数据转换
 * @author Administrator
 *
 */
public class DatasCovert {

	public static FormSelectDatas setRootFormSelectData(List<FormSelectDatas> formSelectDatas,String root) {
		FormSelectDatas formSelectData = new FormSelectDatas();
		for(FormSelectDatas fd : formSelectDatas) {
			if(fd.getParentId().equalsIgnoreCase(root)) {
				formSelectData.setChildren(covertFormSelectDatas(formSelectDatas,fd.getValue()));
				break;
			}
		}
		return formSelectData;
	}
	
	public static List<FormSelectDatas> covertFormSelectDatas(List<FormSelectDatas> formSelectDatas,String parentId){
		List<FormSelectDatas> fds =  new ArrayList<FormSelectDatas>();
		for(FormSelectDatas fd : formSelectDatas) {
			if(fd.getParentId().equals(parentId)) {
				fd.setChildren(covertFormSelectDatas(formSelectDatas,fd.getValue()));
				fds.add(fd);
			}
		}
		return fds;
	}
}
