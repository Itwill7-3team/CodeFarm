package com.wishlist.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.wishlist.db.WishlistDTO;
import com.cart.db.CartDTO;
import com.lecture.db.LectureDTO;

public class WishlistDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	ResultSet rs2 = null;
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
			if(rs2 != null) rs2.close();
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//자원 해제
	
	//checkGoods()
		public int checkGoods(WishlistDTO wdto){
			
			int check=-1;
			//기존의 위시리스트에 해당 상품이 있는지 없는지 판별
			try {
				//1,2
				getConnection();
				
				//3
				sql="SELECT * FROM wishlist WHERE w_l_num=? and w_m_id=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, wdto.getW_l_num());
				pstmt.setString(2, wdto.getW_m_id());
				rs=pstmt.executeQuery();

				if(rs.next()){ //상품이 있다. => 상품추가안함.
					check=1;
					
					System.out.println("@@ 위시리스트 기존상품!");
					return check;
				}else{ //상품이없다 => check 0 
					check=0;
					System.out.println("@@ 위시리스트 상품확인(신규) 완료!");
				}
				System.out.println("@@ 위시리스트 체크 완료!(0:신규, 1:기존) :"+check);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return check;
		}
		//checkGoods()
	
	
	public void wishlistAdd (WishlistDTO wdto) {
		int w_num = 0;
		try {
			con = getConnection();
			
			sql = "SELECT max(w_num) FROM wishlist";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				w_num = rs.getInt(1)+1;
			}
			System.out.println("위시리스트 번호: "+w_num);
			
			sql = "INSERT INTO wishlist VALUES(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, w_num);
			pstmt.setString(2, wdto.getW_m_id());
			pstmt.setInt(3, wdto.getW_l_num());
			pstmt.setTimestamp(4, wdto.getW_date());
	
			pstmt.executeUpdate();
			System.out.println("~*~*~*~*~* 위시리스트 저장 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}		
	}// wishlistAdd(bkdto)
	
	public Vector getWishList(String id){
		Vector vec = new Vector();
		
		ArrayList lectureList = new ArrayList();
		ArrayList wishList = new ArrayList();
		
		try {
			con = getConnection();
			
			sql = "select * from wishlist where w_m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				WishlistDTO wdto = new WishlistDTO();
				wdto.setW_date(rs.getTimestamp("w_date"));
				wdto.setW_l_num(rs.getInt("w_l_num"));
				wdto.setW_m_id(rs.getString("w_m_id"));
				wdto.setW_num(rs.getInt("w_num"));
				
				wishList.add(wdto);
				
				
				sql = "SELECT * FROM lecture WHERE l_number=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, wdto.getW_l_num());
				rs2 = pstmt.executeQuery();
				
				if(rs2.next()) {
					LectureDTO ldto = new LectureDTO();
					//@이하 처리
					String M=rs2.getString("l_m_email");
					if(M.indexOf("@")>-1){
						id=M.substring(0,M.indexOf("@"));
					}else{id=M;}
					//
					ldto.setL_content(rs2.getString("l_content"));
					ldto.setL_goods(rs2.getInt("l_goods"));
					
					ldto.setL_m_email(id);
					
					ldto.setL_number(rs2.getInt("l_number"));
					ldto.setL_pct(rs2.getInt("l_pct"));
					ldto.setL_price(rs2.getInt("l_price"));
					ldto.setL_reg_date(rs2.getTimestamp("l_reg_date"));
					ldto.setL_type(rs2.getString("l_type"));
					ldto.setL_type2(rs2.getString("l_type2"));
					ldto.setL_level(rs2.getString("l_level"));
					ldto.setPay_count(rs2.getInt("pay_count"));
					ldto.setPct_date(rs2.getTimestamp("pct_date"));
					ldto.setL_img(rs2.getString("l_img"));
					ldto.setL_title(rs2.getString("l_title"));
					
					lectureList.add(ldto);
				}
				
			}
			
			vec.add(0,wishList);
			vec.add(1, lectureList);
			
			System.out.println(" 위시리스트,상품정보 리스트 백터에 저장완료 :"+vec);			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return vec;
	} //getWishList
	
	
		public void wishlistDelete(int w_num){
				
				try {
					con = getConnection();
					// 위시리스트 특정 번호의 상품을 삭제 
					sql="DELETE FROM wishlist WHERE w_num=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, w_num);
					
					pstmt.executeUpdate();
		
					System.out.println(w_num+"번의 위시리스트 삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			}	
			// wishlistDelete(w_num)
		
		
				public void wishlistDelete(String id){
					
					try {
						con = getConnection();
						// 위시리스트 특정 번호의 상품을 삭제 
						sql="DELETE FROM wishlist WHERE w_m_id=?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						
						pstmt.executeUpdate();

						System.out.println(id+"님의 위시리스트 삭제 완료");
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						closeDB();
					}
					
				}	
				// wishlistDelete(id)


				public ArrayList<CartDTO> getMemberWishList(String id) {
					Vector vector= new Vector();
					ArrayList<CartDTO> cartlist= new ArrayList<CartDTO>();
					
					try{
						con=getConnection();
						sql="select * from wishlist where w_m_id=?";
						
						pstmt=con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						
						rs=pstmt.executeQuery();
						
						while(rs.next()){
							CartDTO cartDTO =new CartDTO();
							WishlistDTO wdto= new WishlistDTO();
							wdto.setW_l_num(rs.getInt("w_l_num"));
							wdto.setW_m_id(rs.getString("w_m_id"));
							wdto.setW_num(rs.getInt("w_num"));
							wdto.setW_date(rs.getTimestamp("w_date"));
							
							cartDTO.setWishdata(wdto);
							sql="select * from lecture where l_number=?";
							pstmt=con.prepareStatement(sql);
							
							pstmt.setInt(1, rs.getInt("w_l_num"));
							
							rs2=pstmt.executeQuery();
							if(rs2.next()){
								LectureDTO ldto = new LectureDTO();
								ldto.setL_content(rs2.getString("l_content"));
								ldto.setL_goods(rs2.getInt("l_goods"));
								ldto.setL_m_email(rs2.getString("l_m_email"));
								ldto.setL_number(rs2.getInt("l_number"));
								ldto.setL_pct(rs2.getInt("l_pct"));
								ldto.setL_price(rs2.getInt("l_price"));
								ldto.setL_reg_date(rs2.getTimestamp("l_reg_date"));
								ldto.setL_type(rs2.getString("l_type"));
								ldto.setL_type2(rs2.getString("l_type2"));
								ldto.setL_level(rs2.getString("l_level"));
								ldto.setPay_count(rs2.getInt("pay_count"));
								ldto.setPct_date(rs2.getTimestamp("pct_date"));
								ldto.setL_img(rs2.getString("l_img"));
								ldto.setL_title(rs2.getString("l_title"));
								cartDTO.setLecturedata(ldto);
							}
							cartlist.add(cartDTO);
						}
					}catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeDB();
					}
					
					return cartlist;
				}

	/* Jquery용 wishlistDelete 메서드 (강의 번호로 지우는 형태) */
	public void JqwishlistDelete(int l_number){
								
		try {
			con = getConnection();
			// 위시에서 특정 번호의 상품을 삭제 

			sql="DELETE FROM wishlist WHERE w_l_num=?";
									
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_number);
									
			pstmt.executeUpdate();
						
			System.out.println(l_number+"번의 강의 위시리시트에서 삭제 완료");
									
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}	
	/* Jquery용 basketDelete 메서드 (강의 번호로 지우는 형태) */				
				
	// wishListReg(wdto) Detail_wishList
	public String wishListReg(WishlistDTO wdto){
		String wishCheck = "";
		StringBuffer SQL = new StringBuffer();
		try {
			con = getConnection();
			System.out.print("wishListReg() : ");
			
			sql = "select * from wishlist where w_l_num = ? and w_m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, wdto.getW_l_num());
			pstmt.setString(2, wdto.getW_m_id());
			rs = pstmt.executeQuery();
			if(rs.next()){
				SQL.append("delete from wishlist where w_l_num = ? and w_m_id = ?");
				wishCheck = "delete";
				System.out.println("위시 리스트 삭제 완료");
			} else {
				SQL.append("insert into wishlist(w_l_num, w_m_id) values(?, ?)");
				wishCheck = "insert";
				System.out.println("위시 리스트 저장 완료");
			}
			pstmt = con.prepareStatement(SQL.toString());
			pstmt.setInt(1, wdto.getW_l_num());
			pstmt.setString(2, wdto.getW_m_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return wishCheck;
	}
	// wishListReg(wdto) Detail_wishList
	
	// getWishListCount(int l_number) Detail_wishList
	public int getWishListCount(int l_number){
		int wishCount = 0;
		try {
			con = getConnection();
			System.out.print("wishListCount() : ");
			
			sql = "select count(*) from wishlist where w_l_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_number);
			rs = pstmt.executeQuery();
			if(rs.next()){
				wishCount = rs.getInt(1);
			}
			System.out.println("위시 수 저장 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return wishCount;
	}
	// getWishListCount(int l_number) Detail_wishList
}
