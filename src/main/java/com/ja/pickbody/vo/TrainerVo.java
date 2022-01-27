package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TrainerVo {
	
	private int trainer_no;
	private String trainer_id;
	private String trainer_name;
	private String trainer_pw;
	private String trainer_phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date trainer_birth;
	private String trainer_address;
	private String trainer_auth;
	private String trainer_email;
	private String trainer_gender;
	private int trainer_point;
	private int trainer_price;
	
	public TrainerVo() {
		super();
	}

	public TrainerVo(int trainer_no, String trainer_id, String trainer_name, String trainer_pw, String trainer_phone,
			Date trainer_birth, String trainer_address, String trainer_auth, String trainer_email,
			String trainer_gender, int trainer_point, int trainer_price) {
		super();
		this.trainer_no = trainer_no;
		this.trainer_id = trainer_id;
		this.trainer_name = trainer_name;
		this.trainer_pw = trainer_pw;
		this.trainer_phone = trainer_phone;
		this.trainer_birth = trainer_birth;
		this.trainer_address = trainer_address;
		this.trainer_auth = trainer_auth;
		this.trainer_email = trainer_email;
		this.trainer_gender = trainer_gender;
		this.trainer_point = trainer_point;
		this.trainer_price = trainer_price;
	}

	public int getTrainer_no() {
		return trainer_no;
	}

	public void setTrainer_no(int trainer_no) {
		this.trainer_no = trainer_no;
	}

	public String getTrainer_id() {
		return trainer_id;
	}

	public void setTrainer_id(String trainer_id) {
		this.trainer_id = trainer_id;
	}

	public String getTrainer_name() {
		return trainer_name;
	}

	public void setTrainer_name(String trainer_name) {
		this.trainer_name = trainer_name;
	}

	public String getTrainer_pw() {
		return trainer_pw;
	}

	public void setTrainer_pw(String trainer_pw) {
		this.trainer_pw = trainer_pw;
	}

	public String getTrainer_phone() {
		return trainer_phone;
	}

	public void setTrainer_phone(String trainer_phone) {
		this.trainer_phone = trainer_phone;
	}

	public Date getTrainer_birth() {
		return trainer_birth;
	}

	public void setTrainer_birth(Date trainer_birth) {
		this.trainer_birth = trainer_birth;
	}

	public String getTrainer_address() {
		return trainer_address;
	}

	public void setTrainer_address(String trainer_address) {
		this.trainer_address = trainer_address;
	}

	public String getTrainer_auth() {
		return trainer_auth;
	}

	public void setTrainer_auth(String trainer_auth) {
		this.trainer_auth = trainer_auth;
	}

	public String getTrainer_email() {
		return trainer_email;
	}

	public void setTrainer_email(String trainer_email) {
		this.trainer_email = trainer_email;
	}

	public String getTrainer_gender() {
		return trainer_gender;
	}

	public void setTrainer_gender(String trainer_gender) {
		this.trainer_gender = trainer_gender;
	}

	public int getTrainer_point() {
		return trainer_point;
	}

	public void setTrainer_point(int trainer_point) {
		this.trainer_point = trainer_point;
	}

	public int getTrainer_price() {
		return trainer_price;
	}

	public void setTrainer_price(int trainer_price) {
		this.trainer_price = trainer_price;
	}
		

}
