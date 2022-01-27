package com.ja.pickbody.vo;

import java.util.Date;

public class ApplicationVo {

	private int application_no;
	private int drop_no;
	private int member_no;
	private String application_comment;
	private Date application_applydate;
	
	public ApplicationVo() {
		super();
	}

	public ApplicationVo(int application_no, int drop_no, int member_no, String application_comment,
			Date application_applydate) {
		super();
		this.application_no = application_no;
		this.drop_no = drop_no;
		this.member_no = member_no;
		this.application_comment = application_comment;
		this.application_applydate = application_applydate;
	}

	public int getApplication_no() {
		return application_no;
	}

	public void setApplication_no(int application_no) {
		this.application_no = application_no;
	}

	public int getDrop_no() {
		return drop_no;
	}

	public void setDrop_no(int drop_no) {
		this.drop_no = drop_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getApplication_comment() {
		return application_comment;
	}

	public void setApplication_comment(String application_comment) {
		this.application_comment = application_comment;
	}

	public Date getApplication_applydate() {
		return application_applydate;
	}

	public void setApplication_applydate(Date application_applydate) {
		this.application_applydate = application_applydate;
	}
	
	
	
	
}
