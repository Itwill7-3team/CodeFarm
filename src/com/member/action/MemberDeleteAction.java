package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class MemberDeleteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8"); 
		HttpSession session = request.getSession();
		String m_email = (String)session.getAttribute("m_email");
		String m_pw = (String)request.getParameter("m_pw");
		System.out.println("data: "+m_email+":  "+m_pw);
		if(m_email == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인을 해주세요.');");
			out.print("location.href='Main.me';");
			out.print("</script>");
			out.close();
			return null;
		}
		
		MemberDAO mdao = new MemberDAO();
		int check = mdao.loginCheck(m_email, m_pw);
		if(check == -1) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('비밀번호가 일치하지 않습니다.');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
		mdao.memberDelete(m_email);
		PrintWriter out = response.getWriter();
		session.removeAttribute("m_email");
		out.print("<script>");
		out.print("alert('회원탈퇴가 완료되었습니다.그동안 이용해주셔서 감사합니다.');");
		out.print("location.href='Main.le';");
		out.print("</script>");
		out.close();
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.le");
		forward.setRedirect(true);
		return forward;
	}
}
