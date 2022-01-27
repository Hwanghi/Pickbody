package com.ja.pickbody.trainer.controller;

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

import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.trainer.service.TrainerServiceImpl;
import com.ja.pickbody.vo.DietDailyVo;
import com.ja.pickbody.vo.DietFoodVo;
import com.ja.pickbody.vo.ExerciseCategoryVo;
import com.ja.pickbody.vo.FoodCategoryVo;
import com.ja.pickbody.vo.GoalCategoryVo;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.PTProgramVo;
import com.ja.pickbody.vo.RutineDailyVo;
import com.ja.pickbody.vo.ScheduleDailyVo;
import com.ja.pickbody.vo.ScheduleWeekVo;
import com.ja.pickbody.vo.TrainerProfileImageVo;
import com.ja.pickbody.vo.TrainerVo;

@Controller
@RequestMapping("/trainer/*")
public class TrainerController {

	@Autowired
	private TrainerServiceImpl trainerService;
	
	@Autowired
	private MemberServiceImpl memberService;

	//강사로그인페이지
	@RequestMapping("loginPage.do")
	public String loginPage() {
		
		return "trainer/loginPage";
	}
	
	@RequestMapping("loginProcess.do")
	public String loginProcess(TrainerVo param , HttpSession session) {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		TrainerVo trainerUser = trainerService.login(param);
		if(trainerUser != null) { //로그인 성공
			int trainerNo = trainerUser.getTrainer_no();
			// 세션에 등록
			session.setAttribute("trainerUser", trainerUser);
			// 프로필 사진 가져오기 
			TrainerProfileImageVo profileImageVo = trainerService.getTrainerProfileImageVo(trainerNo);
			session.setAttribute("profileImageVo", profileImageVo);
			// 구독 중인 회원 리스트 가져오기 
			ArrayList<HashMap<String, Object>> memberList = trainerService.getPTProgramMemberList(trainerNo);
			data.put("memberList", memberList);
			// 응답 데이터 
			data.put("isLogined", true);
			data.put("trainerNo", trainerUser.getTrainer_no());
			data.put("trainerName", trainerUser.getTrainer_name());
			data.put("trainerPoint", trainerUser.getTrainer_point());
			data.put("profileImageVo", profileImageVo);
			
		} else { //로그인 실패
			data.put("isLogined", false);
			return "redirect:../trainer/loginPage.do";
		}
		
		return "redirect:../trainer/myPage.do";
	}
	
	@RequestMapping("logoutProcess.do")
	public String logoutProcess(HttpSession session) {
		
		session.invalidate(); //세션 재구성...
		
		return "redirect:../trainer/loginPage.do";
	}
	 
	//강사 회원가입 페이지
	@RequestMapping("joinTrainerPage.do")
	public String joinTrainerPage(Model model) {
		
		ArrayList<GoalCategoryVo> goalCategoryList = trainerService.getGoalCategoryList();
		model.addAttribute("goalCategoryList", goalCategoryList);
		
		return "trainer/joinTrainerPage";
	}
	
	//강사 회원가입 처리
	@RequestMapping("joinTrainerProcess.do")
	public String joinTrainerProcess(TrainerVo vo, int[] goal_category_no, MultipartFile file) {
		String rootUploadFileFolderName =  "/Users/hwanghi/Documents/uploadFiles/trainer/profile"; // 업로드 폴더 경로
		TrainerProfileImageVo trainerProfileImageVo = new TrainerProfileImageVo();
		
		if(file != null && !file.isEmpty()) {
			String originalFileName = file.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			// 파일명 변환...목표 : 동일한 파일명 충돌 방지, 방법 : 랜덤 + 시간
			UUID uuid = UUID.randomUUID();
			System.out.println("생성된 uid: " + uuid.toString());
			long currentTime = System.currentTimeMillis();
			
			String randomFileName = uuid.toString() + "_" + currentTime + ext;
		
			// 날짜 폴더 생성...
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolderName = sdf.format(today);
			// /uploadFiles/2021/10/26
			File todayFolder = new File(rootUploadFileFolderName + "/" + todayFolderName);
			
			if(!todayFolder.exists()) {
				todayFolder.mkdirs();
			}
			
			String uploadFilePath = 
					rootUploadFileFolderName + "/"+ todayFolderName + "/" + randomFileName;
			
			try {
				file.transferTo(new File(uploadFilePath));
			} catch (Exception e) {
				// 실무에서 여기가 제일 어렵고 중요함
				e.printStackTrace();
			}
			
			trainerProfileImageVo.setImage_original_filename(originalFileName);
			trainerProfileImageVo.setImage_link(todayFolderName + "/" + randomFileName);
		} else {
			System.out.println("프로필 사진 업로드에 실패했습니다.");
		}
		
		vo.setTrainer_point(0);
		trainerService.joinTrainerService(vo, goal_category_no, trainerProfileImageVo);
		return "trainer/joinTrainerComplete";
	}
	
	@RequestMapping("myPage.do")
	public String myPage(Model model, HttpSession session) {
		return "trainer/myPage";
	}
	
	
	
	// 강사 회원 관리 페이지 
	@RequestMapping("manageMemberPage.do")
	public String manageMemberPage(Model model, HttpSession session) {
		
		TrainerVo trainer = (TrainerVo)session.getAttribute("trainerUser");
		ArrayList<HashMap<String, Object>> dataList = trainerService.getPTProgramMemberList(trainer.getTrainer_no());
		model.addAttribute("dataList", dataList);
		return "trainer/manageMemberPage";
	}
		
	// 일간 스케줄 전체 조회 페이지 
	@RequestMapping("scheduleDailyPage.do")
	public String scheduleDailyPage(int schedule_week_no, Model model) {
		ArrayList<HashMap<String, Object>> dataList = new ArrayList<HashMap<String,Object>>();
		// 일간 스케줄을 모두 조회 하면서 등록된 식단이 있으면 출력 
		ArrayList<ScheduleDailyVo> scheduleDailyList = trainerService.getScheduleDailyList(schedule_week_no);
		for(ScheduleDailyVo scheduleDaily: scheduleDailyList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int scheduleNo = scheduleDaily.getSchedule_no();
			ArrayList<HashMap<String, Object>> dailyFoodList = trainerService.getScheduleDailyFoodList(scheduleNo);
			ArrayList<HashMap<String, Object>> dailyExerciseList = trainerService.getScheduleDailyExerciseList(scheduleNo);
			
			map.put("scheduleDaily", scheduleDaily);
			map.put("dailyFoodList", dailyFoodList);
			map.put("dailyExerciseList", dailyExerciseList);
			dataList.add(map);
		}
		
		model.addAttribute("dataList", dataList);
		return "trainer/scheduleDailyPage";
	}
	
	// 일간 식단 작성 출력 페이지
	@RequestMapping("dietDailyPage.do")
	public String dietDailyPage(int schedule_no, Model model) {
		
		ScheduleDailyVo scheduleDailyVo = trainerService.getScheduleDaily(schedule_no);
		// 일간 스케줄 데이터
		model.addAttribute("scheduleDailyVo", scheduleDailyVo);
		// 푸드 카테고리 출력
		ArrayList<FoodCategoryVo> foodCategoryList = trainerService.getFoodCategoryList();
		model.addAttribute("foodCategoryList", foodCategoryList);
		return "trainer/dietDailyPage";
	}
	
	// 일간 식단 작성 처리 프로세스 
	@RequestMapping("dietDailyProcess.do")
	public String dietDailyProcess(DietDailyVo param, int schedule_week_no, int food_category_no, int diet_food_number) {
		// 선택한 시간대와 (음식 카테고리 번호,개수)를 매개 변수로 받는다. 
		ArrayList<DietFoodVo> dietFoodList = new ArrayList<DietFoodVo>();
		DietFoodVo dietFoodVo = new DietFoodVo();
		dietFoodVo.setDiet_no(param.getDiet_no());
		dietFoodVo.setFood_category_no(food_category_no);
		dietFoodVo.setDiet_food_number(diet_food_number);
		// 여러개의 음식을 받을 수 있게 할 예정입니다.
		dietFoodList.add(dietFoodVo);
		
		trainerService.registerDiet(param, dietFoodList);
		return "redirect:../trainer/scheduleDailyPage.do?schedule_week_no="+schedule_week_no;
	}
	
	// 일간 루틴 작성 페이지
	@RequestMapping("rutineDailyPage.do")
	public String rutineDailyPage(int schedule_no, Model model) {
		
		ScheduleDailyVo scheduleDailyVo = trainerService.getScheduleDaily(schedule_no);
		// 일간 스케줄 데이터
		model.addAttribute("scheduleDailyVo", scheduleDailyVo);
		// 운동 카테고리 출력
		ArrayList<ExerciseCategoryVo> exerciseCategoryList = trainerService.getExerciseCategoryList();
		model.addAttribute("exerciseCategoryList", exerciseCategoryList);
		return "trainer/rutineDailyPage";
	}
	
	// 일간 루틴 작성 처리 프로세스 
	@RequestMapping("rutineDailyProcess.do")
	public String rutineDailyProcess(RutineDailyVo param, int schedule_week_no) {
		
		trainerService.registerExercise(param);
		return "redirect:../trainer/scheduleDailyPage.do?schedule_week_no="+schedule_week_no;
	}	
	
}
