package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class dashboardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 세션값(id)있을때만 처리 가능
				// 없을경우 로그인페이지 이동
				HttpSession session = request.getSession();

				String id =(String) session.getAttribute("m_email");
				//id="test";//////////아이디 임의지정
				ActionForward forward = new ActionForward();
				if(id == null){
					forward.setPath("./Main.le");
					forward.setRedirect(true);
					return forward;
				}
		
		
		forward.setPath("./views/dashboard/dashboard.jsp");
		forward.setRedirect(false);
		
		System.out.println("dashbordAction 종료");
		return forward;
	
	}

}
