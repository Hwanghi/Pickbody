package com.ja.pickbody.vo;

public class DietFoodVo {

	private int diet_food_no;
	private int diet_no;
	private int food_category_no;
	private int diet_food_number;
	
	public DietFoodVo() {
		super();
	}

	public DietFoodVo(int diet_food_no, int diet_no, int food_category_no, int diet_food_number) {
		super();
		this.diet_food_no = diet_food_no;
		this.diet_no = diet_no;
		this.food_category_no = food_category_no;
		this.diet_food_number = diet_food_number;
	}

	public int getDiet_food_no() {
		return diet_food_no;
	}

	public void setDiet_food_no(int diet_food_no) {
		this.diet_food_no = diet_food_no;
	}

	public int getDiet_no() {
		return diet_no;
	}

	public void setDiet_no(int diet_no) {
		this.diet_no = diet_no;
	}

	public int getFood_category_no() {
		return food_category_no;
	}

	public void setFood_category_no(int food_category_no) {
		this.food_category_no = food_category_no;
	}

	public int getDiet_food_number() {
		return diet_food_number;
	}

	public void setDiet_food_number(int diet_food_number) {
		this.diet_food_number = diet_food_number;
	}
	
	
}
