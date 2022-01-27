package com.ja.pickbody.vo;

import java.util.Date;

public class MemberPointHistoryVo {

	private int point_history_no;
	private int member_no;
	private String point_history_useway;
	private int point_history_amount;
	private Date point_history_date;
	private int point_history_leftover_point;
	
	public MemberPointHistoryVo() {
		super();
	}

	public MemberPointHistoryVo(int point_history_no, int member_no, String point_history_useway,
			int point_history_amount, Date point_history_date, int point_history_leftover_point) {
		super();
		this.point_history_no = point_history_no;
		this.member_no = member_no;
		this.point_history_useway = point_history_useway;
		this.point_history_amount = point_history_amount;
		this.point_history_date = point_history_date;
		this.point_history_leftover_point = point_history_leftover_point;
	}

	public int getPoint_history_no() {
		return point_history_no;
	}

	public void setPoint_history_no(int point_history_no) {
		this.point_history_no = point_history_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getPoint_history_useway() {
		return point_history_useway;
	}

	public void setPoint_history_useway(String point_history_useway) {
		this.point_history_useway = point_history_useway;
	}

	public int getPoint_history_amount() {
		return point_history_amount;
	}

	public void setPoint_history_amount(int point_history_amount) {
		this.point_history_amount = point_history_amount;
	}

	public Date getPoint_history_date() {
		return point_history_date;
	}

	public void setPoint_history_date(Date point_history_date) {
		this.point_history_date = point_history_date;
	}

	public int getPoint_history_leftover_point() {
		return point_history_leftover_point;
	}

	public void setPoint_history_leftover_point(int point_history_leftover_point) {
		this.point_history_leftover_point = point_history_leftover_point;
	}
	
	

	
	
	
}
