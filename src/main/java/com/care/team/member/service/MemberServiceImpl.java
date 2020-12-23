package com.care.team.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.team.member.data.MemberDAO;
import com.care.team.member.data.MemberDTO;

@Service
public class MemberServiceImpl {
	@Autowired	MemberDAO dao;
	public ArrayList userChk(String userid, String userpwd) {
		ArrayList arr = new ArrayList();
		int result = 0;//해당 아이디 정보 없음
		MemberDTO dto = null;
		try {
			dto = dao.userSelect(userid);
			if(dto != null) {
				System.out.println("DB id : "+dto.getId());
				System.out.println("DB pwd : "+dto.getPwd());
				if(dto.getPwd().equals(userpwd)) {
					result = 1;//사용자 정보 일치
				}else {
					result = 2;//사용자 정보 불일치
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		arr.add(0, result);
		arr.add(1, dto);
		return arr;
	}
	public String searchId(String name, String birth, String email) {
		String result = null;
		try {
			result = dao.searchId(name, birth, email);
			System.out.println("result:"+result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String searchPwd(MemberDTO dto) {
		String result = null;
		try {
			String id = dao.searchPwd(dto.getName(), dto.getEmail());
			System.out.println("id : "+id);
			if(id.equals(dto.getId())) {//입력한 정보가 일치하는 경우
				String pwd = randomPwd();
				dao.changePwd(id, pwd);
				result = pwd;	
			}else {
				result = "1";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result = "2";//에러 발생
		}
		return result;
	}
	public String randomPwd() {
		String pwd = "";
		for(int i=0; i<8; i++) {
			int rnd = (int)(Math.random()*(122-48+1)+48);//48~122사이의 랜덤 수
			System.out.println(rnd);
			if((rnd >= 58 && rnd <= 64) || (rnd >= 91 && rnd <= 96)) {//영문과 숫자에 해당하지않는 범위
				i--;
			}else {//영문 대소문자 또는 숫자
				pwd += (char)rnd;
			}
		}
		System.out.println("tmp pwd:"+pwd);
		return pwd;
	}
}
