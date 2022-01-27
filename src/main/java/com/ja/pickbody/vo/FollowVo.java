package com.ja.pickbody.vo;

public class FollowVo {

	private int follow_no;
	private int group_no;
	private int member_no;
	
	public FollowVo() {
		super();
	}

	public FollowVo(int follow_no, int group_no, int member_no) {
		super();
		this.follow_no = follow_no;
		this.group_no = group_no;
		this.member_no = member_no;
	}

	public int getFollow_no() {
		return follow_no;
	}

	public void setFollow_no(int follow_no) {
		this.follow_no = follow_no;
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
	
}
