package com.ask.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class AskDAO {
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
	
	//getQuestionCount()
	public int getAskCount(){
		int check = 0;
		try {
			con = getConnection();
			System.out.print("getAskCount() : ");
			
			sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = rs.getInt(1);
			}
			System.out.println("문답게시판 전체 글 개수 : " + check);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	
	public ArrayList<AskDTO> getBoardList(int startRow, int pageSize){
		ArrayList<AskDTO> boardList= new ArrayList<AskDTO>();
		try{
			con=getConnection();
			sql="select * from board "
					+ "order by re_ref desc, re_seq asc "
					+ "limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1); //시작행-1
			pstmt.setInt(2, pageSize); //가져갈 글의 개수
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				AskDTO adto=new AskDTO();
				adto.setNum(rs.getInt("num"));
				adto.setL_num(rs.getInt("l_num"));
				adto.setType(rs.getString("type"));
				adto.setTitle(rs.getString("title"));
				adto.setContent(rs.getString("content"));
				adto.setWriter(rs.getString("writer"));
				adto.setRe_lev(rs.getInt("re_lev"));
				adto.setRe_ref(rs.getInt("re_ref"));
				adto.setRe_seq(rs.getInt("re_seq"));
				adto.setReg_date(rs.getTimestamp("reg_date"));
				boardList.add(adto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardList;
	}
	
	
	public AskDTO getBoard(int num){
		AskDTO adto= new AskDTO();
		try{
			con=getConnection();
			sql="select * from board where num = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				adto.setNum(rs.getInt("num"));
				adto.setL_num(rs.getInt("l_num"));
//				adto.setQ_l_name(rs.getString("q_l_name"));
				adto.setType(rs.getString("type"));
				adto.setTitle(rs.getString("title"));
				adto.setContent(rs.getString("content"));
				adto.setWriter(rs.getString("writer"));
				adto.setRe_lev(rs.getInt("re_lev"));
				adto.setRe_ref(rs.getInt("re_ref"));
				adto.setRe_seq(rs.getInt("re_seq"));
				adto.setReg_date(rs.getTimestamp("reg_date"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return adto;
	}
	
	
	
}
