package com.ja.pickbody.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.member.service.MyPageServiceImpl;
import com.ja.pickbody.vo.MemberInbodyVo;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;

@Controller
@RequestMapping("/member/*")
@ResponseBody
public class MyPageRESTController {

	@Autowired
	private MyPageServiceImpl myPageService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	//회원정보 출력(로그인 할 때 session에 set한 정보 아님!)
	@RequestMapping("getMemberVoProcess.do")
	public HashMap<String, Object> getMemberVoProcess(int member_no) {
		HashMap<String, Object> data = new HashMap<String, Object>();

		MemberVo memberVo = memberService.getMemberVo(member_no);
		
		data.put("memberVo", memberVo);
		
		return data;
	}
	
	@RequestMapping("getMemberProfileImageProcess.do")
	public HashMap<String, Object> getMemberProfileImageProcess(int member_no){
		HashMap<String, Object> data = new HashMap<String, Object>();
		MemberProfileImageVo memberProfileImageVo = myPageService.getMemberProfileImageVo(member_no);
		
		data.put("memberProfileImageVo", memberProfileImageVo);
		return data;
	}
	
	//회원 프로필 존재-> 수정, 없으면 삽입
	@RequestMapping("registerMemberProfileProcess.do")
	public void registerMemberProfileProcess(MultipartFile memberProfileImageFile, HttpSession session) {

		String rootUploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles/member/profile";
		
		//파일업로드 
		String originalFileName = memberProfileImageFile.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));


		UUID uuid = UUID.randomUUID();// 랜덤으로 바꿔줌
		long currentTime = System.currentTimeMillis();// 시간 변환
		String randomFileName = uuid.toString() + "_" + currentTime + ext;


		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String todayFolderName = sdf.format(today);
		// 예 ) C:/uploadFiles/2021/10/26
		File todayFolder = new File(rootUploadFileFolderName + "/" + todayFolderName);
		if (!todayFolder.exists()) {
			todayFolder.mkdirs();
		}
		String uplodeFilePath = rootUploadFileFolderName + "/" + todayFolderName + "/" + randomFileName;

		try {
			memberProfileImageFile.transferTo(new File(uplodeFilePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MemberVo vo = (MemberVo)session.getAttribute("memberUser");
		int memberNo = vo.getMember_no();
		
		
		MemberProfileImageVo memberProfileImageVo = new MemberProfileImageVo();
		memberProfileImageVo.setImage_original_filename(originalFileName);
		memberProfileImageVo.setImage_link(todayFolderName + "/" + randomFileName);
		memberProfileImageVo.setMember_no(memberNo);
		
		// 기존에 프로필 사진이 있다면 수정 없으면 삽입
		int countProfileImage = myPageService.countMemberProfileImage(memberNo);
		if(countProfileImage > 0) {
			myPageService.updateMemberProfileImage(memberProfileImageVo);
		} else {
			myPageService.registerMemberProfileImage(memberProfileImageVo);
		}
	}
	
	@RequestMapping("writeInbodyProcess.do")
	public void writeInbodyProcess(MemberInbodyVo param, HttpSession session) {
		
		MemberVo membervo = (MemberVo)session.getAttribute("memberUser");
		int memberNo = membervo.getMember_no();
		
		System.out.println("memberNo : " + memberNo);
		
		param.setMember_no(memberNo);
		
		System.out.println("param : " + param);
		
		myPageService.writeInbody(param);
		
		
	}
	
	@RequestMapping("getInbodyList.do")
	public HashMap<String, Object> getInbodyList(int member_no, HttpSession session){
		HashMap<String, Object> data = new HashMap<String, Object>();
		MemberVo membervo = (MemberVo)session.getAttribute("memberUser");
		int memberNo = -1;
		if (membervo != null) {
			memberNo = membervo.getMember_no();
		} else {
			memberNo = member_no;
		}
		ArrayList<HashMap<String, Object>> inbodyDataList = myPageService.getInbodyListByMemberNo(memberNo);
		data.put("inbodyDataList", inbodyDataList);
		
		return data;
	}
	
	//인바디삭제
	@RequestMapping("deleteInbodyProcess.do")
	public void deleteInbodyProcess(int inbody_no) {
		myPageService.deleteInbody(inbody_no);
	}
	
	//인바디 수정
	@RequestMapping("updateInbodyProcess.do")
	public void updateInbodyProcess(MemberInbodyVo param) {
		myPageService.updateInbody(param);
	}
	
	//닉네임 수정
	@RequestMapping("updateMemberNickProcess.do")
	public void updateMemberNickProcess(MemberVo param) {
		myPageService.updateMemberNick(param);
	}
	
	
}
