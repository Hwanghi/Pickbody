package com.ja.pickbody.vo;

import java.util.Date;

public class BodygoodCommentVo {

	private int comment_no;
	private int bodygood_no; // 게시판 구별 
	private int member_no;	// 댓글 주인 구별 
	private String comment_content;
	private Date comment_date;
	public BodygoodCommentVo() {
		super();
	}
	public BodygoodCommentVo(int comment_no, int bodygood_no, int member_no, String comment_content,
			Date comment_date) {
		super();
		this.comment_no = comment_no;
		this.bodygood_no = bodygood_no;
		this.member_no = member_no;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getBodygood_no() {
		return bodygood_no;
	}
	public void setBodygood_no(int bodygood_no) {
		this.bodygood_no = bodygood_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	
}
