package com.lecture.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class LectureDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	ResultSet rs2=null;
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
			if(rs2 !=null) rs.close();
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(con !=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//자원 해제
	
	public int updateLecture(LectureDTO ldto){
		int check=0;
		try{
			con=getConnection();
			sql="update lecture set "
					+ "l_m_email=?,l_title=?,l_abilities=?,"
					+ "l_targets=?,l_based=?,l_description=?,"
					+ "l_content=?,l_type=?,l_type2=?,l_level=?,"
					+ "l_img=?,l_price=?,start_msg=?,end_msg=? "
					+ "where l_number =?";
					
			pstmt=con.prepareStatement(sql);
				pstmt.setString(1, ldto.getL_m_email());
				pstmt.setString(2, ldto.getL_title());
				pstmt.setString(3, ldto.getL_abilities());
				pstmt.setString(4, ldto.getL_targets());
				pstmt.setString(5, ldto.getL_based());
				pstmt.setString(6, ldto.getL_description());
				pstmt.setString(7, ldto.getL_content());
				pstmt.setString(8, ldto.getL_type());
				pstmt.setString(9, ldto.getL_type2());
				pstmt.setString(10, ldto.getL_level());
				pstmt.setString(11, ldto.getL_img());
				pstmt.setInt(12, ldto.getL_price());
				pstmt.setString(13, ldto.getStart_msg());
				pstmt.setString(14, ldto.getEnd_msg());
				pstmt.setInt(15, ldto.getL_number());
				check=pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	
	
	// getLectureDetail()
	public LectureDTO getLectureDetail(int l_number){
		LectureDTO ldto = null;
		try {
			con = getConnection();
			System.out.print("getLectureDetail() : ");
			sql = "select * from lecture where l_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_number);
			rs = pstmt.executeQuery();
			if(rs.next()){
				ldto = new LectureDTO();
				ldto.setL_number(l_number);
				ldto.setL_m_email(rs.getString("l_m_email"));
				ldto.setL_title(rs.getString("l_title"));
				ldto.setL_abilities(rs.getString("l_abilities"));
				ldto.setL_targets(rs.getString("l_targets"));
				ldto.setL_based(rs.getString("l_based"));
				ldto.setL_description(rs.getString("l_description"));
				ldto.setL_content(rs.getString("l_content"));
				ldto.setL_type(rs.getString("l_type"));
				ldto.setL_type2(rs.getString("l_type2"));
				ldto.setL_level(rs.getString("l_level"));
				ldto.setL_img(rs.getString("l_img"));
				ldto.setL_price(rs.getInt("l_price"));
				ldto.setL_goods(rs.getInt("l_goods"));
				ldto.setL_pct(rs.getInt("l_pct"));
				ldto.setRecord(rs.getInt("record"));
				ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
				ldto.setPct_date(rs.getTimestamp("pct_date"));
				ldto.setPay_count(rs.getInt("pay_count"));
				ldto.setStart_msg(rs.getString("start_msg"));
				ldto.setEnd_msg(rs.getString("end_msg"));
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
	public Map<String, Object> getLecutreList(String s, String item, PagingDTO paging, String t1, String t2){
		List<LectureDTO> lectureList = new ArrayList<LectureDTO>();
		Map<String, Object> map=new HashMap<String,Object>();
		List<Double> starList=new ArrayList<Double>();
		List<Integer> starCount= new ArrayList<Integer>();
		List<String> memberList = new ArrayList<String>();
		StringBuffer SQL = new StringBuffer();
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNnum();
		System.out.println("s :"+s);
		System.out.println("t1 : "+t1+"t2 : "+t2);
		try {
		con = getConnection();
			/*
			 * "select * from (" + " select @rownum:=@rownum+1 as rownum lecture.* from (" +
			 * " from lecture (select @rownum:0) tmp" + ") e where rownum >= ?" +
			 * ") r where rownum <= ?"
			 * 
			 * l_m_name, 
			 * 
			 * 
			 */
			
		/*mysql version*/
			/*
			 * SQL.append("SELECT * FROM (SELECT @ROWNUM :=@ROWNUM +1 AS ROW, A.* FROM (" +
			 * "SELECT * FROM lecture ORDER BY @Rownum DESC) A, (SELECT @ROWNUM := 0) b) c "
			 * + "where C.ROW >=? and C.ROW <=? and concat(l_content, l_title) like ? " +
			 * "and l_type like ? and l_type2 like ?");
			 * 
			 *  left join member on (lecture.l_m_email = member.m_email) 
			 * 
			 */
		SQL.append("SELECT * FROM (SELECT @ROWNUM :=@ROWNUM +1 AS ROW, A.* FROM ("
				+ "SELECT * FROM lecture left join member on (lecture.l_m_email = member.m_email) "
				+ "ORDER BY @Rownum DESC) A, (SELECT @ROWNUM := 0) b) c "
				+ "where C.ROW >=? and record=1 and C.ROW <=? and concat(m_name, l_content, l_title) like ? "
				+ "and l_type like ? and l_type2 like ?");
		
/*		if(item.equals("all")){
		}else*/ 
		if(item.equals("seq")){ // 추천 좋아요 높은 순
			SQL.append(" order by l_goods asc");
		}else if(item.equals("popular")) { //인기? 결제수
			SQL.append(" order by pay_count desc");
		}else if(item.equals("recent")){ //최신
			SQL.append(" order by l_number desc");
		}else if(item.equals("rating")){ // 평점
			SQL.append("");
		}else if(item.equals("famous")){ // 학생수? 결제수
			SQL.append(" order by pay_count desc");
		}
		
		pstmt = con.prepareStatement(SQL.toString());
		pstmt.setInt(1, startNum);
		pstmt.setInt(2, endNum);
		pstmt.setString(3, "%"+s+"%");
		pstmt.setString(4, "%"+t1+"%");
		pstmt.setString(5, "%"+t2+"%");
		
		rs = pstmt.executeQuery();
			
		while(rs.next()){
		
			LectureDTO ldto = new LectureDTO();
			
			ldto.setL_content(rs.getString("l_content"));
			ldto.setL_goods(rs.getInt("l_goods"));
			ldto.setL_m_email(rs.getString("l_m_email"));
			ldto.setL_number(rs.getInt("l_number"));
			ldto.setL_pct(rs.getInt("l_pct"));
			ldto.setL_price(rs.getInt("l_price"));
			ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
			ldto.setL_type(rs.getString("l_type"));
			ldto.setL_type2(rs.getString("l_type2"));
			ldto.setL_level(rs.getString("l_level"));
			ldto.setPay_count(rs.getInt("pay_count"));
			ldto.setPct_date(rs.getTimestamp("pct_date"));
			ldto.setL_img(rs.getString("l_img"));
			ldto.setL_title(rs.getString("l_title"));
			ldto.setL_abilities(rs.getString("l_abilities"));
			ldto.setL_based(rs.getString("l_based"));
			ldto.setL_description(rs.getString("l_description"));
			
			sql="select avg(r_rating) from r_board group by r_l_num having r_l_num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, rs.getInt("l_number"));
			
			rs2=pstmt.executeQuery();
			if(rs2.next()){
				starList.add(rs2.getDouble(1));
				
			}else{
				starList.add(0.0);
				
			}
			sql="select count(*) from r_board where r_l_num=?";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, rs.getInt("l_number"));
			
			rs2=pstmt.executeQuery();
			if(rs2.next()){
				starCount.add(rs2.getInt(1));
			}else{
				starCount.add(0);
			}
			
			sql = "select m_nick from member where m_email=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, rs.getString("l_m_email"));
			rs2 = pstmt.executeQuery();
			if(rs.next()) {
				memberList.add(rs2.getString(1));
			}
			
			
			lectureList.add(ldto);
			
		}	
		System.out.println("사용자 강의 목록 저장완료");
		System.out.println("내용"+lectureList);
			map.put("lectureList", lectureList);
			map.put("starList", starList);
			map.put("starCount", starCount);
			map.put("memberList", memberList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return map;
	}
	// getLectureList()

	
	//getLectureSelectList()
			public Map<String, Object> getLectureSelectList(String item){
				Map<String, Object> map=new HashMap<String,Object>();
				List<Double> starList=new ArrayList<Double>();
				List<Integer> starCount= new ArrayList<Integer>();
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
						SQL.append(" where record=1");
					}
					else if(item.equals("best")){
						SQL.append(" where record=1 and l_price!=0 order by l_goods desc limit 0,5 ");
					}
					else if(item.equals("new")){
						SQL.append(" where record=1 and l_price!=0 order by l_reg_date desc limit 0,5 "); //신규 5개
					}
					else if(item.equals("free")){
						SQL.append(" where l_price=0 and record=1 order by l_reg_date desc limit 0,5");
					}

					pstmt=con.prepareStatement(SQL.toString()); 
			
					rs=pstmt.executeQuery();
					while(rs.next()){
						LectureDTO ldto=new LectureDTO();	//while안에 dto만들어야함.밖에만드니까 리스트에 똑같은 품목(마지막것)만 계속 나옴
						//화면에 출력될 메일주소에서 @ 제거
						String id=null;
						if(rs.getString("l_m_email").indexOf("@")>-1){
							id=rs.getString("l_m_email").substring(0,rs.getString("l_m_email").indexOf("@"));
						}else{id=rs.getString("l_m_email");}
						//
						ldto.setL_content(rs.getString("l_content"));
						ldto.setL_goods(rs.getInt("l_goods"));
						ldto.setL_m_email(id);
						ldto.setL_number(rs.getInt("l_number"));
						ldto.setL_pct(rs.getInt("l_pct"));
						ldto.setL_price(rs.getInt("l_price"));
						ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
						ldto.setL_type(rs.getString("l_type"));
						ldto.setL_type2(rs.getString("l_type2"));
						ldto.setL_level(rs.getString("l_level"));
						ldto.setPay_count(rs.getInt("pay_count"));
						ldto.setPct_date(rs.getTimestamp("pct_date"));
						ldto.setL_img(rs.getString("l_img"));
						ldto.setL_title(rs.getString("l_title"));
						sql="select avg(r_rating) from r_board group by r_l_num having r_l_num=?";
						pstmt=con.prepareStatement(sql);
						
						pstmt.setInt(1, rs.getInt("l_number"));
						
						rs2=pstmt.executeQuery();
						if(rs2.next()){
							starList.add(rs2.getDouble(1));
							
						}else{
							starList.add(0.0);
							
						}
						sql="select count(*) from r_board where r_l_num=?";
						pstmt=con.prepareStatement(sql);
						
						pstmt.setInt(1, rs.getInt("l_number"));
						
						rs2=pstmt.executeQuery();
						if(rs2.next()){
							starCount.add(rs2.getInt(1));
						}else{
							starCount.add(0);
						}
						
						lectureList.add(ldto);
					}
					System.out.println("상품목록 저장완료:"+lectureList.size());
					map.put("lectureList", lectureList);
					map.put("starList", starList);
					map.put("starCount", starCount);
				} catch (Exception e) {
					System.out.println("상품정보조회 실패");
					e.printStackTrace();
				} finally {
					closeDB();
				}
				return map;
			}
	//getLectureSelectList()
			/*public void insertlectures(LectureDTO ldto) {
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
							+ "(l_number,l_m_email,l_reg_date,l_content,l_type,l_type2,l_level,l_price,l_pct,l_img,l_goods,pct_date,paynum,l_title) "
							+ "value(?,?,?,now(),?,?,?,?,?,?,?,?,?,now(),?,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.setString(2, ldto.getL_m_email());
					reg_date
					pstmt.setString(3, ldto.getL_content());
					pstmt.setString(4, ldto.getL_type());
					pstmt.setString(5, ldto.getL_type2());
					pstmt.setString(6, ldto.getL_level());
					pstmt.setInt(7, ldto.getL_price());
					pstmt.setInt(8, ldto.getL_pct());
					pstmt.setString(9, ldto.getL_img());
					
					pstmt.setInt(10, ldto.getL_goods());
					pct_date
					pstmt.setInt(11, ldto.getPay_count());
					pstmt.setString(12, ldto.getL_title());
					
					pstmt.executeUpdate();
					System.out.println("강의 등록 성공");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("강의 등록 실패");
					
				}finally{
					closeDB();
				}
				
				
				
			}*/
			
			
	// getFileList()
	public List<ArrayList<FileDTO>> getFileList(int l_number){
		List<ArrayList<FileDTO>> fileSet = new ArrayList<ArrayList<FileDTO>>();
		try{
			con = getConnection();
			System.out.print("getFileList() : ");
			sql = "select distinct f_sec_list "
				+ "from            file "
				+ "where           f_l_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, l_number);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ArrayList<FileDTO> fileList = new ArrayList<FileDTO>();
				sql = "select   * "
					+ "from     file "
					+ "where    f_l_num = ? and f_sec_list = ? "
					+ "order by f_sec_list asc, f_col_list asc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, l_number);
				pstmt.setInt(2, rs.getInt(1));
				rs2 = pstmt.executeQuery();
				while(rs2.next()){
					FileDTO fdto = new FileDTO();
					fdto.setF_num(rs2.getInt("f_num"));
					fdto.setF_l_num(rs2.getInt("f_l_num"));
					fdto.setF_sec_list(rs2.getInt("f_sec_list"));
					fdto.setF_sec_name(rs2.getString("f_sec_name"));
					fdto.setF_col_list(rs2.getInt("f_col_list"));
					fdto.setF_col_name(rs2.getString("f_col_name"));
					fdto.setF_name(rs2.getString("f_name"));
					fdto.setF_o_name(rs2.getString("f_o_name"));
					fdto.setF_playtime(rs2.getDouble("f_playtime"));
					fdto.setF_reg_date(rs2.getTimestamp("f_reg_date"));
					fdto.setF_m_email(rs2.getString("f_m_email"));
					fileList.add(fdto);
				}
				fileSet.add(fileList);
			}
			System.out.println("강의 파일 목록 저장 완료, 강의 섹션 수 : " + fileSet.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return fileSet;
	}
	// getFileList()
	
	// getLectureList(String l_m_email) // 강사별 강의 목록
	public List<LectureDTO> getLectureList(String l_m_email){
		List<LectureDTO> lectureList= new ArrayList<LectureDTO>();
		try {
			con = getConnection();
			System.out.print("getLectureList() : ");
			
			sql = "select * from lecture where l_m_email = ?";
			pstmt = con.prepareStatement(sql); 
			pstmt.setString(1, l_m_email);
			rs = pstmt.executeQuery();
			while(rs.next()){
				LectureDTO ldto=new LectureDTO();
				ldto.setL_number(rs.getInt("l_number"));
				ldto.setL_m_email(l_m_email);
				ldto.setL_title(rs.getString("l_title"));
				ldto.setL_abilities(rs.getString("l_abilities"));
				ldto.setL_targets(rs.getString("l_targets"));
				ldto.setL_based(rs.getString("l_based"));
				ldto.setL_description(rs.getString("l_description"));
				ldto.setL_content(rs.getString("l_content"));
				ldto.setL_type(rs.getString("l_type"));
				ldto.setL_type2(rs.getString("l_type2"));
				ldto.setL_level(rs.getString("l_level"));
				ldto.setL_img(rs.getString("l_img"));
				ldto.setL_price(rs.getInt("l_price"));
				ldto.setL_goods(rs.getInt("l_goods"));
				ldto.setL_pct(rs.getInt("l_pct"));
				ldto.setRecord(rs.getInt("record"));
				ldto.setL_reg_date(rs.getTimestamp("l_reg_date"));
				ldto.setPct_date(rs.getTimestamp("pct_date"));
				ldto.setPay_count(rs.getInt("pay_count"));
				ldto.setStart_msg(rs.getString("start_msg"));
				ldto.setEnd_msg(rs.getString("end_msg"));
				lectureList.add(ldto);
			}
			System.out.println("강사별 강의 목록 저장 완료, 강의 수 : " + lectureList.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return lectureList;
	}
	// getLectureList(String l_m_email) // 강사별 강의 목록
	public int createLecture(String email,String title) {
		int check=0;
		try{
			con =getConnection();
			sql="select max(l_number) from lecture";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				check=rs.getInt(1)+1;
			}
			sql="insert into lecture(l_number,l_title,l_m_email) values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, check);
			pstmt.setString(2, title);
			pstmt.setString(3, email);
			
			pstmt.executeUpdate();
			System.out.println("정상작동"+check);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	public void removeInstructor(int l_num) {
		try{
			con=getConnection();
			sql="delete from lecture where l_number=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, l_num);
			
			pstmt.executeUpdate();
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
	}
	
}
