package com.mpri.aio.system.controller;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.common.utils.qrcode.QRCode;

/**
 * 微信相关请求
 * @author Cary
 * @date 2018年9月14日
 */
@RestController
public class WebChatController {

	@RequestMapping(value = "/qrcode")
	public void qrcode(HttpServletResponse response) {
		
		String content="http://www.163.com";
	    ServletOutputStream outputStream = null;
	    try {
	        outputStream = response.getOutputStream();
	        QRCode.Stream_QRCode(content, "http://life.southmoney.com/tuwen/UploadFiles_6871/201805/20180510090638710.jpg", outputStream);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (outputStream != null) {
	            try {
	                outputStream.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}

}
