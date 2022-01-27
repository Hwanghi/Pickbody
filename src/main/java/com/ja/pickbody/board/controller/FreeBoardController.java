package com.ja.pickbody.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.pickbody.board.service.FreeBoardServiceImpl;
import com.ja.pickbody.vo.FreeBoardVo;
import com.ja.pickbody.vo.FreeImageVo;
import com.ja.pickbody.vo.FreeLikeVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.RippleVo;

@Controller
@RequestMapping("/board/*")
public class FreeBoardController {

	@Autowired
	private FreeBoardServiceImpl freeboardservice;

	@RequestMapping("boardFree.do")
	public String boardFree(Model model) {

		ArrayList<HashMap<String, Object>> list = freeboardservice.getFreeBoardList();
		model.addAttribute("list", list);

		/*
		Date today = new Date();
		SimpleDateFormat newcontent = new SimpleDateFormat("HH/mm/ss");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.HOUR, -3);
		String nowday = newcontent.format(cal.getTime());
		model.addAttribute("nowday", nowday);
		model.addAttribute("today", today);
		*/
		
		
		
		ArrayList<HashMap<String, Object>> list2 = freeboardservice.getBestFreeViewBoard();
		model.addAttribute("list2", list2);

		return "board/boardFree";

	}

	@RequestMapping("freeBoardWriteContentPage.do")
	public String freeBoardWriteContentPage() {

		return "board/freeBoardWriteContentPage";
	}

	@RequestMapping("freeBoardWriteContentProcess.do")
	public String freeBoardWriteContentProcess(FreeBoardVo param, MultipartFile[] files, HttpSession session) {
		String rootUploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles/";

		ArrayList<FreeImageVo> imageVoList = new ArrayList<FreeImageVo>();
		// 파일업로드 기능
		for (MultipartFile file : files) {
			if (file.isEmpty()) {
				continue;
			}
			String originalFileName = file.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

			// 파일명 변환 코드
			UUID uuid = UUID.randomUUID();// 랜덤으로 바꿔줌
			long currentTime = System.currentTimeMillis();// 시간 변환
			String randomFileName = uuid.toString() + "_" + currentTime + ext;

			// 날짜별 폴더 생성
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
				file.transferTo(new File(uplodeFilePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
			// db입력데이터 구성
			FreeImageVo imageVo = new FreeImageVo();
			imageVo.setImage_original_filename(originalFileName);
			imageVo.setImage_link(todayFolderName + "/" + randomFileName);

			imageVoList.add(imageVo);
		}

		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();

		param.setMember_no(member_no);

		freeboardservice.freeBoardWriteContent(param, imageVoList);

		return "redirect:./boardFree.do";

	}

	@RequestMapping("freeBoardReadContentPage.do")
	public String freeBoardReadContentPage(int free_no, Model model, HttpSession session) {
		HashMap<String, Object> data = freeboardservice.getFreeBoard(free_no, true);
		model.addAttribute("data", data);

		ArrayList<HashMap<String, Object>> list = freeboardservice.getRippleread(free_no);
		model.addAttribute("list", list);

		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");

		if (memberUser != null) {
			int member_no = memberUser.getMember_no();
			FreeLikeVo freeLikeVo = new FreeLikeVo();
			freeLikeVo.setMember_no(member_no);
			freeLikeVo.setFree_no(free_no);
			int myFreeLikeCount = freeboardservice.getMyFreeLikeCount(freeLikeVo);
			model.addAttribute("myFreeLikeCount", myFreeLikeCount);
		}
		int totalFreeLikeCount = freeboardservice.getTotalFreeLikeCount(free_no);
		model.addAttribute("totalFreeLikeCount", totalFreeLikeCount);

		return "board/freeBoardReadContentPage";
	}

	@RequestMapping("freeBoardDeleteContentProcess.do")
	public String freeBoardDeleteContentProcess(int free_no) {
		freeboardservice.deleteContent(free_no);
		return "redirect:./boardFree.do";

	}

	@RequestMapping("freeBoardUpdateContentPage.do")
	public String freeBoardUpdateContentPage(int free_no, Model model) {
		HashMap<String, Object> data = freeboardservice.getFreeBoard(free_no, false);
		model.addAttribute("data", data);
		return "board/freeBoardUpdateContentPage";

	}

	@RequestMapping("freeBoardUpdateContentProcess.do")
	public String freeBoardUpdateContentProcess(FreeBoardVo vo) {
		freeboardservice.updateContent(vo);
		return "redirect:./boardFree.do";
	}

	@RequestMapping("rippleWriteContentProcess.do")
	public String rippleWriteContentProcess(RippleVo ripple, HttpSession Resession) {
		MemberVo memberUser = (MemberVo) Resession.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();

		ripple.setMember_no(member_no);

		freeboardservice.RippleContent(ripple);
		return "redirect:./freeBoardReadContentPage.do?free_no=" + ripple.getFree_no();
	}

	@RequestMapping("freeLike.do")
	public String freeLike(FreeLikeVo param, HttpSession session) {
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberUser.getMember_no();

		param.setMember_no(member_no);
		freeboardservice.doLikeProcess(param);
		return "redirect:./freeBoardReadContentPage.do?free_no=" + param.getFree_no();
	}

}