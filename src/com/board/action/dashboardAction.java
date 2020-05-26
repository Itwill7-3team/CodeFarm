package com.board.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.db.OrderDAO;


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
		
		//결제된 강의정보 vec
		Vector MyOrderV =new OrderDAO().getPaidOrderList(id);
		
		ArrayList orderDeatilList = (ArrayList)MyOrderV.get(0);
		ArrayList lectureList = (ArrayList)MyOrderV.get(1);
		
		
		//강의정보 담기
		request.setAttribute("orderDeatilList", orderDeatilList);
		request.setAttribute("lectureList", lectureList);
				
				
		
		forward.setPath("./views/dashboard/dashboard.jsp");
		forward.setRedirect(false);
		
		System.out.println("dashbordAction 종료");
		return forward;
	
	}

}
