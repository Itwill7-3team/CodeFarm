package com.quest.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.review.db.ReviewDTO;

public class QuestDAO {
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
	public int getQuestCount(){
		int check = 0;
		try {
			con = getConnection();
			System.out.print("getQuestCount() : ");
			
			sql = "select count(*) from q_board";
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
	
	public ArrayList<QuestDTO> getBoardList(int startRow, int pageSize){
		ArrayList<QuestDTO> boardList= new ArrayList<QuestDTO>();
		try{
			con=getConnection();
			sql="select * from q_board "
					//+ "order by q_re_ref desc, q_re_seq asc "
					+ "limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1); //시작행-1
			pstmt.setInt(2, pageSize); //가져갈 글의 개수
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				QuestDTO qdto=new QuestDTO();
				qdto.setQ_num(rs.getInt("q_num"));
				//qdto.setQ_l_num(rs.getInt("q_l_num"));
				qdto.setQ_type(rs.getString("q_type"));
				qdto.setQ_content(rs.getString("q_content"));
				//qdto.setQ_writer(rs.getString("q_writer"));
				//qdto.setQ_re_lev(rs.getInt("q_re_lev"));
				//qdto.setQ_re_ref(rs.getInt("q_re_ref"));
				//qdto.setQ_re_seq(rs.getInt("q_re_seq"));
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
	
	
	/*public QuestDTO getBoard(int num){
		QuestDTO qdto= new QuestDTO();
		try{
			con=getConnection();
			sql="select * from q_board where q_num = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				qdto.setQ_num(rs.getInt("q_num"));
				//qdto.setQ_l_num(rs.getInt("q_l_num"));
//				qdto.setQ_l_name(rs.getString("q_l_name"));
				//qdto.setQ_title(rs.getString("q_title"));
				qdto.setQ_content(rs.getString("q_content"));
				//qdto.setQ_writer(rs.getString("q_writer"));
				//qdto.setQ_re_lev(rs.getInt("q_re_lev"));
				//qdto.setQ_re_ref(rs.getInt("q_re_ref"));
				//qdto.setQ_re_seq(rs.getInt("q_re_seq"));
				qdto.setQ_reg_date(rs.getTimestamp("q_reg_date"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return qdto;
	}*/
	
	public void insertQuest(QuestDTO qdto){
		try{
			con=getConnection();
			sql="insert into q_board (q_type,q_content) values(?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, qdto.getQ_type());
			pstmt.setString(2, qdto.getQ_content());
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	
	
}
