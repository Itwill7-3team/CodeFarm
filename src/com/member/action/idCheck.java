package com.member.action;

import java.io.BufferedReader;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;

public class idCheck implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("@@@@ idCheck_execute호출");
		
		String m_email = (String)request.getParameter("m_email");
		MemberDAO mdao = new MemberDAO();
		System.out.println(m_email);
		int data = mdao.idCheck(m_email);
		System.out.println("data: "+data);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.write(Integer.toString(data));
		out.close();
		return null; 
	}
}
