package com.ja.pickbody.board.mapper;

import java.util.ArrayList;

import com.ja.pickbody.vo.BuyBoardVo;
import com.ja.pickbody.vo.BuyQnaVo;
import com.ja.pickbody.vo.FreeLikeVo;
import com.ja.pickbody.vo.ReviewVo;
import com.ja.pickbody.vo.RippleVo;
import com.ja.pickbody.vo.SellBoardVo;
import com.ja.pickbody.vo.SellImageVo;
import com.ja.pickbody.vo.WillBuyVo;
import com.ja.pickbody.vo.BuyLikeVo;

public interface BuyBoardSQLMapper {

	
    //구매
	public void registerBuyer(BuyBoardVo vo);
    //구매 리스트
	public ArrayList<BuyBoardVo> BuyerList ();
	//좋아요
	public void buylike(BuyLikeVo vo);
	public void disbuylike(BuyLikeVo vo);
	public int mybuylikeCount(BuyLikeVo vo);
	public int totalbuylikeCount(int sell_no);
	public int getAmountReview(int sell_no);
	//댓글
	public void buyQna(BuyQnaVo vo);
	
	public BuyQnaVo getBuyQnaByNo(int no);
	
	public void deleteBuyQnaByNo(int no);
	
	public void updateBuyQna(BuyQnaVo vo);
	
	public ArrayList<BuyQnaVo> BuyQnaRead(int no);
	
	//장바구니 리스트 출력
	public ArrayList<WillBuyVo> willBuyList();
	//장바구니 넣기
	public void willBuy(WillBuyVo vo);
	//장바구니 삭제
	public void deleteWillBuy(int no);
	//리뷰
    public void Review(ReviewVo vo);
	
	public ReviewVo getReviewByNo(int no);
	
	public void deleteReviewByNo(int no);
	
	public void updateReview(ReviewVo vo);
	
	public ArrayList<ReviewVo> reviewRead(int no);
	
	public int getReviewStar(int review_no);
	
	
	

}
