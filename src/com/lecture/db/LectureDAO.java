package com.lecture.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LectureDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	public  LectureDAO() {//기본 생성자
		try{
			con=getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	private Connection getConnection() throws Exception{
		Context init=new InitialContext();
		DataSource ds=
				(DataSource) init.lookup("java:comp/env/jdbc/codefarmDB"); 
		con = ds.getConnection();
		return con;

	}//DB연결
	public void closeDB(){
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//자원 해제
	
	// getLectureList()
	public List<LectureDTO> getLecutreList(String item){
		List<LectureDTO> lectureList = new ArrayList<LectureDTO>();
		StringBuffer SQL = new StringBuffer();

		try {
		con = getConnection();
		/*SQL.append("select * from lecture");
		if(item.equals("")){
		}
			
		pstmt = con.prepareStatement(SQL.toString());
		
		if(item.equals(""))*/
			
		sql = "select * from lecture";	
		pstmt = con.prepareStatement(sql);	
		
		rs = pstmt.executeQuery();
			
		while(rs.next()){
		
			LectureDTO ldto = new LectureDTO();
			
			ldto.setL_content(rs.getString("l_content"));
			ldto.setL_goods(rs.getInt("l_goods"));
			ldto.setL_m_id(rs.getString("l_id"));
			ldto.setL_m_name(rs.getString("l_name"));
			ldto.setL_number(rs.getInt("l_number"));
			ldto.setL_pct(rs.getInt("l_pct"));
			ldto.setL_price(rs.getInt("l_price"));
			ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
			ldto.setL_tag(rs.getString("l_tag"));
			ldto.setL_type(rs.getString("l_type"));
			ldto.setPaynum(rs.getInt("paynum"));
			ldto.setPct_date(rs.getTimestamp("pct_date"));
			ldto.setL_img(rs.getString("l_img"));
			ldto.setL_title(rs.getString("l_title"));
			
			lectureList.add(ldto);
		}	
		System.out.println("사용자 강의 목록 저장완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return lectureList;
	}
	// getLectureList()
	
	
	
	
}
