package com.ja.pickbody.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.admin.mapper.SellBoardSQLMapper;
import com.ja.pickbody.board.mapper.BuyBoardSQLMapper;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.vo.BuyBoardVo;
import com.ja.pickbody.vo.BuyQnaVo;
import com.ja.pickbody.vo.FreeImageVo;
import com.ja.pickbody.vo.FreeLikeVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.ReviewVo;
import com.ja.pickbody.vo.RippleVo;
import com.ja.pickbody.vo.SellBoardVo;
import com.ja.pickbody.vo.SellImageVo;
import com.ja.pickbody.vo.WillBuyVo;
import com.ja.pickbody.vo.BuyLikeVo;

@Service
public class BuyBoardServiceImpl {

	@Autowired
	private BuyBoardSQLMapper buyBoardSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private SellBoardSQLMapper sellBoardSQLMapper;



	// 구매
	public void buyOrder(BuyBoardVo vo) {
		buyBoardSQLMapper.registerBuyer(vo);
	}

	public HashMap<String, Object> getOrderSellBoard(int sell_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		SellBoardVo sellBoardVo = sellBoardSQLMapper.readSellBoard(sell_no);
		map.put("sellBoardVo", sellBoardVo);
		SellImageVo sellImageVo = sellBoardSQLMapper.getSellImageByRownum(sell_no);
	    map.put("sellImageVo", sellImageVo);
		
		return map;
	}

	// 구매 리스트..?
	public ArrayList<HashMap<String, Object>> getBuyerList(HttpSession session) {

	      ArrayList<HashMap<String, Object>> buyList = new ArrayList<HashMap<String, Object>>();

	      ArrayList<BuyBoardVo> buyerList = buyBoardSQLMapper.BuyerList();

	      for (BuyBoardVo buyBoardVo : buyerList) {
	         MemberVo memberVo = (MemberVo) session.getAttribute("memberUser");

	         HashMap<String, Object> map = new HashMap<String, Object>();
	         int sell_no = buyBoardVo.getSell_no();
	         SellBoardVo sellBoardVo = sellBoardSQLMapper.readSellBoard(sell_no);
	         ArrayList<SellImageVo> sellImageVo = sellBoardSQLMapper.getSellImagesBySellNo(sell_no);

	         map.put("sellImageVo", sellImageVo);
	         map.put("sellBoardVo", sellBoardVo);
	         map.put("memberVo", memberVo);
	         map.put("buyBoardVo", buyBoardVo);

	         buyList.add(map);
	      }
	      return buyList;
	   }

	// 장바구니..제작..
		public ArrayList<HashMap<String, Object>> getWillBuyList(int member_no) {
			ArrayList<HashMap<String, Object>> WillBuyList = new ArrayList<HashMap<String, Object>>();

			ArrayList<WillBuyVo> willBuyList = buyBoardSQLMapper.willBuyList();

			for (WillBuyVo willBuyVo : willBuyList) {
				MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				int sell_no = willBuyVo.getSell_no();
				SellBoardVo sellBoardVo = sellBoardSQLMapper.readSellBoard(sell_no);
				ArrayList<SellImageVo> sellImageVo = sellBoardSQLMapper.getSellImagesBySellNo(sell_no);
				
			

				map.put("sellBoardVo", sellBoardVo);
				map.put("memberVo", memberVo);
				map.put("willBuyVo", willBuyVo);
	            map.put("sellImageVo", sellImageVo);
				WillBuyList.add(map);
			}
			return WillBuyList;
		}

	// 장바구니 넣기
	public void willBuy(WillBuyVo vo) {
		int sell_no = vo.getSell_no();
		SellBoardVo sellBoardVo = sellBoardSQLMapper.readSellBoard(sell_no);

		int sell_price = sellBoardVo.getSell_price();
		int willBuy_amount = vo.getWillBuy_amount();

		vo.setWillBuy_price(sell_price * willBuy_amount);
		buyBoardSQLMapper.willBuy(vo);

	}

	// 좋아요
	public void buylikeProcess(BuyLikeVo vo) {

		int mybuylike = buyBoardSQLMapper.mybuylikeCount(vo);

		if (mybuylike > 0) {
			buyBoardSQLMapper.disbuylike(vo);
		} else {
			buyBoardSQLMapper.buylike(vo);
		}

	}

	public int getMybuylikeCount(BuyLikeVo vo) {
		return buyBoardSQLMapper.mybuylikeCount(vo);
	}

	public int getTotalbuylikeCount(int sell_no) {
		return buyBoardSQLMapper.totalbuylikeCount(sell_no);
	}

	//댓글
	//댓글작성
	public void buyQna(BuyQnaVo vo) {
		buyBoardSQLMapper.buyQna(vo);
	}

	public ArrayList<HashMap<String, Object>> getBuyQnaRead(int sell_no) {
		ArrayList<HashMap<String, Object>> buyQnaRead = new ArrayList<HashMap<String, Object>>();
		// 주인이랑 엮자
		ArrayList<BuyQnaVo> buyqnaRead = buyBoardSQLMapper.BuyQnaRead(sell_no);

		for (BuyQnaVo buyQnaVo : buyqnaRead) {

			//리플 출력 부분
			int member_no = buyQnaVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("buyQnaVo", buyQnaVo);
			map.put("memberVo", memberVo);

			buyQnaRead.add(map);
		}
		return buyQnaRead;

	}

	//리플번호 보드번호 맞추기
	public HashMap<String, Object> getBuyQna(int buyqna_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		BuyQnaVo buyQnaVo = buyBoardSQLMapper.getBuyQnaByNo(buyqna_no);
		int sell_no = buyQnaVo.getSell_no();
		SellBoardVo sellBoardVo = sellBoardSQLMapper.readSellBoard(sell_no);

		map.put("buyQnaVo", buyQnaVo);
		map.put("sellBoardVo", sellBoardVo);

		return map;

	}

	public void deleteBuyQnaByNo(int buyqna_no) {
		buyBoardSQLMapper.deleteBuyQnaByNo(buyqna_no);
	}

	public void updateBuyQna(BuyQnaVo vo) {
		buyBoardSQLMapper.updateBuyQna(vo);
	}

	public void deleteWillBuy(int willBuy_no) {
		buyBoardSQLMapper.deleteWillBuy(willBuy_no);
	}

	//후기
	//후기작성
	public void review(ReviewVo vo) {
		buyBoardSQLMapper.Review(vo);
	}

	public ArrayList<HashMap<String, Object>> getReviewRead(int sell_no) {
		ArrayList<HashMap<String, Object>> buyReviewread = new ArrayList<HashMap<String, Object>>();
		// 주인이랑 엮자
		ArrayList<ReviewVo> buyReview = buyBoardSQLMapper.reviewRead(sell_no);

		for (ReviewVo reviewVo : buyReview) {

			//후기 출력 부분
			int member_no = reviewVo.getMember_no();
			int review_no = reviewVo.getReview_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("reviewVo", reviewVo);
			map.put("memberVo", memberVo);
			buyReviewread.add(map);
		}
		return buyReviewread;

	}

	//후기번호 보드번호 맞추기
	public HashMap<String, Object> getReview(int Review_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ReviewVo reviewVo = buyBoardSQLMapper.getReviewByNo(Review_no);
		int sell_no = reviewVo.getSell_no();
		SellBoardVo sellBoardVo = sellBoardSQLMapper.readSellBoard(sell_no);

		map.put("reviewVo", reviewVo);
		map.put("sellBoardVo", sellBoardVo);

		return map;

	}
}