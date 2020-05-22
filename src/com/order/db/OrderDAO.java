package com.order.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.basket.db.BasketDTO;
import com.lecture.db.LectureDTO;




public class OrderDAO {
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


	public void addOrder(OrderDTO oldto, List basketList, List lectureList) {
		// TODO Auto-generated method stub
		
		int o_num = 0;	// 주문 일렬번호
		int o_b_num = 0;	// 주문 번호
		
		// 주문번호 변경을 하기위한 객체
		Calendar cal = Calendar.getInstance();
		// -> 시스템의 시간정보를 가져다 사용(싱글턴패턴)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
		try {
			con = getConnection();
			
			// 주문 일련번호 계산하기 (o_num)
			sql="select max(o_num) from orderlist";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				o_num = rs.getInt(1)+1;
			}
			
			o_b_num = o_num;
			
			System.out.println(" 주문 일련번호 : "+o_num+", 주문번호 : "+o_b_num);
			
			for(int i=0;i<basketList.size();i++){
				BasketDTO bkdto = (BasketDTO)basketList.get(i);
				LectureDTO ldto = (LectureDTO)lectureList.get(i);
						
				
			
				sql ="INSERT INTO orderlist "
						+ "values( "
						+ "?,?,?,?,?, "
						+ "?,?,?,?,now(), "
						+ "?,?,?,date_add(now(),interval 30 MINUTE))";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, o_num);
			//pstmt.setString(2,trade_num);
			pstmt.setString(2, 
					sdf.format(cal.getTime()).toString()+"-"+o_num 
					);
			// => 20200331-1
			pstmt.setInt(3, ldto.getL_price());
			pstmt.setInt(4, ldto.getL_number());
			pstmt.setString(5, bkdto.getB_l_name());
			pstmt.setString(6, bkdto.getB_m_id());	
			pstmt.setString(7, oldto.getO_t_type());
			pstmt.setString(8, oldto.getO_t_bank());
			pstmt.setString(9, oldto.getO_t_payer());
			//10번 함수
			//pstmt.setTimestamp(10, oldto.getO_t_date());
			
			pstmt.setInt(10, (int)Math.floor(ldto.getL_price()+(ldto.getL_price()*ldto.getL_pct()/100)));
			pstmt.setInt(11, 0);
			pstmt.setString(12, oldto.getO_t_b_num());
			//pstmt.setString(13, oldto.getO_t_b_reg_date());
			

			pstmt.executeUpdate();
			
			System.out.println(o_num+" 번 구매정보 저장완료 ");
			
			o_num ++; // 주문 일련번호를 증가
			
			}//  테이블 INSERT동작 반복(for)
			
			System.out.println(" 장바구니에 있던 모든 상품정보를 주문 완료 ");			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}// addOrder(odto,basketList,goodsList)
	
	//getOrderList
	public ArrayList getOrderList(String id) {
		ArrayList orderList = new ArrayList();
		
		try {
			con = getConnection();
			

			sql = "select o_b_num,o_l_price,o_l_name,o_t_type,o_t_bank,o_t_payer, "
					+ "o_t_b_reg_date,o_t_b_num,o_status,o_t_date,sum(o_sum_money) as o_sum_money "
					+ "from orderlist where o_m_id=? "
					+ "group by o_b_num order by o_b_num desc";

			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO oldto = new OrderDTO();
				oldto.setO_b_num(rs.getString("o_b_num"));
				oldto.setO_l_name(rs.getString("o_l_name"));
				oldto.setO_l_price(rs.getInt("o_l_price"));

				oldto.setO_t_type(rs.getString("o_t_type"));
				oldto.setO_sum_money(rs.getInt("o_sum_money"));
				oldto.setO_t_date(rs.getTimestamp("o_t_date"));
				oldto.setO_t_bank(rs.getString("o_t_bank"));
				oldto.setO_t_payer(rs.getString("o_t_payer"));
				oldto.setO_status(rs.getInt("o_status"));
				oldto.setO_t_b_num(rs.getString("o_t_b_num"));
				oldto.setO_t_b_reg_date(rs.getString("o_t_b_reg_date"));
				
				orderList.add(oldto);
				
			}
			System.out.println(" 주문정보 저장 완료 : "+orderList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return orderList;
	}
	
	//getOrderList
	
	
	
	//orderDetail(b_num)
	public List orderDetail(String trade_num) {
		
		List orderDetailList = new ArrayList();
		ArrayList lectureList = new ArrayList();
		ArrayList basketList = new ArrayList();
		
		try {
			con = getConnection();
			
			sql = "select * from orderlist where o_b_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, trade_num);
			rs = pstmt.executeQuery();
			System.out.println("@@@@@@@@@@@@@@@@@");
			
			while(rs.next()){
				OrderDTO odto = new OrderDTO();
			
				odto.setO_b_num(rs.getString("o_b_num"));
				odto.setO_l_name(rs.getString("o_l_name"));
				odto.setO_t_date(rs.getTimestamp("o_t_date"));
				odto.setO_sum_money(rs.getInt("o_sum_money"));
				odto.setO_t_type(rs.getString("o_t_type"));
				odto.setO_t_bank(rs.getString("o_t_bank"));
				odto.setO_status(rs.getInt("o_status"));
				odto.setO_t_b_reg_date(rs.getString("o_t_b_reg_date"));
				
				System.out.println("#######################");
				
				orderDetailList.add(odto);
				
			} // while
			
			System.out.println("주문 상세정보 저장 완료: "+orderDetailList);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return orderDetailList;
	} //orderDetail(b_num)
	
	
	
	}