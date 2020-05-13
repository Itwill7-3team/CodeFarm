package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class myLectureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		forward.setPath("./views/dashboard/my-lectures.jsp");
		forward.setRedirect(false);
		
		System.out.println("myLectureAction 종료");
		return forward;
	
	}

}
