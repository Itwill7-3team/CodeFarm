package com.ask.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.notice.db.NoticeDTO;


public class AskDAO {
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
	
	//getQuestionCount()
	public int getAskCount(){
		int check = 0;
		try {
			con = getConnection();
			System.out.print("getAskCount() : ");
			
			sql = "select count(*) from board where re_lev=0";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				check = rs.getInt(1);
			}
			System.out.println("문답게시판 전체 글 개수 : " + check);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	
	public ArrayList<AskDTO> getBoardList(int startRow, int pageSize){
		ArrayList<AskDTO> boardList= new ArrayList<AskDTO>();
		try{
			con=getConnection();
			sql="select * from board "
					+ "where re_lev=0 " //질문만 보이게~
					+ "order by re_ref desc, re_seq asc "
					+ "limit ?,?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1); //시작행-1
			pstmt.setInt(2, pageSize); //가져갈 글의 개수
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				AskDTO adto=new AskDTO();
				//화면에 출력될 메일주소에서 @ 제거
				String id= null;
				if(rs.getString("writer").indexOf("@")>-1){
					id=rs.getString("writer").substring(0,rs.getString("writer").indexOf("@"));
				}else{id=rs.getString("writer");}
				//
				adto.setNum(rs.getInt("num"));
				adto.setL_num(rs.getInt("l_num"));
				adto.setType(rs.getString("type"));
				adto.setTitle(rs.getString("title"));
				adto.setContent(rs.getString("content"));
				adto.setWriter(id);				
				adto.setRe_lev(rs.getInt("re_lev"));
				adto.setRe_ref(rs.getInt("re_ref"));
				adto.setRe_seq(rs.getInt("re_seq"));
				adto.setReg_date(rs.getTimestamp("reg_date"));
				boardList.add(adto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardList;
	}
	public ArrayList<AskDTO> getAnswerList(int num){
		ArrayList<AskDTO> boardList= new ArrayList<AskDTO>();
		try{
			con=getConnection();
			sql="select * from board "
					+ "where re_ref=? and re_lev>0 " //답글만~
					+ "order by re_seq asc ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num); 
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				AskDTO adto=new AskDTO();
				//화면에 출력될 메일주소에서 @ 제거
				String id= null;
				if(rs.getString("writer").indexOf("@")>-1){
					id=rs.getString("writer").substring(0,rs.getString("writer").indexOf("@"));
				}else{
					id=rs.getString("writer");
				}
				adto.setNum(rs.getInt("num"));
				adto.setL_num(rs.getInt("l_num"));
				adto.setType(rs.getString("type"));
				adto.setTitle(rs.getString("title"));
				adto.setContent(rs.getString("content"));
				adto.setWriter(id);
				adto.setRe_lev(rs.getInt("re_lev"));
				adto.setRe_ref(rs.getInt("re_ref"));
				adto.setRe_seq(rs.getInt("re_seq"));
				adto.setReg_date(rs.getTimestamp("reg_date"));
				boardList.add(adto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardList;
	}
	
	
	public AskDTO getBoard(int num){
		AskDTO adto= new AskDTO();
		try{
			con=getConnection();
			sql="select * from board where num = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				//@이하 처리
				String M =rs.getString("writer");
				String id=null;
				if(M.indexOf("@")>-1){
					id= M.substring(0,M.indexOf("@"));
				}else{id=M;}
				//
				adto.setNum(rs.getInt("num"));
				adto.setL_num(rs.getInt("l_num"));
//				adto.setQ_l_name(rs.getString("q_l_name"));
				adto.setType(rs.getString("type"));
				adto.setTitle(rs.getString("title"));
				adto.setContent(rs.getString("content"));
				adto.setWriter(id);
				adto.setRe_lev(rs.getInt("re_lev"));
				adto.setRe_ref(rs.getInt("re_ref"));
				adto.setRe_seq(rs.getInt("re_seq"));
				adto.setReg_date(rs.getTimestamp("reg_date"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return adto;
	}
	
	//C-insertAsk(ndto)
		public int insertAsk(AskDTO adto) {
			int check=-1;
			int num=0;
			//1: 성공/ -1: 실패
			
			try {
				//1,2
				con=getConnection();
				
				//3 글번호 => 오토인크리먼트
				sql="select max(num) from board";
				pstmt= con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					num=rs.getInt("max(num)")+1;
				}
				System.out.println("글번호:"+num);
				//3 글작성메서드
				sql="insert into board (type,title,content,writer,re_ref,re_lev,re_seq,l_num) values(?,?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, adto.getType());
				pstmt.setString(2, adto.getTitle());
				pstmt.setString(3, adto.getContent());
				pstmt.setString(4, adto.getWriter());
				pstmt.setInt(5, num); //re_ref : 답글그룹 ( 일반글 번호와 동일 )
				pstmt.setInt(6, 0); //re_lev :초기화 => 답글 들여쓰기
				pstmt.setInt(7, 0); //re_seq :초기화 => 답글 순서
				pstmt.setInt(8, adto.getL_num()); //강의 번호
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
		//insertAsk(adto)
		
		//getAnswerCount()
		public int getAnswerCount(int num){
			int check = 0;
			try {
				con = getConnection();
//				System.out.print("getAnswerCount() : ");
				
				sql = "select count(*) from board where re_ref=? and re_seq>0";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()){
					check = rs.getInt(1);
				}
//				System.out.println("답변 개수 : " + check);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return check;
		}
		
		
		//C-insertAnswer(ndto)
		public int insertAnswer(AskDTO adto) {
			int check=-1;
			int num=0;
			//1: 성공/ -1: 실패
			
			try {
				//1,2
				con=getConnection();
				
				//3 글번호 => 오토인크리먼트
				sql="select max(num) from board";
				pstmt= con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					num=rs.getInt("max(num)")+1;
				}
				System.out.println("글번호:"+num);
				//3 글작성메서드
				sql="insert into board (type,title,content,writer,re_ref,re_lev,re_seq) values(?,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, adto.getType());
				pstmt.setString(2, adto.getTitle());
				pstmt.setString(3, adto.getContent());
				pstmt.setString(4, adto.getWriter());
				pstmt.setInt(5, adto.getRe_ref()); //re_ref : 답글그룹 ( 일반글 번호와 동일 )
				pstmt.setInt(6, adto.getRe_lev()); //re_lev :초기화 => 답글 들여쓰기
				pstmt.setInt(7, adto.getRe_seq()); //re_seq :초기화 => 답글 순서
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
		//insertAnswer(adto)
	
		//getMyQuestionCount()
		public int getMyAskCount(String m_email){
			int check = 0;
			try {
				con = getConnection();
				System.out.print("getAskCount() : ");
				
				sql = "select count(*) from board where writer=? and re_lev=0";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_email);
				rs = pstmt.executeQuery();
				if(rs.next()){
					check = rs.getInt(1);
				}
				System.out.println("내가한 질문 글 개수 : " + check);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return check;
		}
		
		//getMyQuestionCount()
		
		
		public ArrayList<AskDTO> getMyAskList(int startRow, int pageSize,String m_email){
			ArrayList<AskDTO> boardList= new ArrayList<AskDTO>();
			try{
				con=getConnection();
				sql="select * from board "
						+ "where re_lev=0 and writer=?" //질문만 보이게~
						+ "order by re_ref desc, re_seq asc "
						+ "limit ?,?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, m_email ); //시작행-1
				pstmt.setInt(2, startRow-1); //가져갈 글의 개수
				pstmt.setInt(3, pageSize); //가져갈 글의 개수
				
				rs=pstmt.executeQuery();
				while(rs.next()){
					AskDTO adto=new AskDTO();
					//@이하 처리
					String M=rs.getString("writer");
					String id=null;
					if(M.indexOf("@")>-1){
						id=M.substring(0,M.indexOf("@"));
					}else{id=M;}
					//
					adto.setNum(rs.getInt("num"));
					adto.setL_num(rs.getInt("l_num"));
					adto.setType(rs.getString("type"));
					adto.setTitle(rs.getString("title"));
					adto.setContent(rs.getString("content"));
					
					adto.setWriter(id);
					
					adto.setRe_lev(rs.getInt("re_lev"));
					adto.setRe_ref(rs.getInt("re_ref"));
					adto.setRe_seq(rs.getInt("re_seq"));
					adto.setReg_date(rs.getTimestamp("reg_date"));
					boardList.add(adto);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return boardList;
		}
}
