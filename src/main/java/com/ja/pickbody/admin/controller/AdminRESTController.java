package com.ja.pickbody.admin.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.pickbody.admin.service.AdminServiceImpl;
import com.ja.pickbody.commons.CalendarUtil;
import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.vo.AdminVo;
import com.ja.pickbody.vo.MemberInhibitionVo;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.PTProgramVo;
import com.ja.pickbody.vo.TrainerVo;

@Controller
@ResponseBody
@RequestMapping("/admin/*")
public class AdminRESTController {

	@Autowired
	private AdminServiceImpl adminServiceImpl;
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@RequestMapping("getSessionAdminInfo.do")
	public HashMap<String, Object> getSessionAdminInfo(HttpSession session) {

		HashMap<String, Object> data = new HashMap<String, Object>();


		AdminVo sessionAdmin = (AdminVo) session.getAttribute("sessionAdmin");
		
		if (sessionAdmin != null) {
			data.put("isLogined", true);
			data.put("adminNo", sessionAdmin.getAdmin_no());
			data.put("adminNick", sessionAdmin.getAdmin_nick());

		} else {
			data.put("isLogined", false);
		}

		return data;
	}
	
	@RequestMapping("inhibitionProcess.do")
	public void inhibitionProcess(int member_no, int day) {
		
		adminServiceImpl.doMemberInhibition(member_no, day);
		
	}
	
	@RequestMapping("getMemberList.do")
	public HashMap<String, Object> getMemberList(){
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> memberList = adminServiceImpl.getMemberList();
		data.put("memberList", memberList);
		
		return data;
	}
	
	@RequestMapping("getJoinMemberCountList.do")
	public HashMap<String, Object> getJoinMemberCountList(){
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> joinMemberCountList = adminServiceImpl.joinMemberCountByDate();
		data.put("joinMemberCountList", joinMemberCountList);
		
		return data;
	}
	
	@RequestMapping("getPointSumList.do")
	public HashMap<String, Object> getPointSumListt(){
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> pointSumList = adminServiceImpl.pointSumByDate();
		data.put("pointSumList", pointSumList);
		
		return data;
	}
}
