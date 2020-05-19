package com.lecture.db;

import java.sql.Timestamp;

public class LectureDTO {

	private int l_number;			//강의번호
	private String l_m_email;			//강사이메일
	private String l_title;			//강의제목
	private String l_abilities;			//배울수있는것
	private String l_targets;			//강의대상
	private String l_based;			//선수지식
	private String l_description;	//강의두줄요약
	private String l_content;		//강의 내용
	private String l_type;			//강의 분류
	private String l_type2;			//강의 분류
	private String l_level;			//강의 난이도
	private String l_img;			//강의 사진
	private int l_price;			//강의 가격
	private int l_goods; 			//강의 좋아요
	private int l_pct; 				//할인률
	private Timestamp l_reg_date;	//강의 제작일
	private Timestamp pct_date;		//할인날짜
	private int pay_count;			//결제 횟수
	private int record;				//강의등록여부
	private String start_msg;
	private String end_msg;
	
	//setter getter
	public int getL_number() {
		return l_number;
	}
	public void setL_number(int l_number) {
		this.l_number = l_number;
	}
	public String getL_m_email() {
		return l_m_email;
	}
	public void setL_m_email(String l_m_email) {
		this.l_m_email = l_m_email;
	}
	public String getL_title() {
		return l_title;
	}
	public void setL_title(String l_title) {
		this.l_title = l_title;
	}
	public String getL_abilities() {
		return l_abilities;
	}
	public void setL_abilities(String l_abilities) {
		this.l_abilities = l_abilities;
	}
	public String getL_targets() {
		return l_targets;
	}
	public void setL_targets(String l_targets) {
		this.l_targets = l_targets;
	}
	public String getL_based() {
		return l_based;
	}
	public void setL_based(String l_based) {
		this.l_based = l_based;
	}
	public String getL_description() {
		return l_description;
	}
	public void setL_description(String l_description) {
		this.l_description = l_description;
	}
	public String getL_content() {
		return l_content;
	}
	public void setL_content(String l_content) {
		this.l_content = l_content;
	}
	public String getL_type() {
		return l_type;
	}
	public void setL_type(String l_type) {
		this.l_type = l_type;
	}
	public String getL_type2() {
		return l_type2;
	}
	public void setL_type2(String l_type2) {
		this.l_type2 = l_type2;
	}
	public String getL_level() {
		return l_level;
	}
	public void setL_level(String l_level) {
		this.l_level = l_level;
	}
	public String getL_img() {
		return l_img;
	}
	public void setL_img(String l_img) {
		this.l_img = l_img;
	}
	public int getL_price() {
		return l_price;
	}
	public void setL_price(int l_price) {
		this.l_price = l_price;
	}
	public int getL_goods() {
		return l_goods;
	}
	public void setL_goods(int l_goods) {
		this.l_goods = l_goods;
	}
	public int getL_pct() {
		return l_pct;
	}
	public void setL_pct(int l_pct) {
		this.l_pct = l_pct;
	}
	public Timestamp getL_reg_date() {
		return l_reg_date;
	}
	public void setL_reg_date(Timestamp l_reg_date) {
		this.l_reg_date = l_reg_date;
	}
	public Timestamp getPct_date() {
		return pct_date;
	}
	public void setPct_date(Timestamp pct_date) {
		this.pct_date = pct_date;
	}
	public int getPay_count() {
		return pay_count;
	}
	public void setPay_count(int pay_count) {
		this.pay_count = pay_count;
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	
	
	public String getStart_msg() {
		return start_msg;
	}
	public void setStart_msg(String start_msg) {
		this.start_msg = start_msg;
	}
	public String getEnd_msg() {
		return end_msg;
	}
	public void setEnd_msg(String end_msg) {
		this.end_msg = end_msg;
	}
	@Override
	public String toString() {
		return "LectureDTO [l_number=" + l_number + ", l_m_email=" + l_m_email + ", l_title=" + l_title
				+ ", l_abilities=" + l_abilities + ", l_targets=" + l_targets + ", l_based=" + l_based
				+ ", l_description=" + l_description + ", l_content=" + l_content + ", l_type=" + l_type + ", l_type2="
				+ l_type2 + ", l_level=" + l_level + ", l_img=" + l_img + ", l_price=" + l_price + ", l_goods="
				+ l_goods + ", l_pct=" + l_pct + ", l_reg_date=" + l_reg_date + ", pct_date=" + pct_date
				+ ", pay_count=" + pay_count + ", record=" + record + ", start_msg=" + start_msg + ", end_msg="
				+ end_msg + "]";
	}
	

	
	
	
	
	
}
