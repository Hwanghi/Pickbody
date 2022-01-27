package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ScheduleWeekVo {

	private int schedule_week_no;
	private int program_no;
	private Date schedule_startdate;
	private String schedule_advice;
	private int week;
	
	public ScheduleWeekVo() {
		super();
	}

	public ScheduleWeekVo(int schedule_week_no, int program_no, Date schedule_startdate, String schedule_advice,
			int week) {
		super();
		this.schedule_week_no = schedule_week_no;
		this.program_no = program_no;
		this.schedule_startdate = schedule_startdate;
		this.schedule_advice = schedule_advice;
		this.week = week;
	}

	public int getSchedule_week_no() {
		return schedule_week_no;
	}

	public void setSchedule_week_no(int schedule_week_no) {
		this.schedule_week_no = schedule_week_no;
	}

	public int getProgram_no() {
		return program_no;
	}

	public void setProgram_no(int program_no) {
		this.program_no = program_no;
	}

	public Date getSchedule_startdate() {
		return schedule_startdate;
	}

	public void setSchedule_startdate(Date schedule_startdate) {
		this.schedule_startdate = schedule_startdate;
	}

	public String getSchedule_advice() {
		return schedule_advice;
	}

	public void setSchedule_advice(String schedule_advice) {
		this.schedule_advice = schedule_advice;
	}

	public int getWeek() {
		return week;
	}

	public void setWeek(int week) {
		this.week = week;
	}

	
	
	
}
