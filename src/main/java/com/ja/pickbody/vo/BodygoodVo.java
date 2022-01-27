package com.ja.pickbody.vo;

import java.util.Date;

public class BodygoodVo {

	private int bodygood_no;
	private int member_no;
	private String bodygood_title;
	private String bodygood_content;
	private Date bodygood_date;
	private int bodygood_view;
	
	public BodygoodVo() {
		super();
	}

	public BodygoodVo(int bodygood_no, int member_no, String bodygood_title, String bodygood_content,
			Date bodygood_date, int bodygood_view) {
		super();
		this.bodygood_no = bodygood_no;
		this.member_no = member_no;
		this.bodygood_title = bodygood_title;
		this.bodygood_content = bodygood_content;
		this.bodygood_date = bodygood_date;
		this.bodygood_view = bodygood_view;
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

	public String getBodygood_title() {
		return bodygood_title;
	}

	public void setBodygood_title(String bodygood_title) {
		this.bodygood_title = bodygood_title;
	}

	public String getBodygood_content() {
		return bodygood_content;
	}

	public void setBodygood_content(String bodygood_content) {
		this.bodygood_content = bodygood_content;
	}

	public Date getBodygood_date() {
		return bodygood_date;
	}

	public void setBodygood_date(Date bodygood_date) {
		this.bodygood_date = bodygood_date;
	}

	public int getBodygood_view() {
		return bodygood_view;
	}

	public void setBodygood_view(int bodygood_view) {
		this.bodygood_view = bodygood_view;
	}
	
	
}

