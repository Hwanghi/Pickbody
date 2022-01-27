package com.ja.pickbody.vo;

import java.util.Date;

public class StoryLikeVo {

	private int st_like_no;
	private int story_no;
	private int member_no;
	private Date st_like_date;
	
	public StoryLikeVo() {
		super();
	}

	public StoryLikeVo(int st_like_no, int story_no, int member_no, Date st_like_date) {
		super();
		this.st_like_no = st_like_no;
		this.story_no = story_no;
		this.member_no = member_no;
		this.st_like_date = st_like_date;
	}

	public int getSt_like_no() {
		return st_like_no;
	}

	public void setSt_like_no(int st_like_no) {
		this.st_like_no = st_like_no;
	}

	public int getStory_no() {
		return story_no;
	}

	public void setStory_no(int story_no) {
		this.story_no = story_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Date getSt_like_date() {
		return st_like_date;
	}

	public void setSt_like_date(Date st_like_date) {
		this.st_like_date = st_like_date;
	}
	
	
	
}
