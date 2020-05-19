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
			sql="select max(o_num) from codefarm_orderlist";
			
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
						
				
			// 18,20번 ?-> now()변경
			sql ="INSERT INTO codeform_orderlist "
					+ "values("
					+ "?,?,?,?,?,"
					+ "?,?,?,?,?,"
					+ "?,now())";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, o_num);
			//pstmt.setString(2,trade_num);
			pstmt.setString(2, 
					sdf.format(cal.getTime()).toString()+"-"+o_b_num 
					);
			// => 20200331-1
			pstmt.setInt(3, bkdto.getB_l_price());
			pstmt.setInt(4, bkdto.getB_l_num());
			pstmt.setString(5, ldto.getL_title());
			pstmt.setString(6, ldto.getL_m_email());	
			pstmt.setString(8, oldto.getO_t_type());
			pstmt.setString(9, oldto.getO_t_bank());
			pstmt.setString(10, oldto.getO_t_payer());
			pstmt.setInt(11, ldto.getL_price());
			
			
			// 20번 ?는 함수로 사용됨(now())
			pstmt.setInt(12, 0); // 21번 ? => 주문 상태표시 
			
			pstmt.executeUpdate();
			
			System.out.println(o_num+" 번 구매정보 저장완료 ");
			
			o_num ++; // 주문 일련번호를 증가
			
			}// Model2_order 테이블 INSERT동작 반복(for)
			
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
			
			sql = "select o_b_num,o_l_price, "
					+ "o_l_name,o_status"
					+ "o_t_type,o_t_bank, "
					+ "o_t_payer,o_t_date "
					+ "sum(o_sum_money) as o_sum_money "
					+ "from codefarm_orderlist "
					+ "where o_m_id=? "
					+ "group by o_b_num "
					+ "order by o_b_num desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO oldto = new OrderDTO();
				oldto.setO_b_num(rs.getInt("o_b_num"));
				oldto.setO_l_name(rs.getString("o_l_name"));
				oldto.setO_l_price(rs.getInt("o_l_price"));
				//oldto.setO_l_num(rs.getInt("o_l_num"));
				oldto.setO_status(rs.getInt("o_status"));
				oldto.setO_t_type(rs.getString("o_t_type"));
				oldto.setO_sum_money(rs.getInt("o_sum_money"));
				oldto.setO_t_date(rs.getTimestamp("o_date"));
				oldto.setO_t_bank(rs.getString("o_t_bank"));
				
				orderList.add(oldto);
				
			}
			System.out.println(" 주문정보 저장 완료 : "+orderList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return null;
	}
	
	//getOrderList
	
	
	
	
	
	}