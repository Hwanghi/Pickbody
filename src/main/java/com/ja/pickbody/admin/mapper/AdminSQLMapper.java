package com.ja.pickbody.admin.mapper;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.ja.pickbody.vo.AdminVo;
import com.ja.pickbody.vo.ApplicationVo;
import com.ja.pickbody.vo.BoardDropImageVo;
import com.ja.pickbody.vo.BoardDropVo;
import com.ja.pickbody.vo.ExerciseCategoryVo;
import com.ja.pickbody.vo.FoodCategoryVo;
import com.ja.pickbody.vo.MemberInhibitionVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.TrainerCertificationVo;
import com.ja.pickbody.vo.TrainerPrizeVo;
import com.ja.pickbody.vo.TrainerVo;
import com.ja.pickbody.vo.WinningListVo;

public interface AdminSQLMapper {
	public AdminVo getAdminByIdAndPw(AdminVo vo);
	
	//음식 관련
	public void registFoodCategory(FoodCategoryVo vo);
	public ArrayList<FoodCategoryVo> getFoodCategory();
	public void updateFoodCategory(FoodCategoryVo vo);
	public void deleteFoodCategoryByNo(int no);
	
	//운동 관련
	public void registExerciseCategory(ExerciseCategoryVo vo);
	public ArrayList<ExerciseCategoryVo> getExerciseCategory();
	public void updateExerciseCategory(ExerciseCategoryVo vo);
	public void deleteExerciseCategoryByNo(int no);
	
	// 드랍 게시판 글쓰끼
	public int createBoardDropPK();

	public void writeBoardDrop(BoardDropVo vo);

	// 드랍 게시판 리스트 출력
	public ArrayList<BoardDropVo> getBoardDropList();
	public BoardDropImageVo getBoardDropImageByRownum(int no);

	// 드랍 게시판 글 보기
	public BoardDropVo getBoardDropByNo(int no);

	// 드랍 게시판 글 수정
	public void updateBoardDrop(BoardDropVo vo);

	// 드랍 게시판 글 삭제
	public void deleteBoardDropByNo(int no);

	// 드랍 게시판 이미지 등록
	public void registImage(BoardDropImageVo vo);

	// 드랍 게시판 이미지 출력
	public ArrayList<BoardDropImageVo> getBoardDropImagesByDropNo(int no);

	// 댓글(응모)출력
	// 댓글 출력
	public ArrayList<ApplicationVo> getDropApplicationListByDropNo(int no);

	public ApplicationVo getDropApplicationByDropNo(int no);

	// 응모 확인
	public int myApplicationCount(ApplicationVo vo);

	// 총 응모자 수
	public int totalApplicationCount(int drop_no);

	// 드랍 상품 수량
	public int getDropAmount(int no);

	public ArrayList<WinningListVo> getWinningMember(int no);
	
	//관리자 정보 받아오기
	public AdminVo getAdminByNo(int admin_no);
	//회원 관리 관련
	//회원 리스트 가져오기
	public ArrayList<MemberVo> getMemberList();
	//회원 로그인 금지 출력
	public MemberInhibitionVo getMemberInhibitionByMemberNo(int member_no);
	//회원 로그인 금지 등록 판단
	public int countMemberInhibitionByNo(int member_no);
	//회원 로그인 금지 등록
	public void resistMemberInhibition(@Param("member_no") int member_no, @Param("day") int day);
	//회원 로그인 금지 추가
	public void additionMemberInhibition(@Param("member_no") int member_no, @Param("day") int day);
	//회원 로그인 금지 해제
	public void deleteMemberInhibition();

	
	//특정 날짜 별 가입 회원 수
	public int joinMemberCountByDate(String date);
	//특정 날짜 별 포인트 소모 합
	public int pointSumByDate(String date);
	
	//강사 상위 5명 정보 
	public ArrayList<TrainerVo> precedenceFiveTrainner();
	//강사 자격증 검색
	public TrainerCertificationVo getTrainerCertificationByNo(int trainer_no);
	//강사 수상내역 검색
	public TrainerPrizeVo getTrainerPrizeByNo(int trainer_no);
}
