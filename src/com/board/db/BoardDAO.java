package com.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	public  BoardDAO() {//기본 생성자
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
	
	public ArrayList<BoardDTO> getboardList(String type){
		ArrayList<BoardDTO> boardlist =new ArrayList<BoardDTO>();
		try{
			sql="select * from board where type=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, type);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt("num"));
				bdto.setType(rs.getString("type"));
				bdto.setTitle(rs.getString("title"));
				bdto.setContent(rs.getString("content"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setRe_lev(rs.getInt("re_lev"));
				bdto.setRe_ref(rs.getInt("re_ref"));
				bdto.setRe_seq(rs.getInt("re_seq"));
				bdto.setReg_date(rs.getTimestamp("reg_date"));
				bdto.setL_name(rs.getString("l_name"));
				boardlist.add(bdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardlist;
	}
}
