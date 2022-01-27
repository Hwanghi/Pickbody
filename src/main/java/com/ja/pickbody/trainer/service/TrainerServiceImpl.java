package com.ja.pickbody.trainer.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.member.mapper.MyPageSQLMapper;
import com.ja.pickbody.trainer.mapper.TrainerSQLMapper;
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
import com.ja.pickbody.vo.TrainerGoalVo;
import com.ja.pickbody.vo.TrainerProfileImageVo;
import com.ja.pickbody.vo.TrainerVo;

@Service
public class TrainerServiceImpl {
	
	@Autowired
	private TrainerSQLMapper trainerSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private MyPageSQLMapper mypageSQLMapper;
	
	//강사 회원가입
	public void joinTrainerService(TrainerVo vo, int[] goal_category_no, TrainerProfileImageVo imageVo) {
		
		int trainerNo = trainerSQLMapper.createTrainerPK();
		vo.setTrainer_no(trainerNo);
		imageVo.setTrainer_no(trainerNo);
		//강사 전문분야 == 회원목표 부분
		if(goal_category_no != null) {
			for(int no : goal_category_no) {
				TrainerGoalVo trainerGoalVo = new TrainerGoalVo();
				trainerGoalVo.setTrainer_no(trainerNo);
				trainerGoalVo.setGoal_category_no(no);
				
				trainerSQLMapper.addGoalCategory(trainerGoalVo);
			}
		}	
		trainerSQLMapper.registerTrainer(vo);
		trainerSQLMapper.registerTrainerProfileImage(imageVo);
	}
	
	//강사 정보 수정
	public void updateTrainerInfo(TrainerVo vo) {
		trainerSQLMapper.updateTrainerInfo(vo);
	}
	
	/*** 강사 프로필 사진 ***/
	// 강사 프로필 사진 존재 여부 확인 
	public int countTrainerProfileImage(int trainerNo) {
		return trainerSQLMapper.countTrainerProfileImage(trainerNo);
	}
	//강사 프로필 사진 등록
	public void registerTrainerProfileImage(TrainerProfileImageVo vo) {
		trainerSQLMapper.registerTrainerProfileImage(vo);
	}
	
	//강사 프로필 사진 출력
	public TrainerProfileImageVo getTrainerProfileImageVo(int trainerNo) {
		return trainerSQLMapper.getTrainerProfileImageByNo(trainerNo);
	}
	//강사 프로필 사진 삭제
	public void deleteTrainerProfileImage(int trainerNo) {
		
		trainerSQLMapper.deleteTrainerProfileImageByNo(trainerNo);
	}
	//강사 프로필 사진 수정
	public void updateTrainerProfileImage(TrainerProfileImageVo vo) {
		
		trainerSQLMapper.updateTrainerProfileImage(vo);
	}
	// 강사 정보 조회
	public TrainerVo getTrainerVo(int trainerNo) {
		return trainerSQLMapper.getTrainerByNo(trainerNo);
	}	
	// 강사 회원가입시 전문분야(회원목표) 체크박스 표시용
	public ArrayList<GoalCategoryVo> getGoalCategoryList(){	
		return trainerSQLMapper.getGoalCategoryList();
	}
	
	// 강사번호로 구독중인 회원 목록 가져오기 
	public ArrayList<HashMap<String, Object>> getPTProgramMemberList(int trainerNo) {
			ArrayList<HashMap<String, Object>> memberList = new ArrayList<HashMap<String, Object>>();
			// PT 프로그램 테이블 에서 강사를 구독 중인 회원을 불러온다.
			ArrayList<PTProgramVo> programList = trainerSQLMapper.getPTMemberList(trainerNo);
			for (PTProgramVo programVo : programList) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("programVo", programVo);
				int memberNo =  programVo.getMember_no();
				map.put("memberVo", memberSQLMapper.getMemberByNo(memberNo));
				map.put("memberProfileImageVo", mypageSQLMapper.getMemberProfileImageByNo(memberNo));
				map.put("memberGoal", trainerSQLMapper.getGoalCategoryVo(programVo.getGoal_category_no()));
				memberList.add(map);
			}
			
			return memberList;
	}
	
	// 강사번호로 전문분야 리스트 가져오기 
	public ArrayList<GoalCategoryVo> getTrainerGoalList(int trainerNo) {
		ArrayList<GoalCategoryVo> list = new ArrayList<GoalCategoryVo>();
		ArrayList<TrainerGoalVo> trainerGoalList = trainerSQLMapper.getTrainerGoalList(trainerNo);
		
		for(TrainerGoalVo trainerGoalVo : trainerGoalList) {
			int goalCategoryNo = trainerGoalVo.getGoal_category_no();
			GoalCategoryVo goalCategoryVo = trainerSQLMapper.getGoalCategoryVo(goalCategoryNo);
			list.add(goalCategoryVo);
		}
		
		return list;
	}
	
	
	// 로그인 부분
	public TrainerVo login(TrainerVo vo) {
		TrainerVo result = trainerSQLMapper.getTrainerByIdAndPw(vo);
		return result;
	}	
	
	
	// PT 프로그램 상세 조회
	public PTProgramVo getPTProgram(int programNo) {
		return trainerSQLMapper.getPTProgramVo(programNo);
	}
	
	// PT 프로그램 특정 주차 스케줄 조회 
	public ScheduleWeekVo getScheduleWeek(int programNo, int week) {
		return trainerSQLMapper.getScheduleWeekByProgramNoAndWeek(programNo, week);
	}
	
	// 일주일 단위 일간 스케줄 가져오기 
	public ArrayList<ScheduleDailyVo> getScheduleDailyList(int scheduleWeekNo) {
		return trainerSQLMapper.getScheduleDailyList(scheduleWeekNo);
	}
	
	// 일간 스케줄 상세 조회
	public ScheduleDailyVo getScheduleDaily(int scheduleNo) {
		return trainerSQLMapper.getScheduleDailyVo(scheduleNo);
	}	
	
	public int createScheduleWeekAndDaily(ScheduleWeekVo vo) {
		
		int scheduleWeekNo = trainerSQLMapper.createSchedulePK();
		final Date startWeekDate = vo.getSchedule_startdate();
		
		vo.setSchedule_week_no(scheduleWeekNo);
		
		trainerSQLMapper.registerScheduleWeek(vo);
		// 일간 스케줄 7개 생성
		for(int i=0; i<7; i++) {
			ScheduleDailyVo scheduleDailyVo = new ScheduleDailyVo();
			scheduleDailyVo.setSchedule_week_no(scheduleWeekNo);
			
			long milliSeconds = startWeekDate.getTime() + i*(24*60*60*1000);
			scheduleDailyVo.setSchedule_date(new Date(milliSeconds));
			
			trainerSQLMapper.registerScheduleDaily(scheduleDailyVo);
		}
		
		return scheduleWeekNo;
	}
	
	// 일간 식단 (아침 점심 저녁) 조회 
	public ArrayList<HashMap<String, Object>> getScheduleDailyFoodList(int scheduleNo) {
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<DietDailyVo> dietDailyList = trainerSQLMapper.getDietDailyList(scheduleNo);
		for (DietDailyVo dietDailyVo : dietDailyList) {
			// 시간대와 foodMapList를 결합한 해쉬맵
			HashMap<String, Object> dailyFoodMap = new HashMap<String,Object>();
			
			// 음식 이름과 개수를 결합한 맵 리스트를 만든다.
			ArrayList<HashMap<String, Object>> foodMapList = new ArrayList<HashMap<String,Object>>();
			ArrayList<DietFoodVo> dietFoodList = trainerSQLMapper.getDietFoodList(dietDailyVo.getDiet_no());
			for(DietFoodVo dietFood : dietFoodList) {
				HashMap<String, Object> foodMap = new HashMap<String, Object>();
				FoodCategoryVo foodCategoryVo = trainerSQLMapper.getFoodCategoryVo(dietFood.getFood_category_no());
				foodMap.put("name", foodCategoryVo.getFood_category_name());
				foodMap.put("unit", foodCategoryVo.getFood_category_unit());
				foodMap.put("number", dietFood.getDiet_food_number());
				foodMapList.add(foodMap);
			}
			
			dailyFoodMap.put("foodMapList", foodMapList);
			dailyFoodMap.put("time",dietDailyVo.getDiet_time());
			list.add(dailyFoodMap);
		}
		
		return list;
	}
	
	public ArrayList<FoodCategoryVo> getFoodCategoryList() {
		return trainerSQLMapper.getFoodCategoryList();
	}
	
	// 시간대 포함 식단 등록
	public void registerDiet(DietDailyVo dietDailyVo, ArrayList<DietFoodVo> dietFoodList) {
		// 스케쥴 번호를 조회해서 없으면 생성 
		DietDailyVo existDietDailyVo = trainerSQLMapper.checkDietDaily(dietDailyVo);
		int dietNo;
		if (existDietDailyVo == null) {
			dietNo = trainerSQLMapper.createDietDailyPK();
			dietDailyVo.setDiet_no(dietNo);
			trainerSQLMapper.addDietDaily(dietDailyVo);
		} else {
			dietNo = existDietDailyVo.getDiet_no();
		}
		
		for (DietFoodVo dietFood : dietFoodList) {
			dietFood.setDiet_no(dietNo);
			trainerSQLMapper.addDietFood(dietFood);
		}	
	}
	
	// 일간 운동 루틴 조회
	public ArrayList<HashMap<String, Object>> getScheduleDailyExerciseList(int scheduleNo) {
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<RutineDailyVo> rutineDailyList = trainerSQLMapper.getRutineDailyList(scheduleNo);
		for (RutineDailyVo rutineDailyVo : rutineDailyList) {
			// 운동 정보와 루틴을 결합한 해쉬맵
			HashMap<String, Object> dailyRuntineMap = new HashMap<String,Object>();
			ExerciseCategoryVo exerciseCategoryVo = trainerSQLMapper.getExerciseCategoryVo(rutineDailyVo.getExercise_category_no());
			
			dailyRuntineMap.put("exerciseCategoryVo", exerciseCategoryVo);
			dailyRuntineMap.put("rutineDailyVo",rutineDailyVo);
			list.add(dailyRuntineMap);
		}
		
		return list;
	}	
		
	// 일간 운동 루틴 등록
	public void registerExercise(RutineDailyVo vo) {
		trainerSQLMapper.addRutineDaily(vo);
	}
	
	// 운동 카테고리 조회
	public ArrayList<ExerciseCategoryVo> getExerciseCategoryList() {
		return trainerSQLMapper.getExerciseCategoryList();
	}
	
}
