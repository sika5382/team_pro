package com.care.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.team.dao.MemberDAO;
import com.care.team.dto.MemberDTO;

@Service
public class MemberServiceImpl {
	@Autowired	MemberDAO dao;
	public int userChk(String userid, String userpwd) {
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
		return result;
	}
}
