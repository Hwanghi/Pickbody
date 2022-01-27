package com.ja.pickbody.secondhand.service;

import java.awt.event.ItemEvent;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.pickbody.board.service.BoardBodygoodServiceImpl;
import com.ja.pickbody.member.mapper.MemberSQLMapper;
import com.ja.pickbody.secondhand.mapper.SecondhandSQLMapper;
import com.ja.pickbody.vo.MemberVo;
import com.ja.pickbody.vo.SecondhandCategoryBigVo;
import com.ja.pickbody.vo.SecondhandCommentVo;
import com.ja.pickbody.vo.SecondhandEvaluateVo;
import com.ja.pickbody.vo.SecondhandImageVo;
import com.ja.pickbody.vo.SecondhandLikeVo;
import com.ja.pickbody.vo.SecondhandTradeVo;
import com.ja.pickbody.vo.SecondhandVo;

@Service
public class SecondhandServiceImpl {

	@Autowired
	private SecondhandSQLMapper secondhandSQLMapper;
	@Autowired
	private MemberSQLMapper membersqlMapper;
	
	
	
	public ArrayList<SecondhandCategoryBigVo> categorybigList(){
		
		return secondhandSQLMapper.categorybigList();
	}
	
	
	public void SecondhandwirteContent(SecondhandVo vo, ArrayList<SecondhandImageVo> imageVoList) {
	
		int itemNo = secondhandSQLMapper.createSecondhandPK();
		vo.setItem_no(itemNo);
		secondhandSQLMapper.SecondhandWriteContent(vo);
	
		for(SecondhandImageVo imageVo : imageVoList) {
			imageVo.setItem_no(itemNo);
			secondhandSQLMapper.insertImage(imageVo);
		}
		
		
	}
	
	public ArrayList<HashMap<String, Object>> wishlist(int member_no){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandLikeVo> likelist = secondhandSQLMapper.getwishlist(member_no);
		for (SecondhandLikeVo lvo: likelist) {
			int item_no =  lvo.getItem_no();
			SecondhandVo svo = secondhandSQLMapper.getitemByNo(item_no);
			SecondhandImageVo ivo = secondhandSQLMapper.itemthumbnail(item_no);
			
			int no = svo.getMember_no();
			
			int average = secondhandSQLMapper.averageevaluateslaes(no);
			
			
			int writer_no = svo.getMember_no();
			MemberVo mvo = membersqlMapper.getMemberByNo(writer_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("svo", svo);
			map.put("mvo", mvo);
			map.put("lvo", lvo);
			map.put("ivo", ivo);
			map.put("average",average);
			
			list.add(map);
		}
			return list;
	}
	
	
	
	
	
	
	
	public ArrayList<HashMap<String, Object>> getboardbymemberno(int member_no){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandVo> boardlist = secondhandSQLMapper.getboardbymemberno(member_no);
		for(SecondhandVo svo : boardlist) {
			MemberVo mvo = membersqlMapper.getMemberByNo(member_no);
			int no = svo.getItem_no();
			
			SecondhandImageVo ivvo= secondhandSQLMapper.itemthumbnail(no);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ivvo", ivvo);
			map.put("svo", svo);
			map.put("mvo", mvo);
			list.add(map);
		}
			return list;
		
	}
	
	
	public ArrayList<HashMap<String, Object>> getevaluatesalesbymemberno(int member_no){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandEvaluateVo> evaluatelist = secondhandSQLMapper.getevaluatesalesbymemberno(member_no);
		for(SecondhandEvaluateVo sevo : evaluatelist) {
			MemberVo mvo = membersqlMapper.getMemberByNo(member_no);
			
			int sender_no = sevo.getSender_no();
			MemberVo wmvo = membersqlMapper.getMemberByNo(sender_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("wmvo", wmvo);
			map.put("sevo", sevo);
			map.put("mvo", mvo);
			list.add(map);
		}
			return list;		
	}
	public ArrayList<HashMap<String, Object>> getevaluatebuyerbymemberno(int member_no){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandEvaluateVo> evaluatelist = secondhandSQLMapper.getevaluatebuyerbymemberno(member_no);
		for(SecondhandEvaluateVo sevo : evaluatelist) {
			MemberVo mvo = membersqlMapper.getMemberByNo(member_no);
			
			int setter_no = sevo.getSetter_no();
			MemberVo wmvo = membersqlMapper.getMemberByNo(setter_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("sevo", sevo);
			map.put("mvo", mvo);
			map.put("wmvo", wmvo);
			list.add(map);
		}
			return list;		
	}
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<HashMap<String, Object>> getBoardList(){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandVo> boardlist = secondhandSQLMapper.getitemlist();
		for(SecondhandVo svo : boardlist) {
			int member_no = svo.getMember_no();
			int item_no = svo.getItem_no();
			MemberVo mvo = membersqlMapper.getMemberByNo(member_no);
			SecondhandImageVo ivo= secondhandSQLMapper.itemthumbnail(item_no);
			int average = secondhandSQLMapper.averageevaluateslaes(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("svo", svo);
			map.put("mvo", mvo);
			map.put("ivo", ivo);
			map.put("average",average);
			list.add(map);
		}
		return list;	
	}
	
	public ArrayList<HashMap<String, Object>> getBoardtwoList(int no){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandVo> boardlist = secondhandSQLMapper.getitemtwolist(no);
		for(SecondhandVo svo : boardlist) {
			int member_no = svo.getMember_no();
			int item_no = svo.getItem_no();
			MemberVo mvo = membersqlMapper.getMemberByNo(member_no);
			SecondhandImageVo ivo= secondhandSQLMapper.itemthumbnail(item_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("svo", svo);
			map.put("mvo", mvo);
			map.put("ivo", ivo);
			list.add(map);
		}
		return list;	
	}
	public ArrayList<HashMap<String, Object>> getevaluateone(int member_no){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandEvaluateVo> evaluatelist = secondhandSQLMapper.getevaluateone(member_no);
		for(SecondhandEvaluateVo sevo : evaluatelist) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			int buyer_no = sevo.getSetter_no();
			MemberVo bmvo = membersqlMapper.getMemberByNo(buyer_no); 
			int sender_no = sevo.getSender_no();
			MemberVo smvo = membersqlMapper.getMemberByNo(sender_no);
			map.put("smvo", smvo);
			map.put("sevo", sevo);
			map.put("bmvo", bmvo);
			list.add(map);
		}
		
	return list;
		
	}
	
	
	
	
	public HashMap<String, Object> getBoard(int no, int buyer_no){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		SecondhandVo svo = secondhandSQLMapper.getitemByNo(no);
		int member_no = svo.getMember_no();
		MemberVo mvo = membersqlMapper.getMemberByNo(member_no);
		if(buyer_no != 0) {
			SecondhandTradeVo stvo = secondhandSQLMapper.prohibittrade(no, buyer_no );
			map.put("stvo", stvo);
			
		}
		
		int countevaluate = secondhandSQLMapper.countevaluate(member_no);
		int countsell = secondhandSQLMapper.countsellitem(member_no);
		int averageevaluate = secondhandSQLMapper.averageevaluateslaes(member_no);
		
		ArrayList<SecondhandImageVo> ivo = secondhandSQLMapper.getimage(no);
		
		map.put("svo", svo);
		map.put("mvo", mvo);
		map.put("ivo", ivo);
		map.put("countevaluate", countevaluate);
		map.put("countsell", countsell);
		map.put("averageevaluate", averageevaluate);
		return map;
	}
	
	
	public void writeComment(SecondhandCommentVo vo) {
		secondhandSQLMapper.SecondhandWriteComment(vo);
		
	}
	
	public ArrayList<HashMap<String, Object>> getCommentList(int item_no){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandCommentVo> CommentList = secondhandSQLMapper.getSecondhandcommentlist(item_no);
		for (SecondhandCommentVo cvo : CommentList) {
			int member_no = cvo.getComment_writerno();
			MemberVo mvo = membersqlMapper.getMemberByNo(member_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mvo", mvo);
			map.put("cvo", cvo);
			list.add(map);
		}
		return list;
	}

	
	public void doLikeProcess(SecondhandLikeVo vo) {
		int myCount = secondhandSQLMapper.myLikeCount(vo);
		
		if(myCount >0) {
			secondhandSQLMapper.unLike(vo);
		}
		else {
			secondhandSQLMapper.Like(vo);
		}
		
		
	}
	
	public int getTotalLikeCount(int item_no) {
		return secondhandSQLMapper.totalLikeCount(item_no);
		
	}
	
	
	public int getMyLikeCount(SecondhandLikeVo vo) {
		return secondhandSQLMapper.myLikeCount(vo);
	}
	
	public void buyprocess(SecondhandTradeVo vo) {
		secondhandSQLMapper.buyprocess(vo);
	}
	
	public ArrayList<HashMap<String, Object>> getsalelist(int member_no){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandVo> salelist = secondhandSQLMapper.getsalelist(member_no);
		for (SecondhandVo svo  : salelist) {
			int no = svo.getMember_no();
			MemberVo mvo = membersqlMapper.getMemberByNo(no);
			
			
			int item_no = svo.getItem_no();
	
			int countbuyer = secondhandSQLMapper.countbuyer(item_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("countbuyer",countbuyer);
			map.put("svo", svo);
			map.put("mvo", mvo);
			
			list.add(map);
			
		}
		return list;
	}
	
	
	public ArrayList<HashMap<String, Object>> getbuylist(int buyer_no){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandTradeVo> buylist = secondhandSQLMapper.getbuylistByNo(buyer_no);
		for(SecondhandTradeVo stvo : buylist) {
			int no = stvo.getBuyer_no();
			MemberVo mvo = membersqlMapper.getMemberByNo(no);
			
			int item_no = stvo.getItem_no();
			SecondhandVo svo = secondhandSQLMapper.getitemByNo(item_no);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mvo", mvo);
			map.put("stvo", stvo);
			map.put("svo", svo);
			
			list.add(map);
		}
		return list;
	}
	
	
	public ArrayList<HashMap<String, Object>> getbuyerlist(int item_no){
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		ArrayList<SecondhandTradeVo> buyerlist = secondhandSQLMapper.getbuyerlistByNo(item_no);
		for(SecondhandTradeVo stvo : buyerlist) {
			int no = stvo.getBuyer_no();
			MemberVo mvo = membersqlMapper.getMemberByNo(no);
			
			int item = stvo.getItem_no();
			SecondhandVo svo = secondhandSQLMapper.getitemByNo(item);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("stvo", stvo);
			map.put("mvo", mvo);
			map.put("svo", svo);	
			list.add(map);
		}
		
		return list;
		
	}
	
	public void updatefirstitem(int buy_no) {
		secondhandSQLMapper.updatefirstbuyer(buy_no);
	}
	public void updatefirstitemm(int item_no) {
		secondhandSQLMapper.updatefirstitem(item_no);
	}
	public void updateseconditem(int item_no) {
		secondhandSQLMapper.updatesecondbuyer(item_no);
		secondhandSQLMapper.updateseconditem(item_no);
		
	}
	public void updatesecondbuyer(int buy_no) {
		
		secondhandSQLMapper.updatesecondrealbuyer(buy_no);
	}
	
	public void updateevaluatefinishbuyer(int buy_no) {
		secondhandSQLMapper.updateevaluatebuyer(buy_no);
	}
	public void updateevaluatefinishsales(int item_no) {
		secondhandSQLMapper.updateevaluatesales(item_no);
	}
	
	public void writeevaluate(SecondhandEvaluateVo vo) {
		secondhandSQLMapper.writeevaluate(vo);
	}
	
	
	
	
	public int averageevaluateslaes(int setsale_no) {
		return secondhandSQLMapper.averageevaluateslaes(setsale_no);
	}
	
	public int averageevaluatebuy(int setbuy_no) {
		return secondhandSQLMapper.averageevaluatebuy(setbuy_no);
	}
	
	public int countbuyer(int item_no) {
		return secondhandSQLMapper.countbuyer(item_no);
	}
	
	public int countevaluate(int sales_no) {
		return secondhandSQLMapper.countevaluate(sales_no);
	}
	public int countsellitem(int member_no) {
		return secondhandSQLMapper.countsellitem(member_no);
	}

	

	
	
}