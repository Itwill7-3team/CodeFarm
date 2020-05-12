package com.lecture.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class LectureDAO {
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
	
	// getLectureDetail()
		public LectureDTO getLectureDetail(int l_number){
			LectureDTO ldto = null;
			try {
				getConnection();
				System.out.print("getLectureDetail() : ");
				sql = "select "
					+ "  l_m_name,    l_m_id,  l_title,  l_reg_date,  l_content,  l_type,  l_type2,  l_type3, "
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
					ldto.setL_m_name(rs.getString("l_m_name"));
					ldto.setL_m_id(rs.getString("l_m_id"));
					ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
					ldto.setL_content(rs.getString("l_content"));
					ldto.setL_type(rs.getString("l_type"));
					ldto.setL_type2(rs.getString("l_type2"));
					ldto.setL_type3(rs.getString("l_type3"));
					ldto.setL_price(rs.getInt("l_price"));
					ldto.setL_pct(rs.getInt("l_pct"));
					ldto.setL_img(rs.getString("l_img"));
					ldto.setL_tag(rs.getString("l_tag"));
					ldto.setL_goods(rs.getInt("l_goods"));
					ldto.setPct_date(rs.getTimestamp("pct_date"));
					ldto.setPaynum(rs.getInt("paynum"));
					ldto.setL_title(rs.getString("l_title"));
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
		
	//getAllCount()
	public int getAllCount() {
		int count = 0;
		try {
			con = getConnection();
			sql = "select count(*) as count from lecture";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return count;
	}
	//getAllCount()
	
	// getLectureList()
	public List<LectureDTO> getLecutreList(String s, String item, PagingDTO paging){
		List<LectureDTO> lectureList = new ArrayList<LectureDTO>();
		StringBuffer SQL = new StringBuffer();
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNnum();
		System.out.println("s :"+s);
		/* s = " "; */
		System.out.println("s :"+s);
		
		try {
		con = getConnection();
			/*
			 * "select * from (" + " select @rownum:=@rownum+1 as rownum lecture.* from (" +
			 * " from lecture (select @rownum:0) tmp" + ") e where rownum >= ?" +
			 * ") r where rownum <= ?"
			 */
		/*mysql version*/
		SQL.append("SELECT * FROM (SELECT @ROWNUM :=@ROWNUM +1 AS ROW, A.* FROM ("
				+ "SELECT * FROM lecture ORDER BY @Rownum DESC) A, (SELECT @ROWNUM := 0) b) c "
				+ "where C.ROW >=? and C.ROW <=? and concat(l_m_name, l_content, l_title) like ?");
		
		if(item.equals("all")){
		}else if(item.equals("seq")){ // 추천 좋아요 높은 순
			SQL.append(" order by l_goods asc");
		}else if(item.equals("popular")) { //인기? 결제수
			SQL.append(" order by paynum desc");
		}else if(item.equals("recent")){ //최신
			SQL.append(" order by l_number desc");
		}else if(item.equals("rating")){ // 평점
			SQL.append("");
		}else if(item.equals("famous")){ // 학생수? 결제수
			SQL.append(" order by paynum desc");
		}
		
		pstmt = con.prepareStatement(SQL.toString());
		pstmt.setInt(1, startNum);
		pstmt.setInt(2, endNum);
		pstmt.setString(3, "%"+s+"%");
		
		rs = pstmt.executeQuery();
			
		while(rs.next()){
		
			LectureDTO ldto = new LectureDTO();
			
			ldto.setL_content(rs.getString("l_content"));
			ldto.setL_goods(rs.getInt("l_goods"));
			ldto.setL_m_id(rs.getString("l_m_id"));
			ldto.setL_m_name(rs.getString("l_m_name"));
			ldto.setL_number(rs.getInt("l_number"));
			ldto.setL_pct(rs.getInt("l_pct"));
			ldto.setL_price(rs.getInt("l_price"));
			ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
			ldto.setL_tag(rs.getString("l_tag"));
			ldto.setL_type(rs.getString("l_type"));
			ldto.setL_type2(rs.getString("l_type2"));
			ldto.setL_type3(rs.getString("l_type3"));
			ldto.setPaynum(rs.getInt("paynum"));
			ldto.setPct_date(rs.getTimestamp("pct_date"));
			ldto.setL_img(rs.getString("l_img"));
			ldto.setL_title(rs.getString("l_title"));
			
			lectureList.add(ldto);
		}	
		System.out.println("사용자 강의 목록 저장완료");
		System.out.println("내용"+lectureList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return lectureList;
	}
	// getLectureList()

	
	//getLectureSelectList()
			public List<LectureDTO> getLectureSelectList(String item){
				
				List<LectureDTO> lectureList= new ArrayList<LectureDTO>();
					
				StringBuffer SQL= new StringBuffer();
				
				try {
					con=getConnection();
					//sql
					//상품 전체 목록 => 조건절 없이
					//상품 인기상품 목록 => 조건절 best=?
					//상품 카테고리별 목록(6개) => 조건절 카테고리=? 으로 처리가능
					SQL.append("SELECT * FROM lecture");
					if(item.equals("all")){					
					}
					else if(item.equals("best")){
						SQL.append(" WHERE l_tag=?");
					}
					else if(item.equals("new")){
						SQL.append(" WHERE l_tag=?");
					}
					else if(item.equals("free")){
						SQL.append(" WHERE l_tag=?");
					}
					else{
						SQL.append(" WHERE l_type=?");
					}
					
					pstmt=con.prepareStatement(SQL.toString()); 
					
					if(item.equals("all")){					
					}
					else if(item.equals("best")){
						pstmt.setString(1, "best");
					}
					else if(item.equals("new")){
						pstmt.setString(1, "new");
					}
					else if(item.equals("free")){
						pstmt.setString(1, "free");
					}
					else{ //카테고리정보
						pstmt.setString(1, item);
					}
					
					rs=pstmt.executeQuery();
					while(rs.next()){
						LectureDTO ldto=new LectureDTO();	//while안에 dto만들어야함.밖에만드니까 리스트에 똑같은 품목(마지막것)만 계속 나옴
						ldto.setL_content(rs.getString("l_content"));
						ldto.setL_goods(rs.getInt("l_goods"));
						ldto.setL_m_id(rs.getString("l_m_id"));
						ldto.setL_m_name(rs.getString("l_m_name"));
						ldto.setL_number(rs.getInt("l_number"));
						ldto.setL_pct(rs.getInt("l_pct"));
						ldto.setL_price(rs.getInt("l_price"));
						ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
						ldto.setL_tag(rs.getString("l_tag"));
						ldto.setL_type(rs.getString("l_type"));
						ldto.setL_type2(rs.getString("l_type2"));
						ldto.setL_type3(rs.getString("l_type3"));
						ldto.setPaynum(rs.getInt("paynum"));
						ldto.setPct_date(rs.getTimestamp("pct_date"));
						ldto.setL_img(rs.getString("l_img"));
						ldto.setL_title(rs.getString("l_title"));
						
						lectureList.add(ldto);
					}
					System.out.println("상품목록 저장완료:"+lectureList.size());
					
				} catch (Exception e) {
					System.out.println("상품정보조회 실패");
					e.printStackTrace();
				} finally {
					closeDB();
				}
				return lectureList;
			}
	//getLectureSelectList()
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
					pstmt.setString(6, ldto.getL_type2());
					pstmt.setString(7, ldto.getL_type3());
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
	
	
}
