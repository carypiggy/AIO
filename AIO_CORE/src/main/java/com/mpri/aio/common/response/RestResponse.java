package com.mpri.aio.common.response;

/**
 * 登陆及鉴权相关返回格式装
 * @author Cary
 * @date 2018年8月15日
 */
public class RestResponse<T> {

	// http 状态码
    private int code;

    // 返回信息
    private String msg;

    // 返回的数据
    private T data;
    
    public static <T> RestResponse<T> getInstance(int code, String message,T data) {
    	
        return new RestResponse<T>(code,message, data);
    }
    
    public RestResponse(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
