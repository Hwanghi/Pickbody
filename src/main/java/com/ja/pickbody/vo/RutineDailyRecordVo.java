package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RutineDailyRecordVo {
	
	private int rutine_record_no;
	private int rutine_no;
	private String rutine_record_time;
	
	public RutineDailyRecordVo() {
		super();
	}

	public RutineDailyRecordVo(int rutine_record_no, int rutine_no, String rutine_record_time) {
		super();
		this.rutine_record_no = rutine_record_no;
		this.rutine_no = rutine_no;
		this.rutine_record_time = rutine_record_time;
	}

	public int getRutine_record_no() {
		return rutine_record_no;
	}

	public void setRutine_record_no(int rutine_record_no) {
		this.rutine_record_no = rutine_record_no;
	}

	public int getRutine_no() {
		return rutine_no;
	}

	public void setRutine_no(int rutine_no) {
		this.rutine_no = rutine_no;
	}

	public String getRutine_record_time() {
		return rutine_record_time;
	}

	public void setRutine_record_time(String rutine_record_time) {
		this.rutine_record_time = rutine_record_time;
	}

	
	
	
}
