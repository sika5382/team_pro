package com.care.team.member.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface RegisterFileService {
	
	//dir과 파일 삭제
	public void userDirdelete(String userId, String path); 
	//파일 업로드
	public Map<String, Object> profileData(
		MultipartHttpServletRequest multipart, String userId, String Path); 
	//실제사용
	public String getMessage(
		int result, String userid, String profileName, String b_profile, String Path) throws Exception; 

}
