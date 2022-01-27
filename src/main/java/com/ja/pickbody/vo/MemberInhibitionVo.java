package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberInhibitionVo {

	private int inhibition_no;
	private int member_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inhibition_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inhibition_resistdate;
	
	public MemberInhibitionVo() {
		super();
	}

	public MemberInhibitionVo(int inhibition_no, int member_no, Date inhibition_date, Date inhibition_resistdate) {
		super();
		this.inhibition_no = inhibition_no;
		this.member_no = member_no;
		this.inhibition_date = inhibition_date;
		this.inhibition_resistdate = inhibition_resistdate;
	}

	public int getInhibition_no() {
		return inhibition_no;
	}

	public void setInhibition_no(int inhibition_no) {
		this.inhibition_no = inhibition_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Date getInhibition_date() {
		return inhibition_date;
	}

	public void setInhibition_date(Date inhibition_date) {
		this.inhibition_date = inhibition_date;
	}

	public Date getInhibition_resistdate() {
		return inhibition_resistdate;
	}

	public void setInhibition_resistdate(Date inhibition_resistdate) {
		this.inhibition_resistdate = inhibition_resistdate;
	}
	
	
}
