package com.ja.pickbody.vo;

public class StoryLikeRownumVo {

	private int rownum;
	private int story_no;
	private int like_cnt;
	
	public StoryLikeRownumVo() {
		super();
	}

	public StoryLikeRownumVo(int rownum, int story_no, int like_cnt) {
		super();
		this.rownum = rownum;
		this.story_no = story_no;
		this.like_cnt = like_cnt;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getStory_no() {
		return story_no;
	}

	public void setStory_no(int story_no) {
		this.story_no = story_no;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	
	
	
}
