package com.ja.pickbody.vo;

import java.util.Date;

public class StoryVo {

	private int story_no;
	private int member_no;
	private String story_content;
	private String story_img_url;
	private Date story_date;
	
	public StoryVo() {
		super();
	}

	public StoryVo(int story_no, int member_no, String story_content, String story_img_url, Date story_date) {
		super();
		this.story_no = story_no;
		this.member_no = member_no;
		this.story_content = story_content;
		this.story_img_url = story_img_url;
		this.story_date = story_date;
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

	public String getStory_content() {
		return story_content;
	}

	public void setStory_content(String story_content) {
		this.story_content = story_content;
	}

	public String getStory_img_url() {
		return story_img_url;
	}

	public void setStory_img_url(String story_img_url) {
		this.story_img_url = story_img_url;
	}

	public Date getStory_date() {
		return story_date;
	}

	public void setStory_date(Date story_date) {
		this.story_date = story_date;
	}
	
	
}
