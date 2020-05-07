package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AskViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num=Integer.parseInt(request.getParameter("num"));
		ActionForward forward= new ActionForward();
		
		forward.setPath(".views/board/question.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
