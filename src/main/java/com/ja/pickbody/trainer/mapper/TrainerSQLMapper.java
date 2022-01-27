package com.ja.pickbody.trainer.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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

public interface TrainerSQLMapper {

	// 강사 회원가입
	public int createTrainerPK();
	public void registerTrainer(TrainerVo vo);
	
	//강사 정보 수정
	public void updateTrainerInfo(TrainerVo vo);
	//강사 닉네임 수정
	public void updateTrainerNick(TrainerVo vo);
	
	//강사 프로필 사진
	//강사 프로필 사진 있나 없나
	public int countTrainerProfileImage(int trainer_no);
	//강사 프로필 사진 등록
	public void registerTrainerProfileImage(TrainerProfileImageVo vo);
	//강사 프로필 사진 출력
	public TrainerProfileImageVo getTrainerProfileImageByNo(int trainer_no);
	//강사 프로필 사진 삭제
	public void deleteTrainerProfileImageByNo(int trainer_no);
	//강사 프로필 사진 수정
	public void updateTrainerProfileImage(TrainerProfileImageVo vo);
	
	// 강사 전문분야 
	public ArrayList<GoalCategoryVo> getGoalCategoryList();
	public GoalCategoryVo getGoalCategoryVo(int no);
	public ArrayList<TrainerGoalVo> getTrainerGoalList(int trainerNo);
	public void addGoalCategory(TrainerGoalVo vo);
	
	// 강사 정보 상세 조회
	public TrainerVo getTrainerByNo(int no);
	// 강사 로그인 
	public TrainerVo getTrainerByIdAndPw(TrainerVo vo);
	
	/*** 주간 스케줄 등록 부분 ***/
	// 주간 스케줄 PK 생성
	public int createSchedulePK();
	public void registerScheduleWeek(ScheduleWeekVo vo);
	public void registerScheduleDaily(ScheduleDailyVo vo);
	// 시간대가 있는 일간 식단 PK 생성
	public int createDietDailyPK();
	// 식단 추가
	public void addDietDaily(DietDailyVo vo);
	// 식단 음식 추가 
	public void addDietFood(DietFoodVo vo);
	
	/*** 주간 스케줄 조회 부분 ***/
	// 프로그램 번호와 주차로 주간 스케줄 조회
	public ScheduleWeekVo getScheduleWeekByProgramNoAndWeek(@Param("programNo") int programNo, @Param("week") int week );
	// 일간 스케줄 상세 정보 가져오기
	public ScheduleDailyVo getScheduleDailyVo(int no);
	// 주 별로 일간 스케줄 전체 조회
	public ArrayList<ScheduleDailyVo> getScheduleDailyList(int scheduleWeekNo);
	// 일간 식단 전체 조회
	public ArrayList<DietDailyVo> getDietDailyList(int schedule_no);
	// 일간 식단 중복 생성 체크
	public DietDailyVo checkDietDaily(DietDailyVo vo);
	// 식단에 포함된 음식 조회
	public ArrayList<DietFoodVo> getDietFoodList(int diet_no);
	// 음식 카테고리 전체 조회
	public ArrayList<FoodCategoryVo> getFoodCategoryList();
	// 음식 카테고리 개별 조회
	public FoodCategoryVo getFoodCategoryVo(int no);
	
	/*** PT 프로그램 조회 부분 ***/
	// PT 프로그램 상세 조회
	public PTProgramVo getPTProgramVo(int no);
	// PT 프로그램 멤버 목록 조회
	public ArrayList<PTProgramVo> getPTMemberList(int trainerNo);
	
	
	
	/*** 운동 루틴 생성 부분 ***/
	public void addRutineDaily(RutineDailyVo vo);
	
	
	/*** 운동 루틴 조회 부분 ***/
	public ArrayList<ExerciseCategoryVo> getExerciseCategoryList();
	public ExerciseCategoryVo getExerciseCategoryVo(int no);
	public ArrayList<RutineDailyVo> getRutineDailyList(int schedule_no);
}
