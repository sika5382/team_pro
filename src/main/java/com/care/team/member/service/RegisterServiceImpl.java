package com.care.team.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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

	@Override
	public void myRegister(Model model, String userId) {
		model.addAttribute("userInfo",dao.myRegister(userId));
	}

	@Override
	public void modifyCheck(MemberDTO member) {
		dao.modifyCheck(member);
	}

	@Override
	public String passwordChk(String userId) {
		return dao.passwordChk(userId);
	}

	@Override
	public void pwdModify(MemberDTO dto) {
		dao.pwdModify(dto);
	}

	@Override
	public void userdelte(String userId) {
		dao.userdelte(userId);
	}

}
