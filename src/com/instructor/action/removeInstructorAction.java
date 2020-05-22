package com.instructor.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;

public class removeInstructorAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("removeInstructorAction 실행~!");
		String num=request.getParameter("num");
		LectureDAO ldao =new LectureDAO();
		//ldao.removeInstructor();
		
		return null;
	}

}
