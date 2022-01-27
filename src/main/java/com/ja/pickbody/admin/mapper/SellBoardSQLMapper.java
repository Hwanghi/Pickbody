package com.ja.pickbody.admin.mapper;

import java.util.ArrayList;

import com.ja.pickbody.vo.AdminVo;
import com.ja.pickbody.vo.BoardDropImageVo;
import com.ja.pickbody.vo.BoardDropVo;
import com.ja.pickbody.vo.SellBoardVo;
import com.ja.pickbody.vo.SellImageVo;


public interface SellBoardSQLMapper {

	
	//판매pk생성
	public int createSellBoardPK();
	
	//판매게시판 리스트
	public ArrayList<SellBoardVo> getSellList();
	//상품 판매 페이지
	public void writeSellBoard(SellBoardVo vo);
	//상품 이미지등록
	public void SellBoardImage(SellImageVo vo);
	//상품 게시글 상세보기
	public SellBoardVo readSellBoard(int no);
	//상품 이미지 출력
	public ArrayList<SellImageVo> getSellImagesBySellNo(int no);
	//상품 이미지 첫번째꺼 출력 썸넬
	public SellImageVo getSellImageByRownum(int no);
	// 판매 게시판 글 수정
	public void updateSellBoard(SellBoardVo vo);
	// 판매 게시판 글 삭제
	public void deleteSellboard(int no);
	// 상품 판매 조회수
	public void sellincreaseview(int no);
	
	
}
