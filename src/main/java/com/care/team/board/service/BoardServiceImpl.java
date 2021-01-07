package com.care.team.board.service;

import java.util.ArrayList;
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
import com.care.team.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoarderService{
	
	@Autowired BoardDAO dao;
	@Autowired BoardFileService bfs;
	
	@Override
	public void selectAllBoardList(Model model,int num) {
		int pageLetter = 4;//한페이지에 4개의 글씩
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
	
	public void selectLocalBoardList(Model model, String local, int num) {
		try {
			int pageLetter = 6;//한 페이지에 6개의 글씩
			int allCount = dao.selectLocalCount(local+"%");
			int repeat = allCount/pageLetter;
			if((allCount % pageLetter) != 0) {
				repeat += 1;
			}
			int end = num*pageLetter;
			int start = end + 1 - pageLetter;
			model.addAttribute("repeat", repeat);
			ArrayList<BoardDTO> localList = dao.selectLocalBoardList(local+"%", start, end);
			System.out.println(localList.get(0).getPlace_addr());
			model.addAttribute("localBoard", localList);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		
		String IMAGE_REPO = 
			multipartRequest.getSession().getServletContext().getRealPath("/resources/board");	
		return bfs.getMessage(result,write_no,writeMap.get("image_file_name").toString(),IMAGE_REPO);
	}
	//@Transactional
	public void contentView(int write_no, Model model) {
		try {
			BoardDTO dto = dao.contentView(write_no);
			System.out.println(dto.getNickname());
			model.addAttribute("contentView",dto);
			upHit(write_no);
		}catch (Exception e) {
			//TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
		}
	}
	private void upHit(int write_no) {
		dao.upHit(write_no);
	}
	public void modifyView(int write_no, Model model) {
		try {
			BoardDTO dto = dao.contentView(write_no);
			System.out.println(dto.getId());
			model.addAttribute("contentView",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//@Transactional
	public String modify(MultipartHttpServletRequest multipartRequest)throws Exception{
		Map<String, Object> writeMap = bfs.getData(multipartRequest);
		System.out.println("write_no"+writeMap.get("write_no").toString());
		
		int write_no = (Integer.parseInt(writeMap.get("write_no").toString()));
		String originalFileName = (String)writeMap.get("originalFileName");
		String newFileName = (String)writeMap.get("image_file_name");
		String deleteChk = (String)writeMap.get("deleteChk");
		String IMAGE_REPO = 
			multipartRequest.getSession().getServletContext().getRealPath("/resources/board");
		int result = -1;
		try {
			if(originalFileName == null) { originalFileName = ""; }
			System.out.println("original"+originalFileName);
			if(newFileName.length()==0) {//새로 넣는 파일 없는 경우
				if(deleteChk.equals("chk")) {//기존 파일도 삭제
					writeMap.replace("image_file_name", "");
				}else {//기존 파일로 저장					
					writeMap.replace("image_file_name", originalFileName);
				}
			}
			result = dao.updateBoardData(writeMap);
			System.out.println("modified result: "+result);
		}catch (Exception e) {
			e.printStackTrace();
			//TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return bfs.getMessage(deleteChk,result,write_no,originalFileName,newFileName,IMAGE_REPO);
	}
	
	public String boardDelete(int write_no, HttpServletRequest request) {
		
		String IMAGE_REPO = 
				request.getSession().getServletContext().getRealPath("/resources/board");
		String message = "<script>";
		try {
			dao.boardDelete(write_no);
			bfs.boardFileDelete(write_no, IMAGE_REPO);
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
	
	public void myContentList(Model model, int num, String id) {
		try {
			int pageLetter = 3;//한페이지에 3개의 글씩
			int allCount = dao.myContentCount(id); //글 총갯수 얻기
			int repeat = allCount / pageLetter;
			if(allCount % pageLetter != 0) { 
				repeat += 1; 
			}
			int end = num*pageLetter;
			int start = end + 1 - pageLetter;
			model.addAttribute("repeat",repeat);
			System.out.println("id : "+id);
			model.addAttribute("myContentList",dao.myContent(id, start, end));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}











