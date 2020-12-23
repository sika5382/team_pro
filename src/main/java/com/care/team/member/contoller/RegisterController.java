package com.care.team.member.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.team.member.data.MemberDTO;
import com.care.team.member.service.RegisterService;

@Controller
@RequestMapping("member")
public class RegisterController {
	
	@Autowired
	RegisterService ms;
	
	@RequestMapping("registerForm")
	public String registerForm() {
		return "member/registerForm";
	}
	
	@RequestMapping(value = "registerCheck", method = RequestMethod.POST)
	public String registerCheck(MemberDTO member,
			@RequestParam("id") String id,@RequestParam("pwd") String pwd,
			@RequestParam("nickname") String nickname,@RequestParam("email") String email,
			@RequestParam("name") String name,@RequestParam("birth") int birth) {
		member.setId(id);
		member.setPwd(pwd);
		member.setNickname(nickname);
		member.setEmail(email);
		member.setName(name);
		member.setBirth(birth);
		
		int result = ms.register(member);
		System.out.println("result : "+result);
		if(result == 1 ) {
			return "member/registerSuccess";
		}else {
			
			return "redirect:registerForm";
		}
	}
	
	@RequestMapping("registerSuccess")
	public String registerSuccess() {
		return "member/registerSuccess";
	}
	
	@RequestMapping(value="idCheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int result = ms.idCheck(id);
		String str = null;
		if(result == 1) {
			str = "중복값 있음";
		}else {
			str = "중복값 없음";
		}
		System.out.println("result : " + str);
		return result;
	}
	
	@RequestMapping(value = "nicknameCheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {
		int result = ms.nicknameCheck(nickname);
		String str = null;
		if(result == 1) {
			str = "중복값 있음";
		}else {
			str = "중복값 없음";
		}
		System.out.println("result : " + str);
		return result;
	}
	
	@RequestMapping("myRegister")
	public String myRegister() {
		return "member/myRegister";
	}
	
	
	
	
}
