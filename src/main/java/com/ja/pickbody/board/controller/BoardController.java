package com.ja.pickbody.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.pickbody.board.service.BoardServiceImpl;

@Controller
@RequestMapping("/board/test/*")
public class BoardController {
	
	@Autowired
	private BoardServiceImpl boardService; 
	
	@RequestMapping("mainPage.do")
	public String mainPage() {

		return "board/mainPage";
	}

}
