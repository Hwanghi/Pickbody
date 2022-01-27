package com.ja.pickbody.vo;

public class FollowGroupVo {

	private int group_no;
	private int member_no;
	private String group_name;
	
	public FollowGroupVo() {
		super();
	}

	public FollowGroupVo(int group_no, int member_no, String group_name) {
		super();
		this.group_no = group_no;
		this.member_no = member_no;
		this.group_name = group_name;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	
	
}
