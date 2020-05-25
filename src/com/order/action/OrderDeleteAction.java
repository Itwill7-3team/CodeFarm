package com.order.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.db.OrderDAO;



public class OrderDeleteAction implements Action{
@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// /세션제어(로그인 )
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("m_email");

	ActionForward forward = new ActionForward();
	if( id == null ){
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);
		return forward;			
	}
	
	// 주문번호 저장
	String trade_num = request.getParameter("trade_num");
	
	// DAO 객체 생성
	OrderDAO adao = new OrderDAO();
	adao.OrderDelete(trade_num);
	
	forward.setPath("./OrderList.or");
	forward.setRedirect(true);
	return forward;
}
}
