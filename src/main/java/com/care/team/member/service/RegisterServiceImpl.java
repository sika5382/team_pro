package com.care.team.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.care.team.member.data.RegisterDAO;
import com.care.team.member.data.MemberDTO;

@Service
public class RegisterServiceImpl implements RegisterService{
	
	@Autowired private RegisterDAO dao;
	@Autowired private RegisterFileService rfs;
	
	@Transactional
	@Override
	public int register(MemberDTO member) {
		try {
			return dao.register(member);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
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

	@Transactional
	@Override
	public void modifyCheck(MemberDTO member) {
		try {
			dao.modifyCheck(member);
		}catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}
	}

	@Override
	public String passwordChk(String userId) {	
		return dao.passwordChk(userId);
	}
	
	@Transactional
	@Override
	public void pwdModify(MemberDTO dto) {
		try {
			dao.pwdModify(dto);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}	
	}
	
	@Transactional
	@Override
	public void userDelete(String userId) {
		try {
			rfs.userDirdelete(userId);
			dao.userDelete(userId);
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}
	}

	@Override
	public String userProfile(MultipartHttpServletRequest multipart, String userId) throws Exception {
		
		//기존 profile_img가지고 오기
		String profile_Name = dao.getProfile_Img(userId);
		
		Map<String, Object> profileMap = rfs.profileData(multipart,userId);
		String message = "";
		int result = -1;
		try {

			if(profile_Name.isEmpty()) {
				profile_Name = "없음";
			}
			System.out.println("기존 파일명 : "+profile_Name);
			
			if(profileMap.get("profileName").toString().equals("확장자오류")) {
				
				message = "<script>";
				message += "alert('확장자는 .jsp,.gif,.png만 가능합니다.');";
				message += "location.href='profile?id="+userId+"';";
				message += "</script>";
			}else {
				result = dao.userProfile(profileMap);
				System.out.println("result : "+result);
				
				message = 
					rfs.getMessage(result,userId,profileMap.get("profileName").toString(),profile_Name);
					
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}

}
