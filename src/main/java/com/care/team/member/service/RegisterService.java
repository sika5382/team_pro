package com.care.team.member.service;

import org.springframework.ui.Model;

import com.care.team.member.data.MemberDTO;

public interface RegisterService {
	
	public int register(MemberDTO member); //실질적인 회원가입
	public int idCheck(String id); //아이디 중복체크
	public int nicknameCheck(String nickname); //닉네임 중복체크
	public void myRegister(Model model, String userId); //내정보
	public void modifyCheck(MemberDTO member); //내정보 수정
	public String passwordChk(String userId); //비밀번호 호출
	public void pwdModify(MemberDTO dto); //비밀번호 변경
	public void userdelte(String userId); //회원삭제

}
