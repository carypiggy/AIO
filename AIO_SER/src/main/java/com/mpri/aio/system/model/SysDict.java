package com.mpri.aio.system.model;

import com.mpri.aio.base.model.DataEntity;

/**
 * 
 * @author xw
 * @Date 2018-08-02
 *
 */
public class SysDict extends DataEntity<SysDict>{

	private static final long serialVersionUID = 1L;

    private String typeCode;

    private String label;

    private String value;

    private Long sort;

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode == null ? null : typeCode.trim();
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label == null ? null : label.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }

    public Long getSort() {
        return sort;
    }

    public void setSort(Long sort) {
        this.sort = sort;
    }


}