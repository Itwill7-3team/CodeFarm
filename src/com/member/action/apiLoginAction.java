package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class apiLoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("@@@@ apiLoginAction_execute()");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String m_email = request.getParameter("m_email");
		String m_pw = request.getParameter("m_pw");
		String m_nick = request.getParameter("m_nick");
		
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		mdto.setM_email(m_email);
		mdto.setM_pw(m_pw);
		mdto.setM_nick(m_nick);
		System.out.println("@@@@@@@@@@mdto정보:  "+mdto);
		mdao.apiLogin(mdto);
		
		mdto = mdao.getInfo(m_email);
		
		
		session.setAttribute("m_email", m_email);
		session.setAttribute("m_rank", mdto.getM_rank());
		session.setAttribute("nick", mdto.getM_nick());
		System.out.println("@@@@@@@@@@mdto정보:  "+mdto);
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.le");
		forward.setRedirect(true);
		return forward;
	}

}
