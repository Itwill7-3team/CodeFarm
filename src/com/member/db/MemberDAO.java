package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_email);
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return -1;
	}
	
	
	public int login(String userID, String userPassword) {

		sql = "SELECT m_pw FROM USER WHERE m_email = ?";

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				if(rs.getString(1).equals(userPassword))

					return 1; // 로그인 성공

				else

					return 0; // 비밀번호 틀림

			}

			return -1; // 아이디 없음

		} catch (SQLException e) {

			e.printStackTrace();

		}finally {
			closeDB();
		}

		return -2; // 데이터베이스 오류

	}

	

	public int join(MemberDTO user) {

		sql = "INSERT INTO member (m_email, m_pw, m_emailHash, m_regdate, m_emailCheck) VALUES (?, ?, ?, now(), false)";

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, user.getM_email());

			pstmt.setString(2, user.getM_pw());

			pstmt.setString(3, user.getM_emailHash());

		

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}finally {
			closeDB();
		}

		return -1; // 회원가입 실패

	}

	

	public String getUserEmail(String userID) {

		sql = "SELECT m_email FROM member WHERE m_email = ?";

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				return rs.getString(1); // 이메일 주소 반환

			}

		} catch (SQLException e) {

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

			pstmt = con.prepareStatement(sql);
			System.out.println(m_email);
			pstmt.setString(1, m_email);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				System.out.println(rs.getString("m_emailHash"));
				return rs.getString("m_emailHash"); // 이메일 주소 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null; // 데이터베이스 오류

	}

	public boolean getUserEmailChecked(String userID) {

		sql = "SELECT m_emailCheck FROM member WHERE m_email = ?";

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				return rs.getBoolean(1); // 이메일 등록 여부 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}
		return false; // 데이터베이스 오류

	}

	

	public boolean setUserEmailChecked(String userID) {

		sql = "UPDATE member SET m_emailCheck = true WHERE m_email = ?";

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, userID);

			pstmt.executeUpdate();

			return true; // 이메일 등록 설정 성공

		} catch (SQLException e) {

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
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
