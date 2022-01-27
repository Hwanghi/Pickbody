package com.ja.pickbody.vo;

public class SecondhandLikeVo {
	private int like_no;
	private int member_no;
	private int item_no;
	public SecondhandLikeVo(int like_no, int member_no, int item_no) {
		super();
		this.like_no = like_no;
		this.member_no = member_no;
		this.item_no = item_no;
	}
	public SecondhandLikeVo() {
		super();
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	
	
	

}
