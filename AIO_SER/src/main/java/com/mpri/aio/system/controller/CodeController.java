package com.mpri.aio.system.controller;

import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.common.utils.qrcode.QRCode;
import com.mpri.aio.system.utils.CaptchaUtil;

/**
 * 各类码生成
 * @author Cary
 * @date 2018年8月3日
 */
@RestController
public class CodeController {
	
    /**
     * 二维码生成
     * @param response
     */
    @RequestMapping("qrcode")
	public void qrcode(HttpServletResponse response) {
		
		String content="http://www.caryskying.com";
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
    
    /**
	 * 验证码生成
	 * @param response
	 * @param session
	 * @throws IOException
	 */
    @PostMapping("captcha")
    public void authImg(HttpServletResponse response, HttpSession session) throws IOException {
        Map<String, Object> map = CaptchaUtil.generateCodeAndPic();
        session.setAttribute("authCode", map.get("code"));
        ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", response.getOutputStream());
    }
}
