package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SecondhandVo {
	
	private int item_no;
	private int member_no;
	private String small_no;
	private String item_title;
	private String item_content;
	private int item_price;
	private String item_negotiate;
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date item_writedate;
	private String item_status;
	private String item_condition;
	private String item_keyword;
	private String item_refund;
	private String item_readcount;
	private String item_location;
	public SecondhandVo(int item_no, int member_no, String small_no, String item_title, String item_content,
			int item_price, String item_negotiate, Date item_writedate, String item_status, String item_condition,
			String item_keyword, String item_refund, String item_readcount, String item_location) {
		super();
		this.item_no = item_no;
		this.member_no = member_no;
		this.small_no = small_no;
		this.item_title = item_title;
		this.item_content = item_content;
		this.item_price = item_price;
		this.item_negotiate = item_negotiate;
		this.item_writedate = item_writedate;
		this.item_status = item_status;
		this.item_condition = item_condition;
		this.item_keyword = item_keyword;
		this.item_refund = item_refund;
		this.item_readcount = item_readcount;
		this.item_location = item_location;
	}
	public SecondhandVo() {
		super();
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getSmall_no() {
		return small_no;
	}
	public void setSmall_no(String small_no) {
		this.small_no = small_no;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public String getItem_negotiate() {
		return item_negotiate;
	}
	public void setItem_negotiate(String item_negotiate) {
		this.item_negotiate = item_negotiate;
	}
	public Date getItem_writedate() {
		return item_writedate;
	}
	public void setItem_writedate(Date item_writedate) {
		this.item_writedate = item_writedate;
	}
	public String getItem_status() {
		return item_status;
	}
	public void setItem_status(String item_status) {
		this.item_status = item_status;
	}
	public String getItem_condition() {
		return item_condition;
	}
	public void setItem_condition(String item_condition) {
		this.item_condition = item_condition;
	}
	public String getItem_keyword() {
		return item_keyword;
	}
	public void setItem_keyword(String item_keyword) {
		this.item_keyword = item_keyword;
	}
	public String getItem_refund() {
		return item_refund;
	}
	public void setItem_refund(String item_refund) {
		this.item_refund = item_refund;
	}
	public String getItem_readcount() {
		return item_readcount;
	}
	public void setItem_readcount(String item_readcount) {
		this.item_readcount = item_readcount;
	}
	public String getItem_location() {
		return item_location;
	}
	public void setItem_location(String item_location) {
		this.item_location = item_location;
	}

	
	
	
	
	
	
	

}
