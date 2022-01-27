package com.ja.pickbody.vo;

public class GoalCategoryVo {

	int goal_category_no;
	String goal_category_name;

	public GoalCategoryVo() {
		super();
	}

	public GoalCategoryVo(int goal_category_no, String goal_category_name) {
		super();
		this.goal_category_no = goal_category_no;
		this.goal_category_name = goal_category_name;
	}

	public int getGoal_category_no() {
		return goal_category_no;
	}

	public void setGoal_category_no(int goal_category_no) {
		this.goal_category_no = goal_category_no;
	}

	public String getGoal_category_name() {
		return goal_category_name;
	}

	public void setGoal_category_name(String goal_category_name) {
		this.goal_category_name = goal_category_name;
	}

}
