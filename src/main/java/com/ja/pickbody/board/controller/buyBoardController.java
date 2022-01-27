package com.ja.pickbody.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.pickbody.admin.mapper.SellBoardSQLMapper;
import com.ja.pickbody.admin.service.SellBoardServiceImpl;
import com.ja.pickbody.board.service.BuyBoardServiceImpl;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.vo.BuyBoardVo;
import com.ja.pickbody.vo.BuyQnaVo;
import com.ja.pickbody.vo.FreeImageVo;
import com.ja.pickbody.vo.FreeLikeVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.ReviewVo;
import com.ja.pickbody.vo.SellBoardVo;
import com.ja.pickbody.vo.WillBuyVo;
import com.ja.pickbody.vo.BuyLikeVo;

@Controller
@RequestMapping("/board/*")
public class buyBoardController {

	@Autowired
	private BuyBoardServiceImpl buyBoardService;

	@Autowired
	private SellBoardServiceImpl sellBoardService;
//판매리스트
	@RequestMapping("buyBoardPage.do")
	public String buyBoardPage(Model model) {

		ArrayList<HashMap<String, Object>> sellList = sellBoardService.getSellList();
		model.addAttribute("sellList", sellList);

		return "board/buyBoardPage";
	}

//글 상세보기
	@RequestMapping("readBuyBoardPage.do")
	public String readBuyBoardPage(int sell_no, Model model, HttpSession session) {
		HashMap<String, Object> buydata = sellBoardService.getReadSellBoard(sell_no);
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		model.addAttribute("memberUser", memberUser);
		model.addAttribute("buydata", buydata);

		ArrayList<HashMap<String, Object>> list = buyBoardService.getBuyQnaRead(sell_no);
		model.addAttribute("list", list);

		ArrayList<HashMap<String, Object>> list2 = buyBoardService.getReviewRead(sell_no);
		model.addAttribute("list2", list2);

		if (memberUser != null) {
			int member_no = memberUser.getMember_no();
			BuyLikeVo buylikeVo = new BuyLikeVo();
			buylikeVo.setMember_no(member_no);
			buylikeVo.setSell_no(sell_no);
			int mybuylikeCount = buyBoardService.getMybuylikeCount(buylikeVo);
			model.addAttribute("mybuylikeCount", mybuylikeCount);
		}

		int totalbuylikeCount = buyBoardService.getTotalbuylikeCount(sell_no);
		model.addAttribute("totalbuylikeCount", totalbuylikeCount);

		return "board/buyContentPage";
	}

	//구매
		@RequestMapping("buyOrderPage.do")
		public String buyPage(Model model, int sell_no, int amount ,  HttpSession session ,int currentPrice) {
			HashMap<String, Object> orderdata = buyBoardService.getOrderSellBoard(sell_no);
			model.addAttribute("orderdata", orderdata);
			MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
			model.addAttribute("memberUser", memberUser);
			model.addAttribute("amount",amount);
			model.addAttribute("currentPrice", currentPrice);
			return "board/buyOrderPage";
		}

	@RequestMapping("buyOrderProcess.do")
	public String buyOrderProcess(BuyBoardVo vo) {
		buyBoardService.buyOrder(vo);
		return "redirect:./buyBoardPage.do";
	}

//좋아요
	@RequestMapping("buylike.do")
	public String buylike(BuyLikeVo param, HttpSession session) {
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();

		param.setMember_no(member_no);
		buyBoardService.buylikeProcess(param);
		return "redirect:./readBuyBoardPage.do?sell_no=" + param.getSell_no();
	}

	@RequestMapping("writeBuyQnaProcess.do")
	public String writeBuyQnaProcess(BuyQnaVo Qna, HttpSession session) {
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();

		Qna.setMember_no(member_no);
		buyBoardService.buyQna(Qna);
		return "redirect:./readBuyBoardPage.do?sell_no=" + Qna.getSell_no();
	}

//구매내역..?
	@RequestMapping("buyListPage.do")
	public String buyListPage(Model model, HttpSession session) {

		ArrayList<HashMap<String, Object>> buyList = buyBoardService.getBuyerList(session);
		model.addAttribute("buyList", buyList);

		return "board/buyListPage";
	}

//리뷰
	@RequestMapping("writeReviewProcess.do")
	public String writeReviewProcess(ReviewVo review, HttpSession session) {
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();
		review.setMember_no(member_no);
		buyBoardService.review(review);
		return "redirect:./readBuyBoardPage.do?sell_no=" + review.getSell_no();
	}

	@RequestMapping("willBuyListPage.do")
	public String willBuyListPage(Model model, HttpSession session, BuyBoardVo vo) {
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");

		int sell_no = vo.getSell_no();
		vo.setSell_no(sell_no);
		ArrayList<HashMap<String, Object>> willBuyList = buyBoardService.getWillBuyList(memberUser.getMember_no());
		model.addAttribute("willBuyList", willBuyList);

		return "board/willBuyList";
	}

	@RequestMapping("willBuyListProcess.do")
	public String willBuyListProcess(WillBuyVo vo,HttpSession session, int amount, int price) {
		
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();
		vo.setMember_no(member_no);
		vo.setWillBuy_amount(amount);
		vo.setWillBuy_price(price);
		buyBoardService.willBuy(vo);
		return "redirect:./readBuyBoardPage.do?sell_no=" + vo.getSell_no();
	}

	@RequestMapping("deleteWillBuyProcess.do")
	public String deleteWillBuyProcess(int willBuy_no) {
		buyBoardService.deleteWillBuy(willBuy_no);
		return "redirect:./willBuyListPage.do";
	}

	//장바구니 구매
		@RequestMapping("buyWillOrderProcess.do")
		public String buyWillOrderProcess(int[] sell_nos, int willBuy_amounts[], int[] willBuy_nos, String address, String memo,
				HttpSession session,int price) {

			MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
			int member_no = memberUser.getMember_no();

			for (int i = 0; i < sell_nos.length; i++) {
				int sell_no = sell_nos[i];
				int willBuy_amount = willBuy_amounts[i];

				BuyBoardVo vo = new BuyBoardVo();
				vo.setSell_no(sell_no);
				vo.setBuy_Quantity(willBuy_amount);
				vo.setMember_no(member_no);
				vo.setBuy_adress(address);
	            vo.setBuy_memo(memo);
	            vo.setBuy_price(price);
	 			buyBoardService.buyOrder(vo);

				// 비우기...
				int willBuy_no = willBuy_nos[i];
				buyBoardService.deleteWillBuy(willBuy_no);
			}

			return "board/buyWillOrderPage";
		}

}
