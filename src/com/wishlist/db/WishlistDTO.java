package com.wishlist.db;

import java.sql.Timestamp;

public class WishlistDTO {

	private int w_num;			//위시리스트 번호
	private String w_m_id;		//위시리스트 회원 아이디
	private int w_l_num;		//위시리스트 강의 번호
	private Timestamp w_date;	//위시리스트 등록 일자
	
	//setter getter
	public int getW_num() {
		return w_num;
	}
	public void setW_num(int w_num) {
		this.w_num = w_num;
	}
	public String getW_m_id() {
		return w_m_id;
	}
	public void setW_m_id(String w_m_id) {
		this.w_m_id = w_m_id;
	}
	public int getW_l_num() {
		return w_l_num;
	}
	public void setW_l_num(int w_l_num) {
		this.w_l_num = w_l_num;
	}
	public Timestamp getW_date() {
		return w_date;
	}
	public void setW_date(Timestamp w_date) {
		this.w_date = w_date;
	}
	
	//toString
	@Override
	public String toString() {
		return "wishlistDTO [w_num=" + w_num + ", w_m_id=" + w_m_id + ", w_l_num=" + w_l_num + ", w_date=" + w_date
				+ "]";
	}
	
	
	
	
}
