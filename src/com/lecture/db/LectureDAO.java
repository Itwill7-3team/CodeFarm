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
	
	public List<LectureDTO> getLecutreList(String item){

		List<LectureDTO> lectureList = new ArrayList<LectureDTO>();
		
		StringBuffer SQL = new StringBuffer();

		try {
		
		/*SQL.append("select * from lecture");
		if(item.equals("")){
		}
			
		pstmt = con.prepareStatement(SQL.toString());
		
		if(item.equals(""))*/
			
		sql = "select * from lecture";	
			
		
		rs = pstmt.executeQuery();
			
		while(rs.next()){
		
			LectureDTO ldto = new LectureDTO();
			
			ldto.setL_content(rs.getString("l_content"));
			ldto.setL_goods(l_goods);
			
			
		}	
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
	
	
}
