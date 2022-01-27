package com.ja.pickbody.secondhand.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ja.pickbody.secondhand.service.SecondhandServiceImpl;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.SecondhandCommentVo;
import com.ja.pickbody.vo.SecondhandEvaluateVo;
import com.ja.pickbody.vo.SecondhandLikeVo;
@Controller
@RequestMapping("/secondhand/*")
@ResponseBody
public class SecondhandControllerRest {


		@Autowired
		private SecondhandServiceImpl secondhandService;
		
		
		
		
		@RequestMapping("writeCommentProcess.do")
		public HashMap<String, Object> writeCommentProcess(SecondhandCommentVo param, HttpSession session){
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
			int member_no = memberUser.getMember_no();
			param.setComment_writerno(member_no);
			
			secondhandService.writeComment(param);
		
		
			return data;
		}
		
		
		
		@RequestMapping("getCommentLists.do")
		public HashMap<String, Object> getcommentlist(int item_no){
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			ArrayList<HashMap<String, Object>> commentlist =
					secondhandService.getCommentList(item_no);
			data.put("commentlist", commentlist);
			
			
			return data;
		}
		
		@RequestMapping("doLikeRest.do")
		public void doLike(SecondhandLikeVo param, HttpSession session) {
			
			MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
			int no = memberUser.getMember_no();
			
			param.setMember_no(no);
			secondhandService.doLikeProcess(param);
		
		}
		@RequestMapping("getMyLikeData.do")
		public HashMap<String, Object> getMyLikeData(SecondhandLikeVo param, HttpSession session ){
			
		HashMap<String, Object> data = new HashMap<String, Object>();
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();
		param.setMember_no(member_no);
		
		int myCount = secondhandService.getMyLikeCount(param);
		data.put("myLikeCount", myCount);
		return data;	
			
		}
		@RequestMapping("getTotalLikeCount.do")
		public HashMap<String, Object> getTotalLikeCount(int item_no){
				HashMap<String, Object> data = new HashMap<String, Object>();
				int totalLikeCount = secondhandService.getTotalLikeCount(item_no);
				data.put("totalLikeCount" , totalLikeCount);
				
				return data;
		}
	

		
		
		
		
		
	}




