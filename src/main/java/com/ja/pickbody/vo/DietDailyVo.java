package com.ja.pickbody.vo;

public class DietDailyVo {

	private int diet_no;
	private int schedule_no;
	private String diet_time;
	
	public DietDailyVo() {
		super();
	}

	public DietDailyVo(int diet_no, int schedule_no, String diet_time) {
		super();
		this.diet_no = diet_no;
		this.schedule_no = schedule_no;
		this.diet_time = diet_time;
	}

	public int getDiet_no() {
		return diet_no;
	}

	public void setDiet_no(int diet_no) {
		this.diet_no = diet_no;
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public String getDiet_time() {
		return diet_time;
	}

	public void setDiet_time(String diet_time) {
		this.diet_time = diet_time;
	}
	
}
