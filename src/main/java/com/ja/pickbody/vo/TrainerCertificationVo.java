package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TrainerCertificationVo {

	private int trainer_certification_no;
	private int trainer_no;
	private String trainer_certification_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date trainer_certification_date;
	
	public TrainerCertificationVo() {
		super();
	}

	public TrainerCertificationVo(int trainer_certification_no, int trainer_no, String trainer_certification_name,
			Date trainer_certification_date) {
		super();
		this.trainer_certification_no = trainer_certification_no;
		this.trainer_no = trainer_no;
		this.trainer_certification_name = trainer_certification_name;
		this.trainer_certification_date = trainer_certification_date;
	}

	public int getTrainer_certification_no() {
		return trainer_certification_no;
	}

	public void setTrainer_certification_no(int trainer_certification_no) {
		this.trainer_certification_no = trainer_certification_no;
	}

	public int getTrainer_no() {
		return trainer_no;
	}

	public void setTrainer_no(int trainer_no) {
		this.trainer_no = trainer_no;
	}

	public String getTrainer_certification_name() {
		return trainer_certification_name;
	}

	public void setTrainer_certification_name(String trainer_certification_name) {
		this.trainer_certification_name = trainer_certification_name;
	}

	public Date getTrainer_certification_date() {
		return trainer_certification_date;
	}

	public void setTrainer_certification_date(Date trainer_certification_date) {
		this.trainer_certification_date = trainer_certification_date;
	}
	
}
