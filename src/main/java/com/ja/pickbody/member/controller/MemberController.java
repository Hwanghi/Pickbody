package com.ja.pickbody.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ja.pickbody.commons.CalendarUtil;
import com.ja.pickbody.member.service.MemberServiceImpl;
import com.ja.pickbody.member.service.MyPageServiceImpl;
import com.ja.pickbody.trainer.service.TrainerServiceImpl;
import com.ja.pickbody.vo.FollowGroupVo;
import com.ja.pickbody.vo.FollowVo;
import com.ja.pickbody.vo.GoalCategoryVo;
import com.ja.pickbody.vo.MemberDailyNoteVo;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.MessageVo;
import com.ja.pickbody.vo.PTProgramVo;
import com.ja.pickbody.vo.RutineDailyRecordVo;
import com.ja.pickbody.vo.RutineDailyVo;
import com.ja.pickbody.vo.ScheduleDailyVo;
import com.ja.pickbody.vo.ScheduleWeekVo;
import com.ja.pickbody.vo.TrainerProfileImageVo;
import com.ja.pickbody.vo.TrainerVo;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private TrainerServiceImpl trainerService;
	@Autowired
	private MyPageServiceImpl myPageService;

	@RequestMapping("loginPage.do")
	public String loginPage() {

		return "member/loginPage";
	}

	@RequestMapping("joinMemberPage.do")
	public String joinMemberPage(Model model) {
		ArrayList<GoalCategoryVo> goalCategoryList = memberService.getCategoryList();
		model.addAttribute("goalCategoryList", goalCategoryList);

		return "member/joinMemberPage";
	}

	@RequestMapping("joinMemberProcess.do")
	public String joinMemberProcess(MemberVo param, MultipartFile file, int[] goal_category_no) {

		String rootUploadFileFolderName = "/Users/hwanghi/Documents/uploadFiles/member/profile"; // 업로드 폴더 경로
		MemberProfileImageVo imageVo = new MemberProfileImageVo();

		if (file != null && !file.isEmpty()) {
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

			if (!todayFolder.exists()) {
				todayFolder.mkdirs();
			}

			String uploadFilePath = rootUploadFileFolderName + "/" + todayFolderName + "/" + randomFileName;

			try {
				file.transferTo(new File(uploadFilePath));
			} catch (Exception e) {
				// 실무에서 여기가 제일 어렵고 중요함
				e.printStackTrace();
			}

			imageVo.setImage_link(todayFolderName + "/" + randomFileName);
			imageVo.setImage_original_filename(originalFileName);
		} else {
			System.out.println("프로필 사진 업로드에 실패했습니다.");
		}

		param.setMember_point(0);
		memberService.joinMember(param, goal_category_no, imageVo);

		return "member/joinMemberComplete";
	}

	// 회원포인트 페이지
	@RequestMapping("memberPointPage.do")
	public String memberPointPage(Model model, HttpSession session) {

		MemberVo memberVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = memberVo.getMember_no();

		MemberProfileImageVo memberProfileImageVo = myPageService.getMemberProfileImageVo(member_no);

		model.addAttribute("memberProfileImageVo", memberProfileImageVo);

		return "member/memberPointPage";
	}

	@RequestMapping("logoutProcess.do")
	public String logoutProcess(HttpSession session) {

		session.invalidate(); // 세션 재구성...

		return "redirect:../board/mainPage.do";
	}

	@RequestMapping("applyProgramPage.do")
	public String applyProgramPage(Model model, HttpSession session) {

		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");
		// 프로그램 신청 내역이 있으면 주간 페이지로 리다이렉트
		PTProgramVo programVo = memberService.getMemberPTProgram(memberUser.getMember_no());
		if (programVo != null)
			return "redirect:../member/toDoWeekPage.do";
		// 모든 강사 정보를 불러온다
		ArrayList<HashMap<String, Object>> trainerList = memberService.getTrainerList();
		Collections.shuffle(trainerList);
		model.addAttribute("trainerList", trainerList);
		return "member/applyProgramPage";
	}

	@RequestMapping("toDoWeekPage.do")
	public String toDoWeekPage(Model model, HttpSession session) {
		MemberVo memberUser = (MemberVo) session.getAttribute("memberUser");

		// 회원 번호로 PT 프로그램 및 강사 찾기
		PTProgramVo programVo = memberService.getMemberPTProgram(memberUser.getMember_no());
		TrainerVo trainerVo = trainerService.getTrainerVo(programVo.getTrainer_no());
		TrainerProfileImageVo trainerProfileImageVo = trainerService.getTrainerProfileImageVo(trainerVo.getTrainer_no());
		// PT 프로그램 번호, 구독 시작 날짜, 오늘 날짜로 몇주차인지 계산
		Date startDate = programVo.getStart_date();
		Date today = CalendarUtil.resetTime(new Date());

		long milliSeconds = today.getTime() - startDate.getTime();
		if (milliSeconds < 0)
			milliSeconds = 0; // 오늘이 시작 날짜보다 이전인 경우
		int thisweek = (int) (milliSeconds / (24 * 60 * 60 * 1000)) / 7 + 1;

		// 주간 스케줄 조회
		ScheduleWeekVo scheduleWeek = trainerService.getScheduleWeek(programVo.getProgram_no(), thisweek);
		// 일간 스케줄 리스트
		ArrayList<ScheduleDailyVo> scheduleDailyList = null;
		if (scheduleWeek != null)
			scheduleDailyList = trainerService.getScheduleDailyList(scheduleWeek.getSchedule_week_no());

		model.addAttribute("trainerVo", trainerVo);
		model.addAttribute("trainerProfileImageVo", trainerProfileImageVo);
		model.addAttribute("scheduleWeek", scheduleWeek);
		model.addAttribute("scheduleDailyList", scheduleDailyList);
		model.addAttribute("thisweek", thisweek);
		model.addAttribute("today", today);
		return "member/toDoWeekPage";
	}

	@RequestMapping("toDoTodayPage.do")
	public String toDoTodayPage(int schedule_no, Model model) {
		// 오늘의 식단, 운동목록 조회하기
		ArrayList<HashMap<String, Object>> dailyFoodList = trainerService.getScheduleDailyFoodList(schedule_no);
		ArrayList<HashMap<String, Object>> dailyExerciseList = trainerService.getScheduleDailyExerciseList(schedule_no);
		MemberDailyNoteVo memberDailyNoteVo = memberService.getMemberDailyNoteVo(schedule_no);

		ArrayList<HashMap<String, Object>> rutineDailyExerciseList = new ArrayList<HashMap<String, Object>>();
		for (HashMap<String, Object> dailyExercise : dailyExerciseList) {
			RutineDailyVo rutineDailyVo = (RutineDailyVo) dailyExercise.get("rutineDailyVo");
			int rutineNo = rutineDailyVo.getRutine_no();
			ArrayList<RutineDailyRecordVo> rutineDailyRecordList = memberService.getRutineDailyRecordList(rutineNo);
			dailyExercise.put("rutineDailyRecordList", rutineDailyRecordList);
			rutineDailyExerciseList.add(dailyExercise);
		}

		// 회원 일지, 운동 기록 데이터 가져오기
		model.addAttribute("dailyFoodList", dailyFoodList);
		model.addAttribute("rutineDailyExerciseList", dailyExerciseList);
		model.addAttribute("memberDailyNoteVo", memberDailyNoteVo);
		model.addAttribute("scheduleNo", schedule_no);

		return "member/toDoTodayPage";
	}

	// 내 팔로우(친구)페이지
	@RequestMapping("myFollowPage.do")
	public String myFollowPage(int member_no, HttpSession session, Model model) {

		// 로그인한 나의 member_no를 파라미터값에 set해주기
		MemberVo user = (MemberVo) session.getAttribute("memberUser");
		member_no = user.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getMyfollowService(member_no);

		model.addAttribute("list", list);

		return "member/myFollowPage";
	}

	// 팔로우등록페이지
	@RequestMapping("followPage.do")
	public String followPage(HttpSession session, Model model) {
		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getMyGroupService(member_no);

		model.addAttribute("groupList", list);

		return "member/followPage";
	}

	// 팔로우process
	@RequestMapping("followProcess.do")
	public String followProcess(int group_no, String member_nick, HttpSession session) {

		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		// nick 받아서 팔로우/언팔할 회원 번호 뽑기
		Integer follow_member_no = memberService.getMemberNoFromNickService(member_nick);
		// ********follow_member_no == null일때 -> 존재하지 않는 회원 닉네임.. 오류발생 / 어떻게 해결할 것인가
		// ?*****//

		// 팔로우상태 확인
		FollowVo fVo = memberService.checkFollowStateService(member_no, follow_member_no);

		if (fVo == null) { // 팔로우안한상태
			memberService.addFollowService(follow_member_no, group_no);

			return "redirect:../member/myFollowPage.do?member_no=" + member_no;
		} else { // 팔로우 상태 -> 팔로우 취소

			FollowVo stateIsFollow = memberService.checkFollowSasteteInGroupService(follow_member_no, group_no);

			if (stateIsFollow != null) {

				return "member/followDuplicated";

			} else {

				memberService.addFollowService(follow_member_no, group_no);

				return "redirect:../member/myFollowPage.do?member_no=" + member_no;
			}
		}
	}

	// 회원이 팔로우 그룹 생성하기
	@RequestMapping("creatFollowGroup.do")
	public String creatFollowGroup() {

		return "member/creatFollowGroupPage";
	}

	@RequestMapping("createFollowGroupProcess.do")
	public String createFollowGroupProcess(HttpSession session, FollowGroupVo param) {

		int member_no = param.getMember_no();

		memberService.createFollowGroupService(param);

		return "redirect:../member/myFollowPage.do?member_no=" + member_no;
	}

	// 그룹삭제 process
	@RequestMapping("deleteFollowGroupProcess.do")
	public String deleteFollowGroupProcess(int group_no, HttpSession session) {

		MemberVo mVo = (MemberVo) session.getAttribute("memberUser");
		int member_no = mVo.getMember_no();

		memberService.deleteFollowGroupService(member_no, group_no);

		return "redirect:../member/myFollowPage.do?member_no=" + member_no;
	}

	// 쪽지쓰기
	@RequestMapping("writeMessagePage.do")
	public String writeMessagePage(HttpSession session, Model model) {
		MemberVo vo = (MemberVo) session.getAttribute("memberUser");
		int member_no = vo.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.getMyfollowService(member_no);

		model.addAttribute("list", list);

		return "member/writeMessagePage";
	}

	// 쪽지쓰기
	@RequestMapping("writeMessageProcess.do")
	public String writeMessageProcess(MessageVo param, HttpSession session) {
		MemberVo vo = (MemberVo) session.getAttribute("memberUser");
		int member_no = vo.getMember_no();

		memberService.writeMessageService(param);

		return "redirect:../member/receiveMessagePage.do?member_no=" + member_no;
	}

	// 보낸쪽지함
	@RequestMapping("sendMessagePage.do")
	public String sendMessagePage(HttpSession session, Model model) {

		MemberVo user = (MemberVo) session.getAttribute("memberUser");
		int sender_no = user.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.sendMessageService(sender_no);
		model.addAttribute("list", list);

		return "member/sendMessagePage";
	}

	// 받은쪽지함
	@RequestMapping("receiveMessagePage.do")
	public String receiveMessagePage(HttpSession session, Model model) {

		MemberVo user = (MemberVo) session.getAttribute("memberUser");
		int recieve_no = user.getMember_no();

		ArrayList<HashMap<String, Object>> list = memberService.receiveMessageService(recieve_no);
		model.addAttribute("list", list);

		return "member/receiveMessagePage";
	}

	// 받은쪽지 상세페이지
	@RequestMapping("recieveMessageDetailPage.do")
	public String recieveMessageDetailPage(int message_no, Model model) {

		HashMap<String, Object> map = memberService.recieveMessageDetailPageServcie(message_no);
		model.addAttribute("map", map);

		return "member/recieveMessageDetailPage";
	}

	// 답장
	@RequestMapping("answerMessagePage.do")
	public String answerMessagePage(int receive_no, Model model) {

		int follow_member_no = receive_no;

		MemberVo vo = memberService.getNickname(follow_member_no);
		model.addAttribute("vo", vo);

		return "member/writeAnswerMessagePage";
	}

	// 받은메세지삭제
	@RequestMapping("updateReceiveMessageIsDeleted.do")
	public String updateReceiveMessageIsDeleted(int message_no) {

		memberService.updateRecieveMessageIsDeletedService(message_no);

		return "redirect:../member/receiveMessagePage.do";
	}

	// 보낸메세지삭제
	@RequestMapping("updateSendMessageIsDeleted.do")
	public String updateSendMessageIsDeleted(int message_no) {

		memberService.updateSendMessageIsDeletedService(message_no);

		return "redirect:../member/sendMessagePage.do";
	}

	// 보낸메세지상세페이지
	@RequestMapping("sendMessageDetailPage.do")
	public String sendMessageDetailPage(int message_no, Model model) {

		HashMap<String, Object> map = memberService.sendMessageDetailPageService(message_no);
		model.addAttribute("map", map);

		return "member/sendMessageDetailPage";
	}

	// 목록에서 언팔
	// @RequestMapping("deleteFollowProcess.do")
	public String deleteFollowProcess(HttpSession session, int follow_member_no) {
		MemberVo vo = (MemberVo) session.getAttribute("memberUser");
		int member_no = vo.getMember_no();

		memberService.deleteFollowMemberService(follow_member_no);

		return "redirect:../member/myFollowPage.do?member_no=" + member_no;
	}

	@RequestMapping("myStoryPage.do")
	public String myStoryPage() {

		return "member/myStoryHome";
	}

	@RequestMapping("othersStoryPage.do")
	public String othersStoryPage(int member_no, Model model) {

		MemberVo mVo = memberService.getMemberByNo(member_no);

		// 친구목록
		ArrayList<HashMap<String, Object>> list = memberService.getMyfollowService(member_no);
		model.addAttribute("list", list);
		model.addAttribute("mVo", mVo);
		model.addAttribute("member_no", member_no);

		return "member/othersStoryHome";
	}
}
