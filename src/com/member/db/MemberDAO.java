package com.member.db;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	Connection con= null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	public  MemberDAO() {//기본 생성자
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
		System.out.println("db연결 완료");
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
	
	
	//이메일 체크  업데이트
		public int update_emailcheck(String m_email) {
			
			sql = "update member set m_emailCheck = true where m_email=?";
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_email);
				pstmt.executeUpdate();
				return 1;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			
			return -1;
		}
		
		
		

		public int join(MemberDTO user) {

			sql = "INSERT INTO member (m_email, m_pw, m_emailHash, m_regdate, m_emailCheck) VALUES (?, ?, ?, now(), false)";

			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, user.getM_email());

				pstmt.setString(2, user.getM_pw());

				pstmt.setString(3, user.getM_emailHash());

			

				return pstmt.executeUpdate();

			} catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeDB();
			}

			return -1; // 회원가입 실패

		}

		

		public String getUserEmail(String userID) {

			sql = "SELECT m_email FROM member WHERE m_email = ?";

			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, userID);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					return rs.getString(1); // 이메일 주소 반환

				}

			} catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeDB();
			}

			return null; // 데이터베이스 오류

		}

		//hash 값 받아오기
		public String getHash(String m_email) {

			sql = "SELECT m_emailHash FROM member WHERE m_email = ?";

			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);
				System.out.println(m_email);
				pstmt.setString(1, m_email);
				
				rs = pstmt.executeQuery();

				while(rs.next()) {
					System.out.println(rs.getString("m_emailHash"));
					return rs.getString("m_emailHash"); // 이메일 주소 반환

				}

			} catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeDB();
			}

			return null; // 데이터베이스 오류

		}

		public boolean getUserEmailChecked(String userID) {

			sql = "SELECT m_emailCheck FROM member WHERE m_email = ?";

			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, userID);

				rs = pstmt.executeQuery();

				while(rs.next()) {

					return rs.getBoolean(1); // 이메일 등록 여부 반환

				}

			} catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeDB();
			}
			return false; // 데이터베이스 오류

		}

		

		public boolean setUserEmailChecked(String userID) {

			sql = "UPDATE member SET m_emailCheck = true WHERE m_email = ?";

			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, userID);

				pstmt.executeUpdate();

				return true; // 이메일 등록 설정 성공

			} catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeDB();
			}

			return false; // 이메일 등록 설정 실패

		}
		
		//이메일 중복 체크
		public int idCheck(String m_email) {
			sql = "select * from member where m_email = ?";
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_email);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return 1;
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return 0;
		}

		
		//로그인
			public int loginCheck(String m_email, String m_pw) {
				int check = 0; //0일 때 정보없음
				sql = "select * from member where m_email = ?";
				try {
					con=getConnection();
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_email);
					
					rs = pstmt.executeQuery();
					if(rs.next()) {
						if(m_pw.equals(rs.getString("m_pw"))){
							if(rs.getBoolean("m_emailCheck") == false) {
								//이메일 인증 안함
								check =2;
							}else {
								//로그인 완료
								check = 1;
							}
						}else {
							//비밀번호 오류
							check = -1;
							
						}
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeDB();
				}
				return check;
			}
			
			// getMemberList()
			public List<MemberDTO> getMemberList(){
				
				List<MemberDTO> memberList = new ArrayList<MemberDTO>();
				
				try {
					// 1,2
					con = getConnection();
					// 3 sql
					sql = "select * from member";
					pstmt = con.prepareStatement(sql);
					
					// 4 실행
					rs = pstmt.executeQuery();
					
					// 5  rs 값 비교
				    while(rs.next()){
				    	MemberDTO mdto = new MemberDTO();
				    	mdto.setM_email(rs.getString("m_email"));
				    	mdto.setM_rank(rs.getString("m_rank"));
				    	//  한사람의 정보를  memberList배열에 한칸으로 저저장
				    	memberList.add(mdto);
				    }
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				return memberList;
			}
			// getMemberList()
			
			
			
			//AdminDelte()
			public void AdminDelete(String m_email) {
				try {
					con = getConnection();
					sql = "delete from member where m_email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_email);
					pstmt.executeUpdate();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			//AdminDelte()
			
			
			//
	}
	


	
	