package com.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.lecture.db.LectureDTO;


public class ReviewDAO {
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
	public ArrayList<Map<String,Object>> getReviewList(){
		//별점 게시판 리스트 가져오는 메서드
		ArrayList<Map<String, Object>> reviewlist=new ArrayList<Map<String,Object>>();
		try{
			con=getConnection();
			sql="select * from r_board";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				Map<String, Object> reviewdata= new HashMap<String,Object>();
				ReviewDTO rdto =new ReviewDTO();
				rdto.setR_num(rs.getInt("r_num"));
				rdto.setR_l_num(rs.getInt("r_l_num"));
				rdto.setR_content(rs.getString("r_content"));
				rdto.setR_writer(rs.getString("r_writer"));
				rdto.setR_rating(rs.getInt("r_rating"));
				rdto.setR_re_lev(rs.getInt("r_re_lev"));
				rdto.setR_re_ref(rs.getInt("r_re_ref"));
				rdto.setR_re_seq(rs.getInt("r_re_seq"));
				rdto.setR_reg_date(rs.getTimestamp("r_reg_date"));
				reviewdata.put("rdto", rdto);
				
				sql="select * from lecture where l_number=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1,rs.getInt("r_l_num"));
				
				rs2=pstmt.executeQuery();
				if(rs2.next()){
					LectureDTO ldto= new LectureDTO();
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
					reviewdata.put("ldto", ldto);
				}
				
				reviewlist.add(reviewdata);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return reviewlist;
	}
	
	// getAvgrating() 강의별 평균 별점 가져오기
	public Map<Integer, Map<String, Object>> getAvgrating(List<Integer> l_numList){
		Map<Integer, Map<String, Object>> ratingList = new HashMap<Integer, Map<String, Object>>();
		StringBuffer qMark = new StringBuffer();
		for(int i=0; i<l_numList.size(); i++){
			qMark.append("?");
			qMark.append(",");
		}
		qMark.deleteCharAt(qMark.lastIndexOf(","));
		
		try {
			con = getConnection();
			System.out.print("getAvgrating() : ");
			sql = "select "
				+ "  r_l_num,            count(*) reviewAll,           round(avg(r_rating), 1) rating_avg, "
				+ "  count(if(r_rating = 5, r_rating, null)) rating_5, count(if(r_rating = 4, r_rating, null)) rating_4, "
				+ "  count(if(r_rating = 3, r_rating, null)) rating_3, count(if(r_rating = 2, r_rating, null)) rating_2, "
				+ "  count(if(r_rating = 1, r_rating, null)) rating_1 "
				+ "from   r_board "
				+ "where  r_re_lev = 0 and r_l_num in("+qMark.toString()+") group by r_l_num";
			pstmt = con.prepareStatement(sql);
			for(int i=0; i<l_numList.size(); i++){ pstmt.setInt(i + 1, l_numList.get(i)); }
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, Object> review_rating = new HashMap<String, Object>();
				review_rating.put("r_l_num", rs.getInt("r_l_num"));
				review_rating.put("reviewAll", rs.getInt("reviewAll"));
				review_rating.put("rating_avg", rs.getDouble("rating_avg"));
				review_rating.put("rating_5", rs.getInt("rating_5"));
				review_rating.put("rating_4", rs.getInt("rating_4"));
				review_rating.put("rating_3", rs.getInt("rating_3"));
				review_rating.put("rating_2", rs.getInt("rating_2"));
				review_rating.put("rating_1", rs.getInt("rating_1"));
				ratingList.put(rs.getInt("r_l_num"), review_rating);
			}
			System.out.println("강의별 리뷰 정보 가져오기 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return ratingList;
	}
	// getAvgrating() 강의별 평균 별점 가져오기
	
	// getReviewCount(l_number)
	public int getReviewCount(int l_number){
		int check = 0;
		try {
			con = getConnection();
			System.out.print("getReviewCount() : ");
			
			sql = "select count(*) from r_board where r_re_lev = 0 and r_l_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_number);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = rs.getInt(1);
			}
			System.out.println("강의별 리뷰 전체 개수 : " + check);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	// getReviewCount(l_number)
	
	// getReviewList(l_number);
		public List<ReviewDTO> getReviewList(int l_number){
			List<ReviewDTO> reviewList = new ArrayList<>();
			try {
				con = getConnection();
				System.out.print("getReviewList() : ");
				sql = "select   * "
					+ "from     r_board "
					+ "where    r_l_num = ? "
					+ "order by r_re_ref desc, r_re_seq asc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, l_number);
				rs = pstmt.executeQuery();
				while(rs.next()){
					ReviewDTO rdto = new ReviewDTO();
					rdto.setR_num(rs.getInt("r_num"));
					rdto.setR_l_num(rs.getInt("r_l_num"));
					rdto.setR_content(rs.getString("r_content"));
					rdto.setR_writer(rs.getString("r_writer"));
					rdto.setR_rating(rs.getInt("r_rating"));
					rdto.setR_re_lev(rs.getInt("r_re_lev"));
					rdto.setR_re_ref(rs.getInt("r_re_ref"));
					rdto.setR_re_seq(rs.getInt("r_re_seq"));
					rdto.setR_reg_date(rs.getTimestamp("r_reg_date"));
					reviewList.add(rdto);
				}
				System.out.println("리뷰 목록 가져오기 완료");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return reviewList;
		}
		// getBoardList(l_number);
		
		// addReComment(rdto)
		public ReviewDTO addReComment(ReviewDTO rdto){
			ReviewDTO rcdto = new ReviewDTO();
			int num = 0;
			try {
				con = getConnection();
				System.out.print("insertBoard() : ");
				
				// 글 번호 증가
				sql = "select max(r_num) from r_board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					num = rs.getInt(1) + 1;
				}
				
				// 답글 정렬
				sql = "update r_board set r_re_seq = r_re_seq + 1 "
						+ "where r_re_ref = ? and r_re_seq > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rdto.getR_re_ref());
				pstmt.setInt(2, rdto.getR_re_seq());
				pstmt.executeUpdate();
				
				sql = "insert into r_board("
						+ " r_num,     r_l_num,   r_content,  r_writer,   r_rating, "
						+ " r_re_lev,  r_re_ref,  r_re_seq,   r_reg_date) "
						+ "values(?, ?, ?, ?, ?, ?, ?, ?, now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setInt(2, rdto.getR_l_num());
				pstmt.setString(3, rdto.getR_content());
				pstmt.setString(4, rdto.getR_writer());
				pstmt.setInt(5, rdto.getR_rating());
				pstmt.setInt(6, rdto.getR_re_lev() + 1); // lev 0 - 일반, 1 - 답변...
				pstmt.setInt(7, rdto.getR_re_ref());     // ref 일반글 번호와 동일
				pstmt.setInt(8, rdto.getR_re_seq() + 1); // seq 글 순서
				pstmt.executeUpdate();
				System.out.print("comment 저장 완료, ");
				
				sql = "select * from r_board where r_num = ? and r_writer = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, rdto.getR_writer());
				rs = pstmt.executeQuery();
				if(rs.next()){
					rcdto.setR_num(rs.getInt("r_num"));
					rcdto.setR_l_num(rs.getInt("r_l_num"));
					rcdto.setR_content(rs.getString("r_content"));
					rcdto.setR_writer(rs.getString("r_writer"));
					rcdto.setR_rating(rs.getInt("r_rating"));
					rcdto.setR_re_lev(rs.getInt("r_re_lev"));
					rcdto.setR_re_ref(rs.getInt("r_re_ref"));
					rcdto.setR_re_seq(rs.getInt("r_re_seq"));
					rcdto.setR_reg_date(rs.getTimestamp("r_reg_date"));
				}
				System.out.println("dto 저장 완료");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return rcdto;
		}
		// addReComment(rdto)
}
