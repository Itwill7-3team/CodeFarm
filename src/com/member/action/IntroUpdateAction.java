package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class IntroUpdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String m_email = (String)session.getAttribute("m_email");
		
		String m_intro = request.getParameter("m_intro");
		String m_nick = request.getParameter("m_nick");
		
		if(m_email == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인을 해주세요');");
			out.print("locattion.href='Main.le'");
			out.print("</script>");
			out.close();
			return null;
		}
		MemberDAO mdao = new MemberDAO();
		mdao.IntroUpdate(m_email,m_intro,m_nick);
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberInfo.me");
		forward.setRedirect(true);
		return forward;
	}
}
