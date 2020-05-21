package com.order.db;

import java.sql.Timestamp;

public class OrderDTO {

	private int o_num;			//결제 번호
	private String o_b_num;		//결제 장바구니 번호
	private int o_l_price;		//결제 강의 가격
	private int o_l_num;		//결제 강의 번호
	private String o_l_name;	//결제 강의 이름
	private String o_m_id;			//결제 회원 아이디
	private String o_t_type;	//결제 방식
	private String o_t_bank;	//온라인 결제
	private String o_t_payer;	//입금자명
	private Timestamp o_t_date;	//결제시간
	private int o_sum_money;	//결제 가격
	private int o_status; // 주문 상태(무통장)
	private String o_t_b_reg_date;
	private String o_t_b_num;
	
	public String getO_t_b_num() {
		return o_t_b_num;
	}
	public void setO_t_b_num(String o_t_b_num) {
		this.o_t_b_num = o_t_b_num;
	}
	public String getO_t_b_reg_date() {
		return o_t_b_reg_date;
	}
	public void setO_t_b_reg_date(String o_t_b_reg_date) {
		this.o_t_b_reg_date = o_t_b_reg_date;
	}
	public int getO_status() {
		return o_status;
	}
	public void setO_status(int o_status) {
		this.o_status = o_status;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getO_b_num() {
		return o_b_num;
	}
	public void setO_b_num(String o_b_num) {
		this.o_b_num = o_b_num;
	}
	public int getO_l_price() {
		return o_l_price;
	}
	public void setO_l_price(int o_l_price) {
		this.o_l_price = o_l_price;
	}
	public int getO_l_num() {
		return o_l_num;
	}
	public void setO_l_num(int o_l_num) {
		this.o_l_num = o_l_num;
	}
	public String getO_l_name() {
		return o_l_name;
	}
	public void setO_l_name(String o_l_name) {
		this.o_l_name = o_l_name;
	}
	public String getO_m_id() {
		return o_m_id;
	}
	public void setO_m_id(String o_m_id) {
		this.o_m_id = o_m_id;
	}
	public String getO_t_type() {
		return o_t_type;
	}
	public void setO_t_type(String o_t_type) {
		this.o_t_type = o_t_type;
	}
	public String getO_t_bank() {
		return o_t_bank;
	}
	public void setO_t_bank(String o_t_bank) {
		this.o_t_bank = o_t_bank;
	}
	public String getO_t_payer() {
		return o_t_payer;
	}
	public void setO_t_payer(String o_t_payer) {
		this.o_t_payer = o_t_payer;
	}
	public Timestamp getO_t_date() {
		return o_t_date;
	}
	public void setO_t_date(Timestamp o_t_date) {
		this.o_t_date = o_t_date;
	}
	public int getO_sum_money() {
		return o_sum_money;
	}
	public void setO_sum_money(int o_sum_money) {
		this.o_sum_money = o_sum_money;
	}
	@Override
	public String toString() {
		return "OrderDTO [o_num=" + o_num + ", o_b_num=" + o_b_num + ", o_l_price=" + o_l_price + ", o_l_num=" + o_l_num
				+ ", o_l_name=" + o_l_name + ", o_m_id=" + o_m_id + ", o_t_type=" + o_t_type + ", o_t_bank=" + o_t_bank
				+ ", o_t_payer=" + o_t_payer + ", o_t_date=" + o_t_date + ", o_sum_money=" + o_sum_money + ", o_status="
				+ o_status + ", o_t_b_reg_date=" + o_t_b_reg_date + ", o_t_b_num=" + o_t_b_num + "]";
	}
	

	

	
}
