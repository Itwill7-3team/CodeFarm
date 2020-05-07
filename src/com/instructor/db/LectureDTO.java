package com.instructor.db;

import java.sql.Timestamp;

public class LectureDTO {

	private int l_number;			//강의번호
	private String l_m_name;			//강사이름
	private String l_m_id;			//강사 아이디
	private String l_title;			//강의제목
	private String l_content;		//강의 내용
	private String l_type;			//강의 분류
	private int l_price;			//강의 가격
	private int l_pct; 				//할인률
	private String l_img;			//강의 사진
	private String l_tag;			//강의 태그
	private int l_goods; 			//강의 좋아요
	private Timestamp l_reg_date;	//강의 제작일
	private Timestamp pct_date;		//할인날짜
	private int paynum;				//결제 횟수
	
	//setter getter
	public int getL_number() {
		return l_number;
	}
	public void setL_number(int l_number) {
		this.l_number = l_number;
	}
	public String getL_m_name() {
		return l_m_name;
	}
	public void setL_m_name(String l_m_name) {
		this.l_m_name = l_m_name;
	}
	public String getL_m_id() {
		return l_m_id;
	}
	public void setL_m_id(String l_m_id) {
		this.l_m_id = l_m_id;
	}
	public String getL_title() {
		return l_title;
	}
	public void setL_title(String l_title) {
		this.l_title = l_title;
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
	public int getL_price() {
		return l_price;
	}
	public void setL_price(int l_price) {
		this.l_price = l_price;
	}
	public int getL_pct() {
		return l_pct;
	}
	public void setL_pct(int l_pct) {
		this.l_pct = l_pct;
	}
	public String getL_img() {
		return l_img;
	}
	public void setL_img(String l_img) {
		this.l_img = l_img;
	}
	public String getL_tag() {
		return l_tag;
	}
	public void setL_tag(String l_tag) {
		this.l_tag = l_tag;
	}
	public int getL_goods() {
		return l_goods;
	}
	public void setL_goods(int l_goods) {
		this.l_goods = l_goods;
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
	public int getPaynum() {
		return paynum;
	}
	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}
	
	//toString
	@Override
	public String toString() {
		return "lectureDTO [l_number=" + l_number + ", l_m_name=" + l_m_name + ", l_m_id=" + l_m_id + ", l_title="
				+ l_title + ", l_content=" + l_content + ", l_type=" + l_type + ", l_price=" + l_price + ", l_pct="
				+ l_pct + ", l_img=" + l_img + ", l_tag=" + l_tag + ", l_goods=" + l_goods + ", l_reg_date="
				+ l_reg_date + ", pct_date=" + pct_date + ", paynum=" + paynum + "]";
	}
	
	
}
