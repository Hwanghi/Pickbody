package com.ja.pickbody.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.board.mapper.BoardSQLMapper;

@Service
public class BoardServiceImpl {
	@Autowired
	private BoardSQLMapper boardSQLMapper;
	
	public void writeContent() {
		
		
	}
	
	public ArrayList<HashMap<String, Object>> getBoardList() {
		//여기가 1차 예제... 도전 과제...
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		
		return list;
		
	}
	
	
	public HashMap<String, Object> getBoard(int board_no) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		return map;
	}
	
	public void deleteContent(int board_no) {
	}
	
	public void updateContent() {
	}
}
