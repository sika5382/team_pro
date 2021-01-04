package com.care.team.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.team.board.service.BoardFileService;

import com.care.team.board.service.BoarderService;


@Controller
@RequestMapping("board")
public class BoardController {

	
	@Autowired
	private BoarderService bs;
	@Autowired
	private BoardFileService bfs;
	@RequestMapping(value="boardAllList",method= {RequestMethod.GET, RequestMethod.POST})
	public String selectAllBoardList(Model model,
			@RequestParam(value="num", required = false, defaultValue = "1") int num) {
		bs.selectAllBoardList(model, num);
		return "board/boardAllList";
	}
	@GetMapping("writeForm")
	public String writeForm() {
		return "board/writeForm";
	}
	@PostMapping("writeSave")
	public ResponseEntity writeSave(MultipartHttpServletRequest multipartRequest) throws Exception {
		System.out.println("writesave");
		String message = bs.writeSave(multipartRequest);
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}
	@GetMapping("contentView")
	public String contentView(@RequestParam("write_no") int write_no, Model model) {
		bs.contentView(write_no,model);
		return "board/contentView";
	}
	@GetMapping("download")
	public void download(@RequestParam("write_no") int write_no,
					@RequestParam("image_file_name") String image_file_name,
			                 HttpServletResponse response)throws Exception {
		System.out.println("download 컨트롤러 실행 ");
		bfs.download(write_no, image_file_name, response);
	}
	@RequestMapping("modifyForm")
	public String modifyForm(@RequestParam("write_no") int write_no, Model model) {
		bs.modifyView(write_no, model);
		return "board/modifyForm";
	}
	@PostMapping("modify")
	public ResponseEntity modify(MultipartHttpServletRequest multiRequest,
			HttpServletResponse response)throws Exception {
		String message = bs.modify(multiRequest);
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		//HttpStatus.CREATED(201) : 요청이 성공적으로 처리되었으며, 자원이 생성되었다는 상태 응답 코드
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}
	@GetMapping("boardDelete")
	public ResponseEntity boardDelete(@RequestParam("write_no") int write_no,
			HttpServletResponse response) {
		String message = bs.boardDelete(write_no);
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}
	@GetMapping("boardReplyView")
	public String boardReplyView(@RequestParam("write_no") int write_no,Model model) {
		model.addAttribute("write_no",write_no);
		return "board/replyForm";
	}
	@PostMapping("addReply")
	public String addReply(HttpServletRequest request, RedirectAttributes red) {
		bs.addReply(request);
		red.addAttribute("write_no",request.getParameter("write_no"));
		return "redirect:contentView";	
	}
}
