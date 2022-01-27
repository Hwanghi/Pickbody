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

import com.ja.pickbody.admin.service.AdminServiceImpl;
import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.vo.AdminVo;
import com.ja.pickbody.vo.BoardDropImageVo;
import com.ja.pickbody.vo.BoardDropVo;
import com.ja.pickbody.vo.ExerciseCategoryVo;
import com.ja.pickbody.vo.FoodCategoryVo;
import com.ja.pickbody.vo.MemberInhibitionVo;
import com.ja.pickbody.vo.MemberVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminServiceImpl adminServiceImpl;
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	
	//로그인
	@RequestMapping("loginPage.do")
	public String loginPage() {
		
		return "admin/loginPage";
	}
	
	@RequestMapping("loginProcess.do")
	public String loginProcess(AdminVo param, HttpSession session, Model model) {
		
		AdminVo sessionAdmin = adminServiceImpl.login(param);
		
		
		if(sessionAdmin != null) {
			
			session.setAttribute("sessionAdmin", sessionAdmin);
			
			return "redirect:./siteStatisticsPage.do";
			
		} else {
			model.addAttribute("loginFail", true);
			return "admin/loginPage";
		}
		
		
	}
	
	@RequestMapping("logoutProcess.do")
	public String logoutProcess(HttpSession session) {
			session.invalidate();
		return "redirect:./loginPage.do";
	}

	
	@RequestMapping("registExerciseCategoryPage.do")
	public String registExerciseCategoryPage(Model model) {
		ArrayList<HashMap<String, Object>> exerciseCategoryVoList = adminServiceImpl.getExerciseCategory();
		model.addAttribute("exerciseCategoryVoList", exerciseCategoryVoList);
		return "admin/registExerciseCategoryPage";
	}
	@RequestMapping("registExerciseCategoryProcess.do")
	public String registExerciseCategoryProcess(ExerciseCategoryVo param) {
		adminServiceImpl.registExerciseCategory(param);
		return "redirect:./registExerciseCategoryPage.do";
	}
	@RequestMapping("updateExerciseCategoryProcess.do")
	public String updateExerciseCategoryProcess(ExerciseCategoryVo param) {
		adminServiceImpl.updateExerciseCategory(param);
		return "redirect:./registExerciseCategoryPage.do";
	}
	@RequestMapping("deleteExerciseCategoryProcess.do")
	public String deleteExerciseCategoryProcess(int exercise_category_no) {
		adminServiceImpl.deleteExerciseCategoryByNo(exercise_category_no);
		return "redirect:./registExerciseCategoryPage.do";
	}
	
	
	@RequestMapping("registFoodCategoryPage.do")
	public String registFoodCategoryPage(Model model) {
		ArrayList<HashMap<String, Object>> foodCategoryVoList = adminServiceImpl.getFoodCategory();
		model.addAttribute("foodCategoryVoList", foodCategoryVoList);
		return "admin/registFoodCategoryPage";
	}
	
	@RequestMapping("registFoodCategoryProcess.do")
	public String registFoodCategoryProcess(FoodCategoryVo param) {
		adminServiceImpl.registFoodCategory(param);
		return "redirect:./registFoodCategoryPage.do";
	}
	@RequestMapping("updateFoodCategoryProcess.do")
	public String updateFoodCategoryProcess(FoodCategoryVo param) {
		adminServiceImpl.updateFoodCategory(param);
		return "redirect:./registFoodCategoryPage.do";
	}
	@RequestMapping("deleteFoodCategoryProcess.do")
	public void deleteFoodCategoryProcess(int food_category_no) {
		adminServiceImpl.deleteFoodCategory(food_category_no);
	}
	
	@RequestMapping("dropBoardPage.do")
	public String dropBoardPage(Model model) {

		ArrayList<HashMap<String, Object>> droplist = adminServiceImpl.getBoardDropList();
		model.addAttribute("droplist", droplist);
		
		return "admin/dropBoardPage";
	}
	
	@RequestMapping("writeDropBoardPage.do")
	public String writeDropBoardContentPage() {
		
		
		return "admin/writeDropBoardPage";
	}
	
	@RequestMapping("writeDropBoardProcess.do")
	public String writeDropBoardContentProcess(BoardDropVo param, MultipartFile [] files) {
		
		String rootUploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles/";
		
		ArrayList<BoardDropImageVo> dropImageVoList = new ArrayList<BoardDropImageVo>();
		
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
			BoardDropImageVo dropimageVo = new BoardDropImageVo();
			dropimageVo.setImage_original_filename(originalFileName);
			dropimageVo.setImage_link(todayFolderName + "/"+ randomFileName);
			
			dropImageVoList.add(dropimageVo);
			
		}
		
		adminServiceImpl.writeBoardDrop(param, dropImageVoList);
		
		return "redirect:./dropBoardPage.do";
	}
	
	@RequestMapping("readDropBoardPage.do")
	public String readDropBoardPage(int drop_no, Model model) {
		HashMap<String, Object> dropdata = adminServiceImpl.getBoardDropByNo(drop_no, true);
		model.addAttribute("dropdata", dropdata);
		ArrayList<HashMap<String, Object>> applist = adminServiceImpl.getAapplicationDropList(drop_no);
		model.addAttribute("applist", applist);
		
		ArrayList<HashMap<String, Object>> winninglist = adminServiceImpl.getWinningMember(drop_no);
		model.addAttribute("winninglist", winninglist);
		
		int totalApplicationCount = adminServiceImpl.totalApplicationCount(drop_no);
		model.addAttribute("totalApplicationCount", totalApplicationCount);
		
		return "admin/readDropBoardPage";
	}
	
	@RequestMapping("updateDropBoardPage.do")
	public String updateDropBoardPage(int drop_no, Model model) {
		HashMap<String, Object> dropdata = adminServiceImpl.getBoardDropByNo(drop_no, false);
		model.addAttribute("dropdata", dropdata);
		
		return "admin/updateDropBoardPage";
	}
	
	@RequestMapping("updateDropBoardProcess.do")
	public String updateDropBoardProcess(BoardDropVo vo) {
		adminServiceImpl.updateBoardDrop(vo);
		return "redirect:./dropBoardPage.do";
	}
	
	
	@RequestMapping("deleteDropBoardProcess.do")
	public String deleteDropBoardProcess(int drop_no) {
		adminServiceImpl.deleteBoardDropByNo(drop_no);
		return "redirect:./dropBoardPage.do";
	}
	
	@RequestMapping("managementMemberPage.do")
	public String managementMember() {
		
		return "admin/managementMemberPage";
	}
	
	@RequestMapping("siteStatisticsPage.do")
	public String siteStatisticsPage(Model model) {
		ArrayList<HashMap<String, Object>> trainerDataList = adminServiceImpl.getPrecedenceFiveTrainner();
		model.addAttribute("trainerDataList", trainerDataList);
		
		return "admin/siteStatisticsPage";
	}
	
	
	
}
