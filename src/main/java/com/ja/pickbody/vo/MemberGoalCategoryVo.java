package com.ja.pickbody.vo;

public class MemberGoalCategoryVo {

	int goal_no;
	String goal_name;
	
	public MemberGoalCategoryVo() {
		super();
	}

	public MemberGoalCategoryVo(int goal_no, String goal_name) {
		super();
		this.goal_no = goal_no;
		this.goal_name = goal_name;
	}

	public int getGoal_no() {
		return goal_no;
	}

	public void setGoal_no(int goal_no) {
		this.goal_no = goal_no;
	}

	public String getGoal_name() {
		return goal_name;
	}

	public void setGoal_name(String goal_name) {
		this.goal_name = goal_name;
	}
	
	
	
	
}
