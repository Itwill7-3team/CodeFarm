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
			int check=-1;
			sql = "update member set m_emailCheck = true, m_rank=1 where m_email=? ";
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_email);
				check=pstmt.executeUpdate();
				check=1;
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return check;
		}
		
		
		

		public int join(MemberDTO mdto) {
			int check=-1;
			sql = "INSERT INTO member (m_email,m_nick, m_pw, m_emailHash, m_regdate, m_emailCheck) VALUES (?,?, ?, ?, now(), false)";
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, mdto.getM_email());
				pstmt.setString(2, mdto.getM_email().split("@")[0]);

				pstmt.setString(3, mdto.getM_pw());

				pstmt.setString(4, mdto.getM_emailHash());

			

				check= pstmt.executeUpdate();

			} catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeDB();
			}

			return check; // 회원가입 실패

		}

		

		public String getUserEmail(String userID) {
			sql = "SELECT m_email FROM member WHERE m_email = ?";
			String check=null;
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, userID);

				rs = pstmt.executeQuery();

				while(rs.next()) {
					check= rs.getString(1); // 이메일 주소 반환
				}

			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}

			return check; // 데이터베이스 오류

		}

		//hash 값 받아오기
		public String getHash(String m_email) {

			sql = "SELECT m_emailHash FROM member WHERE m_email = ?";
			String check=null;
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);
				System.out.println(m_email);
				pstmt.setString(1, m_email);
				
				rs = pstmt.executeQuery();

				while(rs.next()) {
					System.out.println(rs.getString("m_emailHash"));
					check= rs.getString("m_emailHash"); // 이메일 주소 반환
				}

			} catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeDB();
			}

			return check; // 데이터베이스 오류

		}

		public boolean getUserEmailChecked(String userID) {

			sql = "SELECT m_emailCheck FROM member WHERE m_email = ?";
			boolean check =false;
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, userID);

				rs = pstmt.executeQuery();

				while(rs.next()) {
					check= rs.getBoolean(1); // 이메일 등록 여부 반환
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return check; // 데이터베이스 오류

		}

		

		public boolean setUserEmailChecked(String userID) {

			sql = "UPDATE member SET m_emailCheck = true WHERE m_email = ?";
			boolean check=false;
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, userID);

				pstmt.executeUpdate();

				check= true; // 이메일 등록 설정 성공

			} catch (Exception e) {

				e.printStackTrace();

			}finally {
				closeDB();
			}

			return check; // 이메일 등록 설정 실패

		}
		
		//이메일 중복 체크
		public int idCheck(String m_email) {
			sql = "select count(*) from member where m_email = ?";
			int check=0;
			try {
				con=getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_email);
				rs = pstmt.executeQuery();
				if(rs.next()){
					check=rs.getInt(1);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeDB();
			}
			return check;
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
				    	mdto.setM_rank(rs.getInt("m_rank"));
				    	mdto.setM_nick(rs.getString("m_nick"));
				    	mdto.setM_addr(rs.getString("m_addr"));
				    	mdto.setM_intro(rs.getString("m_intro"));
				    	mdto.setM_phone(rs.getString("m_phone"));
				    
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
				}finally {
					closeDB();
				}
			}
			//AdminDelte()
			
			
			//getInfo()
			public MemberDTO getInfo(String m_email) {
				MemberDTO mdto = new MemberDTO();
				try {
					con = getConnection();
					sql = "select * from member where m_email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_email);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						mdto.setM_email(rs.getString("m_email"));
						mdto.setM_rank(rs.getInt("m_rank"));
						mdto.setM_addr(rs.getString("m_addr"));
						mdto.setM_intro(rs.getString("m_intro"));
						mdto.setM_nick(rs.getString("m_nick"));
						mdto.setM_name(rs.getString("m_name"));
						mdto.setM_phone(rs.getString("m_phone"));
						mdto.setM_pw(rs.getString("m_pw"));
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeDB();
				}
				return mdto;
			}
			
			//getInfo()
			
			
			//자기소개 업데이트
			public void IntroUpdate(String m_email,String m_intro, String m_nick) {
				try {
					con = getConnection();
					sql = "update member set m_intro =?, m_nick=? where m_email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_intro);
					pstmt.setString(2, m_nick);
					pstmt.setString(3, m_email);
					pstmt.executeUpdate();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
			}
			
			public void update_pw(String m_email, String m_pw) {
				try {
					con = getConnection();
					sql = "update member set m_pw=? where m_email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_pw);
					pstmt.setString(2, m_email);
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
			}
			public void memberDelete(String m_email) {
				try {
					con = getConnection();
					sql = "delete from member where m_email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_email);
					pstmt.executeUpdate();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
			}
			public void techRequest(MemberDTO mdto) {
				try {
					con = getConnection();
					sql = "update member set m_name=?, m_intro=?, m_phone=?,"
							+ "m_rank=2,m_addr=? where m_email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mdto.getM_name() );
					pstmt.setString(2, mdto.getM_intro());
					pstmt.setString(3, mdto.getM_phone());
					pstmt.setString(4, mdto.getM_addr());
					pstmt.setString(5, mdto.getM_email());
					pstmt.executeUpdate();
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeDB();
				}
			}
			
			public MemberDTO apiLogin(MemberDTO mdto) {
				
				try {
					con = getConnection();
					sql = "select * from member where m_email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mdto.getM_email());
					rs = pstmt.executeQuery();
					if(rs.next()) {
						mdto.setM_nick(rs.getString("m_nick"));
						mdto.setM_rank(rs.getInt("m_rank"));
						return mdto;
					}else {
						sql = "insert into member (m_email, m_pw, m_nick, m_rank,"
								+ "m_regdate, m_emailCheck) values (?,?,?,1,now(),true)";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, mdto.getM_email());
						pstmt.setString(2, mdto.getM_pw());
						pstmt.setString(3, mdto.getM_nick());
						pstmt.executeUpdate();
						
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeDB();
				}
				return mdto;
			}
			
			public int getRank(String m_email) {
				int check = 0;
				try {
					con = getConnection();
					sql = "select m_rank from member where m_email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_email);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						check = rs.getInt("m_rank");
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return check;
			}
	}
	


	
	