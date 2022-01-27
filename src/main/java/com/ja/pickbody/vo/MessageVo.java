package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MessageVo {

	private int message_no;
	private int sender_no;
	private int recieve_no;
	private String message_title;
	private String message_content;
	private String message_isRead;
	private String message_senderDelete;
	private String message_receiveDelete;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date message_sendDate;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date message_readDate;
	
	public MessageVo() {
		super();
	}

	public MessageVo(int message_no, int sender_no, int recieve_no, String message_title, String message_content,
			String message_isRead, String message_senderDelete, String message_receiveDelete, Date message_sendDate,
			Date message_readDate) {
		super();
		this.message_no = message_no;
		this.sender_no = sender_no;
		this.recieve_no = recieve_no;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_isRead = message_isRead;
		this.message_senderDelete = message_senderDelete;
		this.message_receiveDelete = message_receiveDelete;
		this.message_sendDate = message_sendDate;
		this.message_readDate = message_readDate;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public int getSender_no() {
		return sender_no;
	}

	public void setSender_no(int sender_no) {
		this.sender_no = sender_no;
	}

	public int getRecieve_no() {
		return recieve_no;
	}

	public void setRecieve_no(int recieve_no) {
		this.recieve_no = recieve_no;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public String getMessage_isRead() {
		return message_isRead;
	}

	public void setMessage_isRead(String message_isRead) {
		this.message_isRead = message_isRead;
	}

	public String getMessage_senderDelete() {
		return message_senderDelete;
	}

	public void setMessage_senderDelete(String message_senderDelete) {
		this.message_senderDelete = message_senderDelete;
	}

	public String getMessage_receiveDelete() {
		return message_receiveDelete;
	}

	public void setMessage_receiveDelete(String message_receiveDelete) {
		this.message_receiveDelete = message_receiveDelete;
	}

	public Date getMessage_sendDate() {
		return message_sendDate;
	}

	public void setMessage_sendDate(Date message_sendDate) {
		this.message_sendDate = message_sendDate;
	}

	public Date getMessage_readDate() {
		return message_readDate;
	}

	public void setMessage_readDate(Date message_readDate) {
		this.message_readDate = message_readDate;
	}
	
	
	
}
