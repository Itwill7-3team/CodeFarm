package com.lecture.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class LectureVideoAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureVideoAction_execute() 호출");
		
		LectureDAO ldao = new LectureDAO();
		
	
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/lectureVideo.jsp");
		forward.setRedirect(false);		
	
		return forward;
	}
}
