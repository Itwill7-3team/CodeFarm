package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class dashboardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		forward.setPath("./views/dashboard/dashboard.jsp");
		forward.setRedirect(false);
		
		System.out.println("dashbordAction 종료");
		return forward;
	
	}

}
