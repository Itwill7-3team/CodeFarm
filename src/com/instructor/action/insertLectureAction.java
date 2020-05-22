package com.instructor.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.db.LectureDAO;

public class insertLectureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("insertLecture Action 실행");
		request.setCharacterEncoding("UTF-8");
		ActionForward forward=new ActionForward();
		String title=request.getParameter("title");
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("m_email");
		LectureDAO ldao= new LectureDAO();
		int check =ldao.createLecture(email,title);
		forward.setPath("updateLecture.in?num="+check);
		forward.setRedirect(true);
		
		return forward;
		
		
	}

}
