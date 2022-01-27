package com.ja.pickbody.vo;

public class WillBuyVo {

	
	private int willBuy_no;
	private int member_no;
	private int sell_no;
	private int willBuy_amount;
	private int willBuy_price;
	public WillBuyVo() {
		super();
	}
	public WillBuyVo(int willBuy_no, int member_no, int sell_no, int willBuy_amount, int willBuy_price) {
		super();
		this.willBuy_no = willBuy_no;
		this.member_no = member_no;
		this.sell_no = sell_no;
		this.willBuy_amount = willBuy_amount;
		this.willBuy_price = willBuy_price;
	}
	public int getWillBuy_no() {
		return willBuy_no;
	}
	public void setWillBuy_no(int willBuy_no) {
		this.willBuy_no = willBuy_no;
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
	public int getWillBuy_amount() {
		return willBuy_amount;
	}
	public void setWillBuy_amount(int willBuy_amount) {
		this.willBuy_amount = willBuy_amount;
	}
	public int getWillBuy_price() {
		return willBuy_price;
	}
	public void setWillBuy_price(int willBuy_price) {
		this.willBuy_price = willBuy_price;
	}







}
