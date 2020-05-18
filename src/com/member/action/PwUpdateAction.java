package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class PwUpdateAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8"); 
		HttpSession session = request.getSession();
		String m_email = (String)session.getAttribute("m_email");
		String Oldm_pw = (String)request.getParameter("Oldm_pw");
		String m_pw = (String)request.getParameter("m_pw");
		
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.loginCheck(m_email, Oldm_pw);
		if(m_email == null ) {
			response.sendRedirect("./Main.le");
		}else if(check == -1) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 정확히 입력해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		PrintWriter out = response.getWriter();
		mdao.update_pw(m_email, m_pw);
		out.println("<script>");
		out.println("alert('비밀번호 변경 완료.');");
		out.println("location.href='MemberInfo.me';");
		out.println("</script>");
		out.close();
		/*
		 * ActionForward forward = new ActionForward();
		 * forward.setPath("./MemberInfo.me"); forward.setRedirect(true);
		 */
		
		return null;
	}

}
