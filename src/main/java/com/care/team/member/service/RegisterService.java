package com.care.team.member.service;

import com.care.team.member.data.MemberDTO;

public interface RegisterService {
	
	public int register(MemberDTO member); //실질적인 회원가입
	public int idCheck(String id); //아이디 중복체크
	public int nicknameCheck(String nickname); //닉네임 중복체크

}
