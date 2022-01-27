package com.ja.pickbody.admin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.admin.mapper.AdminSQLMapper;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
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

@Service
public class AdminServiceImpl {
	@Autowired
	private AdminSQLMapper adminSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	// 로그인
	public AdminVo login(AdminVo vo) {

		AdminVo result = adminSQLMapper.getAdminByIdAndPw(vo);

		return result;
	}
	
	//음식 관련
	public void registFoodCategory(FoodCategoryVo vo) {
		adminSQLMapper.registFoodCategory(vo);
	}
	public ArrayList<HashMap<String, Object>> getFoodCategory(){
		ArrayList<HashMap<String, Object>> categoryVos = new ArrayList<HashMap<String,Object>>();
		ArrayList<FoodCategoryVo> foodCategoryVos = adminSQLMapper.getFoodCategory();
			
		for(FoodCategoryVo foodCategoryVo : foodCategoryVos) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("foodCategoryVo", foodCategoryVo);
			categoryVos.add(map);
		}
		
		return categoryVos;
	}
	public void updateFoodCategory(FoodCategoryVo vo) {
		adminSQLMapper.updateFoodCategory(vo);
	}
	public void deleteFoodCategory(int food_category_no) {
		adminSQLMapper.deleteFoodCategoryByNo(food_category_no);
	}
	
	//운동 관련
	public void registExerciseCategory(ExerciseCategoryVo vo) {
		adminSQLMapper.registExerciseCategory(vo);
	}
	public ArrayList<HashMap<String, Object>> getExerciseCategory(){
		ArrayList<HashMap<String, Object>> categoryVos = new ArrayList<HashMap<String,Object>>();
		ArrayList<ExerciseCategoryVo> exerciseCategoryVos = adminSQLMapper.getExerciseCategory();
			
		for(ExerciseCategoryVo exerciseCategoryVo : exerciseCategoryVos) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("exerciseCategoryVo", exerciseCategoryVo);
			categoryVos.add(map);
		}
		
		return categoryVos;
	} 
	public void updateExerciseCategory(ExerciseCategoryVo vo) {
		adminSQLMapper.updateExerciseCategory(vo);
	}
	public void deleteExerciseCategoryByNo(int exercise_category_no) {
		adminSQLMapper.deleteExerciseCategoryByNo(exercise_category_no);
	}

	// 드랍 글 쓰기
	public void writeBoardDrop(BoardDropVo vo, ArrayList<BoardDropImageVo> boardDropImageVoList) {

		// dropboard pk 생성
		int board_drop_no = adminSQLMapper.createBoardDropPK();
		vo.setDrop_no(board_drop_no);
		// dropboard insert
		adminSQLMapper.writeBoardDrop(vo);

		// 이미지 insert
		for (BoardDropImageVo boardDropImageVo : boardDropImageVoList) {
			boardDropImageVo.setDrop_no(board_drop_no);
			adminSQLMapper.registImage(boardDropImageVo);

		}
	}

	// 드랍 게시판 리스트
	public ArrayList<HashMap<String, Object>> getBoardDropList() {
		
		ArrayList<HashMap<String, Object>> droplist = new ArrayList<HashMap<String, Object>>();
		
		
		
		//SELECT * FROM FP_Board ORDER BY board_no DESC;
		ArrayList<BoardDropVo> boardDropList = adminSQLMapper.getBoardDropList();
		
		for(BoardDropVo boardDropVo : boardDropList) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			int drop_no = boardDropVo.getDrop_no();
			BoardDropImageVo boardDropImageVo = adminSQLMapper.getBoardDropImageByRownum(drop_no);
			
			map.put("boardDropVo", boardDropVo);
			map.put("boardDropImageVo", boardDropImageVo);

			droplist.add(map);
		}
		
		
		return droplist;
	}

	// 드랍 게시판 상세보기
	public HashMap<String, Object> getBoardDropByNo(int drop_no, boolean escape) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		BoardDropVo boardDropVo = adminSQLMapper.getBoardDropByNo(drop_no);
	
		if(escape) {
			String str = StringEscapeUtils.escapeHtml4(boardDropVo.getDrop_content());
			str = str.replaceAll("\n", "<br>");
			boardDropVo.setDrop_content(str);
		}
		
		//이미지 리스트 출력
		ArrayList<BoardDropImageVo> boardDropImageVoList = adminSQLMapper.getBoardDropImagesByDropNo(drop_no);

		map.put("boardDropVo", boardDropVo);
		map.put("boardDropImageVoList", boardDropImageVoList);
		return map;
	}

	// 드랍 게시판 글 수정하기
	public void updateBoardDrop(BoardDropVo vo) {
		adminSQLMapper.updateBoardDrop(vo);
	}

	// 드랍게시판 글 삭제하기
	public void deleteBoardDropByNo(int drop_no) {
		adminSQLMapper.deleteBoardDropByNo(drop_no);
	}

	// 당첨자 출력
	public ArrayList<HashMap<String, Object>> getWinningMember(int drop_no) {

		ArrayList<WinningListVo> winningListVos = adminSQLMapper.getWinningMember(drop_no);

		ArrayList<HashMap<String, Object>> winninglist = new ArrayList<HashMap<String, Object>>();

		for (WinningListVo winningVo : winningListVos) {

			HashMap<String, Object> map = new HashMap<String, Object>();
			int member_no = winningVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);

			map.put("memberVo", memberVo);
			map.put("winningVo", winningVo);
			winninglist.add(map);
		}

		return winninglist;
	}

	// 댓글 보기
	public ArrayList<HashMap<String, Object>> getAapplicationDropList(int drop_no) {

		// 댓글 리스트 출력
		ArrayList<HashMap<String, Object>> applist = new ArrayList<HashMap<String, Object>>();

		ArrayList<ApplicationVo> applicationList = adminSQLMapper.getDropApplicationListByDropNo(drop_no);

		for (ApplicationVo applicationVo : applicationList) {
			int member_no = applicationVo.getMember_no();

			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("memberVo", memberVo);
			map.put("applicationVo", applicationVo);

			applist.add(map);
		}

		return applist;
	}

	public int totalApplicationCount(int drop_no) {

		return adminSQLMapper.totalApplicationCount(drop_no);
	}
	
	
	//관리자 정보
	public AdminVo getAdminVo(int admin_no) {
		return adminSQLMapper.getAdminByNo(admin_no);
	}
	//회원관리 관련

	
	//회원 리스트 출력
	public ArrayList<HashMap<String, Object>> getMemberList() {
		
		ArrayList<HashMap<String, Object>> memberVoList = new ArrayList<HashMap<String,Object>>();
		ArrayList<MemberVo> memberVos = adminSQLMapper.getMemberList();
		
		for(MemberVo memberVo : memberVos) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int member_no = memberVo.getMember_no();
			MemberInhibitionVo memberInhibitionVo = adminSQLMapper.getMemberInhibitionByMemberNo(member_no);
			map.put("memberInhibitionVo", memberInhibitionVo);
			map.put("memberVo", memberVo);
			memberVoList.add(map);
		}
		return memberVoList;
	}
	
	public void doMemberInhibition(int member_no, int day) {
		
		int count = adminSQLMapper.countMemberInhibitionByNo(member_no);
		
		if(count > 0) {
			adminSQLMapper.additionMemberInhibition(member_no, day);
		} else {
			adminSQLMapper.resistMemberInhibition(member_no, day);
		}
	}
	
	//특정 날짜 별 가입 회원 수 조회
	public ArrayList<HashMap<String, Object>> joinMemberCountByDate() {
		ArrayList<HashMap<String, Object>> joinMemberCountList = new ArrayList<HashMap<String,Object>>();
		
			for(int i=7; i>0; i--) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DATE , -i);
				
				String date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());

			    int joinMemberCount = adminSQLMapper.joinMemberCountByDate(date);
			
			    map.put("date", date);
			    map.put("joinMemberCount", joinMemberCount);
			    
			    joinMemberCountList.add(map);
			}
			
		return joinMemberCountList;
	}
	
	//특정 날짜 별 소모 포인트 합
	public ArrayList<HashMap<String, Object>> pointSumByDate() {
		ArrayList<HashMap<String, Object>> pointSumList = new ArrayList<HashMap<String,Object>>();
		
		for(int i=7; i>0; i--) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE , -i);
			
			String date = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
			
			int pointSum = adminSQLMapper.pointSumByDate(date);
			
			map.put("date", date);
			map.put("pointSum", pointSum);
			
			pointSumList.add(map);
		}
		
		return pointSumList;
	}
	
	//특정 날짜 별 소모 포인트 합
	
	//PT매칭 수 상위 5강사 정보
	public ArrayList<HashMap<String, Object>> getPrecedenceFiveTrainner(){
		ArrayList<HashMap<String, Object>> trainerDataList = new ArrayList<HashMap<String,Object>>();
		ArrayList<TrainerVo> precedenceTrainerList = adminSQLMapper.precedenceFiveTrainner();
		
		for(TrainerVo trainerVo : precedenceTrainerList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int trainerNo = trainerVo.getTrainer_no();
			TrainerCertificationVo trainerCertificationVo = adminSQLMapper.getTrainerCertificationByNo(trainerNo);
			TrainerPrizeVo trainerPrizeVo = adminSQLMapper.getTrainerPrizeByNo(trainerNo);
			
			map.put("trainerVo", trainerVo);
			map.put("trainerCertificationVo", trainerCertificationVo);
			map.put("trainerPrizeVo", trainerPrizeVo);
			trainerDataList.add(map);
			
		}
		
		return trainerDataList;
	}
}
