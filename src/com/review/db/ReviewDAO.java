package com.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	ResultSet rs2= null;
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
			if(rs2 !=null) rs2.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//자원 해제
	public ArrayList<ReviewDTO> getReviewList(){
		//별점 게시판 리스트 가져오는 메서드
		ArrayList<ReviewDTO> reviewlist=new ArrayList<ReviewDTO>();
		try{
			con=getConnection();
			sql="select * from r_board";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				ReviewDTO rdto =new ReviewDTO();
				rdto.setR_num(rs.getInt("r_num"));
				rdto.setR_l_num(rs.getInt("r_l_num"));
				rdto.setR_l_title(rs.getString("r_l_title"));
				rdto.setR_content(rs.getString("r_content"));
				rdto.setR_writer(rs.getString("r_writer"));
				rdto.setR_rating(rs.getInt("r_rating"));
				rdto.setR_re_lev(rs.getInt("r_re_lev"));
				rdto.setR_re_ref(rs.getInt("r_re_ref"));
				rdto.setR_re_seq(rs.getInt("r_re_seq"));
				rdto.setR_reg_date(rs.getTimestamp("r_reg_date"));
				reviewlist.add(rdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return reviewlist;
	}
}
