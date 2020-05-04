package com.member.db;

import java.sql.Timestamp;

public class memberDTO {

	private String m_email;		//회원이메일
	private String m_pw;		//회원 비밀번호
	private Timestamp m_regdate;//회원 가입일
	private String m_name;		//회원 이름
	private String m_phone;		//회원 전화번호
	private String m_addr;		//회원 깃or블로그주소
	private String m_rank;		//회원 등급
	private String m_intro;		//회원 소개
	
	//setter getter
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public Timestamp getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Timestamp m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_rank() {
		return m_rank;
	}
	public void setM_rank(String m_rank) {
		this.m_rank = m_rank;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	//toString
	@Override
	public String toString() {
		return "memberDTO [m_email=" + m_email + ", m_pw=" + m_pw + ", m_regdate=" + m_regdate + ", m_name=" + m_name
				+ ", m_phone=" + m_phone + ", m_addr=" + m_addr + ", m_rank=" + m_rank + ", m_intro=" + m_intro + "]";
	}
	
	
}
