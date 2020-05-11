package com.question.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.review.db.ReviewDTO;

public class QuestionDAO {
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
	
	public ArrayList<QuestionDTO> getBoardList(){
		ArrayList<QuestionDTO> boardList= new ArrayList<QuestionDTO>();
		try{
			con=getConnection();
			sql="select * from q_board";
			pstmt=con.prepareStatement(sql);
			
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				QuestionDTO qdto=new QuestionDTO();
				qdto.setQ_num(rs.getInt("q_num"));
				qdto.setQ_l_num(rs.getInt("q_l_num"));
				qdto.setQ_l_name(rs.getString("q_l_name"));
				qdto.setQ_title(rs.getString("q_title"));
				qdto.setQ_content(rs.getString("q_content"));
				qdto.setQ_writer(rs.getString("q_writer"));
				qdto.setQ_re_lev(rs.getInt("q_re_lev"));
				qdto.setQ_re_ref(rs.getInt("q_re_ref"));
				qdto.setQ_re_seq(rs.getInt("q_re_seq"));
				qdto.setQ_reg_date(rs.getTimestamp("q_reg_date"));
				boardList.add(qdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		
		return boardList;
	}
	public QuestionDTO getBoard(int num){
		QuestionDTO qdto= new QuestionDTO();
		try{
			con=getConnection();
			sql="select * from q_board where num = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				qdto.setQ_num(rs.getInt("q_num"));
				qdto.setQ_l_num(rs.getInt("q_l_num"));
				qdto.setQ_l_name(rs.getString("q_l_name"));
				qdto.setQ_title(rs.getString("q_title"));
				qdto.setQ_content(rs.getString("q_content"));
				qdto.setQ_writer(rs.getString("q_writer"));
				qdto.setQ_re_lev(rs.getInt("q_re_lev"));
				qdto.setQ_re_ref(rs.getInt("q_re_ref"));
				qdto.setQ_re_seq(rs.getInt("q_re_seq"));
				qdto.setQ_reg_date(rs.getTimestamp("q_reg_date"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return qdto;
	}
	
	
	
}
