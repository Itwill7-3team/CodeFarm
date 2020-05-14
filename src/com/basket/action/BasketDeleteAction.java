package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;

public class BasketDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BasketDeleteAction_execute() 호출");
		
		// 세션값 처리
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("m_email");
		//id="test";
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 삭제할 장바구니 번호 저장
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		// BasketDAO 객체 생성
		BasketDAO bkdao = new BasketDAO();
		
		// basketDelete(번호) 호출
		bkdao.basketDelete(b_num);
		
		// 페이지 이동	
		forward.setPath("./BasketList.ba");
		forward.setRedirect(true);	
		return forward;
	}

}
