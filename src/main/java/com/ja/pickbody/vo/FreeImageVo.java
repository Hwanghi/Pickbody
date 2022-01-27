package com.ja.pickbody.vo;

public class FreeImageVo {
	
	
private int image_no;

private int free_no;

private String image_link;

private String image_original_filename;

public FreeImageVo() {
	super();
}

public FreeImageVo(int image_no, int free_no, String image_link, String image_original_filename) {
	super();
	this.image_no = image_no;
	this.free_no = free_no;
	this.image_link = image_link;
	this.image_original_filename = image_original_filename;
}

public int getImage_no() {
	return image_no;
}

public void setImage_no(int image_no) {
	this.image_no = image_no;
}

public int getFree_no() {
	return free_no;
}

public void setFree_no(int free_no) {
	this.free_no = free_no;
}

public String getImage_link() {
	return image_link;
}

public void setImage_link(String image_link) {
	this.image_link = image_link;
}

public String getImage_original_filename() {
	return image_original_filename;
}

public void setImage_original_filename(String image_original_filename) {
	this.image_original_filename = image_original_filename;
}
}
