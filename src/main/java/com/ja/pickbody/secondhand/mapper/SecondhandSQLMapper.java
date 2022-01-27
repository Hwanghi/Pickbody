package com.ja.pickbody.secondhand.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.ja.pickbody.vo.SecondhandCategoryVo;
import com.ja.pickbody.vo.SecondhandCommentVo;
import com.ja.pickbody.vo.SecondhandEvaluateVo;
import com.ja.pickbody.vo.SecondhandImageVo;
import com.ja.pickbody.vo.SecondhandLikeVo;
import com.ja.pickbody.vo.SecondhandTradeVo;
import com.ja.pickbody.vo.SecondhandVo;
import com.ja.pickbody.vo.SecondhandCategoryBigVo;

public interface SecondhandSQLMapper {

	public int createSecondhandPK();
	
	public void SecondhandWriteContent(SecondhandVo vo);
	
	public ArrayList<SecondhandCategoryVo> categoryList(int big_no);
	
	public ArrayList<SecondhandCategoryBigVo> categorybigList();
	
	
	public void insertImage(SecondhandImageVo vo);
	public ArrayList<SecondhandImageVo> getboardImageByItemNo(int item_no);
	
	public void increaseReadCount(int no);
	
	public ArrayList<SecondhandVo> getitemlist();
	
	public ArrayList<SecondhandVo> getitemtwolist(int no);
	
	
	public SecondhandImageVo itemthumbnail(int item_no);
	
	public SecondhandVo getitemByNo(int no);
	public ArrayList<SecondhandImageVo> getimage(int item_no);
	
	public void SecondhandWriteComment(SecondhandCommentVo vo);
	public ArrayList<SecondhandCommentVo> getSecondhandcommentlist(int item_no);
	
	public void Like(SecondhandLikeVo vo);
	public void unLike(SecondhandLikeVo vo);
	public int myLikeCount(SecondhandLikeVo vo);
	public int totalLikeCount(int item_no); 
	
	public void buyprocess(SecondhandTradeVo vo);
	
	public ArrayList<SecondhandLikeVo> getwishlist(int member_no);
	
	
	public ArrayList<SecondhandVo> getsalelist(int member_no);
	public ArrayList<SecondhandTradeVo> getbuyerlistByNo(int item_no);
	public ArrayList<SecondhandTradeVo> getbuylistByNo(int buyer_no);
	
	public SecondhandTradeVo prohibittrade(@Param("item_no")int item_no,@Param("buyer_no") int buyer_no);
	
	
	public void updatefirstitem(int	item_no);
	public void updatefirstbuyer(int buy_no);

	
	public void updateseconditem(int item_no);
	public void updatesecondbuyer(int item_no);	
	public void updatesecondrealbuyer(int buy_no);
	
	public void updateevaluatesales(int item_no);
	public void updateevaluatebuyer(int buy_no);
	
	public void writeevaluate(SecondhandEvaluateVo vo);
	
	public SecondhandTradeVo getbuyerByNo(int item_no);
	
	public int averageevaluateslaes(int no);
	public int averageevaluatebuy(int no);
	public int countbuyer(int no);
	public int countevaluate(int no);
	public int countsellitem(int no);
	
	
	public ArrayList<SecondhandEvaluateVo> getevaluateone(int member_no);
	
	public ArrayList<SecondhandVo> getboardbymemberno(int member_no);
	public ArrayList<SecondhandEvaluateVo> getevaluatesalesbymemberno(int member_no);
	public ArrayList<SecondhandEvaluateVo> getevaluatebuyerbymemberno(int member_no);
	
	

	
	
	
}
