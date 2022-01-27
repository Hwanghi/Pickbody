package com.ja.pickbody.vo;

import java.util.Date;

public class SellBoardVo {

	
	private int sell_no;
	private int admin_no;
	private String sell_name;
	private String sell_content;
	private int sell_price;
	private Date sell_date;
	private int sell_Quantity;
	private int sell_view;
	
	public SellBoardVo() {
		super();
	}

	public SellBoardVo(int sell_no, int admin_no, String sell_name, String sell_content, int sell_price, Date sell_date,
			int sell_Quantity, int sell_view) {
		super();
		this.sell_no = sell_no;
		this.admin_no = admin_no;
		this.sell_name = sell_name;
		this.sell_content = sell_content;
		this.sell_price = sell_price;
		this.sell_date = sell_date;
		this.sell_Quantity = sell_Quantity;
		this.sell_view = sell_view;
	}

	public int getSell_no() {
		return sell_no;
	}

	public void setSell_no(int sell_no) {
		this.sell_no = sell_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getSell_name() {
		return sell_name;
	}

	public void setSell_name(String sell_name) {
		this.sell_name = sell_name;
	}

	public String getSell_content() {
		return sell_content;
	}

	public void setSell_content(String sell_content) {
		this.sell_content = sell_content;
	}

	public int getSell_price() {
		return sell_price;
	}

	public void setSell_price(int sell_price) {
		this.sell_price = sell_price;
	}

	public Date getSell_date() {
		return sell_date;
	}

	public void setSell_date(Date sell_date) {
		this.sell_date = sell_date;
	}

	public int getSell_Quantity() {
		return sell_Quantity;
	}

	public void setSell_Quantity(int sell_Quantity) {
		this.sell_Quantity = sell_Quantity;
	}

	public int getSell_view() {
		return sell_view;
	}

	public void setSell_view(int sell_view) {
		this.sell_view = sell_view;
	}
	
}
