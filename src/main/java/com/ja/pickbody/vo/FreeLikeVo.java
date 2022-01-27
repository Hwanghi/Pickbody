package com.ja.pickbody.vo;

import java.util.Date;

public class FreeLikeVo {

	private int like_no;
	
	private int member_no;
	
	private int free_no;
	
	private Date like_date;

	public FreeLikeVo() {
		super();
	}

	public FreeLikeVo(int like_no, int member_no, int free_no, Date like_date) {
		super();
		this.like_no = like_no;
		this.member_no = member_no;
		this.free_no = free_no;
		this.like_date = like_date;
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

	public int getFree_no() {
		return free_no;
	}

	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}
}
