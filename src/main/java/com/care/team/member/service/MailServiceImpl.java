package com.care.team.member.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl {
	@Autowired
	JavaMailSender mailSender;
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body, true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("메일 전송 실패!");
		}
	}
	public String mailBody(String pwd) {
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<h1>안녕하세요! CarCamp 입니다!</h1><hr>");
		sb.append("<div style='padding: 10px 20px;text-align:center;'>");
		sb.append("고객님이 요청하신 임시비밀번호는 <br>");
		sb.append("<span style='font-size:1.5em; color:red; font-weight:bold;'>"+pwd+"</span> 입니다.<br>");
		sb.append("사이트에서 로그인 하신 후 원하시는 비밀번호로 변경하시기 바랍니다.<br>");
		sb.append("<a href='http://localhost:8090/team/login'>CarCamp 바로가기</a>");
		sb.append("</div>");	
		sb.append("</html></body>");
		String str = sb.toString();
		return str;
	}
}
