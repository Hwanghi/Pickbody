package com.ja.pickbody.board.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.ja.pickbody.vo.BodygoodCommentVo;
import com.ja.pickbody.vo.BodygoodImageVo;
import com.ja.pickbody.vo.BodygoodLikeVo;
import com.ja.pickbody.vo.BodygoodVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.SellImageVo;

public interface BodygoodBoardSQLMapper {

	public int createBodygoodPK();
	
	public void BodygoodWriteContent(BodygoodVo vo);
	
	public ArrayList<BodygoodVo> getList();
	
	public BodygoodVo getBodygoodByNo(int no);
	
	public void bodygooddeleteByNo(int no);
	
	public void bodygoodupdate(BodygoodVo vo);
	
	public void bodygoodincreaseView(int no);
	
	//이미지 관련 
	public void registerImage(BodygoodImageVo vo);
	public ArrayList<BodygoodImageVo> getBodygoodImagesByBodygoodNo(int bodygoodNo);
	//상품 이미지 첫번째꺼 출력 썸넬
	public BodygoodImageVo getBodygoodImageByRownum(int no);
	
	//댓글 관련
	
	public ArrayList<BodygoodCommentVo> bodygoodReadComment(int bodygood_no);
	public int bodygoodtotalComment(int bodygood_no);
	
	public void bodygoodWriteComment(BodygoodCommentVo vo);
	
	//좋아요 관련
	
	public void bodygoodLike(BodygoodLikeVo vo);
	public void bodygoodunLike(BodygoodLikeVo vo);
	public int myLikeCount(BodygoodLikeVo vo);
	public int totalLikecount(int bodygood_no);
	
	//조회수 높은순으로 인기글 관련
	
	public ArrayList<BodygoodVo> bestview();
	
	
	
	
	
	
	
}
