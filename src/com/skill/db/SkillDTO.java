package com.skill.db;

public class SkillDTO {
	
	private int s_num;
	private String s_name;
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	@Override
	public String toString() {
		return "SkillDTO [s_num=" + s_num + ", s_name=" + s_name + "]";
	}
	
	
	
}
