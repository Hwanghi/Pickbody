package com.ja.pickbody.vo;

public class TrainerGoalVo {

	private int trainer_goal_no;
	private int trainer_no;
	private int goal_category_no;
	
	public TrainerGoalVo() {
		super();
	}

	public TrainerGoalVo(int trainer_goal_no, int trainer_no, int goal_category_no) {
		super();
		this.trainer_goal_no = trainer_goal_no;
		this.trainer_no = trainer_no;
		this.goal_category_no = goal_category_no;
	}

	public int getTrainer_goal_no() {
		return trainer_goal_no;
	}

	public void setTrainer_goal_no(int trainer_goal_no) {
		this.trainer_goal_no = trainer_goal_no;
	}

	public int getTrainer_no() {
		return trainer_no;
	}

	public void setTrainer_no(int trainer_no) {
		this.trainer_no = trainer_no;
	}

	public int getGoal_category_no() {
		return goal_category_no;
	}

	public void setGoal_category_no(int goal_category_no) {
		this.goal_category_no = goal_category_no;
	}
	
	
}
