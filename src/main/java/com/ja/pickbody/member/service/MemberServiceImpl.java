package com.ja.pickbody.member.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.member.mapper.MyPageSQLMapper;
import com.ja.pickbody.trainer.mapper.TrainerSQLMapper;
import com.ja.pickbody.vo.FollowGroupVo;
import com.ja.pickbody.vo.FollowVo;
import com.ja.pickbody.vo.GoalCategoryVo;
import com.ja.pickbody.vo.MemberDailyNoteVo;
import com.ja.pickbody.vo.MemberInhibitionVo;
import com.ja.pickbody.vo.MemberPointHistoryVo;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.MessageVo;
import com.ja.pickbody.vo.PTProgramVo;
import com.ja.pickbody.vo.RutineDailyRecordVo;
import com.ja.pickbody.vo.ScheduleDailyVo;
import com.ja.pickbody.vo.StoryCommentVo;
import com.ja.pickbody.vo.StoryLikeRownumVo;
import com.ja.pickbody.vo.StoryLikeVo;
import com.ja.pickbody.vo.StoryVo;
import com.ja.pickbody.vo.TrainerGoalVo;
import com.ja.pickbody.vo.TrainerProfileImageVo;
import com.ja.pickbody.vo.TrainerVo;

@Service
public class MemberServiceImpl {
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private MyPageSQLMapper mypageSQLMapper;
	@Autowired
	private TrainerSQLMapper trainerSQLMapper;

	/*** 회원 정보 조회 ***/
	public MemberVo getMemberVo(int memberNo) {
		return memberSQLMapper.getMemberByNo(memberNo);
	}

	/*** 회원 가입 부분 ***/
	public void joinMember(MemberVo vo, int[] goal_category_no, MemberProfileImageVo imageVo) {

		int memberNo = memberSQLMapper.createMemberPK();
		vo.setMember_no(memberNo);
		memberSQLMapper.registerMember(vo);

		// 팔로우 기본그룹 생성
		memberSQLMapper.createBasicGroupOfFollow(memberNo);
		for (int goalCategoryNo : goal_category_no) {
			memberSQLMapper.addGoalCategory(memberNo, goalCategoryNo);
		}

		// 프로필 이미지 추가
		if (imageVo.getImage_link() != null && imageVo.getImage_original_filename() != null) {
			imageVo.setMember_no(memberNo);
			mypageSQLMapper.registerMemberProfileImage(imageVo);
		}

	}

	public ArrayList<GoalCategoryVo> getCategoryList() {
		return memberSQLMapper.getGoalCategoryList();
	}

	/*** 회원 포인트 부분 ***/
	// 회원 포인트 충전
	public void chargeMemberPoint(int member_no, int point) {

		memberSQLMapper.chargeMemberPoint(member_no, point);
	}

	// 회원 포인트 차감
	public void deductionMemberPoint(int member_no, int point) {
		memberSQLMapper.deductionMemberPoint(member_no, point);
	}

	// 회원 포인트 내역 입력
	public void writePlusMemberPointHistory(MemberPointHistoryVo vo) {
		memberSQLMapper.writePlusMemberPointHistory(vo);
	}

	public void writeMinusMemberPointHistory(MemberPointHistoryVo vo) {

		memberSQLMapper.writeMinusMemberPointHistory(vo);
	}

	// 회원 포인트 내역 출력
	public ArrayList<HashMap<String, Object>> getMemberPointHistoryByNo(int member_no) {
		ArrayList<HashMap<String, Object>> memberPointHistoryList = new ArrayList<HashMap<String, Object>>();
		ArrayList<MemberPointHistoryVo> memberPointHistoryVoList = memberSQLMapper.getMemberPointHistoryByNo(member_no);
		for (MemberPointHistoryVo memberPointHistoryVo : memberPointHistoryVoList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberPointHistoryVo", memberPointHistoryVo);
			memberPointHistoryList.add(map);
		}

		return memberPointHistoryList;
	}

	//회원 금지
	public MemberInhibitionVo memberInhibition(int member_no) {
		return memberSQLMapper.getMemberInhibitionByMemberNo(member_no);
	}
	/*** 로그인 부분 ***/
	public MemberVo login(MemberVo vo) {

		MemberVo result = memberSQLMapper.getMemberByIdAndPw(vo);
		return result;
	}

	/*** PT 프로그램 부분 ***/
	// 강사 리스트 조회
	public ArrayList<HashMap<String, Object>> getTrainerList() {
		// 강사 프로필 이미지, 강사 전문분야와 결합
		ArrayList<HashMap<String, Object>> trainerList = new ArrayList<HashMap<String, Object>>();
		ArrayList<TrainerVo> trainerVoList = memberSQLMapper.getTrainerList();
		for (TrainerVo trainerVo : trainerVoList) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int trainerNo = trainerVo.getTrainer_no();
			ArrayList<GoalCategoryVo> goalCategoryList = new ArrayList<GoalCategoryVo>();
			ArrayList<TrainerGoalVo> trainerGoalList = trainerSQLMapper.getTrainerGoalList(trainerNo);

			for (TrainerGoalVo trainerGoalVo : trainerGoalList) {
				int goalCategoryNo = trainerGoalVo.getGoal_category_no();
				GoalCategoryVo goalCategoryVo = trainerSQLMapper.getGoalCategoryVo(goalCategoryNo);
				goalCategoryList.add(goalCategoryVo);
			}
			TrainerProfileImageVo profileImageVo = trainerSQLMapper.getTrainerProfileImageByNo(trainerNo);
			map.put("trainerVo", trainerVo);
			map.put("goalCategoryList", goalCategoryList);
			map.put("profileImageVo", profileImageVo);
			trainerList.add(map);
		}

		return trainerList;
	}

	// 회원 신청 프로그램 목록 조회
	public PTProgramVo getMemberPTProgram(int memberNo) {
		return memberSQLMapper.getPTProgramByMemberNo(memberNo);
	}

	// PT 프로그램 등록
	public void addPTProgram(PTProgramVo vo) {
		memberSQLMapper.addPTProgram(vo);
	}

	// 오늘의 할일 조회
	public ScheduleDailyVo getToDoToday(ScheduleDailyVo vo) {
		return memberSQLMapper.getScheduleDailyByTodayAndWeekNo(vo);
	}

	/*** 회원 일지 부분 ***/
	public MemberDailyNoteVo getMemberDailyNoteVo(int scheduleNo) {
		return memberSQLMapper.getMemberDailyNoteByScheduleNo(scheduleNo);
	}

	public void addMemberDailyNote(MemberDailyNoteVo vo) {
		memberSQLMapper.addMemberDailyNote(vo);
	}

	public ArrayList<RutineDailyRecordVo> getRutineDailyRecordList(int rutineNo) {
		return memberSQLMapper.getRecordListByRutineNo(rutineNo);
	}

	public void addRutineDailyRecord(RutineDailyRecordVo vo) {
		memberSQLMapper.addRutineDailyRecord(vo);
	}

	/*** 팔로우 부분 ***/
	// 친구목록
	public ArrayList<HashMap<String, Object>> getMyfollowService(int member_no) {

		// 리턴할 최종 List
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		// 내가가진 그룹들이 담긴 리스트
		ArrayList<FollowGroupVo> groupList = memberSQLMapper.getMyGroup(member_no);
		for (FollowGroupVo fgVo : groupList) {
			// 그룹Vo와 멤버리스트를 담을 HashMap = 내가 가진 그룹의 개수만큼 for문이 돌고 그 횟수만큼 HashMap생성
			HashMap<String, Object> groupMap = new HashMap<String, Object>();

			// 그룹리스트 for문 돌려서 나오는 한 행==GroupVo 의 group_no와 followVo의 grouop_no엮기(HashMap)
			int group_no = fgVo.getGroup_no();
			// fgVo에서 뽑은 group_no로 그 안의 멤버 리스트 뽑기
			ArrayList<FollowVo> memberList = memberSQLMapper.getFollowInAnyGroup(group_no);

			// followVo와 memberVo담은 Map을 담아줄 List생성 == 그룹개수만큼 생성되어야 함 (위치조심)
			ArrayList<HashMap<String, Object>> voList = new ArrayList<HashMap<String, Object>>();

			for (FollowVo fVo : memberList) {
				// for문돌려 나온 한행==followVo 에서 member_no(팔로우대상) 뽑아서 memberVo와엮어 닉네임뽑기
				int follow_member_no = fVo.getMember_no();
				MemberVo mVo = memberSQLMapper.getNickname(follow_member_no);
				// fVo와 mVo를 담아줄 맵 == memberList의 개수만큼 hashMap생성되어야 함.
				HashMap<String, Object> memberMap = new HashMap<String, Object>();

				// memberList개수만큼 생성된 map에 fVo와 mVo넣어 엮어주기
				memberMap.put("fVo", fVo);
				memberMap.put("mVo", mVo);

				// Arraylist로 받아주기
				voList.add(memberMap);
			}
			// groupList길이만큼 생ㅇ성된 groupMap에 각각 fgVo와 voList넣어주기
			groupMap.put("voList", voList);
			groupMap.put("fgVo", fgVo);

			// 최종 리턴할 list에 groupMap넣기
			list.add(groupMap);
		}
		return list;
	}

	// 팔로우
	public void addFollowService(int follow_member_no, int group_no) {

		memberSQLMapper.addFollow(follow_member_no, group_no);
	}

	// 팔로우여부확인
	public FollowVo checkFollowStateService(int member_no, int follow_member_no) {

		return memberSQLMapper.checkFollowState(member_no, follow_member_no);
	}

	// 특정 그룹 내 팔로우 여부 확인
	public FollowVo checkFollowSasteteInGroupService(int follow_member_no, int group_no) {
		return memberSQLMapper.checkFollowSasteteInGroup(follow_member_no, group_no);
	}

	// 언팔
	public void deleteFollowService(int member_no, int follow_member_no) {

		memberSQLMapper.deleteFollow(member_no, follow_member_no);
	}

	// 내 팔로우 그룹 목록
	public ArrayList<HashMap<String, Object>> getMyGroupService(int member_no) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<FollowGroupVo> groupList = memberSQLMapper.getMyGroup(member_no);

		for (FollowGroupVo fgVo : groupList) {
			String group_name = fgVo.getGroup_name();
			int group_no = fgVo.getGroup_no();
			int memberNo = fgVo.getMember_no();

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("group_name", group_name);
			map.put("group_no", group_no);
			map.put("memberNo", memberNo);

			list.add(map);
		}
		// System.out.println(list.get(0));

		return list;
	}

	// 회원닉으로 번호 가져오기
	public Integer getMemberNoFromNickService(String member_nick) {
		return memberSQLMapper.getMemberNoFromNick(member_nick);
	}

	// 회원이 그룹 생성하기
	public void createFollowGroupService(FollowGroupVo vo) {
		memberSQLMapper.createFollowGroup(vo);
	}

	// 새그룹추가
	public void addNewGroupService(int member_no) {
		memberSQLMapper.addNewGroup(member_no);
	}

	// 그룹삭제하기
	public void deleteFollowGroupService(int member_no, int group_no) {

		ArrayList<FollowVo> memberList = memberSQLMapper.getMemberInGroup(group_no);

		FollowGroupVo fgVo = memberSQLMapper.getBasicGroupNo(member_no);
		int basicGroupNo = fgVo.getGroup_no();

		System.out.println("삭제할 그룹 안 회원 확인됨");

		if (memberList != null) {
			for (FollowVo vo : memberList) {
				int follow_member_no = vo.getMember_no();

				memberSQLMapper.putIntoBasicGroupBeforeDelete(follow_member_no, basicGroupNo);
				System.out.println("멤버 기본그룹으로 이동됨");
			}
			memberSQLMapper.deleteFollowGroup(group_no);
			System.out.println("기본그룹 이동 후 삭제됨");

		} else {
			memberSQLMapper.deleteFollowGroup(group_no);
			System.out.println("바로 삭제됨");
		}
	}

	// 회원의 기본그룹 번호따오기
	public FollowGroupVo getBasicGroupNoService(int member_no) {
		return memberSQLMapper.getBasicGroupNo(member_no);
	}

	// 메세지쓰기
	public void writeMessageService(MessageVo vo) {
		memberSQLMapper.writeMessage(vo);
	}

	// 보낸쪽지함
	public ArrayList<HashMap<String, Object>> sendMessageService(int sender_no) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<MessageVo> mList = memberSQLMapper.sendMessage(sender_no);
		for (MessageVo vo : mList) {
			int follow_member_no = vo.getRecieve_no();

			MemberVo mVo = memberSQLMapper.getNickname(follow_member_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("vo", vo);
			map.put("mVo", mVo);

			list.add(map);
		}
		return list;
	}

	// 받은쪽지함
	public ArrayList<HashMap<String, Object>> receiveMessageService(int receive_no) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<MessageVo> mList = memberSQLMapper.receiveMessage(receive_no);
		for (MessageVo vo : mList) {
			int follow_member_no = vo.getSender_no();

			MemberVo mVo = memberSQLMapper.getNickname(follow_member_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("vo", vo);
			map.put("mVo", mVo);

			list.add(map);
		}
		return list;
	}

	// 받은쪽지 상세페이지
	public HashMap<String, Object> recieveMessageDetailPageServcie(int message_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		MessageVo mVo = memberSQLMapper.messageDetailPage(message_no);
		int follow_member_no = mVo.getSender_no();

		MemberVo vo = memberSQLMapper.getNickname(follow_member_no);

		map.put("mVo", mVo);
		map.put("vo", vo);

		return map;
	}

	// 보낸쪽지 상세페이지
	public HashMap<String, Object> sendMessageDetailPageService(int message_no) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		MessageVo mVo = memberSQLMapper.messageDetailPage(message_no);
		int follow_member_no = mVo.getRecieve_no();

		MemberVo vo = memberSQLMapper.getNickname(follow_member_no);

		map.put("mVo", mVo);
		map.put("vo", vo);

		return map;
	}

	// 닉네임따오기
	public MemberVo getNickname(int follow_member_no) {
		return memberSQLMapper.getNickname(follow_member_no);
	}

	// 보낸쪽지지우기
	public void updateSendMessageIsDeletedService(int message_no) {
		memberSQLMapper.updateSendMessageIsDeleted(message_no);
	}

	// 받은쪽지지우기
	public void updateRecieveMessageIsDeletedService(int message_no) {
		memberSQLMapper.updateRecieveMessageIsDeleted(message_no);
	}

	// 목록에서 직접 언팔
	public void deleteFollowMemberService(int follow_member_no) {
		memberSQLMapper.deleteFollowMember(follow_member_no);
	}

	// 스토리작성
	public void writeStoryService(StoryVo vo) {
		memberSQLMapper.writeStory(vo);
	}

	// 그룹이름 수정
	public void editGroupNameService(FollowGroupVo vo) {
		memberSQLMapper.editGroupName(vo);
	}

	// 나를 팔로우중인 회원 찾기
	public ArrayList<MemberVo> getMyFollowerList(int member_no) {

		ArrayList<MemberVo> list = new ArrayList<MemberVo>();

		ArrayList<FollowVo> groupNoList = memberSQLMapper.getGroupNoForGetFollwerNo(member_no);

		for (FollowVo fVo : groupNoList) {
			int group_no = fVo.getGroup_no();

			FollowGroupVo fgVo = memberSQLMapper.getMemberNoForGetFollowerNick(group_no);

			if (fgVo != null) {
				int no = fgVo.getMember_no();

				MemberVo mVo = memberSQLMapper.getNickname(no);

				list.add(mVo);
			}
		}

		return list;
	}

	// 내 스토리보드 가져오기
	public ArrayList<HashMap<String, Object>> getMyStoryBoardService(int member_no) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<StoryVo> storyList = memberSQLMapper.getMyStoryBoard(member_no);
		for (StoryVo sVo : storyList) {
			int follower_no = sVo.getMember_no();

			MemberVo mVo = memberSQLMapper.getNickname(follower_no);

			int story_no = sVo.getStory_no();
			int countLike = memberSQLMapper.countStoryLike(story_no);
			int countComment = memberSQLMapper.countStoryComment(story_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sVo", sVo);
			map.put("mVo", mVo);
			map.put("countLike", countLike);
			map.put("countComment", countComment);

			StoryLikeVo storyLikeVo = new StoryLikeVo();
			storyLikeVo.setMember_no(member_no);
			storyLikeVo.setStory_no(story_no);

			map.put("myLikeCount", memberSQLMapper.doILikeThisStory(storyLikeVo));

			list.add(map);
		}
		return list;
	}

	// 친구 스토리보드 가져오기
	public ArrayList<HashMap<String, Object>> getOtherMemberBoardService(int member_no, int memberNo) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<StoryVo> storyList = memberSQLMapper.getMyStoryBoard(member_no);
		for (StoryVo sVo : storyList) {
			int follower_no = sVo.getMember_no();

			MemberVo mVo = memberSQLMapper.getNickname(follower_no);

			int story_no = sVo.getStory_no();
			int countLike = memberSQLMapper.countStoryLike(story_no);
			int countComment = memberSQLMapper.countStoryComment(story_no);

			HashMap<String, Object> map = new HashMap<String, Object>();

			FollowVo fVo = memberSQLMapper.checkFollowState(memberNo, follower_no);
			if (fVo == null) {
				map.put("followState", false);
			}

			map.put("sVo", sVo);
			map.put("mVo", mVo);
			map.put("countLike", countLike);
			map.put("countComment", countComment);

			StoryLikeVo storyLikeVo = new StoryLikeVo();
			storyLikeVo.setMember_no(memberNo);
			storyLikeVo.setStory_no(story_no);

			map.put("myLikeCount", memberSQLMapper.doILikeThisStory(storyLikeVo));

			list.add(map);
		}
		return list;
	}

	// 스토리 좋아요
	public void doLikeProcess(StoryLikeVo vo) {

		int myCount = memberSQLMapper.doILikeThisStory(vo);

		if (myCount > 0) {
			memberSQLMapper.storyUnLike(vo);
		} else {
			memberSQLMapper.storyLike(vo);
		}
	}

	// 좋아요 여부
	public int doILikeThisStory(StoryLikeVo vo) {
		return memberSQLMapper.doILikeThisStory(vo);
	}

	// 스토리댓글
	public void writeStoryComment(StoryCommentVo vo) {
		memberSQLMapper.writeStoryComment(vo);
	}

	public ArrayList<HashMap<String, Object>> getStoryComments(int story_no) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<StoryCommentVo> commentList = memberSQLMapper.getStoryComments(story_no);
		for (StoryCommentVo commentVo : commentList) {

			int member_no = commentVo.getMember_no();
			MemberVo memberVo = memberSQLMapper.getNickname(member_no);

			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("commentVo", commentVo);
			map.put("memberVo", memberVo);

			list.add(map);
		}
		return list;
	}

	public void deleteStoryComment(int st_comment_no) {
		memberSQLMapper.deleteStoryComment(st_comment_no);
	}

	// 스토리삭제
	public void deleteStory(int story_no) {
		memberSQLMapper.deleteStory(story_no);
		memberSQLMapper.delteLikesWithStory(story_no);
	}

	// 다른회원페이지갈때 no로 그회원정보 넘겨주기
	public MemberVo getMemberByNo(int no) {
		return memberSQLMapper.getMemberByNo(no);
	}

	// 좋아요많은순
	public ArrayList<HashMap<String, Object>> getMostLikesStoryMaxFive() {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<StoryLikeRownumVo> mostLikesList = memberSQLMapper.getMostLikesStoryMaxFive();

		for (StoryLikeRownumVo rowVo : mostLikesList) {
			int story_no = rowVo.getStory_no();

			StoryVo sVo = memberSQLMapper.getStoryVo(story_no);
			int member_no = sVo.getMember_no();
			MemberVo mVo = memberSQLMapper.getNickname(member_no);

			Date writeDate = sVo.getStory_date();
			long writeTime = writeDate.getTime();
			long currentTime = System.currentTimeMillis();

			HashMap<String, Object> map = new HashMap<String, Object>();

			if (currentTime - 1000 * 60 * 60 * 168 <= writeTime) {
				map.put("recentStory", true);
			}

			map.put("rowVo", rowVo);
			map.put("sVo", sVo);
			map.put("mVo", mVo);

			list.add(map);
		}
		return list;
	}

	// 팔로워 삭제
	public void deleteMyFollower(int follower_member_no, int member_no) {
		memberSQLMapper.deleteMyFollower(follower_member_no, member_no);
	}

	// 함께아는친구
	public ArrayList<HashMap<String, Object>> getCommonFollowers(int follow_member_no, int member_no) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<MemberVo> memberList = memberSQLMapper.getCommonFollowers(follow_member_no, member_no);

		for (MemberVo mVo : memberList) {
			HashMap<String, Object> map = new HashMap<String, Object>();

			map.put("mVo", mVo);
			list.add(map);
		}
		return list;
	}

	// 활동로그
	public ArrayList<HashMap<String, Object>> getMyFollowsLikeLogs(int member_no) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		ArrayList<StoryLikeVo> likeList = memberSQLMapper.getMyFollowsLikeLogs(member_no);

		for (StoryLikeVo slVo : likeList) {
			int no = slVo.getMember_no();
			int story_no = slVo.getStory_no();

			MemberVo mVo = memberSQLMapper.getNickname(no);
			StoryVo sVo = memberSQLMapper.getWriterFromStoryNo(story_no);
			int writer_no = sVo.getMember_no();
			MemberVo writerMemberVo = memberSQLMapper.getNickname(writer_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("slVo", slVo);
			map.put("mVo", mVo);
			map.put("sVo", sVo);
			map.put("writerMemberVo", writerMemberVo);

			list.add(map);
		}
		return list;
	}

	public ArrayList<HashMap<String, Object>> getMyFollowsCommentLogs(int member_no) {

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		ArrayList<StoryCommentVo> commentList = memberSQLMapper.getMyFollowsCommentLogs(member_no);

		for (StoryCommentVo cmVo : commentList) {
			int no = cmVo.getMember_no();
			int story_no = cmVo.getStory_no();

			MemberVo mVo = memberSQLMapper.getNickname(no);
			StoryVo sVo = memberSQLMapper.getWriterFromStoryNo(story_no);
			int writer_no = sVo.getMember_no();
			MemberVo writerMemberVo = memberSQLMapper.getNickname(writer_no);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("cmVo", cmVo);
			map.put("mVo", mVo);
			map.put("sVo", sVo);
			map.put("writerMemberVo", writerMemberVo);

			list.add(map);
		}
		return list;
	}

}
