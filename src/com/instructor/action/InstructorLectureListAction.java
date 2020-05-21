package com.instructor.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InstructorLectureListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("GoodsListAction-execute()");
		HttpSession session = request.getSession();
		if(session.getAttribute("m_email")==null ){
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.write("<script>");
		out.write("location.href='Main.le'");
		out.write("</script>");
		out.close();
		}
		ActionForward forward= new ActionForward();
		forward.setPath("./views/instructor/addLecture.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
