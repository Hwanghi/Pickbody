package com.ja.pickbody.vo;

public class SellImageVo {

private	int sellImage_no;
private int sell_no;
private String sellImage_link;
private String sellImage_original_filename;
public SellImageVo() {
	super();
}
public SellImageVo(int sellImage_no, int sell_no, String sellImage_link, String sellImage_original_filename) {
	super();
	this.sellImage_no = sellImage_no;
	this.sell_no = sell_no;
	this.sellImage_link = sellImage_link;
	this.sellImage_original_filename = sellImage_original_filename;
}
public int getSellImage_no() {
	return sellImage_no;
}
public void setSellImage_no(int sellImage_no) {
	this.sellImage_no = sellImage_no;
}
public int getSell_no() {
	return sell_no;
}
public void setSell_no(int sell_no) {
	this.sell_no = sell_no;
}
public String getSellImage_link() {
	return sellImage_link;
}
public void setSellImage_link(String sellImage_link) {
	this.sellImage_link = sellImage_link;
}
public String getSellImage_original_filename() {
	return sellImage_original_filename;
}
public void setSellImage_original_filename(String sellImage_original_filename) {
	this.sellImage_original_filename = sellImage_original_filename;
}
	
}
