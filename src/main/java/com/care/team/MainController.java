package com.care.team;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("login")
	public String login() {
		
		return "login/login";
	}
	
	@RequestMapping("board")
	public String board() {
		
		return "board";
	}
	
	@RequestMapping("listing")
	public String listing() {
		
		return "listing";
	}
	
	@RequestMapping("test")
	public String test() {
		
		return "test";
	}
	
	@RequestMapping("post")
	public String post() {
		
		return "post";
	}
	
	
}
