package com.ja.pickbody.vo;

public class RutineDailyVo {

	private int rutine_no;
	private int exercise_category_no;
	private int schedule_no;
	private int rutine_set;
	private int rutine_number;
	private int rutine_weight;
	private String rutine_resttime;
	
	public RutineDailyVo() {
		super();
	}

	public RutineDailyVo(int rutine_no, int exercise_category_no, int schedule_no, int rutine_set, int rutine_number,
			int rutine_weight, String rutine_resttime) {
		super();
		this.rutine_no = rutine_no;
		this.exercise_category_no = exercise_category_no;
		this.schedule_no = schedule_no;
		this.rutine_set = rutine_set;
		this.rutine_number = rutine_number;
		this.rutine_weight = rutine_weight;
		this.rutine_resttime = rutine_resttime;
	}

	public int getRutine_no() {
		return rutine_no;
	}

	public void setRutine_no(int rutine_no) {
		this.rutine_no = rutine_no;
	}

	public int getExercise_category_no() {
		return exercise_category_no;
	}

	public void setExercise_category_no(int exercise_category_no) {
		this.exercise_category_no = exercise_category_no;
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public int getRutine_set() {
		return rutine_set;
	}

	public void setRutine_set(int rutine_set) {
		this.rutine_set = rutine_set;
	}

	public int getRutine_number() {
		return rutine_number;
	}

	public void setRutine_number(int rutine_number) {
		this.rutine_number = rutine_number;
	}

	public int getRutine_weight() {
		return rutine_weight;
	}

	public void setRutine_weight(int rutine_weight) {
		this.rutine_weight = rutine_weight;
	}

	public String getRutine_resttime() {
		return rutine_resttime;
	}

	public void setRutine_resttime(String rutine_resttime) {
		this.rutine_resttime = rutine_resttime;
	}

	
	
}
