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

import com.cart.db.CartDTO;
import com.lecture.db.LectureDTO;
import com.wishlist.db.WishlistDTO;

public class BasketDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	ResultSet rs2=null;
	ResultSet rs3 = null;
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
			if(con != null) con.close();
			if(rs2 != null) rs2.close();
			if(rs3 != null) rs3.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//자원 해제
	
	//checkGoods()
			public int checkGoods(BasketDTO bkdto){
				
				int check=-1;
				//기존의 장바구니에 해당 상품이 있는지 없는지 판별
				try {
					//1,2
					getConnection();
					
					//3
					sql="SELECT * FROM basket WHERE b_l_num=? and b_m_id=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, bkdto.getB_l_num());
					pstmt.setString(2, bkdto.getB_m_id());
					rs=pstmt.executeQuery();

					if(rs.next()){ //상품이 있다. => 상품추가안함.
						check=1;
						
						System.out.println("@@ 장바구니 기존상품!");
						return check;
					}else{ //상품이없다 => check 0 
						check=0;
						System.out.println("@@ 장바구니 상품확인(신규) 완료!");
					}
					System.out.println("@@ 장바구니 체크 완료!(0:신규, 1:기존) :"+check);
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				return check;
			}
			//checkGoods()
		

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
			
			sql = "INSERT INTO basket VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.setString(2, bkdto.getB_m_id());
			pstmt.setInt(3, bkdto.getB_l_num());
			pstmt.setTimestamp(4, bkdto.getB_date());
			pstmt.setInt(5, bkdto.getB_l_price());
			pstmt.setString(6, bkdto.getB_l_name());
					
	
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
		ArrayList wishList = new ArrayList();
		
		

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
				System.out.println("-----bkdto------");
				basketList.add(bkdto);
				
				sql = "SELECT * FROM lecture WHERE l_number=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, bkdto.getB_l_num());
				rs2 = pstmt.executeQuery();
				
				if(rs2.next()) {
					LectureDTO ldto = new LectureDTO();
					//@ 이하 처리
					String M=rs2.getString("l_m_email");
					if(M.indexOf("@")>-1){
						id=M.substring(0,M.indexOf("@"));
					}else{id=M;}
					//
					ldto.setL_number(rs2.getInt("l_number"));
					
					ldto.setL_m_email(id);
					
					ldto.setL_img(rs2.getString("l_img"));
					ldto.setL_title(rs2.getString("l_title"));
					ldto.setL_content(rs2.getString("l_content"));
					ldto.setL_price(rs2.getInt("l_price"));
					ldto.setL_pct(rs2.getInt("l_pct"));
					System.out.println("-----ldto------");
					lectureList.add(ldto);
				}
				sql = "SELECT * FROM wishlist WHERE w_num=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, bkdto.getB_l_num());
				rs3 = pstmt.executeQuery();
				
				if(rs3.next()) {
					WishlistDTO widto = new WishlistDTO();
					
					widto.setW_date(rs3.getTimestamp("w_date"));
					widto.setW_l_num(rs3.getInt("w_l_num"));
					widto.setW_m_id(rs3.getString("w_m_id"));
					widto.setW_num(rs3.getInt("w_num"));
					System.out.println("-----widto------");
					wishList.add(widto);
					
				}
			}
			
			vec.add(0,basketList);
			vec.add(1, lectureList);
			vec.add(2,wishList);
			
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

					//sql="DELETE FROM basket WHERE b_num=?";

					sql="DELETE FROM basket WHERE b_num=?";
					
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
						sql="DELETE FROM basket WHERE b_m_id=?";
						
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


				public ArrayList<CartDTO> getMemberBasketList(String id) {
					ArrayList<CartDTO> cartList= new ArrayList<CartDTO>();
					try{
						con=getConnection();
						sql="select * from basket where b_m_id=?";
						pstmt=con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						
						rs=pstmt.executeQuery();
						
						while(rs.next()){
							CartDTO cdto=new CartDTO();
							BasketDTO bdto= new BasketDTO();
							bdto.setB_num(rs.getInt("b_num"));
							bdto.setB_l_num(rs.getInt("b_l_num"));
							bdto.setB_l_name(rs.getString("b_l_name"));
							bdto.setB_m_id(rs.getString("b_m_id"));
							bdto.setB_l_price(rs.getInt("b_l_price"));
							bdto.setB_date(rs.getTimestamp("b_date"));
							cdto.setBasketdata(bdto);
							sql="select * from lecture where l_number=?";
							pstmt=con.prepareStatement(sql);
							
							pstmt.setInt(1, rs.getInt("b_l_num"));
							
							rs2=pstmt.executeQuery();
							if(rs2.next()){
								LectureDTO ldto = new LectureDTO();
								ldto.setL_number(rs2.getInt("l_number"));
								ldto.setL_m_email(rs2.getString("l_m_email"));
								ldto.setL_reg_date(rs2.getTimestamp("l_reg_date"));
								ldto.setL_content(rs2.getString("l_content"));
								ldto.setL_type(rs2.getString("l_type"));
								ldto.setL_type2(rs2.getString("l_type2"));
								ldto.setL_level(rs2.getString("l_level"));
								ldto.setL_price(rs2.getInt("l_price"));
								ldto.setL_pct(rs2.getInt("l_pct"));
								ldto.setL_img(rs2.getString("l_img"));
								
								ldto.setL_goods(rs2.getInt("l_goods"));
								ldto.setPct_date(rs2.getTimestamp("pct_date"));
								//ldto.setPay_count(rs.getInt("pay_count"));
								ldto.setL_title(rs2.getString("l_title"));
								cdto.setLecturedata(ldto);
							}
							cartList.add(cdto);
						}
					}catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeDB();
					}
					return cartList;
				}
				
	/* Jquery용 basketDelete 메서드 (강의 번호로 지우는 형태) */
	public void JqbasketDelete(int l_number){
					
		try {
			con = getConnection();
			// 장바구니에서 특정 번호의 상품을 삭제 

			sql="DELETE FROM basket WHERE b_l_num=?";
						
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_number);
						
			pstmt.executeUpdate();
			
			System.out.println(l_number+"번의 강의 장바구니에서 삭제 완료");
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}	
	/* Jquery용 basketDelete 메서드 (강의 번호로 지우는 형태) */
				
	// basketReg(bdto) Detail_basket
		public String basketReg(BasketDTO bdto){
			String basketCheck = "";
			StringBuffer SQL = new StringBuffer();
			try {
				con = getConnection();
				System.out.print("basketReg() : ");
				
				sql = "select * from basket where b_l_num = ? and b_m_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bdto.getB_l_num());
				pstmt.setString(2, bdto.getB_m_id());
				rs = pstmt.executeQuery();
				if(rs.next()){
					SQL.append("delete from basket where b_l_num = ? and b_m_id = ?");
					basketCheck = "delete";
					System.out.println("장바구니 삭제 완료");
				} else {
					SQL.append("insert into basket(b_l_num, b_m_id, b_l_price, b_l_name) values(?, ?, ?, ?)");
					basketCheck = "insert";
					System.out.println("장바구니 저장 완료");
				}
				pstmt = con.prepareStatement(SQL.toString());
				pstmt.setInt(1, bdto.getB_l_num());
				pstmt.setString(2, bdto.getB_m_id());
				if(basketCheck.equals("insert")){
					pstmt.setInt(3, bdto.getB_l_price());
					pstmt.setString(4, bdto.getB_l_name());
				}
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return basketCheck;
		}
		// basketReg(bdto) Detail_basket
	
}
