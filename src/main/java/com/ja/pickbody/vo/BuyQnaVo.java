package com.ja.pickbody.vo;

import java.util.Date;

public class BuyQnaVo {

private int buyqna_no;	
private int sell_no;
private int member_no;
private String buyqna_content;
private Date buyqna_date;
public BuyQnaVo() {
	super();
}
public BuyQnaVo(int buyqna_no, int sell_no, int member_no, String buyqna_content, Date buyqna_date) {
	super();
	this.buyqna_no = buyqna_no;
	this.sell_no = sell_no;
	this.member_no = member_no;
	this.buyqna_content = buyqna_content;
	this.buyqna_date = buyqna_date;
}
public int getBuyqna_no() {
	return buyqna_no;
}
public void setBuyqna_no(int buyqna_no) {
	this.buyqna_no = buyqna_no;
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
public String getBuyqna_content() {
	return buyqna_content;
}
public void setBuyqna_content(String buyqna_content) {
	this.buyqna_content = buyqna_content;
}
public Date getBuyqna_date() {
	return buyqna_date;
}
public void setBuyqna_date(Date buyqna_date) {
	this.buyqna_date = buyqna_date;
}


}
