package com.care.team.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoarderService {

	public void selectAllBoardList(Model model,int num);
	public void selectLocalBoardList(Model model, String local, int num);
	public String writeSave(MultipartHttpServletRequest multipartRequest) throws Exception;
	public void contentView(int write_no, Model model);
	public void modifyView(int write_no, Model model);
	public String modify(MultipartHttpServletRequest multipartRequest)throws Exception;
	public String boardDelete(int write_no, HttpServletRequest request);
	public void addReply(HttpServletRequest request);
	public void myContentList(Model model, int num, String id);
}
