package com.care.team.member.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface RegisterFileService {

	public void userDirdelete(String userId);
	public Map<String, Object> profileData(MultipartHttpServletRequest multipart, String userId);
	public String getMessage(int result, String userid, String profileName, String b_profile) throws Exception;

}
