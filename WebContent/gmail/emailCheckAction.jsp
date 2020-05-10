<%@page import="util.Script"%>
<%@page import="util.SHA256"%>
<%@page import="com.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = request.getContextPath()+"/index.jsp";
	MemberDAO mdao = new MemberDAO();
	String m_email = null;
	if(session.getAttribute("m_email") != null){
		m_email = (String)session.getAttribute("m_email");
	}
	
	String code = request.getParameter("code");
	String salt = mdao.getHash(m_email);
	String emailHash = SHA256.getEncrypt(m_email,salt);
	
	boolean isTrue = emailHash.equals(code)? true : false;
	
	if(isTrue){
		int result = mdao.update_emailcheck(m_email);
		if(result == 1){
			Script.moving(response, "인증에 성공하였습니다.",url);
		}else{
			Script.moving(response, "데이터베이스 오류");
			
		}
		
	}else{
		Script.moving(response, "인증에 실행하였습니다.");
	}
	

%>