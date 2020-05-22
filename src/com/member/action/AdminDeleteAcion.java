package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;

public class AdminDeleteAcion implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AdminDeleteAcion_execute 호출!!");
		String m_email = (String)request.getParameter("m_email");
		MemberDAO mdao = new MemberDAO();
		System.out.println(m_email);
		mdao.AdminDelete(m_email);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberAdmin.me");
		forward.setRedirect(true);
		
		
		return forward;
	}

}
