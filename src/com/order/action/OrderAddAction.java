package com.order.action;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.order.db.OrderDAO;
import com.order.db.OrderDTO;

public class OrderAddAction implements Action{

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("^*^*^*^* OrderAddAction_execute() 호출");
		
		
		// 세션값 사용해서 로그인 체크
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_email");

		ActionForward forward = new ActionForward();
		if (id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		// OrderDTO 객체 생성
		OrderDTO oldto = new OrderDTO();
		
		// 결제타입 추가
		oldto.setO_m_id(id);
		oldto.setO_t_type("무통장 입금");
		oldto.setO_t_payer(request.getParameter("o_t_payer"));
		oldto.setO_t_bank(request.getParameter("o_t_bank").split("/")[0]);
		oldto.setO_t_b_num(request.getParameter("o_t_bank").split("/")[1]);
		//oldto.setO_status(request.getParameter());
	//	oldto.setO_t_b_reg_date(request.getParameter("o_t_b_reg_date"));
		
		
		
		BasketDAO bkdao = new BasketDAO();
		Vector vec = bkdao.getBasketList(id);
		List basketList = (List) vec.get(0);
		List lectureList = (List) vec.get(1);
		// 결제모듈 동작 처리 
		// OrderlistDAO 객체 생성 -> addOrder()
		OrderDAO oldao = new OrderDAO();
		oldao.addOrder(oldto,basketList,lectureList);
		
		// 장바구니 비우기(장바구니 삭제)
		// BasketDAO bkdao = new BasketDAO();
		bkdao.basketDelete(id);
		
		// 페이지 이동
		forward.setPath("./OrderList.or");
		forward.setRedirect(true);
		return forward;
		
	}
	
}