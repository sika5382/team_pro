package com.care.team.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.team.board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoarderService{
	@Autowired BoardDAO dao;
	@Autowired BoardFileService bfs;
	@Override
	public void selectAllBoardList(Model model,int num) {
		int pageLetter = 3;//한페이지에 3개의 글씩
		int allCount = dao.selectBoardCount(); //글 총갯수 얻기
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) { 
			repeat += 1; 
		}
		int end = num*pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat",repeat);
		model.addAttribute("boardList",dao.selectAllBoardList(start, end));
	}
	public String writeSave(MultipartHttpServletRequest multipartRequest) throws Exception  {
		Map<String, Object> writeMap = bfs.getData(multipartRequest);
		int result = -1;
		int write_no = 0;
		try {
			result = dao.insertBoardData(writeMap);
			write_no = dao.getMaxWrite_no();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return bfs.getMessage(result,write_no,writeMap.get("image_file_name").toString());
	}
	@Transactional
	public void contentView(int write_no, Model model) {
		try {
			model.addAttribute("contentView",dao.contentView(write_no));
			upHit(write_no);
		}catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}
	}
	private void upHit(int write_no) {
		dao.upHit(write_no);
	}
	public String modify(MultipartHttpServletRequest multipartRequest)throws Exception{
		Map<String, Object> writeMap = bfs.getData(multipartRequest);
		int write_no = (Integer.parseInt(writeMap.get("write_no").toString()));
		String originalFileName = (String)writeMap.get("originalFileName");
		String newFileName = (String)writeMap.get("image_file_name");
		int result = -1;
		try {
			if(newFileName.length()==0) {
				writeMap.replace("image_file_name", originalFileName);
			}		
			result = dao.updateBoardData(writeMap);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return bfs.getMessage(result,write_no,originalFileName,newFileName);
	}
	public String boardDelete(int write_no) {
		String message = "<script>";
		try {
			dao.boardDelete(write_no);
			bfs.boardFileDelete(write_no);
			message += "alert('글을 삭제했습니다.');";
		}catch (Exception e) {
			message += "alert('문제가 발생했습니다.');";
			e.printStackTrace();
		}
		message += "location.href='boardAllList';";
		message +=" </script>";
		return message;
	}
	public void addReply(HttpServletRequest request) {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int write_no = Integer.parseInt(request.getParameter("write_no"));
		dao.addReply(id,title,content,write_no);
	}
}











