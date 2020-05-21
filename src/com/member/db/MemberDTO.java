package com.member.db;

import java.sql.Timestamp;

public class MemberDTO {

	private String m_email;		//회원이메일
	private String m_nick;		//닉네임
	private String m_pw;		//회원 비밀번호
	private Timestamp m_regdate;//회원 가입일
	private String m_name;		//회원 이름
	private String m_phone;		//회원 전화번호
	private String m_addr;		//회원 깃or블로그주소
	private int m_rank;		//회원 등급
	private String m_intro;		//회원 소개
	private String m_emailHash;	//인증해시 코드
	private boolean m_emailCheck;//이메일 인증 여부
	//setter getter
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
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
	public int getM_rank() {
		return m_rank;
	}
	public void setM_rank(int m_rank) {
		this.m_rank = m_rank;
	}
	public String getM_intro() {
		return m_intro;
	}
	public void setM_intro(String m_intro) {
		this.m_intro = m_intro;
	}
	public String getM_emailHash() {
		return m_emailHash;
	}
	public void setM_emailHash(String m_emailHash) {
		this.m_emailHash = m_emailHash;
	}
	public boolean isM_emailCheck() {
		return m_emailCheck;
	}
	public void setM_emailCheck(boolean m_emailCheck) {
		this.m_emailCheck = m_emailCheck;
	}
	//toString
	@Override
	public String toString() {
		return "MemberDTO [m_email=" + m_email + ", m_nick=" + m_nick + ", m_pw=" + m_pw + ", m_regdate=" + m_regdate
				+ ", m_name=" + m_name + ", m_phone=" + m_phone + ", m_addr=" + m_addr + ", m_rank=" + m_rank
				+ ", m_intro=" + m_intro + ", m_emailHash=" + m_emailHash + ", m_emailCheck=" + m_emailCheck + "]";
	}
	
	
	

	
	
}
