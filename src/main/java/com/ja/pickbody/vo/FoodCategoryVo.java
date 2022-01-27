package com.ja.pickbody.vo;

public class FoodCategoryVo {

	private int food_category_no;
	private String food_category_name;
	private String food_category_unit;

	public FoodCategoryVo() {
		super();
	}

	public FoodCategoryVo(int food_category_no, String food_category_name, String food_category_unit) {
		super();
		this.food_category_no = food_category_no;
		this.food_category_name = food_category_name;
		this.food_category_unit = food_category_unit;
	}

	public int getFood_category_no() {
		return food_category_no;
	}

	public void setFood_category_no(int food_category_no) {
		this.food_category_no = food_category_no;
	}

	public String getFood_category_name() {
		return food_category_name;
	}

	public void setFood_category_name(String food_category_name) {
		this.food_category_name = food_category_name;
	}

	public String getFood_category_unit() {
		return food_category_unit;
	}

	public void setFood_category_unit(String food_category_unit) {
		this.food_category_unit = food_category_unit;
	}

}
