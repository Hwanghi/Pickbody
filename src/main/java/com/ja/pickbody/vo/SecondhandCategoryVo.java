package com.ja.pickbody.vo;

public class SecondhandCategoryVo {
	
	private int small_no;
	private int big_no;
	private String small_name;
	public SecondhandCategoryVo(int small_no, int big_no, String small_name) {
		super();
		this.small_no = small_no;
		this.big_no = big_no;
		this.small_name = small_name;
	}
	
	
	
	public SecondhandCategoryVo() {
		super();
	}



	public int getSmall_no() {
		return small_no;
	}
	public void setSmall_no(int small_no) {
		this.small_no = small_no;
	}
	public int getBig_no() {
		return big_no;
	}
	public void setBig_no(int big_no) {
		this.big_no = big_no;
	}
	public String getSmall_name() {
		return small_name;
	}
	public void setSmall_name(String small_name) {
		this.small_name = small_name;
	}
	
	

}
