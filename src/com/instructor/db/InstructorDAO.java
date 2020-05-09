package com.instructor.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.plaf.synth.SynthSeparatorUI;

public class InstructorDAO {
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

	
	/*indao.insertlectures();*/
	public void insertlectures(LectureDTO ldto) {
		// TODO Auto-generated method stub
		System.out.println("insertlectures(ldto)");
		
		int num = 0;
		try {
			con=getConnection();
			sql = "select max(l_number) from lecture";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt("max(l_number)")+1;
			}
			System.out.println("lecture num");
			
			sql = "insert into lecture"
					+ "(l_number,l_m_name,l_m_id,l_reg_date,l_content,l_type,l_type2,l_type3,l_price,l_pct,l_img,l_tag,l_goods,pct_date,paynum,l_title) "
					+ "value(?,?,?,now(),?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, ldto.getL_m_name());
			pstmt.setString(3, ldto.getL_m_id());
			/*reg_date*/
			pstmt.setString(4, ldto.getL_content());
			pstmt.setString(5, ldto.getL_type());
			pstmt.setString(6, ldto.getL_type());
			pstmt.setString(7, ldto.getL_type());
			pstmt.setInt(8, ldto.getL_price());
			pstmt.setInt(9, ldto.getL_pct());
			pstmt.setString(10, ldto.getL_img());
			pstmt.setString(11, ldto.getL_tag());
			pstmt.setInt(12, ldto.getL_goods());
			/*pct_date*/
			pstmt.setInt(13, ldto.getPaynum());
			pstmt.setString(14, ldto.getL_title());
			
			pstmt.executeUpdate();
			System.out.println("강의 등록 성공");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("강의 등록 실패");
			
		}finally{
			closeDB();
		}
		
		
		
	}
	/*indao.insertlectures();*/





}
