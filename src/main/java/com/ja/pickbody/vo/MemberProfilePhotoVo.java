package com.ja.pickbody.vo;

public class MemberProfilePhotoVo {

	private int profilephoto_no;
    private int member_no;
    private String profilephoto_link;
    private String profilephoto_original_filename;
    
	public MemberProfilePhotoVo() {
		super();
	}

	public MemberProfilePhotoVo(int profilephoto_no, int member_no, String profilephoto_link,
			String profilephoto_original_filename) {
		super();
		this.profilephoto_no = profilephoto_no;
		this.member_no = member_no;
		this.profilephoto_link = profilephoto_link;
		this.profilephoto_original_filename = profilephoto_original_filename;
	}

	public int getProfilephoto_no() {
		return profilephoto_no;
	}

	public void setProfilephoto_no(int profilephoto_no) {
		this.profilephoto_no = profilephoto_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getProfilephoto_link() {
		return profilephoto_link;
	}

	public void setProfilephoto_link(String profilephoto_link) {
		this.profilephoto_link = profilephoto_link;
	}

	public String getProfilephoto_original_filename() {
		return profilephoto_original_filename;
	}

	public void setProfilephoto_original_filename(String profilephoto_original_filename) {
		this.profilephoto_original_filename = profilephoto_original_filename;
	}
    
	
	
}
