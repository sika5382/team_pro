package com.care.team.member.contoller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.team.member.data.MemberDTO;
import com.care.team.member.service.MemberServiceImpl;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class LoginController {	
	@Autowired MemberServiceImpl ms;
	
	@PostMapping("userChk")
	public void userChk(@RequestParam("userid") String userid, 
						@RequestParam("userpwd") String userpwd,
						HttpServletRequest request, 
						HttpServletResponse response) throws Exception {
		System.out.println("input id : "+userid);
		System.out.println("input pwd : "+userpwd);
		ArrayList arr = ms.userChk(userid, userpwd);
		int result = (int) arr.get(0);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(); 
		if(result == 1) {//login success
			MemberDTO dto = (MemberDTO) arr.get(1);
			session.setAttribute("userid", dto.getId());
			session.setAttribute("nickname", dto.getNickname());
			session.setAttribute("login", "system");
			System.out.println("session 생성 : "+session.getAttribute("userid"));
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
		session.setAttribute("nickname", nickname);
		session.setAttribute("userid", id);
		session.setAttribute("login", "kakao");
		return "myPage";
	}
	@RequestMapping("myPage")
	public String mypage() {
		return "member/myPage";
	}
	@RequestMapping("naverLogin")
	public String test() {
		return "login/naverLogin";
	}
	@RequestMapping("naverSuccess")
	public String naverSuccess(@RequestParam("id") String id, 
								@RequestParam("nickname") String nickname,
								HttpSession session,
								HttpServletResponse response) throws Exception {
		session.setAttribute("userid", id);
		session.setAttribute("nickname", nickname);
		session.setAttribute("login", "naver");
		 response.setContentType("text/html; charset=UTF-8");
		 System.out.println("session id:"+id);
         PrintWriter out = response.getWriter();
         out.println("<script>window.opener.location.href=\"myPage\";"
         		+ "				window.close();</script>");
         out.flush();
		return "member/myPage";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
