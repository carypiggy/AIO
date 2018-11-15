package com.mpri.aio.system.utils;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.github.pagehelper.util.StringUtil;
import com.mpri.aio.system.common.GlobalStr;

import freemarker.template.Template;
import freemarker.template.TemplateException;

@Component
public class MailUtil
{
	@Autowired
	private JavaMailSender jms;
	
	@Autowired
    private FreeMarkerConfigurer configurer;
	
	/*校友卡邮件发送主题*/
	public static final String MAIL_SUBJECT = "个人——salary";

	/**
	 * 管理员邮箱
	 */
	@Value("${spring.mail.adminAddress}")
	String adminAddress;
	@Value("${spring.mail.username}")
	String username;
	@Value("${spring.mail.port}")
	String port;
	@Value("${spring.mail.password}")
	String password;
	@Value("${spring.mail.smtp.ssl.checkserveridentity}")
	Boolean checkserveridentity;
	@Value("${spring.mail.host}")
	String host;
	@Value("${spring.mail.mailType}")
	String mailType;
	
	/**
	 * 使用freemarker模板异步发送邮件
	 * @param toEmail 目标地址
	 * @param template 模板对象
	 * @param model 模板参数
	 * @throws IOException
	 * @throws TemplateException
	 * @throws MessagingException
	 */
	public Boolean asyncSendMail(String toEmail, Template template,Map<String, Object> map,String filePath){
		String html;
		try {
			html = FreeMarkerTemplateUtils
					.processTemplateIntoString(template, map);
			sendMail(toEmail, html,filePath);
			return true;
		} catch (IOException | TemplateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 使用freemarker模板异步发送邮件
	 * @param toEmail 目标地址
	 * @param templateName freemarker模板名称
	 * @param model 模板参数
	 * @throws IOException
	 * @throws TemplateException
	 * @throws MessagingException
	 */
	public Boolean asyncSendMail(String toEmail, String templateName,Map<String, Object> map,String filePath){
		try {
			if(!templateName.endsWith(".ftl"))
			{
				templateName=templateName+".ftl";
			}
			Template template = configurer.getConfiguration().getTemplate(templateName);
			String html;
			html = FreeMarkerTemplateUtils
					.processTemplateIntoString(template, map);
			sendMail(toEmail, html,filePath);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 异步发送邮件
	 * @param toEmail 目标地址
	 * @param html 发送内容
	 * @throws IOException
	 * @throws TemplateException
	 * @throws MessagingException
	 */
	@Async("mailTaskExecutor")
	public Boolean asyncSendMail(String toEmail, String html,String filePath){
		if(GlobalStr.Mail_TLS.equals(mailType)) {
			return sendMailTls(toEmail, html,filePath);
		}else {
			return sendMailSsl(toEmail, html,filePath);
		}
	}
	
	/**
	 * 同步发送邮件，由于网络原因，响应可能被阻塞
	 * @param toEmail 目标地址
	 * @param html 发送内容
	 * @throws IOException
	 * @throws MessagingException
	 */
	public Boolean sendMail(String toEmail, String html,String filePath){
		if(GlobalStr.Mail_TLS.equals(mailType)) {
			return sendMailTls(toEmail, html,filePath);
		}else {
			return sendMailSsl(toEmail, html,filePath);
		}
	}
	
	/**
	 * Tls 发送邮件
	* <p>Title: sendMailTls</p>  
	* <p>Description: </p>
	 * @return 
	 * @throws MessagingException 
	 * @throws AddressException 
	 */
	public boolean sendMailTls(String toEmail, String html,String filePath) {
		try {
			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			//不做服务器证书校验
			props.put("mail.smtp.ssl.checkserveridentity", checkserveridentity);
			//添加信任的服务器地址，多个地址之间用空格分开
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.ssl.trust", host);
			Session session = Session.getInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}
					});
			Message message = new MimeMessage(session);
			message.setSubject(MAIL_SUBJECT);
			message.setFrom(new InternetAddress(adminAddress));
			message.setRecipients(Message.RecipientType.TO,
			InternetAddress.parse(toEmail));
			message.setText(html);
	        FileSystemResource file=new FileSystemResource(new File(filePath));
	        String fileName=filePath.substring(filePath.lastIndexOf("/")+1);
			message.setFileName(fileName);
			Transport.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * ssl 发送邮件
	 * @return 
	 * @throws MessagingException 
	 */
	public boolean sendMailSsl(String toEmail, String html,String filePath){
		MimeMessage message = jms.createMimeMessage();
		try {
			message.setSubject(MAIL_SUBJECT);
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setFrom(adminAddress);
			helper.setTo(toEmail);
			if(!StringUtil.isEmpty(filePath)) {
		        FileSystemResource file=new FileSystemResource(new File(filePath));
		        String fileName=filePath.substring(filePath.lastIndexOf("/")+1);
		        helper.addAttachment(fileName,file);	
			}
			helper.setText(html, true);
			jms.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}

	}
}
