package com.order.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.lecture.db.LectureDAO;
import com.order.db.OrderDAO;

public class OrderDetailAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("OrderDetailAction_execute() 호출");
		
		// 세션값 사용 (ID 체크)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_email");
		ActionForward forward = new ActionForward();
		
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		// 주문번호 정보 저장
		String trade_num = request.getParameter("trade_num");
		
		OrderDAO odao = new OrderDAO();
		Vector vec = odao.orderDetail(trade_num);
		//List orderDetailList = odao.orderDetail(trade_num);
		
		//lecture 객체 생성
		LectureDAO ldao = new LectureDAO();
		//List lectureList = ldao.getLectureList("l_m_email");
		ArrayList orderDetailList = (ArrayList)vec.get(0);
		ArrayList lectureList = (ArrayList)vec.get(1);
		/*BasketDAO bkdao = new BasketDAO();
		Vector vec = bkdao.getBasketList(id);
		ArrayList lectureList = (ArrayList)vec.get(1);*/
		
		// 저장영역
		request.setAttribute("orderDetailList", orderDetailList);
		request.setAttribute("lectureList", lectureList);
		
		// 페이지 이동
		forward.setPath("./views/basket/odetail.jsp");
		forward.setRedirect(false);
		
		
		
		return forward;
	}

}
