package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;

public class BasketRegAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BasketRegAction_execute()");
		// courseDetail.jsp -> basket update용 ajax Action
		
		int l_number = Integer.parseInt(request.getParameter("l_number"));
		int l_price = Integer.parseInt(request.getParameter("l_price"));
		String m_email = request.getParameter("m_email");
		String l_title = request.getParameter("l_title");
		
		BasketDTO bdto = new BasketDTO();
		bdto.setB_l_num(l_number);
		bdto.setB_l_price(l_price);
		bdto.setB_m_id(m_email);
		bdto.setB_l_name(l_title);
		
		System.out.println(bdto);
		BasketDAO bdao = new BasketDAO();
		String basketCheck = bdao.basketReg(bdto);
		
		System.out.println(basketCheck);
		response.getWriter().print(basketCheck);
		
		return null;
	}
}
