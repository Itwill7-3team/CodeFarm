package com.review.db;

import java.sql.Timestamp;

public class ReviewDTO {

	private int r_num;			//별점글번호
	private int r_l_num;			//강의 번호
	private String r_content;		//별점글 내용
	private String r_writer;		//별점글 작성자
	private int r_rating;			//별점
	private int r_re_lev;
	private int r_re_ref;
	private int r_re_seq;
	private Timestamp r_reg_date;	//별점글 작성일자
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getR_l_num() {
		return r_l_num;
	}
	public void setR_l_num(int r_l_num) {
		this.r_l_num = r_l_num;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public int getR_rating() {
		return r_rating;
	}
	public void setR_rating(int r_rating) {
		this.r_rating = r_rating;
	}
	public int getR_re_lev() {
		return r_re_lev;
	}
	public void setR_re_lev(int r_re_lev) {
		this.r_re_lev = r_re_lev;
	}
	public int getR_re_ref() {
		return r_re_ref;
	}
	public void setR_re_ref(int r_re_ref) {
		this.r_re_ref = r_re_ref;
	}
	public int getR_re_seq() {
		return r_re_seq;
	}
	public void setR_re_seq(int r_re_seq) {
		this.r_re_seq = r_re_seq;
	}
	public Timestamp getR_reg_date() {
		return r_reg_date;
	}
	public void setR_reg_date(Timestamp r_reg_date) {
		this.r_reg_date = r_reg_date;
	}
	
	
	@Override
	public String toString() {
		return "ReviewDTO [r_num=" + r_num + ", r_l_num=" + r_l_num 
				+ ", r_content=" + r_content + ", r_writer=" + r_writer + ", r_rating=" + r_rating + ", r_re_lev="
				+ r_re_lev + ", r_re_ref=" + r_re_ref + ", r_re_seq=" + r_re_seq + ", r_reg_date=" + r_reg_date + "]";
	}
	
	
	
	
	
}
