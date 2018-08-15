package com.mpri.aio.system.controller;

import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mpri.aio.system.utils.CaptchaUtil;

/**
 * 
 * @author Cary
 * @date 2018年8月3日
 */
@RestController
public class CaptchaController {

    @RequestMapping(value = "captcha")
    public void authImg(HttpServletResponse response, HttpSession session) throws IOException {
        Map<String, Object> map = CaptchaUtil.generateCodeAndPic();
        session.setAttribute("authCode", map.get("code"));
        ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", response.getOutputStream());
    }
}
