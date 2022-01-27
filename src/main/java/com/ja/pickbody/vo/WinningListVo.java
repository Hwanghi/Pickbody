package com.ja.pickbody.vo;

public class WinningListVo {
	
	private int winning_no;
	private int drop_no;
	private int member_no;
	 
	public WinningListVo() {
		super();
	}

	public WinningListVo(int winning_no, int drop_no, int member_no) {
		super();
		this.winning_no = winning_no;
		this.drop_no = drop_no;
		this.member_no = member_no;
	}

	public int getWinning_no() {
		return winning_no;
	}

	public void setWinning_no(int winning_no) {
		this.winning_no = winning_no;
	}

	public int getDrop_no() {
		return drop_no;
	}

	public void setDrop_no(int drop_no) {
		this.drop_no = drop_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	 
	 
}
