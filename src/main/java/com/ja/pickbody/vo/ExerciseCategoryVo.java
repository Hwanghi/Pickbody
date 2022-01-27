package com.ja.pickbody.vo;

public class ExerciseCategoryVo {

	private int exercise_category_no;
	private String exercise_category_name;
	private String exercise_category_link;
	
	public ExerciseCategoryVo() {
		super();
	}

	public ExerciseCategoryVo(int exercise_category_no, String exercise_category_name, String exercise_category_link) {
		super();
		this.exercise_category_no = exercise_category_no;
		this.exercise_category_name = exercise_category_name;
		this.exercise_category_link = exercise_category_link;
	}

	public int getExercise_category_no() {
		return exercise_category_no;
	}

	public void setExercise_category_no(int exercise_category_no) {
		this.exercise_category_no = exercise_category_no;
	}

	public String getExercise_category_name() {
		return exercise_category_name;
	}

	public void setExercise_category_name(String exercise_category_name) {
		this.exercise_category_name = exercise_category_name;
	}

	public String getExercise_category_link() {
		return exercise_category_link;
	}

	public void setExercise_category_link(String exercise_category_link) {
		this.exercise_category_link = exercise_category_link;
	}
	
	
}
