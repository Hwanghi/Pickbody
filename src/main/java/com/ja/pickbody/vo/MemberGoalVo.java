package com.ja.pickbody.vo;

public class MemberGoalVo {

	int choice_no;
	int goal_no;
	int member_no;
	
	public MemberGoalVo() {
		super();
	}

	public MemberGoalVo(int choice_no, int goal_no, int member_no) {
		super();
		this.choice_no = choice_no;
		this.goal_no = goal_no;
		this.member_no = member_no;
	}

	public int getChoice_no() {
		return choice_no;
	}

	public void setChoice_no(int choice_no) {
		this.choice_no = choice_no;
	}

	public int getGoal_no() {
		return goal_no;
	}

	public void setGoal_no(int goal_no) {
		this.goal_no = goal_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	
}
