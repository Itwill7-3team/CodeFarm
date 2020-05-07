package com.lecture.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LectureDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	public  LectureDAO() {//기본 생성자
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
	
	// getLectureDetail()
		public LectureDTO getLectureDetail(int l_number){
			LectureDTO ldto = null;
			try {
				System.out.print("getLectureDetail() : ");
				sql = "select "
					+ "  l_name,    l_id,   l_reg_date,  l_content,  l_type, "
					+ "  l_price,   l_pct,  l_img,       l_tag,      l_goods, "
					+ "  pct_date,  paynum "
					+ "from lecture "
					+ "where l_number = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, l_number);
				rs = pstmt.executeQuery();
				if(rs.next()){
					ldto = new LectureDTO();
					ldto.setL_number(l_number);
					ldto.setL_m_name(rs.getString("l_name"));
					ldto.setL_m_id(rs.getString("l_id"));
					ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
					ldto.setL_content(rs.getString("l_content"));
					ldto.setL_type(rs.getString("l_type"));
					ldto.setL_price(rs.getInt("l_price"));
					ldto.setL_pct(rs.getInt("l_pct"));
					ldto.setL_img(rs.getString("l_img"));
					ldto.setL_tag(rs.getString("l_tag"));
					ldto.setL_goods(rs.getInt("l_goods"));
					ldto.setPct_date(rs.getTimestamp("pct_date"));
					ldto.setPaynum(rs.getInt("paynum"));
				}
				System.out.println("강의 상세정보 저장 완료");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return ldto;
		}
		// getLectureDetail()
}
