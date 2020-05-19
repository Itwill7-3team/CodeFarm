package com.lecture.db;

import java.sql.Timestamp;

public class FileDTO {

	private int f_num;				//파일 번호
	private int f_l_num;			//강의 번호
	private int f_sec_list;			//강의 섹션 목록
	private String f_sec_name;		//강의 섹션 제목
	private int f_col_list;			//섹션 목차
	private String f_col_name;		//섹션 목차 제목
	private String f_name;			//파일 이름
	private String f_o_name;		//원본 파일 이름
	private double f_playtime;		//재생 시간
	private Timestamp f_reg_date;	//등록일
	private String f_m_email;			//ip
	
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public int getF_l_num() {
		return f_l_num;
	}
	public void setF_l_num(int f_l_num) {
		this.f_l_num = f_l_num;
	}
	public int getF_sec_list() {
		return f_sec_list;
	}
	public void setF_sec_list(int f_sec_list) {
		this.f_sec_list = f_sec_list;
	}
	public String getF_sec_name() {
		return f_sec_name;
	}
	public void setF_sec_name(String f_sec_name) {
		this.f_sec_name = f_sec_name;
	}
	public int getF_col_list() {
		return f_col_list;
	}
	public void setF_col_list(int f_col_list) {
		this.f_col_list = f_col_list;
	}
	public String getF_col_name() {
		return f_col_name;
	}
	public void setF_col_name(String f_col_name) {
		this.f_col_name = f_col_name;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_o_name() {
		return f_o_name;
	}
	public void setF_o_name(String f_o_name) {
		this.f_o_name = f_o_name;
	}
	public double getF_playtime() {
		return f_playtime;
	}
	public void setF_playtime(double f_playtime) {
		this.f_playtime = f_playtime;
	}
	public Timestamp getF_reg_date() {
		return f_reg_date;
	}
	public void setF_reg_date(Timestamp f_reg_date) {
		this.f_reg_date = f_reg_date;
	}
	
	
	public String getF_m_email() {
		return f_m_email;
	}
	public void setF_m_email(String f_m_email) {
		this.f_m_email = f_m_email;
	}
	@Override
	public String toString() {
		return "FileDTO [f_num=" + f_num + ", f_l_num=" + f_l_num + ", f_sec_list=" + f_sec_list + ", f_sec_name="
				+ f_sec_name + ", f_col_list=" + f_col_list + ", f_col_name=" + f_col_name + ", f_name=" + f_name
				+ ", f_o_name=" + f_o_name + ", f_playtime=" + f_playtime + ", f_reg_date=" + f_reg_date
				+ ", f_m_email=" + f_m_email + "]";
	}
	
	
}
