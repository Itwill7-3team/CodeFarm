package com.wishlist.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wishlist.db.WishlistDAO;


public class WishListDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WishListDeleteAction_execute() 호출");
		
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
		
		// 삭제할 위시리스트 번호 저장
		int w_num = Integer.parseInt(request.getParameter("num"));
		// WishlistDAO 객체 생성
		WishlistDAO wdao = new WishlistDAO();
		
		// WishListDelete(번호) 호출
		wdao.wishlistDelete(w_num);
		
		// 페이지 이동	
		forward.setPath("./WishList.wi");
		forward.setRedirect(true);	
		return forward;
	}

}
