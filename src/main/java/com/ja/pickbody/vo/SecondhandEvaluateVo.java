package com.ja.pickbody.vo;

import java.util.Date;

public class SecondhandEvaluateVo {
	private int evaluate_no;
	private int item_no;
	private int buyer_no;
	private int sales_no;
	private int evaluate_score;
	private String evaluate_comment;
	private Date evaluate_date;
	private int sender_no;
	private int setter_no;
	public SecondhandEvaluateVo(int evaluate_no, int item_no, int buyer_no, int sales_no, int evaluate_score,
			String evaluate_comment, Date evaluate_date, int sender_no, int setter_no) {
		super();
		this.evaluate_no = evaluate_no;
		this.item_no = item_no;
		this.buyer_no = buyer_no;
		this.sales_no = sales_no;
		this.evaluate_score = evaluate_score;
		this.evaluate_comment = evaluate_comment;
		this.evaluate_date = evaluate_date;
		this.sender_no = sender_no;
		this.setter_no = setter_no;
	}
	public SecondhandEvaluateVo() {
		super();
	}
	public int getEvaluate_no() {
		return evaluate_no;
	}
	public void setEvaluate_no(int evaluate_no) {
		this.evaluate_no = evaluate_no;
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
	public int getSales_no() {
		return sales_no;
	}
	public void setSales_no(int sales_no) {
		this.sales_no = sales_no;
	}
	public int getEvaluate_score() {
		return evaluate_score;
	}
	public void setEvaluate_score(int evaluate_score) {
		this.evaluate_score = evaluate_score;
	}
	public String getEvaluate_comment() {
		return evaluate_comment;
	}
	public void setEvaluate_comment(String evaluate_comment) {
		this.evaluate_comment = evaluate_comment;
	}
	public Date getEvaluate_date() {
		return evaluate_date;
	}
	public void setEvaluate_date(Date evaluate_date) {
		this.evaluate_date = evaluate_date;
	}
	public int getSender_no() {
		return sender_no;
	}
	public void setSender_no(int sender_no) {
		this.sender_no = sender_no;
	}
	public int getSetter_no() {
		return setter_no;
	}
	public void setSetter_no(int setter_no) {
		this.setter_no = setter_no;
	}
	
	
	
}
