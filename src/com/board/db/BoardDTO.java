package com.board.db;

import java.sql.Timestamp;

public class BoardDTO {

	private int num;			//게시글 번호
	private String type;		//게시글 타입
	private String title; 		//게시글 제목
	private String content; 	//게시글 내용
	private String writer; 		//작성자 이름
	private int re_lev;
	private int re_ref;
	private int re_seq;
	private Timestamp reg_date;	//작성시간
	private String l_name;		//강의 이름
	// setter getter
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	public int getRe_ref() {
		return re_ref;
	}

	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

<<<<<<< HEAD
=======
	
>>>>>>> branch 'Team' of https://github.com/Itwill7-3team/LMSProject.git
	//toString
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", type=" + type + ", title=" + title + ", content=" + content + ", writer="
				+ writer + ", re_lev=" + re_lev + ", re_ref=" + re_ref + ", re_seq=" + re_seq + ", reg_date=" + reg_date
				+ ", l_name=" + l_name + "]";
	}

<<<<<<< HEAD

=======
>>>>>>> branch 'Team' of https://github.com/Itwill7-3team/LMSProject.git
	
	
}
