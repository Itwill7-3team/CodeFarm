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
	
	//insertNotice(ndto)
	public int insertNotice(NoticeDTO ndto) {
		int check=-1;
		int num=0;
		//1: 성공/ -1: 실패
		
		try {
			//1,2
			con=getConnection();
			
			//3 글번호 => 오토인크리먼트
			sql="select max(n_num) from n_board";
			pstmt= con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt("max(n_num)")+1;
			}
			System.out.println("글번호:"+num);
			//3 글작성메서드
			sql="insert into n_board (n_title,n_content,n_writer,n_re_ref,n_re_lev,n_re_seq) values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, ndto.getN_title());
			pstmt.setString(2, ndto.getN_content());
			pstmt.setString(3, ndto.getN_writer());
			pstmt.setInt(4, num); //re_ref : 답글그룹 ( 일반글 번호와 동일 )
			pstmt.setInt(5, 0); //re_lev :초기화 => 답글 들여쓰기
			pstmt.setInt(6, 0); //re_seq :초기화 => 답글 순서
			check=pstmt.executeUpdate();
			//4
			if(check==1){
				System.out.println("글쓰기 성공"+check);
			}else{
				System.out.println("글쓰기 실패"+check);
			}					
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	//insertNotice(ndto)
	
}
