package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ScheduleDailyVo {

	private int schedule_no;
	private int schedule_week_no;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date schedule_date;
	
	public ScheduleDailyVo() {
		super();
	}

	public ScheduleDailyVo(int schedule_no, int schedule_week_no, Date schedule_date) {
		super();
		this.schedule_no = schedule_no;
		this.schedule_week_no = schedule_week_no;
		this.schedule_date = schedule_date;
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public int getSchedule_week_no() {
		return schedule_week_no;
	}

	public void setSchedule_week_no(int schedule_week_no) {
		this.schedule_week_no = schedule_week_no;
	}

	public Date getSchedule_date() {
		return schedule_date;
	}

	public void setSchedule_date(Date schedule_date) {
		this.schedule_date = schedule_date;
	}
	
	
}
