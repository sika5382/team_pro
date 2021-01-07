package com.care.team.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface RegisterFileService {
	
	//dir과 파일 삭제
	public void userDirdelete(String userId, String path); 
	//파일 업로드
	public Map<String, Object> profileData(MultipartHttpServletRequest multipart, 
			String userId, String Path); 
	//실제사용
	public String getMessage(int result, String userid, 
			String profileName, String b_profile, String Path) throws Exception;
	//이미지출력
	public void profileDownload(Model model, String userId, String Path, 
			HttpServletResponse response) throws Exception; 

}
