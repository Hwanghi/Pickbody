package com.ja.pickbody.vo;

import java.util.Date;

public class ReviewVo {
	private int review_no;
	private int sell_no;
	private int member_no;
	private String review_content;
	private int review_star;
	private Date review_date;
	public ReviewVo() {
		super();
	}
	public ReviewVo(int review_no, int sell_no, int member_no, String review_content, int review_star,
			Date review_date) {
		super();
		this.review_no = review_no;
		this.sell_no = sell_no;
		this.member_no = member_no;
		this.review_content = review_content;
		this.review_star = review_star;
		this.review_date = review_date;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getSell_no() {
		return sell_no;
	}
	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
}
