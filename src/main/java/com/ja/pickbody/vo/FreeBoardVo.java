package com.ja.pickbody.vo;

import java.util.Date;

public class FreeBoardVo {

	private int free_no;
	private int member_no;
	private String free_title;
	private String free_content;
	private Date free_date;
	private int free_view;
	public FreeBoardVo() {
		super();
	}
	public FreeBoardVo(int free_no, int member_no, String free_title, String free_content, Date free_date,
			int free_view) {
		super();
		this.free_no = free_no;
		this.member_no = member_no;
		this.free_title = free_title;
		this.free_content = free_content;
		this.free_date = free_date;
		this.free_view = free_view;
	}
	public int getFree_no() {
		return free_no;
	}
	public void setFree_no(int free_no) {
		this.free_no = free_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public Date getFree_date() {
		return free_date;
	}
	public void setFree_date(Date free_date) {
		this.free_date = free_date;
	}
	public int getFree_view() {
		return free_view;
	}
	public void setFree_view(int free_view) {
		this.free_view = free_view;
	}
}
