package com.care.team.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoarderService {

	public void selectAllBoardList(Model model,int num);
	public String writeSave(MultipartHttpServletRequest multipartRequest) throws Exception;
	public void contentView(int write_no, Model model);
	public String modify(MultipartHttpServletRequest multipartRequest)throws Exception;
	public String boardDelete(int write_no);
	public void addReply(HttpServletRequest request);
}
