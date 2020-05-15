package com.notice.db;

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


public class NoticeDAO {
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
	public ArrayList<NoticeDTO> getNoticeList(){
		//공지 게시판 리스트 가져오는 메서드
		ArrayList<NoticeDTO> noticeList=new ArrayList<NoticeDTO>();
		try{
			con=getConnection();
			sql="select * from n_board";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				NoticeDTO ndto =new NoticeDTO();
				ndto.setN_num(rs.getInt("n_num"));
				ndto.setN_title(rs.getString("n_title"));
				ndto.setN_content(rs.getString("n_content"));
				ndto.setN_writer(rs.getString("n_writer"));
				ndto.setN_re_lev(rs.getInt("n_re_lev"));
				ndto.setN_re_ref(rs.getInt("n_re_ref"));
				ndto.setN_re_seq(rs.getInt("n_re_seq"));
				ndto.setReg_date(rs.getTimestamp("reg_date"));
				
				noticeList.add(ndto);	
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return noticeList;
	}
	
	
	
	// getNoticeCount()
	public int getNoticeCount(){
		int check = 0;
		try {
			con = getConnection();
			System.out.print("getNoticeCount() : ");
			
			sql = "select count(*) from n_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = rs.getInt(1);
			}
			System.out.println("공지게시판 전체 글 개수 : " + check);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	// getNoticeCount()
	
	// getReviewList(l_number, count);
//		public ArrayList<NoticeDTO> getReviewList(int l_number, int count){
//			ArrayList<NoticeDTO> ReviewList = new ArrayList<>();
//			int startRow = 0;
//			try {
//				con = getConnection();
//				System.out.print("getReviewList() : ");
//				// 최초 2개만 로드 & 이후 전체 로드
//				if(count <= 2){ startRow = 0; }
//				else if(count > 2){ startRow = 2; }
//				sql = "select   * "
//					+ "from     n_board "
//					+ "where    n_l_num = ? "
//					+ "order by n_re_ref desc, n_re_seq asc "
//					+ "limit    ?, ?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setInt(1, l_number);
//				pstmt.setInt(2, startRow);
//				pstmt.setInt(3, count);
//				rs = pstmt.executeQuery();
//				while(rs.next()){
//					NoticeDTO ndto = new NoticeDTO();
//					ndto.setn_num(rs.getInt("n_num"));
//					ndto.setn_l_num(rs.getInt("n_l_num"));
//					ndto.setn_content(rs.getString("n_content"));
//					ndto.setn_writer(rs.getString("n_writer"));
//					ndto.setn_rating(rs.getInt("n_rating"));
//					ndto.setn_re_lev(rs.getInt("n_re_lev"));
//					ndto.setn_re_ref(rs.getInt("n_re_ref"));
//					ndto.setn_re_seq(rs.getInt("n_re_seq"));
//					ndto.setn_reg_date(rs.getTimestamp("n_reg_date"));
//					ReviewList.add(ndto);
//				}
//				System.out.println("성공 (개시글 갯수) : " + ReviewList.size());
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				closeDB();
//			}
//			return ReviewList;
//		}
		// getBoardList(l_number, count);
}
