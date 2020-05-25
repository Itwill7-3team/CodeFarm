package com.blog.db;

import java.sql.Timestamp;

/**
 * @author ITWILL
 *
 */
public class BlogDTO {
	/* blog
b_num int(11) AI PK 
b_title varchar(45) 
b_img varchar(500) 
b_content text 
b_writer varchar(45) 
b_reg_date timestamp
b_ip varchar(200)
*/
	
	private int b_num;
	private String b_title;
	private String b_img;
	private String b_content;
	private String b_writer;
	private Timestamp b_reg_date;
	private String b_ip;
	public int getB_num() {
		return b_num;
	}
	public String getB_img() {
		return b_img;
	}
	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public Timestamp getB_reg_date() {
		return b_reg_date;
	}
	public void setB_reg_date(Timestamp b_reg_date) {
		this.b_reg_date = b_reg_date;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	@Override
	public String toString() {
		return "BlogDTO [b_num=" + b_num + ", b_title=" + b_title + ", b_img=" + b_img + ", b_content=" + b_content
				+ ", b_writer=" + b_writer + ", b_reg_date=" + b_reg_date + ", b_ip=" + b_ip + "]";
	}
	
	
	
}
