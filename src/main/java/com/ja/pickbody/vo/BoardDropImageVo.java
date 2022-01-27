package com.ja.pickbody.vo;

public class BoardDropImageVo {

		private int image_no;
		private int drop_no;
		private String image_link;
		private String image_original_filename;
		
		public BoardDropImageVo() {
			super();
		}

		public BoardDropImageVo(int image_no, int drop_no, String image_link, String image_original_filename) {
			super();
			this.image_no = image_no;
			this.drop_no = drop_no;
			this.image_link = image_link;
			this.image_original_filename = image_original_filename;
		}

		public int getImage_no() {
			return image_no;
		}

		public void setImage_no(int image_no) {
			this.image_no = image_no;
		}

		public int getDrop_no() {
			return drop_no;
		}

		public void setDrop_no(int drop_no) {
			this.drop_no = drop_no;
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
