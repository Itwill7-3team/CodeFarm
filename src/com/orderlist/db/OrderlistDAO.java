package com.orderlist.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderlistDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	
	
	
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


	public void addOrder(OrderlistDTO oldto, List basketList, List lectureList) {
		// TODO Auto-generated method stub
		
		int o_num = 0;
		int o_b_num = 0;
		
		// 주문번호 변경을 하기위한 객체
		Calendar cal = Calendar.getInstance();
		// -> 시스템의 시간정보를 가져다 사용(싱글턴패턴)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
