package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TrainerPrizeVo {

	private int trainer_prize_no;
	private int trainer_no;
	private String trainer_prize_name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date trainer_prize_date;
	
	public TrainerPrizeVo() {
		super();
	}

	public TrainerPrizeVo(int trainer_prize_no, int trainer_no, String trainer_prize_name, Date trainer_prize_date) {
		super();
		this.trainer_prize_no = trainer_prize_no;
		this.trainer_no = trainer_no;
		this.trainer_prize_name = trainer_prize_name;
		this.trainer_prize_date = trainer_prize_date;
	}

	public int getTrainer_prize_no() {
		return trainer_prize_no;
	}

	public void setTrainer_prize_no(int trainer_prize_no) {
		this.trainer_prize_no = trainer_prize_no;
	}

	public int getTrainer_no() {
		return trainer_no;
	}

	public void setTrainer_no(int trainer_no) {
		this.trainer_no = trainer_no;
	}

	public String getTrainer_prize_name() {
		return trainer_prize_name;
	}

	public void setTrainer_prize_name(String trainer_prize_name) {
		this.trainer_prize_name = trainer_prize_name;
	}

	public Date getTrainer_prize_date() {
		return trainer_prize_date;
	}

	public void setTrainer_prize_date(Date trainer_prize_date) {
		this.trainer_prize_date = trainer_prize_date;
	}
	
}
