package com.notice.db;

import java.sql.Timestamp;

/**
 * @author ITWILL
 *
 */
public class NoticeDTO {
	/*
	 * n_board
	 * n_num int(11) AI PK 
	n_title varchar(45) 
	n_content text 
	n_writer varchar(45) 
	n_re_lev int(11) 
	n_re_ref int(11) 
	n_re_seq int(11) 
	reg_date timestamp*/
	
	private int n_num;
	private String n_title;
	private String n_content;
	private String n_writer;
	private int n_re_lev;
	private int n_re_ref;
	private int n_re_seq;
	private Timestamp reg_date;
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public int getN_re_lev() {
		return n_re_lev;
	}
	public void setN_re_lev(int n_re_lev) {
		this.n_re_lev = n_re_lev;
	}
	public int getN_re_ref() {
		return n_re_ref;
	}
	public void setN_re_ref(int n_re_ref) {
		this.n_re_ref = n_re_ref;
	}
	public int getN_re_seq() {
		return n_re_seq;
	}
	public void setN_re_seq(int n_re_seq) {
		this.n_re_seq = n_re_seq;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "NoticeDTO [n_num=" + n_num + ", n_title=" + n_title + ", n_content=" + n_content + ", n_writer="
				+ n_writer + ", n_re_lev=" + n_re_lev + ", n_re_ref=" + n_re_ref + ", n_re_seq=" + n_re_seq
				+ ", reg_date=" + reg_date + "]";
	}

	
	
}
