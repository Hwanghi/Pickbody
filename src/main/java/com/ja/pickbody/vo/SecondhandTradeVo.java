package com.ja.pickbody.vo;

import java.util.Date;

public class SecondhandTradeVo {

	
	private int buy_no;
	private int item_no;
	private int buyer_no;
	private Date buy_date;
	private String buy_status;
	public SecondhandTradeVo(int buy_no, int item_no, int buyer_no, Date buy_date, String buy_status) {
		super();
		this.buy_no = buy_no;
		this.item_no = item_no;
		this.buyer_no = buyer_no;
		this.buy_date = buy_date;
		this.buy_status = buy_status;
	}
	public SecondhandTradeVo() {
		super();
	}
	public int getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getBuyer_no() {
		return buyer_no;
	}
	public void setBuyer_no(int buyer_no) {
		this.buyer_no = buyer_no;
	}
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public String getBuy_status() {
		return buy_status;
	}
	public void setBuy_status(String buy_status) {
		this.buy_status = buy_status;
	}
	
	
}
