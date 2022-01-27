package com.ja.pickbody.vo;

import java.util.Date;

public class PTProgramVo {
	int program_no;
	int trainer_no;
	int member_no;
	int goal_category_no;
	Date start_date; // 구독시작 날짜는 자바에서 계산해서 넣어준다.
	int how_weeks;
	
	public PTProgramVo() {
		super();
	}

	public PTProgramVo(int program_no, int trainer_no, int member_no, int goal_category_no, Date start_date,
			int how_weeks) {
		super();
		this.program_no = program_no;
		this.trainer_no = trainer_no;
		this.member_no = member_no;
		this.goal_category_no = goal_category_no;
		this.start_date = start_date;
		this.how_weeks = how_weeks;
	}

	public int getProgram_no() {
		return program_no;
	}

	public void setProgram_no(int program_no) {
		this.program_no = program_no;
	}

	public int getTrainer_no() {
		return trainer_no;
	}

	public void setTrainer_no(int trainer_no) {
		this.trainer_no = trainer_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getGoal_category_no() {
		return goal_category_no;
	}

	public void setGoal_category_no(int goal_category_no) {
		this.goal_category_no = goal_category_no;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public int getHow_weeks() {
		return how_weeks;
	}

	public void setHow_weeks(int how_weeks) {
		this.how_weeks = how_weeks;
	}
	
	
}
