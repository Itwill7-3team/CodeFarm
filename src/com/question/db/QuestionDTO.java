package com.question.db;

import java.sql.Timestamp;

public class QuestionDTO {

	private int q_num;			//게시글 번호
	private int q_l_num;		//게시글 강의 번호
	private String q_l_name;		//게시글 강의 이름
	private String q_title; 		//게시글 제목
	private String q_content; 	//게시글 내용
	private String q_writer; 		//작성자 이름
	private int q_re_lev;			
	private int q_re_ref;
	private int q_re_seq;
	private Timestamp q_reg_date;	//작성시간
	
	//setter getter
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public int getQ_l_num() {
		return q_l_num;
	}
	public void setQ_l_num(int q_l_num) {
		this.q_l_num = q_l_num;
	}
	public String getQ_l_name() {
		return q_l_name;
	}
	public void setQ_l_name(String q_l_name) {
		this.q_l_name = q_l_name;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public int getQ_re_lev() {
		return q_re_lev;
	}
	public void setQ_re_lev(int q_re_lev) {
		this.q_re_lev = q_re_lev;
	}
	public int getQ_re_ref() {
		return q_re_ref;
	}
	public void setQ_re_ref(int q_re_ref) {
		this.q_re_ref = q_re_ref;
	}
	public int getQ_re_seq() {
		return q_re_seq;
	}
	public void setQ_re_seq(int q_re_seq) {
		this.q_re_seq = q_re_seq;
	}
	public Timestamp getQ_reg_date() {
		return q_reg_date;
	}
	public void setQ_reg_date(Timestamp q_reg_date) {
		this.q_reg_date = q_reg_date;
	}
	
	//toString
	@Override
	public String toString() {
		return "QuestionDTO [q_num=" + q_num + ", q_l_num=" + q_l_num + ", q_l_name=" + q_l_name + ", q_title="
				+ q_title + ", q_content=" + q_content + ", q_writer=" + q_writer + ", q_re_lev=" + q_re_lev
				+ ", q_re_ref=" + q_re_ref + ", q_re_seq=" + q_re_seq + ", q_reg_date=" + q_reg_date + ", getQ_num()="
				+ getQ_num() + ", getQ_l_num()=" + getQ_l_num() + ", getQ_l_name()=" + getQ_l_name() + ", getQ_title()="
				+ getQ_title() + ", getQ_content()=" + getQ_content() + ", getQ_writer()=" + getQ_writer()
				+ ", getQ_re_lev()=" + getQ_re_lev() + ", getQ_re_ref()=" + getQ_re_ref() + ", getQ_re_seq()="
				+ getQ_re_seq() + ", getQ_reg_date()=" + getQ_reg_date() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
	
	

	

	

	
	
}
