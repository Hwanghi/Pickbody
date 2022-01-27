package com.ja.pickbody.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ja.pickbody.member.service.MyPageServiceImpl;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
public class MyPageController {

	@Autowired
	private MyPageServiceImpl myPageServiceImpl;

	
	@RequestMapping("myPage.do")
	public String myPage(Model model, HttpSession session) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("memberUser");
		int member_no = memberVo.getMember_no();
		
		MemberProfileImageVo memberProfileImageVo = myPageServiceImpl.getMemberProfileImageVo(member_no);
		
		
		model.addAttribute("memberProfileImageVo", memberProfileImageVo);
		return "member/myPage";
	}
	
	@RequestMapping("updateMemberInfoPage.do")
	public String updateMemberInfoPage(HttpSession session) {
		
		session.getAttribute("memberUser");
		
		return "member/updateMemberInfoPage";
	}
	
	@RequestMapping("updateMemberInfoProcess.do")
	public String updateMemberInfoProcess(MemberVo param) {
		
		myPageServiceImpl.updateMemberInfo(param);
		
		return "redirect:./myPage.do";
	}
	
	//멤버 프로필 사진 등록
	@RequestMapping("resistMemberProfileImagePage.do")
	public String resistMemberProfileImagePage() {
		return "member/resistMemberProfileImagePage";
	}
		
		
		
	//회원 프로필사진 삭제
	@RequestMapping("deleteMemberProfileImageProcess.do")
	public String deleteMemberProfileImageProcess(HttpSession session) {
		
		MemberVo vo = (MemberVo)session.getAttribute("memberUser");
		int member_no = vo.getMember_no();
		myPageServiceImpl.deleteMemberProfileImage(member_no);
		
		return "redirect: ./myPage.do";
	}

	//회원 프로필 사진 수정
	@RequestMapping("updateMemberProfileImagePage.do")
	public String updateMemberProfileImagePage() {
		return "member/updateMemberProfileImagePage";
	}
	
	
	@RequestMapping("chargeMemberPage.do")
	public String chargeMemberPage() {
		return "member/chargeMemberPage";
	}
	
	//인바디 쓰기
	@RequestMapping("writeInbodyPage.do")
	public String writeInbodyPage() {
		return "member/writeInbodyPage";
	}
	
	
	
}
