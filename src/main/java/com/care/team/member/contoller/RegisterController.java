package com.care.team.member.contoller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.team.board.service.BoarderService;
import com.care.team.member.data.MemberDTO;
import com.care.team.member.service.MemberServiceImpl;
import com.care.team.member.service.RegisterService;

@Controller
@RequestMapping("member")
public class RegisterController {
	
	@Autowired
	RegisterService rs;
	MemberServiceImpl ms;
	@Autowired
	BoarderService bs;
	
	//회원가입 폼으로 이동
	@RequestMapping("registerForm")
	public String registerForm() {
		return "member/registerForm";
	}
	
	//회원가입 
	@RequestMapping(value = "registerCheck", method = RequestMethod.POST)
	public String registerCheck(MemberDTO member) {
		
		int result = rs.register(member);
		System.out.println("result : "+result);
		if(result == 1 ) {
			return "member/registerSuccess";
			//성공시 registerSuccess.jsp로 이동
		}else {
			System.out.println("회원가입 실패");
			return "redirect:registerForm";
			//실패시 다시 회원가입 폼으로 이동 내용은 없음
		}
	}
	
	//회원가입 성공폼으로 이동
	@RequestMapping("registerSuccess")
	public String registerSuccess() {
		return "member/registerSuccess";
	}
	
	//Ajax 아이디 중복검사
	@RequestMapping(value="idCheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		int result = rs.idCheck(id);
		String str = null;
		if(result == 1) {
			str = "중복값 있음";
		}else {
			str = "중복값 없음";
		}
		System.out.println("result : " + str);
		return result;
	}
	
	//Ajax 닉네임 중복검사
	@RequestMapping(value = "nicknameCheck", produces = "application/json;charset=utf-8")
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {
		int result = rs.nicknameCheck(nickname);
		String str = null;
		if(result == 1) {
			str = "중복값 있음";
		}else {
			str = "중복값 없음";
		}
		System.out.println("result : " + str);
		return result;
	}
	
	//회원수정 이동 및 회원 데이터 호출
	@RequestMapping("myPage")
	public String myRegister(Model model, @RequestParam("id") String userId) {
		rs.myRegister(model,userId);
		return "member/myPage";
	}
	
	//이미지 변경창으로 이동
	@RequestMapping("profile")
	public String profile() {
		return "member/profile";		}
	
	//이미지 변경
	@RequestMapping("profile_change")
	public void profile_change() {
			
	}
	
	//회원정보 수정
	@RequestMapping(value = "modifyCheck", method = RequestMethod.POST )
	public String modifyCheck(MemberDTO member,	RedirectAttributes ra) {
		rs.modifyCheck(member);
		ra.addAttribute("id", member.getId());
		return "redirect:myRegister";
	}
	
	//비밀번호 변경페이지 이동 및 회원의 정보 가져오기
	@RequestMapping("passwordModify")
	public String passwordModify(Model model, @RequestParam("id") String userId) {
		rs.myRegister(model,userId); //회원 정보 호출
		return "member/passwordModify";
	}
	
	//비밀번호 수정
	@RequestMapping(value ="pwdModify", method = RequestMethod.POST )
	public void pwdModify(MemberDTO dto, @RequestParam("ori_pwd") String ori_pwd,
			HttpSession session, HttpServletResponse response) throws Exception {
		
			//mybatis문제로 dto에 id값과 변경 pwd를 넣어서 던지기로함
			//mybatis문제 : 여러게의 파라미터를 받지 못하기때문에
		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			String ori = rs.passwordChk(dto.getId());
			//기존 비밀번호 호출
		if( !ori.equals(ori_pwd) ) { //여기서 기존 비밀번호와 입력 기존 비밀번호 확인
			
			out.println("<script>");
			out.println("alert('현재 비밀번호가 다릅니다 다시 입력해주세요');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			
		} else {
			rs.pwdModify(dto);
			
			out.println("<script>");
			out.println("alert('비밀번호가 정상적으로 변경되었습니다 다시 로그인해주세요');");
			out.println("location.href='/team/login';");
			out.println("</script>");
			out.flush();
			
			session.invalidate();
			//비밀번호가 변경이 되면 로그인한 세션이 풀리고 다시 로그인창으로 던짐
		}
	}
	
	//회원탈퇴 정보확인페이지로 이동
	@RequestMapping("deleteCheck")
	public String deleteCheck(Model model,@RequestParam("id")String userId) {
		rs.myRegister(model,userId); //회원 정보 호출
		return "member/deleteCheck";
	}
	
	//회원 탈퇴전 정보확인
	@RequestMapping(value = "identification", method = RequestMethod.POST)
	public void identification(@RequestParam("userid") String  userid, 
			@RequestParam("userpwd") String userpwd, HttpSession session,
			HttpServletResponse response) throws Exception {
		
		String ori = rs.passwordChk(userid);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
				
		if(!ori.equals(userpwd) ) { //여기서 기존 비밀번호와 입력 기존 비밀번호 확인
		
			out.println("<script>");
			out.println("alert('비밀번호를 틀렸습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		} else {
			out.println("<script>");
			out.println("location.href='registerDelete?id="+userid+"';");
			out.println("</script>");
			out.flush();
		}
	}
	
	//회원탈퇴페이지로 이동
	@RequestMapping("registerDelete")
	public String registerDelete(@RequestParam("id") String userId,
			HttpSession session) {
		return "member/registerDelete";
	}
	
	//회원탈퇴
	@RequestMapping("userdelete")
	public String userdelete(@RequestParam("id") String userId,
			HttpSession session) {
		rs.userdelte(userId);
		session.invalidate();
		return "redirect:/login";
	}
	
	//내가 쓴 글
	@RequestMapping("myContent")
	public String myContentList(Model model,
			@RequestParam("id") String id,
			@RequestParam(value="num", required = false, defaultValue = "1") int num) {
		bs.myContentList(model, num, id);
		return "member/myContentList";
	}
}

