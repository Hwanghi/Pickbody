package com.ja.pickbody.vo;

import java.util.Date;

public class BuyLikeVo {

	
private int buylike_no;
private int member_no;
private int sell_no;
private Date buylike_date;

public BuyLikeVo() {
	super();
}
public BuyLikeVo(int buylike_no, int member_no, int sell_no, Date buylike_date) {
	super();
	this.buylike_no = buylike_no;
	this.member_no = member_no;
	this.sell_no = sell_no;
	this.buylike_date = buylike_date;
}
public int getBuylike_no() {
	return buylike_no;
}
public void setBuylike_no(int buylike_no) {
	this.buylike_no = buylike_no;
}
public int getMember_no() {
	return member_no;
}
public void setMember_no(int member_no) {
	this.member_no = member_no;
}
public int getSell_no() {
	return sell_no;
}
public void setSell_no(int sell_no) {
	this.sell_no = sell_no;
}
public Date getBuylike_date() {
	return buylike_date;
}
public void setBuylike_date(Date buylike_date) {
	this.buylike_date = buylike_date;
}

}
