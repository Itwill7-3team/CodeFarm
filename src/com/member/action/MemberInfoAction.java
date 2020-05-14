package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberInfoAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String m_email = (String)session.getAttribute("m_email");
		if(m_email == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인을 해주세요');");
			out.print("locattion.href='Main.le'");
			out.print("</script>");
			out.close();
		}
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		
		mdto = mdao.getInfo(m_email);
		request.setAttribute("mdto", mdto);
		ActionForward forward = new  ActionForward();
		forward.setPath("./views/member/info.jsp");
		return forward;
	}

}
