package com.ja.pickbody.vo;

import java.util.Date;

public class SecondhandCommentVo {
	
	private int comment_no;
	private int item_no;
	private int comment_writerno;
	private String comment_content;
	private Date comment_writedate;
	public SecondhandCommentVo(int comment_no, int item_no, int comment_writerno, String comment_content,
			Date comment_writedate) {
		super();
		this.comment_no = comment_no;
		this.item_no = item_no;
		this.comment_writerno = comment_writerno;
		this.comment_content = comment_content;
		this.comment_writedate = comment_writedate;
	}
	public SecondhandCommentVo() {
		super();
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public int getComment_writerno() {
		return comment_writerno;
	}
	public void setComment_writerno(int comment_writerno) {
		this.comment_writerno = comment_writerno;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_writedate() {
		return comment_writedate;
	}
	public void setComment_writedate(Date comment_writedate) {
		this.comment_writedate = comment_writedate;
	}
	
	
	

}
