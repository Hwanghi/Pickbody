package com.ja.pickbody.vo;

import java.util.Date;

public class BodygoodLikeVo {

	private int like_no;
	private int member_no;
	private int bodygood_no;
	private Date bodygoodlike_date;
	
	public BodygoodLikeVo() {
		super();
	}

	public BodygoodLikeVo(int like_no, int member_no, int bodygood_no, Date bodygoodlike_date) {
		super();
		this.like_no = like_no;
		this.member_no = member_no;
		this.bodygood_no = bodygood_no;
		this.bodygoodlike_date = bodygoodlike_date;
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

	public int getBodygood_no() {
		return bodygood_no;
	}

	public void setBodygood_no(int bodygood_no) {
		this.bodygood_no = bodygood_no;
	}

	public Date getBodygoodlike_date() {
		return bodygoodlike_date;
	}

	public void setBodygoodlike_date(Date bodygoodlike_date) {
		this.bodygoodlike_date = bodygoodlike_date;
	}
	
	
}
