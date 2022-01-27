package com.ja.pickbody.vo;

public class MemberDailyNoteVo {

	private int daily_note_no;
	private int schedule_no;
	private int trainer_score;
	private String member_review;
	
	public MemberDailyNoteVo() {
		super();
	}

	public MemberDailyNoteVo(int daily_note_no, int schedule_no, int trainer_score, String member_review) {
		super();
		this.daily_note_no = daily_note_no;
		this.schedule_no = schedule_no;
		this.trainer_score = trainer_score;
		this.member_review = member_review;
	}

	public int getDaily_note_no() {
		return daily_note_no;
	}

	public void setDaily_note_no(int daily_note_no) {
		this.daily_note_no = daily_note_no;
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public int getTrainer_score() {
		return trainer_score;
	}

	public void setTrainer_score(int trainer_score) {
		this.trainer_score = trainer_score;
	}

	public String getMember_review() {
		return member_review;
	}

	public void setMember_review(String member_review) {
		this.member_review = member_review;
	}
		
}
