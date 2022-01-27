package com.ja.pickbody.vo;

import java.util.Date;

public class RippleVo {

private	int ripple_no;
private	int free_no;
private	int member_no;
private String ripple_content;
private Date ripple_date;
public RippleVo() {
	super();
}
public RippleVo(int ripple_no, int free_no, int member_no, String ripple_content, Date ripple_date) {
	super();
	this.ripple_no = ripple_no;
	this.free_no = free_no;
	this.member_no = member_no;
	this.ripple_content = ripple_content;
	this.ripple_date = ripple_date;
}
public int getRipple_no() {
	return ripple_no;
}
public void setRipple_no(int ripple_no) {
	this.ripple_no = ripple_no;
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
public String getRipple_content() {
	return ripple_content;
}
public void setRipple_content(String ripple_content) {
	this.ripple_content = ripple_content;
}
public Date getRipple_date() {
	return ripple_date;
}
public void setRipple_date(Date ripple_date) {
	this.ripple_date = ripple_date;
}
	
}
