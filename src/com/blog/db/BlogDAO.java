package com.blog.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.lecture.db.LectureDTO;


public class BlogDAO {
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
	

	
	public ArrayList<BlogDTO> getBlogList(int startRow, int pageSize){
		//블로그 리스트 가져오는 메서드
		ArrayList<BlogDTO> blogList=new ArrayList<BlogDTO>();
		try{
			con=getConnection();
			
			sql="select * from blog "
					+ "order by b_reg_date desc "
					+ "limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1); //시작행-1
			pstmt.setInt(2, pageSize); //가져갈 글의 개수
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				BlogDTO bdto =new BlogDTO();
				bdto.setB_num(rs.getInt("b_num"));
				bdto.setB_title(rs.getString("b_title"));
				bdto.setB_img(rs.getString("b_img"));
				bdto.setB_content(rs.getString("b_content"));
				bdto.setB_writer(rs.getString("b_writer"));
				bdto.setB_reg_date(rs.getTimestamp("b_reg_date"));
				bdto.setB_ip(rs.getString("b_ip"));
				
				blogList.add(bdto);	
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return blogList;
	}

	public ArrayList<BlogDTO> getBlogMainList(){
		//블로그 리스트 가져오는 메서드
		ArrayList<BlogDTO> blogList=new ArrayList<BlogDTO>();
		try{
			con=getConnection();
			
			sql="select * from blog "
					+ "order by b_reg_date desc "
					+ "limit 0,3";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				BlogDTO bdto =new BlogDTO();
				bdto.setB_num(rs.getInt("b_num"));
				bdto.setB_title(rs.getString("b_title"));
				bdto.setB_img(rs.getString("b_img"));
				//메인에서 태그 빼는 정규식
				bdto.setB_content(rs.getString("b_content").replaceAll("<(/)?([a-zA-Z1-9]*)(\\s[a-zA-Z1-9]*=[^>]*)?(\\s)*(/)?>", ""));
				bdto.setB_writer(rs.getString("b_writer"));
				bdto.setB_reg_date(rs.getTimestamp("b_reg_date"));
				bdto.setB_ip(rs.getString("b_ip"));
				
				blogList.add(bdto);	
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return blogList;
	}
	
	// getBlogCount()
	public int getBlogCount(){
		int check = 0;
		try {
			con = getConnection();
			System.out.print("getblogCount() : ");
			
			sql = "select count(*) from blog";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = rs.getInt(1);
			}
			System.out.println("블로그 전체 글 개수 : " + check);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	// getBlogCount()
	
	//C-insertBlog(bdto)
	public int insertBlog(BlogDTO bdto) {
		int check=-1;
		int num=0;
		//1: 성공/ -1: 실패
		
		try {
			//1,2
			con=getConnection();
			
			//3 글번호 => 오토인크리먼트
			sql="select max(b_num) from blog";
			pstmt= con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				num=rs.getInt("max(b_num)")+1;
			}
			System.out.println("글번호:"+num);
			//3 글작성메서드
			sql="insert into blog (b_title,b_img,b_content,b_writer,b_ip) values(?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bdto.getB_title());
			pstmt.setString(2, bdto.getB_img());
			pstmt.setString(3, bdto.getB_content());
			pstmt.setString(4, bdto.getB_writer());
			pstmt.setString(5, bdto.getB_ip());
			check=pstmt.executeUpdate();
			//4
			if(check==1){
				System.out.println("글쓰기 성공"+check);
			}else{
				System.out.println("글쓰기 실패"+check);
			}					
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	//insertblog(bdto)
	
	//R-getBlog(num)
		public BlogDTO getBlog(int num){
				BlogDTO bdto = null;
			try {
				//1,2
				con=getConnection();
				//3
				sql="select * from blog where b_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				//4
				rs=pstmt.executeQuery();
				
				//5
				if(rs.next()){
					bdto = new BlogDTO();
					bdto.setB_num(rs.getInt("b_num"));
					bdto.setB_title(rs.getString("b_title"));
					bdto.setB_img(rs.getString("b_img"));
					bdto.setB_content(rs.getString("b_content"));
					bdto.setB_writer(rs.getString("b_writer"));
					bdto.setB_reg_date(rs.getTimestamp("b_reg_date"));
					bdto.setB_ip(rs.getString("b_ip"));

					
				}
				System.out.println("@@@해당 정보 저장 완료:"+bdto);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			
			return bdto;
		}
		//getBlogContent(num)
		
		//U-updateBlog(num,bdto)
		public int updateBlog(BlogDTO bdto) {
			int check=0;
			
			try {
				//1,2
				con=getConnection();
				//3
				sql="select * from blog where b_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bdto.getB_num());
				//4
				rs=pstmt.executeQuery();
				System.out.println("@@@@ select");
				//5
				if(rs.next()){//글있음
						//3
						sql="update blog set b_title=?, b_img=?, b_content=?, b_ip=? where b_num=?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, bdto.getB_title());
						pstmt.setString(2, bdto.getB_img());
						pstmt.setString(3, bdto.getB_content());
						pstmt.setString(4, bdto.getB_ip());
						pstmt.setInt(5, bdto.getB_num());
						
						//4
						pstmt.executeUpdate();
						check=1;
				}else{// 글없음
					check=-1;
				}
				System.out.println("@@ 정보 수정 완료!"+check);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return check;
		}
		
		
		//D-deleteBlog(num)
		public int deleteBlog(int num){
			int check=-1;
		
			try {
				con=getConnection();
				
				// 해당 아이디의 글을 삭제 =>세션확인필요
				//3 select
				sql="SELECT * FROM blog WHERE b_num=?";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs=pstmt.executeQuery();
				
				if(rs.next()){//글있음
						//3
						sql="DELETE FROM blog WHERE b_num=?";
						pstmt=con.prepareStatement(sql);
						pstmt.setInt(1, num);
						pstmt.executeUpdate();
						check = 1;
						System.out.println("@@@글 삭제 완료");
					
				}else{//글없음
					check=-1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}		
			
			return check;
		}
		//D-deleteBlog(num)
	
		
}
