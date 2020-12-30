package com.care.team.member.contoller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.team.member.data.MemberDTO;
import com.care.team.member.service.MailServiceImpl;
import com.care.team.member.service.MemberServiceImpl;

@Controller
public class SearchContoller {
	@Autowired MemberServiceImpl ms;
	@Autowired MailServiceImpl mail;
	@RequestMapping("searchForm")
	public String searchIdForm(@RequestParam("menu") String menu, Model model) {
		model.addAttribute("menu", menu);
		System.out.println("menu:"+menu);
		return "login/searchIdForm";
	}
	@RequestMapping(value="/searchId", method = RequestMethod.POST)
	@ResponseBody
	public String searchId(@RequestParam("name") String name,
							@RequestParam("birth") String birth,
							@RequestParam("email") String email, Model model) {
		System.out.println("name : "+name);
		System.out.println("birth:"+birth);
		System.out.println("email:"+email);
		String result = ms.searchId(name, birth, email);
		return result;
	}
	@RequestMapping(value="/searchPwd", method = RequestMethod.POST)
	public void searchPwd(MemberDTO dto, HttpServletResponse response,
							HttpServletRequest request) throws Exception {
		System.out.println(dto.getId());
		String result = ms.searchPwd(dto);
		System.out.println("pwd chage : "+result);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result.equals("1") || result.equals("2")) {
			out.println("<script>alert('비밀번호 초기화 실패! 입력하신 정보를 다시 확인하시기 바랍니다.');"
					+ "history.back()</script>");
		}else {
			String subject = dto.getName()+"님 비밀번호 찾기 이메일입니다.";
			mail.sendMail(dto.getEmail(), subject, mail.mailBody(result));
			out.println("<script>alert('비밀번호 초기화 성공! 입력하신 이메일로 임시비밀번호가 발송되었습니다.');"
					+ "location.href='login';</script>");
		}
		out.flush();
	}
	
}
