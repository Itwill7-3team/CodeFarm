package com.basket.db;

import java.sql.Timestamp;

public class BasketDTO {

	private int b_num;			//장바구니번호
	private String b_m_id;		//장바구니 회원 아이디
	private int b_l_num;		//구매한 강의 번호
	private String b_l_name;	//구매한 강의 이름
	private int b_l_price;		//구매한 강의 가격
	private Timestamp b_date;	// 구매한 시간
	
	// setter getter
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_m_id() {
		return b_m_id;
	}
	public void setB_m_id(String b_m_id) {
		this.b_m_id = b_m_id;
	}
	public int getB_l_num() {
		return b_l_num;
	}
	public void setB_l_num(int b_l_num) {
		this.b_l_num = b_l_num;
	}
	public String getB_l_name() {
		return b_l_name;
	}
	public void setB_l_name(String b_l_name) {
		this.b_l_name = b_l_name;
	}
	public int getB_l_price() {
		return b_l_price;
	}
	public void setB_l_price(int b_l_price) {
		this.b_l_price = b_l_price;
	}
	public Timestamp getB_date() {
		return b_date;
	}
	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}
	
	//toString
	
	@Override
	public String toString() {
		return "basketDTO [b_num=" + b_num + ", b_m_id=" + b_m_id + ", b_l_num=" + b_l_num + ", b_l_name=" + b_l_name
				+ ", b_l_price=" + b_l_price + ", b_date=" + b_date + "]";
	}
	
	
}
