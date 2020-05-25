package com.quest.db;

import java.sql.Timestamp;

public class QuestDTO {

	private int q_num;			//게시글 번호
	private String q_type; 		//게시글 제목
	private String q_content; 	//게시글 내용
	private Timestamp q_reg_date;	//작성시간
	
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_type() {
		return q_type;
	}
	public void setQ_type(String q_type) {
		this.q_type = q_type;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Timestamp getQ_reg_date() {
		return q_reg_date;
	}
	public void setQ_reg_date(Timestamp q_reg_date) {
		this.q_reg_date = q_reg_date;
	}
	@Override
	public String toString() {
		return "QuestDTO [q_num=" + q_num + ", q_type=" + q_type + ", q_content=" + q_content + ", q_reg_date="
				+ q_reg_date + "]";
	}
	
	
	
	
	
	
	
	

	

	

	
	
}
