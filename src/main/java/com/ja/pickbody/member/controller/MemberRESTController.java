package com.ja.pickbody.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ja.pickbody.commons.CalendarUtil;
import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.member.service.MyPageServiceImpl;
import com.ja.pickbody.trainer.service.TrainerServiceImpl;
import com.ja.pickbody.vo.FollowGroupVo;
import com.ja.pickbody.vo.FollowVo;
import com.ja.pickbody.vo.MemberDailyNoteVo;
import com.ja.pickbody.vo.MemberInhibitionVo;
import com.ja.pickbody.vo.MemberPointHistoryVo;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.PTProgramVo;
import com.ja.pickbody.vo.RutineDailyRecordVo;
import com.ja.pickbody.vo.ScheduleDailyVo;
import com.ja.pickbody.vo.ScheduleWeekVo;
import com.ja.pickbody.vo.StoryCommentVo;
import com.ja.pickbody.vo.StoryLikeVo;
import com.ja.pickbody.vo.StoryVo;
import com.ja.pickbody.vo.TrainerProfileImageVo;
import com.ja.pickbody.vo.TrainerVo;

@Controller
@RequestMapping("/member/*")
@ResponseBody
public class MemberRESTController {

	@Autowired
	MemberServiceImpl memberService;
	@Autowired
	MyPageServiceImpl mypageService;
	@Autowired
	TrainerServiceImpl trainerService;

	@RequestMapping("loginProcess.do")
	public HashMap<String, Object> loginProcess(MemberVo param, HttpSession session) {

		HashMap<String, Object> data = new HashMap<String, Object>();
		MemberVo memberUser = memberService.login(param);
		if (memberUser != null) { // 로그인 성공
			int memberNo = memberUser.getMember_no();
			MemberInhibitionVo memberInhibition = memberService.memberInhibition(memberNo);
			if (memberInhibition != null) { // 금지된 회원이면
				data.put("isLogined", false);
				data.put("isBanned", memberInhibition.getInhibition_date());
			} else {
				// 세션에 등록
				session.setAttribute("memberUser", memberUser);
				// 프로필 사진 가져오기
				MemberProfileImageVo profileImageVo = mypageService.getMemberProfileImageVo(memberNo);
				session.setAttribute("profileImageVo", profileImageVo);
				// 구독 중인지 확인
				PTProgramVo programVo = memberService.getMemberPTProgram(memberNo);
				session.setAttribute("programVo", programVo);
				// 응답 데이터
				data.put("isLogined", true);
				data.put("memberNo", memberUser.getMember_no());
				data.put("memberName", memberUser.getMember_name());
				data.put("memberNick", memberUser.getMember_nick());
				data.put("memberPoint", memberUser.getMember_point());
				data.put("profileImageVo", profileImageVo);
				// 구독 중인지 확인(null 일 수 있음)
				if (programVo != null) {
					data.put("isSubscribed", true);
					TrainerVo trainerVo = trainerService.getTrainerVo(programVo.getTrainer_no());
					String trainerName = trainerVo.getTrainer_name();
					session.setAttribute("trainerName", trainerName);
					data.put("trainerName", trainerName);
					// 구독 종료 날짜
					Date dueToDate = CalendarUtil.plusDays(programVo.getStart_date(), programVo.getHow_weeks() * 7);
					data.put("dueToDate", dueToDate);
				} else {
					data.put("isSubscribed", false);
				}
			}
		} else { // 로그인 실패
			data.put("isLogined", false);
		}

		return data;
	}

	@RequestMapping("applyProgramProcess.do")
	public void applyProgramProcess(PTProgramVo param, HttpSession session) {

		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		param.setMember_no(memberUser.getMember_no());

		// 서버기준 다음주 일요일로 시작 날짜 지정, 시간 초기화
		Date now = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(CalendarUtil.resetTime(now));
		for (int i = 0; i < 7; i++) {
			cal.add(Calendar.DATE, 1);
			if (cal.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.US).equals("Sun")) {
				// 시작 날짜 설정
				param.setStart_date(cal.getTime());
				break;
			}
		}

		memberService.addPTProgram(param);
	}

	//회원 일지 작성 
	@RequestMapping("memberDailyNoteProcess.do") 
	public void memberDailyNoteProcess(MemberDailyNoteVo params) {
		memberService.addMemberDailyNote(params);
	}
	
	
	@RequestMapping("getSessionUserInfo.do")
	public HashMap<String, Object> getSessionUserInfo(HttpSession session) {

		HashMap<String, Object> data = new HashMap<String, Object>();

		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		MemberProfileImageVo profileImageVo = null;
		if (session.getAttribute("profileImageVo") instanceof MemberProfileImageVo)
			profileImageVo = (MemberProfileImageVo) session.getAttribute("profileImageVo");

		if (memberUser != null) {
			int memberNo = memberUser.getMember_no();
			data.put("isLogined", true);
			data.put("memberNo", memberNo);
			data.put("memberName", memberUser.getMember_name());
			data.put("memberNick", memberUser.getMember_nick());
			data.put("memberPoint", memberUser.getMember_point());
			data.put("profileImageVo", profileImageVo);
			// 구독 중인지 확인(null 일 수 있음)
			PTProgramVo programVo = memberService.getMemberPTProgram(memberNo);
			if (programVo != null) {
				data.put("isSubscribed", true);
				TrainerVo trainerVo = trainerService.getTrainerVo(programVo.getTrainer_no());
				data.put("trainerName", trainerVo.getTrainer_name());
				// 구독 종료 날짜
				Date dueToDate = CalendarUtil.plusDays(programVo.getStart_date(), programVo.getHow_weeks() * 7);
				data.put("dueToDate", dueToDate);
			} else {
				data.put("isSubscribed", false);
			}
		} else {
			data.put("isLogined", false);
		}

		return data;
	}

	@RequestMapping("updateSessionUserInfo.do")
	public HashMap<String, Object> updateSessionUserInfo(HttpSession session) {
		// 세션 업데이트
		HashMap<String, Object> data = new HashMap<String, Object>();

		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		int memberNo = memberUser.getMember_no();
		MemberVo newMemberUser = memberService.getMemberVo(memberNo);
		session.setAttribute("memberUser", newMemberUser);
		// 프로필 사진 세션 갱신
		MemberProfileImageVo profileImageVo = mypageService.getMemberProfileImageVo(memberNo);
		session.setAttribute("profileImageVo", profileImageVo);

		// 회원 정보 갱신
		data.put("memberNick", newMemberUser.getMember_nick());
		data.put("memberPoint", newMemberUser.getMember_point());
		data.put("profileImageVo", profileImageVo);

		return data;
	}

	// 회원 포인트 충전
	@RequestMapping("chargeMemberPointProcess.do")
	public void chargeMemberPointProcess(int member_no, int point) {

		MemberPointHistoryVo memberPointHistoryVo = new MemberPointHistoryVo();
		MemberVo memberVo = memberService.getMemberVo(member_no);

		memberService.chargeMemberPoint(member_no, point);

		memberPointHistoryVo.setMember_no(member_no);
		memberPointHistoryVo.setPoint_history_amount(point);
		memberPointHistoryVo.setPoint_history_useway("충전");
		int leftoverMemberPoint = memberVo.getMember_point();
		memberPointHistoryVo.setPoint_history_leftover_point(leftoverMemberPoint);

		memberService.writePlusMemberPointHistory(memberPointHistoryVo);
	}

	// 회원 포인트 차감
	@RequestMapping("deductionMemberPointProcess.do")
	public void deductionMemberPointMemberPointProcess(int member_no, int point) {
		MemberPointHistoryVo memberPointHistoryVo = new MemberPointHistoryVo();
		MemberVo memberVo = memberService.getMemberVo(member_no);

		memberService.deductionMemberPoint(member_no, point);
		memberPointHistoryVo.setMember_no(member_no);
		memberPointHistoryVo.setPoint_history_amount(point);
		int leftoverMemberPoint = memberVo.getMember_point();
		memberPointHistoryVo.setPoint_history_useway("출금");
		memberPointHistoryVo.setPoint_history_leftover_point(leftoverMemberPoint);
		memberService.writeMinusMemberPointHistory(memberPointHistoryVo);
	}

	@RequestMapping("getMemberPointHistory.do")
	public HashMap<String, Object> getMemberPointHistory(int member_no) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> memberPointHistoryList = memberService.getMemberPointHistoryByNo(member_no);

		data.put("memberPointHistoryList", memberPointHistoryList);
		return data;
	}

	// 오늘의 할일 데이터 가져오기
	@RequestMapping("getToDoToday.do")
	public HashMap<String, Object> getToDoToday(HttpSession session) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		// 오늘의 식단, 운동목록 조회하기
		PTProgramVo programVo = (PTProgramVo) session.getAttribute("programVo");

		// PT 프로그램 번호, 구독 시작 날짜, 오늘 날짜로 몇주차인지 계산
		Date startDate = programVo.getStart_date();
		Date today = CalendarUtil.resetTime(new Date());

		long milliSeconds = today.getTime() - startDate.getTime();
		if (milliSeconds < 0)
			milliSeconds = 0; // 오늘이 시작 날짜보다 이전인 경우
		int thisweek = (int) (milliSeconds / (24 * 60 * 60 * 1000)) / 7 + 1;

		// 주간 스케줄 조회
		ScheduleWeekVo scheduleWeekVo = trainerService.getScheduleWeek(programVo.getProgram_no(), thisweek);
		ScheduleDailyVo scheduleDailyVo = new ScheduleDailyVo();
		if (scheduleWeekVo != null) {
			ScheduleDailyVo params = new ScheduleDailyVo();
			params.setSchedule_week_no(scheduleWeekVo.getSchedule_week_no());
			params.setSchedule_date(today);
			scheduleDailyVo = memberService.getToDoToday(params);
		}
		// 일간 식단 운동루틴 조회
		ArrayList<HashMap<String, Object>> dailyFoodList = null;
		ArrayList<HashMap<String, Object>> dailyExerciseList = null;
		if (scheduleDailyVo != null) {
			int scheduleNo = scheduleDailyVo.getSchedule_no();
			dailyFoodList = trainerService.getScheduleDailyFoodList(scheduleNo);
			dailyExerciseList = trainerService.getScheduleDailyExerciseList(scheduleNo);
		}

		// 강사 프로필 이미지 가져오기
		TrainerProfileImageVo trainerProfileImageVo = trainerService
				.getTrainerProfileImageVo(programVo.getTrainer_no());
		data.put("dailyFoodList", dailyFoodList);
		data.put("dailyExerciseList", dailyExerciseList);
		data.put("scheduleWeekVo", scheduleWeekVo);
		data.put("scheduleDailyVo", scheduleDailyVo);
		data.put("trainerProfileImageVo", trainerProfileImageVo);

		return data;
	}

	// 운동 별 일간 기록 조회
	@RequestMapping("getRutineDailyRecordList.do")
	public ArrayList<RutineDailyRecordVo> getRutineDailyRecordList(int rutine_no, HttpSession session) {
		return memberService.getRutineDailyRecordList(rutine_no);
	}

	// 일간 운동 기록 추가
	@RequestMapping("rutineDailyRecordProcess.do")
	public void rutineDailyRecordProcess(RutineDailyRecordVo param) {
		memberService.addRutineDailyRecord(param);
	}

	// 회원 일지 추가
	@RequestMapping("addMemberDailyNoteProcess.do")
	public void addMemberDailyNoteProcess(MemberDailyNoteVo param) {
		memberService.addMemberDailyNote(param);
	}

	// 회원 일지 업데이트
	@RequestMapping("updateMemberDailyNoteProcess.do")
	public void updateMemberDailyNoteProcess(MemberDailyNoteVo param) {
		// 추가해야함
	}

	// 새그룹추가
	@RequestMapping("addNewGroup.do")
	public void addNewGroup(HttpSession session) {
		MemberVo vo = (MemberVo) session.getAttribute("memberUser");
		int member_no = vo.getMember_no();

		memberService.addNewGroupService(member_no);
	}

	// 친구그룹, 리스트 가져오기
	@RequestMapping("getMyGroupAndFollow.do")
	public HashMap<String, Object> getGroupAndFollowList(HttpSession session) {
		HashMap<String, Object> data = new HashMap<String, Object>();

		// 로그인한 나의 member_no를 파라미터값에 set해주기
		MemberVo user = (MemberVo) session.getAttribute("memberUser");
		int member_no = user.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getMyfollowService(member_no);

		data.put("list", list);

		return data;
	}

	// 나를 팔로우한 회원 리스트
	@RequestMapping("getMyFollowerList.do")
	public HashMap<String, Object> getMyFollowerList(HttpSession session) {
		HashMap<String, Object> data = new HashMap<String, Object>();

		MemberVo user = (MemberVo) session.getAttribute("memberUser");
		int member_no = user.getMember_no();

		ArrayList<MemberVo> list = memberService.getMyFollowerList(member_no);

		data.put("list", list);

		// System.out.println(data);
		return data;
	}

	// 스토리작성
	@RequestMapping("writeStoryProcess.do")
	public void writeStoryProcess(StoryVo param, HttpSession session, MultipartFile storyFile) {
		MemberVo vo = (MemberVo) session.getAttribute("memberUser");
		int member_no = vo.getMember_no();
		param.setMember_no(member_no);

		String rootUploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles";

		if (storyFile == null || storyFile.isEmpty()) {
			param.setStory_img_url(null);
		} else {
			String originalFileName = storyFile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));

			UUID uuid = UUID.randomUUID();
			long currentTime = System.currentTimeMillis();

			String randomFileName = uuid.toString() + "_" + currentTime + ext;

			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolderName = sdf.format(today);

			// 예 ) C:/uploadFiles/2021/10/26
			File todayFolder = new File(rootUploadFileFolderName + "/" + todayFolderName);

			if (!todayFolder.exists()) {
				todayFolder.mkdirs();
			}

			String uploadFilePath = rootUploadFileFolderName + "/" + todayFolderName + "/" + randomFileName;

			try {
				storyFile.transferTo(new File(uploadFilePath));
			} catch (Exception e) {
				e.printStackTrace();
			}

			param.setStory_img_url(todayFolderName + "/" + randomFileName);
		}

		memberService.writeStoryService(param);
	}

	// 그룹이름수정
	@RequestMapping("editGroupNameProcess.do")
	public void editGroupNameProcess(FollowGroupVo param) {

		System.out.println(param.getGroup_no());
		memberService.editGroupNameService(param);
	}

	// 내 스토리보드가져오기
	@RequestMapping("getMyStoryBoard.do")
	public HashMap<String, Object> getMyStoryBoard(HttpSession session) {
		MemberVo vo = (MemberVo) session.getAttribute("memberUser");
		int member_no = vo.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getMyStoryBoardService(member_no);

		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("list", list);

		return data;
	}

	// 친구스토리보드
	@RequestMapping("getOthersStoryBoard.do")
	public HashMap<String, Object> getOthersStoryBoard(int member_no, HttpSession session) {

		HashMap<String, Object> data = new HashMap<String, Object>();

		MemberVo vo = (MemberVo) session.getAttribute("memberUser");
		int memberNo = vo.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getOtherMemberBoardService(member_no, memberNo);

		data.put("list", list);

		return data;
	}

	// 스토리좋아요
	@RequestMapping("storyDoLikeProcess.do")
	public void doLike(StoryLikeVo param, HttpSession session) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		memberService.doLikeProcess(param);
	}

	// 댓글쓰기
	@RequestMapping("writeStoryCommentProcess.do")
	public void writeStoryCommentProcess(StoryCommentVo param, HttpSession session) {

		MemberVo sessionUser = (MemberVo) session.getAttribute("memberUser");
		int member_no = sessionUser.getMember_no();

		param.setMember_no(member_no);

		memberService.writeStoryComment(param);
	}

	// 댓글목록가져오기
	@RequestMapping("getStoryComments.do")
	public HashMap<String, Object> getStoryComments(int story_no) {

		ArrayList<HashMap<String, Object>> commentList = memberService.getStoryComments(story_no);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("commentList", commentList);

		return map;
	}

	// 댓글삭제
	@RequestMapping("deleteStoryCommentProcess.do")
	public void deleteStoryCommentProcess(int st_comment_no) {
		memberService.deleteStoryComment(st_comment_no);
	}

	// 그룹삭제
	@RequestMapping("deleteGroupProcess.do")
	public void deleteGroupProcess(HttpSession session, int group_no) {

		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		memberService.deleteFollowGroupService(member_no, group_no);
	}

	// 스토리삭제
	@RequestMapping("deleteStoryProcess.do")
	public void deleteStoryProcess(int story_no) {
		memberService.deleteStory(story_no);
	}

	// 팔로우
	@RequestMapping("checkFollowState.do")
	public HashMap<String, Object> checkFollowState(HttpSession session, String member_nick) {

		HashMap<String, Object> data = new HashMap<String, Object>();

		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		Integer follow_member_no = memberService.getMemberNoFromNickService(member_nick);

		if (follow_member_no != null) {

			FollowVo fVo = memberService.checkFollowStateService(member_no, follow_member_no);
			data.put("fVo", fVo);
			data.put("follow_member_no", follow_member_no);

		} else {
			data.put("error", "없는 회원입니다");
		}

		return data;
	}

	@RequestMapping("addFollowProcess.do")
	public void addFollowProcess(int follow_member_no, int group_no) {

		memberService.addFollowService(follow_member_no, group_no);
	}

	// 팔로우삭제
	@RequestMapping("deleteFollowProcess.do")
	public void deleteFollowProcess(int member_no) {
		memberService.deleteFollowMemberService(member_no);
	}

	// 좋아요 많은글~~!~!~
	@RequestMapping("getMostLikesStories.do")
	public HashMap<String, Object> getMostLikesStoryMaxFive() {

		HashMap<String, Object> data = new HashMap<String, Object>();

		ArrayList<HashMap<String, Object>> list = memberService.getMostLikesStoryMaxFive();

		data.put("list", list);

		return data;
	}

	// 기본그룹에 팔로우 추가하기
	@RequestMapping("addFollowInBasicGroup.do")
	public void addFollowInBasicGroup(HttpSession session, int follow_member_no) {
		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		FollowGroupVo fgVo = memberService.getBasicGroupNoService(member_no);
		int group_no = fgVo.getGroup_no();

		memberService.addFollowService(follow_member_no, group_no);

	}

	// 팔로워삭제
	@RequestMapping("followerDeleteProcess.do")
	public void deleteMyFollower(int follower_member_no, HttpSession session) {
		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		memberService.deleteMyFollower(follower_member_no, member_no);
	}

	// 함께아는친구들
	@RequestMapping("getCommonFollowersProcess.do")
	public HashMap<String, Object> getCommonFollowers(HttpSession session, int follow_member_no) {
		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getCommonFollowers(follow_member_no, member_no);

		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("list", list);

		return data;
	}

	// 활동로그
	@RequestMapping("getMyFollowsLikeLogsProcess.do")
	public HashMap<String, Object> getMyFollowsLikeLogsProcess(HttpSession session) {
		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getMyFollowsLikeLogs(member_no);
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("list", list);
		return data;
	}

	@RequestMapping("getMyFollowsCommentLogsProcess.do")
	public HashMap<String, Object> getMyFollowsCommentLogsProcess(HttpSession session) {
		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getMyFollowsCommentLogs(member_no);
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("list", list);
		return data;
	}

}
