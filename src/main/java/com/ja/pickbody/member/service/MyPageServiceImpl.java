package com.ja.pickbody.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.member.mapper.MyPageSQLMapper;
import com.ja.pickbody.vo.MemberInbodyVo;
import com.ja.pickbody.vo.MemberProfileImageVo;
import com.ja.pickbody.vo.MemberVo;


@Service
public class MyPageServiceImpl {

	@Autowired
	private MyPageSQLMapper myPageSQLMapper;
	
	//회원 정보 수정
	public void updateMemberInfo(MemberVo vo) {
		
		myPageSQLMapper.updateMemberInfo(vo);
	}
	
	/*** 회원 프로필 사진 ***/
	// 회원 프로필 사진 존재 여부 확인 
	public int countMemberProfileImage(int memberNo) {
		return myPageSQLMapper.countMemberProfileImage(memberNo);
	}
	//회원 프로필 사진 등록
	public void registerMemberProfileImage(MemberProfileImageVo vo) {
		myPageSQLMapper.registerMemberProfileImage(vo);
	}
	
	//회원 프로필 사진 출력
	public MemberProfileImageVo getMemberProfileImageVo(int member_no) {
		return myPageSQLMapper.getMemberProfileImageByNo(member_no);
	}
	//회원 프로필 사진 삭제
	public void deleteMemberProfileImage(int member_no) {
		
		myPageSQLMapper.deleteMemberProfileImageByNo(member_no);
	}
	//회원 프로필 사진 수정
	public void updateMemberProfileImage(MemberProfileImageVo vo) {
		
		myPageSQLMapper.updateMemberProfileImage(vo);
	}
	
	//인바디 입력
	public void writeInbody(MemberInbodyVo vo) {
		
		myPageSQLMapper.writeInbody(vo);
		
	}
	
	//회원 인바디 리스트 출력
	public ArrayList<HashMap<String, Object>> getInbodyListByMemberNo(int member_no){
		ArrayList<HashMap<String, Object>> myInbodyList = new ArrayList<HashMap<String,Object>>();
		ArrayList<MemberInbodyVo> inbodyVoList = myPageSQLMapper.getInbodyListByMemberNo(member_no);
		
		for(MemberInbodyVo memberInbodyVo: inbodyVoList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		double stature = memberInbodyVo.getInbody_stature();
		double weight = memberInbodyVo.getInbody_weight();
		double fatmass = memberInbodyVo.getInbody_bodyfatmass();
		double bmi = Math.round(weight/(stature*stature)*100)/100;
		double fatmassPercentage = Math.round((fatmass/weight)*100*100)/100;
		
		map.put("fatmassPercentage", fatmassPercentage);
		map.put("bmi", bmi);
		map.put("memberInbodyVo", memberInbodyVo);
		myInbodyList.add(map);
		}
		return myInbodyList;
	}
	
	public void deleteInbody(int inbody_no) {
		myPageSQLMapper.deleteInbody(inbody_no);
	}
	
	public void updateInbody(MemberInbodyVo vo) {
		myPageSQLMapper.updateInbody(vo);
	}
	
	public void updateMemberNick(MemberVo vo) {
		myPageSQLMapper.updateMemberNick(vo);
	}
	
}
