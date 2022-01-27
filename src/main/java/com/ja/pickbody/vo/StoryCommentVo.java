package com.ja.pickbody.vo;

import java.util.Date;

public class StoryCommentVo {

	private int st_comment_no;
	private int story_no;
	private int member_no;
	private String st_comment_content;
	private Date st_comment_date;
	
	public StoryCommentVo() {
		super();
	}

	public StoryCommentVo(int st_comment_no, int story_no, int member_no, String st_comment_content,
			Date st_comment_date) {
		super();
		this.st_comment_no = st_comment_no;
		this.story_no = story_no;
		this.member_no = member_no;
		this.st_comment_content = st_comment_content;
		this.st_comment_date = st_comment_date;
	}

	public int getSt_comment_no() {
		return st_comment_no;
	}

	public void setSt_comment_no(int st_comment_no) {
		this.st_comment_no = st_comment_no;
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

	public String getSt_comment_content() {
		return st_comment_content;
	}

	public void setSt_comment_content(String st_comment_content) {
		this.st_comment_content = st_comment_content;
	}

	public Date getSt_comment_date() {
		return st_comment_date;
	}

	public void setSt_comment_date(Date st_comment_date) {
		this.st_comment_date = st_comment_date;
	}
	
	
}
