package com.ja.pickbody.board.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.board.mapper.FreeBoardSQLMapper;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.vo.FreeBoardVo;
import com.ja.pickbody.vo.FreeImageVo;
import com.ja.pickbody.vo.FreeLikeVo;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.RippleVo;

@Service
public class FreeBoardServiceImpl {
	@Autowired
	private FreeBoardSQLMapper freeBoardSQLMapper;
	@Autowired
	private MemberSQLMapper MemberSQLMapper;
	
	
    
	public void freeBoardWriteContent(FreeBoardVo vo,ArrayList<FreeImageVo> ImageVoList) {
		int free_no = freeBoardSQLMapper.createfreePK();
		vo.setFree_no(free_no);
		freeBoardSQLMapper.freeWriteContent(vo);
		for(FreeImageVo imageVo : ImageVoList ) {
		imageVo.setFree_no(free_no);
		freeBoardSQLMapper.freeImage(imageVo);
		}
	}
	public ArrayList<HashMap<String, Object>> getFreeBoardList(){
		ArrayList<HashMap<String, Object>> list
		=new ArrayList<HashMap<String, Object>>();
			
		ArrayList<FreeBoardVo> FreeboardList = freeBoardSQLMapper.getList();
		for(FreeBoardVo freeboardVo : FreeboardList) {
		    
			int free_no=freeboardVo.getFree_no();
		    int member_no = freeboardVo.getMember_no();
		    int getrippleAmount =freeBoardSQLMapper.RippleAmount(free_no);
		    ArrayList<FreeImageVo>FreeImagesByNo= freeBoardSQLMapper.getFreeImagesByNo(free_no);
		    MemberVo memberVo = MemberSQLMapper.getMemberByNo(member_no);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("FreeBoardVo", freeboardVo);
			map.put("getrippleAmount",getrippleAmount);
			map.put("FreeImagesByNo", FreeImagesByNo);
			
			
			Date writeDate = freeboardVo.getFree_date();
			long writeTime = writeDate.getTime();
			long currentTime = System.currentTimeMillis();
			
			
			if(currentTime - 1000*60*60*3 <= writeTime) {
				map.put("newttt", true);
			} 
			
			list.add(map);
		
			
		
		
		
		}	
		return list;
	}
	public ArrayList<HashMap<String,Object>>getBestFreeViewBoard(){
		ArrayList<HashMap<String,Object>>list2
		=new ArrayList<HashMap<String,Object>>();
		
		ArrayList<FreeBoardVo>getBestFreeViewBoard = freeBoardSQLMapper.BestFreeViewBoard();
		for(FreeBoardVo freeboardVo : getBestFreeViewBoard) {
			
			int member_no = freeboardVo.getMember_no();
			MemberVo memberVo = MemberSQLMapper.getMemberByNo(member_no);
			HashMap<String, Object>map=new HashMap<String, Object>();
			map.put("memberVo", memberVo);
			map.put("FreeBoardVo", freeboardVo);
			list2.add(map);

			
			
			
		}
		return list2;
	}

	public HashMap<String, Object> getFreeBoard (int free_no, boolean escape) {
		
		freeBoardSQLMapper.increaseReadCount(free_no);
		
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		FreeBoardVo freeboardVo = freeBoardSQLMapper.getFreeBoardByNo(free_no);
		int member_no = freeboardVo.getMember_no();
		MemberVo memberVo = MemberSQLMapper.getMemberByNo(member_no);
		
		if(escape) {
			//html 문법에 해당하는 특수문자를 바꾼다. 예) '<' = '&lt;'
			String str = StringEscapeUtils.escapeHtml4(freeboardVo.getFree_content());
			str = str.replaceAll("\n", "<br>");
			freeboardVo.setFree_content(str);
		}
		ArrayList<FreeImageVo>imageVoList=
				freeBoardSQLMapper.getFreeImagesByNo(free_no);
		
		
		map.put("FreeBoardVo", freeboardVo);
		map.put("MemberVo",memberVo);
		map.put("imageVoList",imageVoList);
		
		return map;
	}
	

public void deleteContent(int free_no) {
	freeBoardSQLMapper.deleteByNo(free_no);
}
public void updateContent(FreeBoardVo vo) {
	freeBoardSQLMapper.update(vo);
	
}

public void RippleContent(RippleVo vo) {
	freeBoardSQLMapper.freeRippleContent(vo);
}
public int getRippleAmount(int free_no) {
	return freeBoardSQLMapper.RippleAmount(free_no);
}


// 게시글에 속해있는 댓글들을 전부 가지고 온다.
public ArrayList<HashMap<String, Object>> getRippleread(int free_no){
	ArrayList<HashMap<String, Object>> rippleread
	=new ArrayList<HashMap<String,Object>>();
	
	// 댓글의 주인과 댓글 엮는 작업 
	ArrayList<RippleVo> rippleRead = freeBoardSQLMapper.rippleRead(free_no);
	
	for(RippleVo rippleVo : rippleRead) {
		// 리플 출력 : 작성자 닉네임 , 내용 , 쓴날짜
		int member_no = rippleVo.getMember_no();
		MemberVo memberVo = MemberSQLMapper.getMemberByNo(member_no);
		HashMap<String, Object>readmap = new HashMap<String, Object>();
		readmap.put("MemberVo", memberVo);
		readmap.put("RippleVo", rippleVo);
		
		rippleread.add(readmap);
	}
	return rippleread;

}


public HashMap<String, Object> getRipple(int ripple_no){
	HashMap<String,Object> ripplemap = new HashMap<String,Object>();
	RippleVo rippleVo = freeBoardSQLMapper.getFreeRippleByNo(ripple_no);
	int free_no = rippleVo.getFree_no();
	FreeBoardVo freeboardVo = freeBoardSQLMapper.getFreeBoardByNo(free_no);
	
	
	ripplemap.put("RippleVo", rippleVo);
	ripplemap.put("FreeBoardVo", freeboardVo);
	
	return ripplemap;
}

public void deleteRipple(int ripple_no) {
	freeBoardSQLMapper.deleteFreeRippleByNo(ripple_no);
}
public void updateRipple(RippleVo vo) {
	freeBoardSQLMapper.updateFreeRipple(vo);
}
//좋아요
public void doLikeProcess(FreeLikeVo vo) {

int myCount= freeBoardSQLMapper.myFreeLikeCount(vo);

if(myCount > 0) {
	freeBoardSQLMapper.freeDislike(vo);
}else {
	freeBoardSQLMapper.freeLike(vo);
}

}
public int getMyFreeLikeCount(FreeLikeVo vo) {
	return freeBoardSQLMapper.myFreeLikeCount(vo);
}
public int getTotalFreeLikeCount(int free_no) {
	return freeBoardSQLMapper.totalFreeLikeCount(free_no);
}

}
