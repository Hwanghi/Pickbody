package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberInbodyVo {

	private int inbody_no;
	private int  member_no;
	private double inbody_stature;
	private double inbody_weight;
	private double inbody_skeletalmusclemass;
	private double inbody_bodyfatmass;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date inbody_measureddate;
	private Date inbody_writedate;
	
	public MemberInbodyVo() {
		super();
	}

	public MemberInbodyVo(int inbody_no, int member_no, double inbody_stature, double inbody_weight,
			double inbody_skeletalmusclemass, double inbody_bodyfatmass, Date inbody_measureddate,
			Date inbody_writedate) {
		super();
		this.inbody_no = inbody_no;
		this.member_no = member_no;
		this.inbody_stature = inbody_stature;
		this.inbody_weight = inbody_weight;
		this.inbody_skeletalmusclemass = inbody_skeletalmusclemass;
		this.inbody_bodyfatmass = inbody_bodyfatmass;
		this.inbody_measureddate = inbody_measureddate;
		this.inbody_writedate = inbody_writedate;
	}

	public int getInbody_no() {
		return inbody_no;
	}

	public void setInbody_no(int inbody_no) {
		this.inbody_no = inbody_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public double getInbody_stature() {
		return inbody_stature;
	}

	public void setInbody_stature(double inbody_stature) {
		this.inbody_stature = inbody_stature;
	}

	public double getInbody_weight() {
		return inbody_weight;
	}

	public void setInbody_weight(double inbody_weight) {
		this.inbody_weight = inbody_weight;
	}

	public double getInbody_skeletalmusclemass() {
		return inbody_skeletalmusclemass;
	}

	public void setInbody_skeletalmusclemass(double inbody_skeletalmusclemass) {
		this.inbody_skeletalmusclemass = inbody_skeletalmusclemass;
	}

	public double getInbody_bodyfatmass() {
		return inbody_bodyfatmass;
	}

	public void setInbody_bodyfatmass(double inbody_bodyfatmass) {
		this.inbody_bodyfatmass = inbody_bodyfatmass;
	}

	public Date getInbody_measureddate() {
		return inbody_measureddate;
	}

	public void setInbody_measureddate(Date inbody_measureddate) {
		this.inbody_measureddate = inbody_measureddate;
	}

	public Date getInbody_writedate() {
		return inbody_writedate;
	}

	public void setInbody_writedate(Date inbody_writedate) {
		this.inbody_writedate = inbody_writedate;
	}
	
	
	
	
	
}
