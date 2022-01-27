package com.ja.pickbody.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardDropVo {

		private int drop_no;
		private String drop_title;
		private String drop_content;
		private int drop_amount;
		private int drop_price;
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date drop_startdate;
		
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date drop_enddate;
		private Date drop_writedate;
		
		public BoardDropVo() {
			super();
		}

		public BoardDropVo(int drop_no, String drop_title, String drop_content, int drop_amount, int drop_price,
				Date drop_startdate, Date drop_enddate, Date drop_writedate) {
			super();
			this.drop_no = drop_no;
			this.drop_title = drop_title;
			this.drop_content = drop_content;
			this.drop_amount = drop_amount;
			this.drop_price = drop_price;
			this.drop_startdate = drop_startdate;
			this.drop_enddate = drop_enddate;
			this.drop_writedate = drop_writedate;
		}

		public int getDrop_no() {
			return drop_no;
		}

		public void setDrop_no(int drop_no) {
			this.drop_no = drop_no;
		}

		public String getDrop_title() {
			return drop_title;
		}

		public void setDrop_title(String drop_title) {
			this.drop_title = drop_title;
		}

		public String getDrop_content() {
			return drop_content;
		}

		public void setDrop_content(String drop_content) {
			this.drop_content = drop_content;
		}

		public int getDrop_amount() {
			return drop_amount;
		}

		public void setDrop_amount(int drop_amount) {
			this.drop_amount = drop_amount;
		}

		public int getDrop_price() {
			return drop_price;
		}

		public void setDrop_price(int drop_price) {
			this.drop_price = drop_price;
		}

		public Date getDrop_startdate() {
			return drop_startdate;
		}

		public void setDrop_startdate(Date drop_startdate) {
			this.drop_startdate = drop_startdate;
		}

		public Date getDrop_enddate() {
			return drop_enddate;
		}

		public void setDrop_enddate(Date drop_enddate) {
			this.drop_enddate = drop_enddate;
		}

		public Date getDrop_writedate() {
			return drop_writedate;
		}

		public void setDrop_writedate(Date drop_writedate) {
			this.drop_writedate = drop_writedate;
		}
		
		
}
