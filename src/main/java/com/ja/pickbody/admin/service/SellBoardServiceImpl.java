package com.ja.pickbody.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.admin.mapper.AdminSQLMapper;
import com.ja.pickbody.admin.mapper.SellBoardSQLMapper;
import com.ja.pickbody.board.mapper.BuyBoardSQLMapper;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.vo.AdminVo;
import com.ja.pickbody.vo.BoardDropImageVo;
import com.ja.pickbody.vo.BoardDropVo;
import com.ja.pickbody.vo.SellBoardVo;
import com.ja.pickbody.vo.SellImageVo;


@Service
public class SellBoardServiceImpl {
    
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
    @Autowired
	private SellBoardSQLMapper sellBoardSQLMapper;
    @Autowired
    private BuyBoardSQLMapper buyBoardSQLMapper;
	
 // 판매게시판 리스트
 	public ArrayList<HashMap<String, Object>> getSellList() {
 		
 		ArrayList<HashMap<String, Object>> sellList = new ArrayList<HashMap<String, Object>>();
 		
 		ArrayList<SellBoardVo> adminsellList = sellBoardSQLMapper.getSellList();
 	
 		for(SellBoardVo sellVo : adminsellList) {
 			
 			HashMap<String, Object> map = new HashMap<String, Object>();
 			int sell_no = sellVo.getSell_no();
 			SellImageVo sellImageVo = sellBoardSQLMapper.getSellImageByRownum(sell_no);
 			int totalbuylikeCount = buyBoardSQLMapper.totalbuylikeCount(sell_no);
 	        int getAmountRiview = buyBoardSQLMapper.getAmountReview(sell_no);
 	          
 	        map.put("getAmountRiview", getAmountRiview);
 	        map.put("totalbuylikeCount", totalbuylikeCount);
 			
 			map.put("sellVo", sellVo);
 			map.put("sellImageVo", sellImageVo);
 			
 			sellList.add(map);
 		}
 		
 		return sellList;
 		
 		
 	
 	}
   //글쓰기
	public void writeSellBoard(SellBoardVo vo, ArrayList<SellImageVo> sellImageVoList) {
		
	//pk생성
	int sell_no = sellBoardSQLMapper.createSellBoardPK();
	vo.setSell_no(sell_no);
	//글쓰기 insert
	sellBoardSQLMapper.writeSellBoard(vo);
	
	//이미지
	for(SellImageVo sellImageVo : sellImageVoList) {
	sellImageVo.setSell_no(sell_no);
	sellBoardSQLMapper.SellBoardImage(sellImageVo);
		
	}
	}

	//판매게시판 글 상세보기
	public HashMap<String, Object> getReadSellBoard(int sell_no) {

		//조회수
		sellBoardSQLMapper.sellincreaseview(sell_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		SellBoardVo sellVo = sellBoardSQLMapper.readSellBoard(sell_no);
	
		//이미지 리스트 출력
		ArrayList<SellImageVo> sellImageVo = sellBoardSQLMapper.getSellImagesBySellNo(sell_no);

		map.put("sellVo", sellVo);
		map.put("sellImageVo", sellImageVo);
		return map;
	}
	
	// 판매 게시판 글 수정하기
		public void updateSellBoard(SellBoardVo vo) {
			sellBoardSQLMapper.updateSellBoard(vo);
		}
	
	// 판매 게시판 글 삭제하기
		public void deleteSellboard(int sell_no) {
			sellBoardSQLMapper.deleteSellboard(sell_no);
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}



