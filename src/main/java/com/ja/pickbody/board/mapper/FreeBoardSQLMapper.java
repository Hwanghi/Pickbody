package com.ja.pickbody.board.mapper;

import java.util.ArrayList;

import com.ja.pickbody.vo.FreeBoardVo;
import com.ja.pickbody.vo.FreeImageVo;
import com.ja.pickbody.vo.FreeLikeVo;
import com.ja.pickbody.vo.RippleVo;

public interface FreeBoardSQLMapper {
	
	public int createfreePK();

	public void freeWriteContent(FreeBoardVo vo);
	
	public ArrayList<FreeBoardVo> getList();
	
	public FreeBoardVo getFreeBoardByNo(int no);
	
	public void deleteByNo(int no);
	
	public void update(FreeBoardVo vo);
	
	public void increaseReadCount(int no);
	
	public void freeRippleContent(RippleVo vo);
	
	
	public RippleVo getFreeRippleByNo(int no);
	
	public void deleteFreeRippleByNo(int no);
	
	public void updateFreeRipple(RippleVo vo);
	
	public ArrayList<RippleVo> rippleRead(int no);
	
	//이미지
	public void freeImage(FreeImageVo vo);
	public ArrayList<FreeImageVo> getFreeImagesByNo(int free_no);
	
	//좋아요
	public void freeLike(FreeLikeVo vo);
	public void freeDislike(FreeLikeVo vo);
	public int myFreeLikeCount(FreeLikeVo vo);
	public int totalFreeLikeCount(int free_no);
	
	
	//자체제작중..
	public int RippleAmount (int free_no);//조회수 많은거
	
	public ArrayList<FreeBoardVo> BestFreeViewBoard();//인기글
	
	
	
	
	
}
