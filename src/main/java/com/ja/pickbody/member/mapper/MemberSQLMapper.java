package com.ja.pickbody.member.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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
import com.ja.pickbody.vo.TrainerVo;



public interface MemberSQLMapper {

	// 회원가입
	public int createMemberPK();
	public void registerMember(MemberVo vo);
	// 회원 목표 추가 
	public void addGoalCategory(@Param("memberNo") int memberNo, @Param("goalCategoryNo") int goalCategoryNo);
	// 목표 리스트 가져오기
	public ArrayList<GoalCategoryVo> getGoalCategoryList();
	
	// 회원 포인트
	//회원 포인트 충전
	public void chargeMemberPoint(@Param("member_no")int member_no, @Param("point")int point);
	//회원 포인트 차감
	public void deductionMemberPoint(@Param("member_no")int member_no, @Param("point")int point);
	//회원 포인트 사용 내역 입력
	public void writePlusMemberPointHistory(MemberPointHistoryVo vo);
	public void writeMinusMemberPointHistory(MemberPointHistoryVo vo);
	//회원 포인트 사용 내역 출력
	public ArrayList<MemberPointHistoryVo> getMemberPointHistoryByNo(int member_no);
	//회원 정지 확인
	public MemberInhibitionVo getMemberInhibitionByMemberNo(int no);
	
	// 로그인 
	public MemberVo getMemberByIdAndPw(MemberVo vo); 
	public MemberVo getMemberByNo(int no);
	
	// 강사 전체 목록 가져오기
	public ArrayList<TrainerVo> getTrainerList();
	// 회원 프로그램 조회
	public PTProgramVo getPTProgramByMemberNo(int memberNo);
	// 프로그램 등록
	public void addPTProgram(PTProgramVo vo);
	// 오늘의 할일 조회 (schedule_no 찾기)
	public ScheduleDailyVo getScheduleDailyByTodayAndWeekNo(ScheduleDailyVo vo);
	
	// 특정 날짜 회원 일지 가져오기
	public MemberDailyNoteVo getMemberDailyNoteByScheduleNo(int scheduleNo);
	// 회원 일지 등록
	public void addMemberDailyNote(MemberDailyNoteVo vo);
	// 운동 기록 조회
	public ArrayList<RutineDailyRecordVo> getRecordListByRutineNo(int rutineNo);
	// 운동 기록 추가
	public void addRutineDailyRecord(RutineDailyRecordVo vo);
	
	//나의 팔로우목록
	public ArrayList<FollowVo> getMyfollow(int member_no);
	//그룹이름
	public FollowGroupVo getGroupName(int group_no);
	//회원닉네임
	public MemberVo getNickname(int follow_member_no);
	
	//팔로우
	public void addFollow(@Param("follow_member_no") int follow_member_no, @Param("group_no") int group_no);
	//팔로우여부확인
	public FollowVo checkFollowState(@Param("member_no") int member_no, @Param("follow_member_no") int follow_member_no);
	//특정 그룹안에 팔로우 여부 확인
	public FollowVo checkFollowSasteteInGroup(@Param("follow_member_no") int follow_member_no, @Param("group_no") int group_no);
	//언팔로우
	public void deleteFollow(@Param("member_no") int member_no, @Param("follow_member_no") int follow_member_no);
	//내 친구 그룹목록
	public ArrayList<FollowGroupVo> getMyGroup(int member_no);
	//내가가진 특정 그룹 내의 팔로우 목록
	public ArrayList<FollowVo> getFollowInAnyGroup(int group_no);
	//회원닉네임으로 member_no찾기
	public Integer getMemberNoFromNick(String member_nick);
	//회원가입시 기본그룹 생성해주기
	public void createBasicGroupOfFollow(int memberNo);
	//회원이 그룹 만들기
	public void createFollowGroup(FollowGroupVo vo);
	//새그룹추가
	public void addNewGroup(int member_no);
	//그룹안의 팔로우명단가져오기
	public ArrayList<FollowVo> getMemberInGroup(int group_no);
	//그룹삭제전 팔로우멤버 기본그룹으로 옮기기
	public void putIntoBasicGroupBeforeDelete(@Param ("follow_member_no") int follow_member_no, @Param ("basicGroupNo") int basicGroupNo);
	//그룹삭제
	public void deleteFollowGroup(int group_no);
	//회원 기본그룹 번호 따오기
	public FollowGroupVo getBasicGroupNo(int member_no);
	//쪽지쓰기
	public void writeMessage(MessageVo vo);
	//보낸쪽지,받은쪽지
	public ArrayList<MessageVo> sendMessage(int sender_no);
	public ArrayList<MessageVo> receiveMessage(int recieve_no);
	//쪽지상세페이지
	public MessageVo messageDetailPage(int message_no);
	//쪽지 지우기
	public void updateSendMessageIsDeleted(int message_no);
	public void updateRecieveMessageIsDeleted(int message_no);
	//버튼으로 언팔
	public void deleteFollowMember(int follow_member_no);
	
	//스토리쓰기
	public void writeStory(StoryVo vo);
	//그룹명수정
	public void editGroupName(FollowGroupVo vo);
	
	//나를팔로우중인회원 찾기
	public ArrayList<FollowVo> getGroupNoForGetFollwerNo(int member_no);
	public FollowGroupVo getMemberNoForGetFollowerNick(int group_no);
	//내 스토리목록가져오기
	public ArrayList<StoryVo> getMyStoryBoard(int member_no);
	//스토리 좋아요 개수 가져오기
	public int countStoryLike(int story_no);
	//스토리 댓글 개수 가져오기
	public int countStoryComment(int story_no);
	//스토리 좋아요
	public void storyLike(StoryLikeVo vo);
	public int doILikeThisStory(StoryLikeVo vo);
	public void storyUnLike(StoryLikeVo vo);
	//스토리댓글
	public void writeStoryComment(StoryCommentVo vo);
	public ArrayList<StoryCommentVo> getStoryComments(int story_no);
	public void deleteStoryComment(int st_comment_no);
	//스토리삭제
	public void deleteStory(int story_no);
	public void delteLikesWithStory(int story_no);
	
	//최근 좋아요순 5개
	public ArrayList<StoryLikeRownumVo> getMostLikesStoryMaxFive();
	public StoryVo getStoryVo(int story_no);
	
	//내 팔로워 삭제
	public void deleteMyFollower(@Param ("follower_member_no") int follower_member_no, @Param ("member_no") int member_no);
	
	//공통친구
	public ArrayList<MemberVo> getCommonFollowers(@Param ("follow_member_no") int follow_member_no, @Param ("member_no") int member_no);
	
	//활동로그
	public ArrayList<StoryLikeVo> getMyFollowsLikeLogs(int member_no);
	public ArrayList<StoryCommentVo> getMyFollowsCommentLogs(int member_no);
	//스토리번호로 작성자
	public StoryVo getWriterFromStoryNo(int story_no);
}
