package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class TechRequestAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String m_email = (String)session.getAttribute("m_email");
		String m_name = (String)request.getParameter("m_name");
		String m_addr = (String)request.getParameter("m_addr");
		String m_phone = (String)request.getParameter("m_phone") +"-"+(String)request.getParameter("m_phone2")
		+"-"+(String)request.getParameter("m_phone3");
		String m_intro = (String)request.getParameter("M_intro");
		
		if(m_email == null ) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인을 먼저 해주세요.');");
			out.print("location.href = 'Main.le';");
			out.print("</script>");
			out.close();
			return null;
		}
		
		
		
		
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		mdto.setM_email(m_email);
		mdto.setM_name(m_name);
		mdto.setM_intro(m_intro);
		mdto.setM_phone(m_phone);
		mdto.setM_addr(m_addr);
		
		mdao.techRequest(mdto);
		
		int rank = mdao.getRank(m_email);
		session.setAttribute("m_rank", rank);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.le");
		forward.setRedirect(true);
		return forward;
	}

}
