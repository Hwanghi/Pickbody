package com.ja.pickbody.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.pickbody.vo.ApplicationVo;
import com.ja.pickbody.vo.BoardDropImageVo;
import com.ja.pickbody.vo.BoardDropVo;
import com.ja.pickbody.vo.WinningListVo;

public interface DropBoardSQLMapper {

	//드랍 게시판 리스트 출력
	public ArrayList<BoardDropVo> getBoardDropList();
	//드랍 게시판 글 보기
	public BoardDropVo getBoardDropByNo(int no);
	//드랍 게시판 이미지 출력
	public ArrayList<BoardDropImageVo> getBoardDropImagesByDropNo(int no);
	public BoardDropImageVo getBoardDropImageByRownum(int no);
	
	//응모(댓글)입력
	public void dropApplication(ApplicationVo vo);
	public void dropPointMinus(int member_no, int drop_price);
	//댓글 출력
	public ArrayList<ApplicationVo> getDropApplicationListByDropNo(int no);
	public ApplicationVo getDropApplicationByDropNo(int no);
	//응모 확인
	public int myApplicationCount(ApplicationVo vo);
	//총 응모자 수
	public int totalApplicationCount(int drop_no);
	
	
	//드랍 상품 수량
	public int getDropAmount(int no);
	//당첨자 등록
	public int createWinningPk();
	public void registWinningMember(WinningListVo vo);
	//당첨자 출력
	public ArrayList<WinningListVo> getWinningMember(int no);
	//당첨자 출력
	public WinningListVo getWinning();
	public ApplicationVo pickWinningNumber(@Param("drop_no") int drop_no, @Param("rnum") int rnum);
	
	//응모마감날짜와 오늘날짜가 같은 drop
	public ArrayList<BoardDropVo> enddateEqualSysdate();
}
