package com.order.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.order.db.OrderDAO;

import com.order.action.ActionForward;

public class OrderListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		// ID 체크
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_email");
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
			//OrderDAO 객체 생성
			// => 개인의 주문목록을 가져오기
			OrderDAO odao = new OrderDAO();
			ArrayList orderList = odao.getOrderList(id);
			
			// request 영역에 저장
			request.setAttribute("orderList", orderList);
			
			// 페이지 이동(./goods_order/order_list.jsp)
			forward.setPath("./views/basket/order_list.jsp");
			forward.setRedirect(false);	
			return forward;
		
	}


	
}