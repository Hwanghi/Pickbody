package com.ja.pickbody.admin.controller;

import java.io.File;
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

import com.ja.pickbody.admin.mapper.AdminSQLMapper;
import com.ja.pickbody.admin.mapper.SellBoardSQLMapper;
import com.ja.pickbody.admin.service.AdminServiceImpl;
import com.ja.pickbody.admin.service.SellBoardServiceImpl;
import com.ja.pickbody.vo.AdminVo;
import com.ja.pickbody.vo.BoardDropImageVo;
import com.ja.pickbody.vo.BoardDropVo;
import com.ja.pickbody.vo.SellBoardVo;
import com.ja.pickbody.vo.SellImageVo;

@Controller
@RequestMapping("/admin/*")
public class SellBoardController {

@Autowired
private SellBoardServiceImpl sellBoardServiceImpl;
@Autowired
private AdminServiceImpl adminServiceImpl;




@RequestMapping("AdminmainPage.do")
public String adminMainPage() {
	
	return "admin/mainPage";
}

//관리자 판매게시판
	@RequestMapping("sellPage.do")
	public String sellPage(Model model) {
		ArrayList<HashMap<String, Object>> sellList = sellBoardServiceImpl.getSellList();
		model.addAttribute("sellList", sellList);
		return "admin/sellPage";
	}

@RequestMapping("sellBoardWritePage.do")
public String writeSellBoardPage() {
	
	
	return "admin/sellBoardWritePage";
}
@RequestMapping("writeSellBoardProcess.do")
public String writeSellBoardProcess(SellBoardVo param, MultipartFile [] files) {
	String rootUploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles/";
	
	ArrayList<SellImageVo> sellImageVoList = new ArrayList<SellImageVo>();
	
	//파일 업로드
	for(MultipartFile file : files) {
		
		if(file.isEmpty()) {
			continue;
		}
		
		String originalFileName = file.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		//파일명 변환. 목표 : 파일명 충돌 방지, 방법 : 랜덤 + 시간
		UUID uuid = UUID.randomUUID();
		System.out.println("생성 된 uuid : " + uuid.toString());
		long currentTime = System.currentTimeMillis();
		
		String randomFileName = uuid.toString() + "_" + currentTime + ext;
		
		//날짜 폴더 생성
		Date today = new Date();	//오늘 날짜 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");	//날짜 -> 문자 변환 객체
		String todayFolderName = sdf.format(today);
		
		//예) C:/uploadFiles/2021/10/26
		File todayFolder = new File(rootUploadFileFolderName + "/" + todayFolderName);
		
		if(!todayFolder.exists()) {
			todayFolder.mkdirs();
			
		}
		
		String uploadFilePath = rootUploadFileFolderName + "/" + todayFolderName + "/"+ randomFileName;
		
		try {
			file.transferTo(new File(uploadFilePath));
		} catch (Exception e) {
			//실무에서는 여기가 제일 어렵고 중요함
			e.printStackTrace();
		}
		
		//데이터 구성
		SellImageVo sellimageVo = new SellImageVo();
		sellimageVo.setSellImage_original_filename(originalFileName);
		sellimageVo.setSellImage_link(todayFolderName + "/"+ randomFileName);
		
		sellImageVoList.add(sellimageVo);
		
	}
	
	 sellBoardServiceImpl.writeSellBoard(param, sellImageVoList);
	
	
	
	
	return "redirect:./sellPage.do";
}
	//글 상세보기
	@RequestMapping("sellBoardReadPage.do")
	public String sellBoardReadPage(int sell_no, Model model) {
		HashMap<String, Object> selldata = sellBoardServiceImpl.getReadSellBoard(sell_no);
		model.addAttribute("selldata", selldata);
		return "admin/sellBoardReadPage";
	}
	//수정 페이지
	@RequestMapping("sellUpdateContentPage.do")
	public String sellUpdateContentPage(int sell_no, Model model) {
		HashMap<String, Object> selldata = sellBoardServiceImpl.getReadSellBoard(sell_no);
		model.addAttribute("selldata", selldata);
		
		return "admin/sellUpdateContentPage";
	}
		//수정
		@RequestMapping("sellUpdateProcess.do")
		public String sellUpdateProcess(SellBoardVo vo) {
			sellBoardServiceImpl.updateSellBoard(vo);
			return "redirect:./sellBoardReadPage.do?sell_no="+vo.getSell_no();
	}	
		//삭제
		@RequestMapping("deleteSellboardProcess.do")
		public String deleteSellboardProcess(int sell_no) {
			sellBoardServiceImpl.deleteSellboard(sell_no);
			return "redirect:./sellPage.do";
		}
	

		//관리자가 구매한 사람들 리스트 보기
	      @RequestMapping("buyListViewPage.do")
	      public String buyListView() {
	         
	         return "admin/buyListViewPage";
	      }
}







