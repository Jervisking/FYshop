package com.demo.fyshop.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 邮件发送工具类
 * 
 * @author wanghuanjie
 * 
 */
public class MailUtils {
	/**
	 * 发送邮件
	 * 
	 * @param to
	 *            :收件人
	 * @param code
	 *            :激活码
	 */
	public static void sendMail(String to, String code) {
		/**
		 * 1.获得一个Session对象. 2.创建一个代表邮件的对象Message. 3.发送邮件Transport
		 */
		// 1.获得连接对象
		Properties props = new Properties();
		props.setProperty("mail.host", "localhost");
		Session session = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// 服务器邮箱
				return new PasswordAuthentication("service@fyshop.com", "123");
			}

		});
		// 2.创建邮件对象:
		Message message = new MimeMessage(session);
		// 设置发件人:
		try {
			message.setFrom(new InternetAddress("service@fyshop.com"));
			// 设置收件人:
			message.addRecipient(RecipientType.TO, new InternetAddress(to));
			// 设置标题
			message.setSubject("购物天堂--飞鱼商城官方激活邮件");
			// 设置邮件正文:
			message.setContent(
					"<h1>购物天堂--飞鱼商城官方激活邮件!点下面链接完成激活操作!</h1><h3><a href='http://localhost:8080/FYshop/user_active?code="
							+ code
							+ "'>http://localhost:8080/FYshop/user_active?code="
							+ code + "</a></h3>", "text/html;charset=UTF-8");
			// 3.发送邮件:
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
