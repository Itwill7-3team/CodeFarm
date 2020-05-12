package com.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.lecture.db.LectureDTO;


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
	public ArrayList<Map<String,Object>> getReviewList(){
		//별점 게시판 리스트 가져오는 메서드
		ArrayList<Map<String, Object>> reviewlist=new ArrayList<Map<String,Object>>();
		try{
			con=getConnection();
			sql="select * from r_board";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				Map<String, Object> reviewdata= new HashMap<String,Object>();
				ReviewDTO rdto =new ReviewDTO();
				rdto.setR_num(rs.getInt("r_num"));
				rdto.setR_l_num(rs.getInt("r_l_num"));
				rdto.setR_content(rs.getString("r_content"));
				rdto.setR_writer(rs.getString("r_writer"));
				rdto.setR_rating(rs.getInt("r_rating"));
				rdto.setR_re_lev(rs.getInt("r_re_lev"));
				rdto.setR_re_ref(rs.getInt("r_re_ref"));
				rdto.setR_re_seq(rs.getInt("r_re_seq"));
				rdto.setR_reg_date(rs.getTimestamp("r_reg_date"));
				reviewdata.put("rdto", rdto);
				
				sql="select * from lecture where l_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("r_l_num"));
				
				rs2=pstmt.executeQuery();
				if(rs2.next()){
					LectureDTO ldto= new LectureDTO();
					ldto.setL_number(rs.getInt("l_num"));
					ldto.setL_m_name(rs2.getString("l_m_name"));
					ldto.setL_m_id(rs2.getString("l_m_id"));
					ldto.setL_reg_date(rs2.getTimestamp("l_reg_date"));
					ldto.setL_content(rs2.getString("l_content"));
					ldto.setL_type(rs2.getString("l_type"));
					ldto.setL_type2(rs2.getString("l_type2"));
					ldto.setL_type3(rs2.getString("l_type3"));
					ldto.setL_price(rs2.getInt("l_price"));
					ldto.setL_pct(rs2.getInt("l_pct"));
					ldto.setL_img(rs2.getString("l_img"));
					ldto.setL_tag(rs2.getString("l_tag"));
					ldto.setL_goods(rs2.getInt("l_goods"));
					ldto.setPct_date(rs2.getTimestamp("pct_date"));
					ldto.setPaynum(rs2.getInt("paynum"));
					ldto.setL_title(rs2.getString("l_title"));
				}
				
				reviewlist.add(reviewdata);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return reviewlist;
	}
}
