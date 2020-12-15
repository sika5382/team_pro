package com.care.team;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.team.service.MemberServiceImpl;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class MainController {
	@Autowired MemberServiceImpl ms;
	@RequestMapping("login")
	public String login() {		
		return "login";
	}
	@PostMapping("userChk")
	public void userChk(@RequestParam("userid") String userid, 
							@RequestParam("userpwd") String userpwd,
							HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println("input id : "+userid);
		System.out.println("input pwd : "+userpwd);
		int result = ms.userChk(userid, userpwd);
		System.out.println("login result : "+result);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result == 1) {//login success
			session.setAttribute("userid", userid);
			session.setAttribute("login", "system");
			System.out.println("session 생성 : "+session.getAttribute("id"));
			out.println("<script>alert('로그인 성공!'); location.href='myPage'</script>");
			out.flush();
		}else {//login fail
			out.println("<script>alert('로그인 실패! 아이디와 비밀번호를 확인하시기 바랍니다'); location.href='login'</script>");
			out.flush();
		}
	}
	@RequestMapping("success")
	@ResponseBody
	public String success(@RequestBody String result, HttpSession session) {
		System.out.println(result);
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);
		String id = element.getAsJsonObject().get("id").getAsString();
		JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		String nickname = properties.getAsJsonObject().get("nickname").getAsString();
		JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
		System.out.println(kakao_account);
		System.out.println("id : "+id);
		System.out.println("nickname : "+nickname);
		session.setAttribute("userid", id);
		session.setAttribute("login", "kakao");
		return "myPage";
	}
	

}
