package com.ja.pickbody.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ja.pickbody.board.mapper.DropBoardSQLMapper;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.vo.ApplicationVo;
import com.ja.pickbody.vo.BoardDropVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.WinningListVo;

@Service
@EnableScheduling
public class WinningServiceImpl {

	@Autowired
	DropBoardSQLMapper dropBoardSQLMapper;
	
	@Autowired
	MemberSQLMapper memberSQLMapper;
	
	
		@Scheduled(cron = "50 59 23 * * *")
		//당첨자 번호
		public void selectWinningMember() {	
			
			ArrayList<BoardDropVo> equallist = dropBoardSQLMapper.enddateEqualSysdate();
			
			for(BoardDropVo dropVo : equallist) {
				
				ArrayList<ApplicationVo> applicationVoList = dropBoardSQLMapper.getDropApplicationListByDropNo(dropVo.getDrop_no());
				System.out.println("게시글 번호  : " + dropVo.getDrop_no());
				int totalApplicationCount = applicationVoList.size();
				int dropAmount = dropVo.getDrop_amount();
				System.out.println("드랍상품 개수 : " + dropAmount);
				System.out.println("게시글 제목 : " + dropVo.getDrop_title());
				ArrayList<Integer> rnumList = new ArrayList<Integer>();
				System.out.println("지원자 수  : " + totalApplicationCount);
				
				for(int i = 0 ; i < dropAmount ; i++) {
					int rnum = (int)(Math.random()*totalApplicationCount);
					int winningPk = dropBoardSQLMapper.createWinningPk();
					if(rnumList.contains(rnum)) {
						i--;
						continue;
					}
					System.out.println("rnum : " + rnum);
					rnumList.add(rnum);//추첨 완료 번호...
					
					ApplicationVo winningApplicationVo = applicationVoList.get(rnum);
					
					WinningListVo winningListVo = new WinningListVo();
					winningListVo.setWinning_no(winningPk);
					winningListVo.setDrop_no(dropVo.getDrop_no());
					winningListVo.setMember_no(winningApplicationVo.getMember_no());
					
					dropBoardSQLMapper.registWinningMember(winningListVo);
				}
				
				
				
				
				/*
				int drop_no = dropVo.getDrop_no();
				
				int totalApplicationCount = dropBoardSQLMapper.totalApplicationCount(drop_no);
				int dropAmount = dropBoardSQLMapper.getDropAmount(drop_no);
			
				ArrayList<Integer> rnumList = new ArrayList<Integer>();
				
				for(int i = 0; i < dropAmount; i++) {
					
					
					WinningListVo winningListVo = new WinningListVo();
					
					int rnum = (int)(Math.random()*totalApplicationCount) + 1;
					int winningPk = dropBoardSQLMapper.createWinningPk();
					
					if(rnumList.contains(rnum)) {
						i--;
						continue;
					}
					rnumList.add(rnum);
					
					
					ApplicationVo appVo = dropBoardSQLMapper.pickWinningNumber(drop_no, rnum);
					
					int winningMemberNo = appVo.getMember_no();
					winningListVo.setWinning_no(winningPk);
					winningListVo.setDrop_no(drop_no);
					winningListVo.setMember_no(winningMemberNo);
					dropBoardSQLMapper.registWinningMember(winningListVo);
				}*/
				
			}
		}
		
		//당첨자 출력
		public ArrayList<HashMap<String, Object>> getWinningMember(int drop_no){
			
			ArrayList<WinningListVo> winningListVos = dropBoardSQLMapper.getWinningMember(drop_no);
			
			ArrayList<HashMap<String, Object>> winninglist = new ArrayList<HashMap<String,Object>>();

			
			for(WinningListVo winningVo : winningListVos) {
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				int member_no = winningVo.getMember_no();
				MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
				
				map.put("memberVo", memberVo);
				map.put("winningVo", winningVo);
				winninglist.add(map);
			}
			
			return winninglist;
		}
	
}
