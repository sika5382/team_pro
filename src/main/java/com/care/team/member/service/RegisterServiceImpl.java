package com.care.team.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.team.member.data.RegisterDAO;
import com.care.team.member.data.MemberDTO;

@Service
public class RegisterServiceImpl implements RegisterService{
	
	@Autowired
	private RegisterDAO dao;
	
	@Override
	public int register(MemberDTO member) {
		try {
			return dao.register(member);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int idCheck(String id) {
		return dao.idCheck(id);
	}

	@Override
	public int nicknameCheck(String nickname) {
		return dao.nicknameCheck(nickname);
	}

}
