package com.care.team.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardFileService {
	public Map<String, Object> getData(MultipartHttpServletRequest multipartRequest) throws Exception;
	public String getMessage(String deleteChk, int result,int write_no, String image_file_name, String path, String iMAGE_REPO)throws Exception;
	public void download(int write_no,String image_file_name, 
									String iMAGE_REPO, HttpServletResponse response)throws Exception;
	public String getMessage(int result,int write_no,String originalFile,String newFile)throws Exception;
	public void boardFileDelete(int write_no, String IMAGE_REPO)throws Exception;
}
