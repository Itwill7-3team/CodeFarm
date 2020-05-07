package com.basket.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.lecture.db.LectureDTO;

public class BasketDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	public  BasketDAO() {//기본 생성자
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
	

	public void basketAdd (BasketDTO bkdto) {
		int b_num = 0;
		try {
			con = getConnection();
			
			sql = "SELECT max(b_num) FROM basket";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				b_num = rs.getInt(1)+1;
			}
			System.out.println("장바구니 번호: "+b_num);
			
			sql = "INSERT INTO basket VALUES(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.setString(2, bkdto.getB_m_id());
			pstmt.setInt(3, bkdto.getB_l_num());
			pstmt.setString(4, bkdto.getB_l_name());
			pstmt.setInt(5, bkdto.getB_l_price());
			pstmt.setTimestamp(6, bkdto.getB_date());
	
			pstmt.executeUpdate();
			System.out.println("~*~*~*~*~* 장바구니 저장 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}		
	}// basketAdd(bkdto)
	
	public Vector getBasketList(String id){
		Vector vec = new Vector();
		
		ArrayList lectureList = new ArrayList();
		ArrayList basketList = new ArrayList();
		
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		
		try {
			con = getConnection();
			
			sql = "select * from basket where b_m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BasketDTO bkdto = new BasketDTO();
				bkdto.setB_date(rs.getTimestamp("b_date"));
				bkdto.setB_l_name(rs.getString("b_l_name"));
				bkdto.setB_l_num(rs.getInt("b_l_num"));
				bkdto.setB_l_price(rs.getInt("b_l_price"));
				bkdto.setB_m_id(rs.getString("b_m_id"));
				bkdto.setB_num(rs.getInt("b_num"));
				
				basketList.add(bkdto);
				
				sql = "SELECT * FROM lecture WHERE num=?";
				pstmt2 = con.prepareStatement(sql);
				
				pstmt2.setInt(1, bkdto.getB_l_num());
				rs2 = pstmt2.executeQuery();
				
				if(rs2.next()) {
					LectureDTO ldto = new LectureDTO();
					
					ldto.setL_img(rs2.getString("l_img"));
					ldto.setL_title(rs2.getString("l_title"));
					ldto.setL_price(rs2.getInt("l_price"));
					ldto.setL_pct(rs2.getInt("l_pct"));
					
					lectureList.add(ldto);
				}
				
			}
			
			vec.add(0,basketList);
			vec.add(1, lectureList);
			
			System.out.println(" 장바구니,상품정보 리스트 백터에 저장완료 :"+vec);			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return vec;
	} //getBasketList
	
		public void basketDelete(int b_num){
				
				try {
					con = getConnection();
					// 장바구니에서 특정 번호의 상품을 삭제 
					sql="DELETE FROM model2_basket WHERE b_num=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, b_num);
					
					pstmt.executeUpdate();
		
					System.out.println(b_num+"번의 장바구니 삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			}	
			// basketDelete(b_num)
		
		
				public void basketDelete(String id){
					
					try {
						con = getConnection();
						// 장바구니에서 특정 번호의 상품을 삭제 
						sql="DELETE FROM model2_basket WHERE b_m_id=?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						
						pstmt.executeUpdate();

						System.out.println(id+"님의 장바구니 삭제 완료");
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
				}	
				// basketDelete(id)
	
	
}
