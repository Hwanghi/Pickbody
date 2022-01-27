package com.ja.pickbody.board.service;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.ja.pickbody.board.mapper.BodygoodBoardSQLMapper;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.vo.BodygoodCommentVo;
import com.ja.pickbody.vo.BodygoodImageVo;
import com.ja.pickbody.vo.BodygoodLikeVo;
import com.ja.pickbody.vo.BodygoodVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.SellImageVo;
import com.ja.pickbody.vo.BodygoodLikeVo;

@Service
public class BoardBodygoodServiceImpl {
	@Autowired
	private BodygoodBoardSQLMapper bodygoodSQLMapper;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	
	//몸자랑게시판 글작성
	public void BodygoodWriteContent(BodygoodVo vo , ArrayList<BodygoodImageVo> imagesVoList) {
	
	int bodygood_no = bodygoodSQLMapper.createBodygoodPK();	
	vo.setBodygood_no(bodygood_no);	
	bodygoodSQLMapper.BodygoodWriteContent(vo);
	
	//이미지 정보 insert
	for(BodygoodImageVo imageVo : imagesVoList) {
		imageVo.setBodygood_no(bodygood_no);
		bodygoodSQLMapper.registerImage(imageVo);
		
	}
	
	}

	
	//몸자랑게시판 게시글목록
	public ArrayList<HashMap<String, Object>> getBodygoodList() {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		
		ArrayList<BodygoodVo> bodygoodList = bodygoodSQLMapper.getList(); //몸자랑게시판 글목록쿼리
		
		for(BodygoodVo bodygoodVo : bodygoodList) {
			int member_no = bodygoodVo.getMember_no();
			int bodygood_no = bodygoodVo.getBodygood_no();
			//댓글 갯수
			int getbodygoodtotalComment = bodygoodSQLMapper.bodygoodtotalComment(bodygood_no);
			ArrayList<BodygoodImageVo> getImageList = bodygoodSQLMapper.getBodygoodImagesByBodygoodNo(bodygood_no);  
			int getbodygoodtotalLikeCount = bodygoodSQLMapper.totalLikecount(bodygood_no);
			BodygoodImageVo bodygoodImageVo = bodygoodSQLMapper.getBodygoodImageByRownum(bodygood_no);
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no); //몸자랑게시판 글목록 맴버번호쿼리 출력
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("bodygoodVo", bodygoodVo);
			map.put("getbodygoodtotalComment", getbodygoodtotalComment);
			map.put("getImageList", getImageList);
			map.put("getbodygoodtotalLikeCount", getbodygoodtotalLikeCount);
			map.put("bodygoodImageVo", bodygoodImageVo);
			
			Date writedate = bodygoodVo.getBodygood_date();
			long writetime = writedate.getTime();
			long cur = System.currentTimeMillis();
			
			if(cur - 1000*60*60*3 <= writetime) { 
			map.put("writedate", writedate);	
			}
			
			list.add(map);
		}
		return list;
	}
	//조회수 높은순 인기글 목록
	public ArrayList<HashMap<String, Object>> bestviewList(){
		
		ArrayList<HashMap<String, Object>> bestviewList = new ArrayList<HashMap<String,Object>>();
		
		ArrayList<BodygoodVo> bestgoodList = bodygoodSQLMapper.bestview();
		
		for(BodygoodVo bodygoodVo : bestgoodList) {
		int member_no= bodygoodVo.getMember_no();
		int bodygood_no = bodygoodVo.getBodygood_no();
		int getbodygoodtotalComment = bodygoodSQLMapper.bodygoodtotalComment(bodygood_no);
		ArrayList<BodygoodImageVo> getImageList = bodygoodSQLMapper.getBodygoodImagesByBodygoodNo(bodygood_no); 
		int getbodygoodtotalLikeCount = bodygoodSQLMapper.totalLikecount(bodygood_no);
		BodygoodImageVo bodygoodImageVo = bodygoodSQLMapper.getBodygoodImageByRownum(bodygood_no);
		
		MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
		
		HashMap<String, Object> bestviewmap = new HashMap<String, Object>();
		bestviewmap.put("memberVo", memberVo);
		bestviewmap.put("bodygoodVo", bodygoodVo);
		bestviewmap.put("getbodygoodtotalComment", getbodygoodtotalComment);
		bestviewmap.put("getImageList", getImageList);
		bestviewmap.put("getbodygoodtotalLikeCount", getbodygoodtotalLikeCount);
		bestviewmap.put("bodygoodImageVo", bodygoodImageVo);
		
		bestviewList.add(bestviewmap);
		}
		
		return bestviewList;
	}
	
	//몸자랑 글 상세보기 
	public HashMap<String, Object> getBodygood(int bodygood_no){
		
	bodygoodSQLMapper.bodygoodincreaseView(bodygood_no);

	
	
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	BodygoodVo bodygoodVo = bodygoodSQLMapper.getBodygoodByNo(bodygood_no);
	
	int member_no = bodygoodVo.getMember_no();
	MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);

	
	ArrayList<BodygoodImageVo> imageVoList= 
			bodygoodSQLMapper.getBodygoodImagesByBodygoodNo(bodygood_no);
	
	map.put("bodygoodVo", bodygoodVo);
	map.put("memberVo", memberVo);
	map.put("imageVoList", imageVoList);
	
	return map;
	}
	
	
	
	
	
	
	public void bodygooddeleteContent(int bodygood_no) {
		bodygoodSQLMapper.bodygooddeleteByNo(bodygood_no);
	}
	
	public void bodygoodupdateContent(BodygoodVo vo) {
		bodygoodSQLMapper.bodygoodupdate(vo);
	}

	//댓글 보기

	public ArrayList<HashMap<String, Object>> bodygoodReadComment(int bodygood_no) {
		
		ArrayList<HashMap<String, Object>> list = 
				new ArrayList<HashMap<String,Object>>();
		
		
		ArrayList<BodygoodCommentVo> commentList = bodygoodSQLMapper.bodygoodReadComment(bodygood_no);
		
		for(BodygoodCommentVo bodygoodCommentVo : commentList) {
			int member_no = bodygoodCommentVo.getMember_no(); // 멤버 닉네임 
			MemberVo memberVo = memberSQLMapper.getMemberByNo(member_no);
			
			HashMap<String, Object> comment = new HashMap<String, Object>();
			comment.put("memberVo", memberVo);
			comment.put("bodygoodCommentVo", bodygoodCommentVo);
			
			list.add(comment);
			
			
		}
		return list;
		
	}
		//댓글쓰기	
		public void bodygoodWriteComment(BodygoodCommentVo vo) {
			
			bodygoodSQLMapper.bodygoodWriteComment(vo);
			
			
		}
		
		//좋아요 관련
		public void doLikeProcess(BodygoodLikeVo vo) {
			
			int myCount = bodygoodSQLMapper.myLikeCount(vo);
			
			if(myCount > 0) {
				bodygoodSQLMapper.bodygoodunLike(vo);
			}else {
				bodygoodSQLMapper.bodygoodLike(vo);
			}
		}
		
		public int getTotalLikeCount(int bodygood_no) {
			
			return bodygoodSQLMapper.totalLikecount(bodygood_no);
		}
		
		public int getMyLikeCount(BodygoodLikeVo vo) {
			
			return bodygoodSQLMapper.myLikeCount(vo);
		}
		
		}
	
	
	
	

	
	
	

