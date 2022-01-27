package com.ja.pickbody.member.mapper;

import java.util.ArrayList;

import com.ja.pickbody.vo.MemberInbodyVo;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;

public interface MyPageSQLMapper {

	//회원 정보 수정
	public void updateMemberInfo(MemberVo vo);
	//회원 닉네임 수정
	public void updateMemberNick(MemberVo vo);
	
	//회원 프로필 사진
	//회원 프로필 사진 있나 없나
	public int countMemberProfileImage(int member_no);
	//회원 프로필 사진 등록
	public void registerMemberProfileImage(MemberProfileImageVo vo);
	//회원 프로필 사진 출력
	public MemberProfileImageVo getMemberProfileImageByNo(int member_no);
	//회원 프로필 사진 삭제
	public void deleteMemberProfileImageByNo(int member_no);
	//회원 프로필 사진 수정
	public void updateMemberProfileImage(MemberProfileImageVo vo);
	
	
	//인바디 입력
	public void writeInbody(MemberInbodyVo vo);
	
	//인바디 리스트 출력
	public ArrayList<MemberInbodyVo> getInbodyListByMemberNo(int member_no);
	
	//인바디 삭제
	public void deleteInbody(int no);
	
	//인바디 수정
	public void updateInbody(MemberInbodyVo vo);
}
