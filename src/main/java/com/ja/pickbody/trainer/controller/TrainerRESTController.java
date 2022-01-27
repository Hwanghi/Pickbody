package com.ja.pickbody.trainer.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ja.pickbody.commons.CalendarUtil;
import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.member.service.MyPageServiceImpl;
import com.ja.pickbody.trainer.service.TrainerServiceImpl;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.PTProgramVo;
import com.ja.pickbody.vo.ScheduleWeekVo;
import com.ja.pickbody.vo.TrainerProfileImageVo;
import com.ja.pickbody.vo.TrainerVo;

@Controller
@RequestMapping("/trainer/*")
@ResponseBody
public class TrainerRESTController {

	@Autowired
	TrainerServiceImpl trainerService;
	// 회원정보 조회용 서비스
	@Autowired
	private MyPageServiceImpl myPageService;
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("getTrainerProfileImageProcess.do")
	public HashMap<String, Object> getTrainerProfileImageProcess(int trainer_no, HttpSession session){
		HashMap<String, Object> data = new HashMap<String, Object>();
		TrainerProfileImageVo profileImageVo = trainerService.getTrainerProfileImageVo(trainer_no);
		session.setAttribute("profileImageVo", profileImageVo);
		data.put("profileImageVo", profileImageVo);
		return data;
	}
	
	//회원 프로필 존재-> 수정, 없으면 삽입
	@RequestMapping("registerTrainerProfileProcess.do")
	public void registerTrainerProfileProcess(MultipartFile trainerProfileImageFile, HttpSession session) {

		String rootUploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles/trainer/profile";
		
		//파일업로드 
		String originalFileName = trainerProfileImageFile.getOriginalFilename();
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
			trainerProfileImageFile.transferTo(new File(uplodeFilePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		TrainerVo vo = (TrainerVo)session.getAttribute("trainerUser");
		int trainerNo = vo.getTrainer_no();
		
		
		TrainerProfileImageVo trainerProfileImageVo = new TrainerProfileImageVo();
		trainerProfileImageVo.setImage_original_filename(originalFileName);
		trainerProfileImageVo.setImage_link(todayFolderName + "/" + randomFileName);
		trainerProfileImageVo.setTrainer_no(trainerNo);
		
		// 기존에 프로필 사진이 있다면 수정 없으면 삽입
		int countProfileImage = trainerService.countTrainerProfileImage(trainerNo);
		if(countProfileImage > 0) {
			trainerService.updateTrainerProfileImage(trainerProfileImageVo);
		} else {
			trainerService.registerTrainerProfileImage(trainerProfileImageVo);
		}
	}
	
	@RequestMapping("getSessionUserInfo.do")
	public HashMap<String, Object> getSessionUserInfo(HttpSession session) {

		HashMap<String, Object> data = new HashMap<String, Object>();

		// 세션 데이터 약간 늦음
		Object trainerUser = session.getAttribute("trainerUser");
		if (trainerUser != null) {
			TrainerVo trainerVo = (TrainerVo) trainerUser;
			int trainerNo = trainerVo.getTrainer_no();
			
			TrainerProfileImageVo profileImageVo = trainerService.getTrainerProfileImageVo(trainerVo.getTrainer_no());
			if(profileImageVo instanceof TrainerProfileImageVo) {
				profileImageVo = (TrainerProfileImageVo) session.getAttribute("profileImageVo");
			}
			data.put("isLogined", true);
			data.put("trainerNo", trainerNo);
			data.put("trainerName", trainerVo.getTrainer_name());
			data.put("trainerPoint", trainerVo.getTrainer_point());
			data.put("profileImageVo", profileImageVo);
			
		} else {
			data.put("isLogined", false);
		}

		return data;
	}
	
	@RequestMapping("showTotalScheduleProcess.do")
	public HashMap<String, Object> showTotalScheduleProcess(int program_no) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		PTProgramVo programVo = trainerService.getPTProgram(program_no);
		Date startDate = programVo.getStart_date();
		Date today = new Date();
		long milliSeconds = today.getTime() - startDate.getTime();
		if (milliSeconds < 0) milliSeconds = 0; // 오늘이 시작 날짜보다 이전인 경우
		int thisweek = (int)(milliSeconds/(24*60*60*1000))/7 + 1;
		
		data.put("thisweek", thisweek); // 구독 시작 날짜와 오늘 날짜 비교해 몇 주차인지 계산  
		data.put("scheduleWeekVo", trainerService.getScheduleWeek(program_no, thisweek)); // null 이면 주간 스케줄 생성 필요!
		return data;
	}
	
	// 주간 스케줄 처리 페이지 
	@RequestMapping("addTrainerAdviceProcess.do")
	public PTProgramVo addTrainerAdviceProcess(ScheduleWeekVo param) {
		PTProgramVo programVo = trainerService.getPTProgram(param.getProgram_no());
		
		// 주간 스케줄 시작 날짜를 구한다. 
		int week = param.getWeek();
		Date programStartDate = programVo.getStart_date();
		long milliSeconds = programStartDate.getTime() + (week-1)*7*(24*60*60*1000);
		Date scheduleStartDate = new Date(milliSeconds);
		param.setSchedule_startdate(scheduleStartDate);
		
		// 주간 스케줄과 동시에 일간 스케줄 7개를 생성 
		int scheduleWeekNo = trainerService.createScheduleWeekAndDaily(param);
		return programVo;
	}
	
	
}
