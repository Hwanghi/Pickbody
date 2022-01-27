package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BuyBoardVo {

private int buy_no;
private int member_no;
private int sell_no;
private int buy_Quantity;
private String buy_adress;
@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date buy_date;
private int buy_price;
private String buy_memo;
public BuyBoardVo() {
	super();
}
public BuyBoardVo(int buy_no, int member_no, int sell_no, int buy_Quantity, String buy_adress, Date buy_date,
		int buy_price, String buy_memo) {
	super();
	this.buy_no = buy_no;
	this.member_no = member_no;
	this.sell_no = sell_no;
	this.buy_Quantity = buy_Quantity;
	this.buy_adress = buy_adress;
	this.buy_date = buy_date;
	this.buy_price = buy_price;
	this.buy_memo = buy_memo;
}
public int getBuy_no() {
	return buy_no;
}
public void setBuy_no(int buy_no) {
	this.buy_no = buy_no;
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
public int getBuy_Quantity() {
	return buy_Quantity;
}
public void setBuy_Quantity(int buy_Quantity) {
	this.buy_Quantity = buy_Quantity;
}
public String getBuy_adress() {
	return buy_adress;
}
public void setBuy_adress(String buy_adress) {
	this.buy_adress = buy_adress;
}
public Date getBuy_date() {
	return buy_date;
}
public void setBuy_date(Date buy_date) {
	this.buy_date = buy_date;
}
public int getBuy_price() {
	return buy_price;
}
public void setBuy_price(int buy_price) {
	this.buy_price = buy_price;
}
public String getBuy_memo() {
	return buy_memo;
}
public void setBuy_memo(String buy_memo) {
	this.buy_memo = buy_memo;
}


	
	
}
