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

import com.ja.pickbody.board.service.BoardBodygoodServiceImpl;
import com.ja.pickbody.vo.BodygoodCommentVo;
import com.ja.pickbody.vo.BodygoodImageVo;
import com.ja.pickbody.vo.BodygoodLikeVo;
import com.ja.pickbody.vo.BodygoodVo;
import com.ja.pickbody.vo.MemberVo;


@Controller
@RequestMapping("/board/*")
public class BodygoodController {
	
	
	@Autowired
	private BoardBodygoodServiceImpl boardBodygoodservice;
	
	@RequestMapping("mainPage.do")
	public String mainPage() {
		
		return "board/mainPage";
	}
	
	@RequestMapping("Bodygood.do")
	public String Bodygood(Model model) {
		
	ArrayList<HashMap<String, Object>> list = boardBodygoodservice.getBodygoodList();
		
		model.addAttribute("list" , list);
		
	ArrayList<HashMap<String, Object>> bestList = boardBodygoodservice.bestviewList();
	
		model.addAttribute("bestList" , bestList);
		

	
		
		return "board/Bodygood";
	}
	@RequestMapping("BodygoodWriteContentPage.do")
	public String BodygoodWriteContentPage() {
		
		return "board/BodygoodWriteContentPage";
	}
	
	@RequestMapping("BodygoodWriteContentProcess.do")
	public String BodygoodWriteContentProces(BodygoodVo param , MultipartFile [] files , HttpSession session) {
		
		String rootuploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles/";
		
		ArrayList<BodygoodImageVo> imageVoList = new ArrayList<BodygoodImageVo>();
		
		//파일 업로드
		for(MultipartFile file : files) {
			
			if(file.isEmpty()) {
				continue;
			}
			
			String originalFileName = file.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			
			//파일명 변환 하는이유:충돌나니까 , 랜덤+시간
			UUID uuid = UUID.randomUUID();
			//System.out.println("생성된uuid: "+uuid.toString());
			long currentTime = System.currentTimeMillis();
			
			String randomFileName = uuid.toString() + "_" + currentTime + ext;
			
			//날짜 폴더 생성
			Date today = new Date(); //오늘 날짜 생성
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy/MM/dd"); //날짜 -> 문자 변환해주는 객체 생성
			String todayFolderName = sdf.format(today);
			
			//예) C:/uploadFiles/2021/11/11
			File todayFolder = new File(rootuploadFileFolderName + "/" + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			
			String uploadFilePath = rootuploadFileFolderName + "/" + todayFolderName + "/" + randomFileName;
			
			try {
				file.transferTo(new File(uploadFilePath));
			} catch (Exception e) {
				// 실무에서는 제일어렵고 중요!
				e.printStackTrace();
			
			}
			
			//DB 입력 데이터 구성 한바퀴돌때마다
			BodygoodImageVo imageVo = new BodygoodImageVo();
			imageVo.setImage_original_filename(originalFileName);
			imageVo.setImage_link(todayFolderName + "/" + randomFileName);
		
			imageVoList.add(imageVo);
			
		}
		
		
		
		//로그인사용자필요한경우 세션값에서 찾기
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();
		
		param.setMember_no(member_no);
		
		boardBodygoodservice.BodygoodWriteContent(param, imageVoList);
		
		return "redirect:./Bodygood.do";
	}
	
	@RequestMapping("BodygoodreadContentPage.do")
	public String BodygoodreadContentPage(int bodygood_no , Model model , HttpSession session) {
		
		HashMap<String, Object> data = boardBodygoodservice.getBodygood(bodygood_no);
		model.addAttribute("data", data);
		
		//좋아요
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		
		if(memberUser != null) {
			int member_no = memberUser.getMember_no();
			BodygoodLikeVo bodygoodLikeVo = new BodygoodLikeVo();
			bodygoodLikeVo.setBodygood_no(bodygood_no);
			bodygoodLikeVo.setMember_no(member_no);
			int myLikeCount = boardBodygoodservice.getMyLikeCount(bodygoodLikeVo);
			model.addAttribute("myLikeCount", myLikeCount);
		}
		
		int totalLikeCount = boardBodygoodservice.getTotalLikeCount(bodygood_no);
		model.addAttribute("totalLikeCount" , totalLikeCount);
		
		
		
		
		// 댓글 보기 불러오기 
		ArrayList<HashMap<String, Object>> commentList = boardBodygoodservice.bodygoodReadComment(bodygood_no);
		model.addAttribute("commentList" , commentList);
		
		
		return "board/BodygoodreadContentPage";
	}
	@RequestMapping("BodygooddeleteContentProcess.do")
	public String BodygooddeleteContentProcess(int bodygood_no) {
		
		boardBodygoodservice.bodygooddeleteContent(bodygood_no);
		
		return "redirect:./Bodygood.do";
	}
	@RequestMapping("deleteBodygoodContentProcess.do")
	public String deleteBodygoodContentProcess(int bodygood_no) {
		
		boardBodygoodservice.bodygooddeleteContent(bodygood_no);
		
		return "redirect:./Bodygood.do";
	}
	@RequestMapping("updateBodygoodContentPage.do")
	public String updateBodygoodContentPage(int bodygood_no , Model model) {
		
		HashMap<String, Object> data = boardBodygoodservice.getBodygood(bodygood_no);
		model.addAttribute("data", data);
		
		return "board/updateBodygoodContentPage";
	}
	@RequestMapping("updateBodygoodContentProcess.do")
	public String updateBodygoodContentProcess(BodygoodVo vo) {
		
		boardBodygoodservice.bodygoodupdateContent(vo);
		
		return "redirect:./BodygoodreadContentPage.do?bodygood_no="+vo.getBodygood_no();
	}
	
	
		
	
	//댓글쓰기
	@RequestMapping("BodygoodWriteCommentProcess.do")
	public String BodygoodWriteCommentProcess(BodygoodCommentVo param, HttpSession session) {
	
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		
		int member_no = memberUser.getMember_no();
		
		param.setMember_no(member_no);
		
		boardBodygoodservice.bodygoodWriteComment(param);
		
		return "redirect:./BodygoodreadContentPage.do?bodygood_no="+param.getBodygood_no();
	}
	
	//좋아요
	@RequestMapping("doLike.do")
	public String doLike(BodygoodLikeVo param , HttpSession session) {
		
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();
		
		param.setMember_no(member_no);
		
		boardBodygoodservice.doLikeProcess(param);
		
		return "redirect:./BodygoodreadContentPage.do?bodygood_no=" +param.getBodygood_no();
	}
	
	}
	

