package com.instructor.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class InstructorLectureListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("GoodsListAction-execute()");
		int num=Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		if(session.getAttribute("m_email")==null ){
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.write("<script>");
		out.write("location.href='Main.le'");
		out.write("</script>");
		out.close();
		}
		LectureDAO ldao =new LectureDAO();
		LectureDTO ldto=ldao.getLectureDetail(num);
		request.setAttribute("ldto", ldto);
		ActionForward forward= new ActionForward();
		forward.setPath("./views/instructor/updateLecture.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
