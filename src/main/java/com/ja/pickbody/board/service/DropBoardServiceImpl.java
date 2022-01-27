package com.ja.pickbody.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.board.mapper.DropBoardSQLMapper;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.vo.ApplicationVo;
import com.ja.pickbody.vo.BoardDropImageVo;
import com.ja.pickbody.vo.BoardDropVo;
import com.ja.pickbody.vo.MemberPointHistoryVo;
import com.ja.pickbody.vo.MemberVo;

@Service
public class DropBoardServiceImpl {
	
	@Autowired
	private DropBoardSQLMapper dropBoardSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	//드랍 게시판 리스트
		public ArrayList<HashMap<String, Object>> getBoardDropList() {
			
			ArrayList<HashMap<String, Object>> droplist = new ArrayList<HashMap<String, Object>>();
			
			
			
			//SELECT * FROM FP_Board ORDER BY board_no DESC;
			ArrayList<BoardDropVo> boardDropList = dropBoardSQLMapper.getBoardDropList();
			
			for(BoardDropVo boardDropVo : boardDropList) {
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				int drop_no = boardDropVo.getDrop_no();
				BoardDropImageVo boardDropImageVo = dropBoardSQLMapper.getBoardDropImageByRownum(drop_no);
				
				map.put("boardDropVo", boardDropVo);
				map.put("boardDropImageVo", boardDropImageVo);

				droplist.add(map);
			}
			
			
			return droplist;
		}
		
		//드랍 게시판 상세보기
		public HashMap<String, Object> getBoardDropByNo(int drop_no, boolean escape) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			BoardDropVo boardDropVo = dropBoardSQLMapper.getBoardDropByNo(drop_no);
		
			if(escape) {
				String str = StringEscapeUtils.escapeHtml4(boardDropVo.getDrop_content());
				str = str.replaceAll("\n", "<br>");
				boardDropVo.setDrop_content(str);
			}
			
			//이미지 리스트 출력
			ArrayList<BoardDropImageVo> boardDropImageVoList = dropBoardSQLMapper.getBoardDropImagesByDropNo(drop_no);
			map.put("boardDropVo", boardDropVo);
			map.put("boardDropImageVoList", boardDropImageVoList);
			

			/*map.put("memberVo", memberVo);
			map.put("applicationList", applicationList);*/
			
			return map;
		}
		
		//드랍 응모하기
		public void applicationDrop(ApplicationVo vo) {
			int myApplicationCount = dropBoardSQLMapper.myApplicationCount(vo);
			
			if(myApplicationCount == 0) {
				dropBoardSQLMapper.dropApplication(vo);
			}
			
		}
		
		
		//댓글 보기
		public ArrayList<HashMap<String, Object>> getAapplicationDropList(int drop_no) {
			
			//댓글 리스트 출력
			ArrayList<HashMap<String, Object>> applist = new ArrayList<HashMap<String,Object>>();
			
			ArrayList<ApplicationVo> applicationList = dropBoardSQLMapper.getDropApplicationListByDropNo(drop_no);
					
			for(ApplicationVo applicationVo : applicationList) {
				int member_no = applicationVo.getMember_no();
				
				MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
				HashMap<String, Object> map = new HashMap<String, Object>();
				
				map.put("memberVo", memberVo);
				map.put("applicationVo", applicationVo);
				
				applist.add(map);
			}
			
			return applist;
		}
		
		public int myApplicationCount(ApplicationVo vo) {
			
			return dropBoardSQLMapper.myApplicationCount(vo);
		}
		
		public int totalApplicationCount(int drop_no) {
			
			return dropBoardSQLMapper.totalApplicationCount(drop_no);
		}
		
	
	
}
