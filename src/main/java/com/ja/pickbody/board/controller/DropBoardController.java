package com.ja.pickbody.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.pickbody.board.service.DropBoardServiceImpl;
import com.ja.pickbody.board.service.WinningServiceImpl;
import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.vo.ApplicationVo;
import com.ja.pickbody.vo.MemberPointHistoryVo;
import com.ja.pickbody.vo.MemberVo;

@Controller
@RequestMapping("/board/*")
public class DropBoardController {
	
	@Autowired
	DropBoardServiceImpl dropBoardServiceImpl;
	
	@Autowired
	WinningServiceImpl winningServiceImpl;
	
	@Autowired
	MemberServiceImpl memberServiceImpl;

	@RequestMapping("dropBoardPage.do")
	public String dropBoardPage(Model model) {
		
		ArrayList<HashMap<String, Object>> droplist = dropBoardServiceImpl.getBoardDropList();
		model.addAttribute("droplist", droplist);
		
		return "board/dropBoardPage";
	}
	
	@RequestMapping("readDropBoardPage.do")
	public String readDropBoardPage(int drop_no, Model model, HttpSession session) {
		HashMap<String, Object> dropdata = dropBoardServiceImpl.getBoardDropByNo(drop_no, true);
		model.addAttribute("dropdata", dropdata);
		
		ArrayList<HashMap<String, Object>> applist = dropBoardServiceImpl.getAapplicationDropList(drop_no);
		model.addAttribute("applist", applist);
		
		
		MemberVo memberUser = (MemberVo)session.getAttribute("memberUser");
		
		ArrayList<HashMap<String, Object>> winninglist = winningServiceImpl.getWinningMember(drop_no);
		model.addAttribute("winninglist", winninglist);
		

		if(memberUser != null) {
			int member_no = memberUser.getMember_no();
			ApplicationVo applicationVo = new ApplicationVo();
			applicationVo.setMember_no(member_no);
			applicationVo.setDrop_no(drop_no);
			int myApplicationCount = dropBoardServiceImpl.myApplicationCount(applicationVo);
			model.addAttribute("myApplicationCount", myApplicationCount);
		}
		
		int totalApplicationCount = dropBoardServiceImpl.totalApplicationCount(drop_no);
		model.addAttribute("totalApplicationCount", totalApplicationCount);
		
		return "board/readDropBoardPage";
	}
	
	@RequestMapping("applicationDropProcess.do")
	public String applicationDropProcess(ApplicationVo param, HttpSession session, int drop_price) {
		MemberPointHistoryVo memberPointHistoryVo = new MemberPointHistoryVo();
		MemberVo memberUser = (MemberVo)session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();
		param.setMember_no(member_no);
		int drop_no = param.getDrop_no();
		MemberVo memberVo = memberServiceImpl.getMemberVo(member_no);
		//포인트
		
		dropBoardServiceImpl.applicationDrop(param);
		memberServiceImpl.deductionMemberPoint(member_no, drop_price);
		memberPointHistoryVo.setMember_no(member_no);
		memberPointHistoryVo.setPoint_history_useway("응모");
		memberPointHistoryVo.setPoint_history_amount(drop_price);
		int leftoverMemberPoint = memberVo.getMember_point();
		memberPointHistoryVo.setPoint_history_leftover_point(leftoverMemberPoint);
		
		memberServiceImpl.writeMinusMemberPointHistory(memberPointHistoryVo);
		
		return "redirect:./dropBoardPage.do?drop_no="+ drop_no;
	}
	
	
}
