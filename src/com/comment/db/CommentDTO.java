package com.comment.db;

import java.sql.Timestamp;

public class CommentDTO {

	private int c_num;				//덧글 번호
	private int c_b_num;			//덧글 게시글 번호
	private String c_content; 		//덧글 내용
	private String writer; 			//덧글 작성자
	private Timestamp c_reg_date;	//덧글 작성시간
	
	
	//setter getter
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getC_b_num() {
		return c_b_num;
	}
	public void setC_b_num(int c_b_num) {
		this.c_b_num = c_b_num;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getC_reg_date() {
		return c_reg_date;
	}
	public void setC_reg_date(Timestamp c_reg_date) {
		this.c_reg_date = c_reg_date;
	}
	
	//toString
	@Override
	public String toString() {
		return "commentDTO [c_num=" + c_num + ", c_b_num=" + c_b_num + ", c_content=" + c_content + ", writer=" + writer
				+ ", c_reg_date=" + c_reg_date + "]";
	}
	
	
	
	
}
