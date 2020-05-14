package com.wishlist.action;

import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wishlist.db.WishlistDAO;


public class WishListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WishListAction_execute() 호출");
		
		// 세션값(id)있을때만 처리 가능
		// 없을경우 로그인페이지 이동
		HttpSession session = request.getSession();

		String id =(String) session.getAttribute("m_email");
		//id="test";//////////아이디 임의지정
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// BasketDAO 객체 생성
		WishlistDAO wdao = new WishlistDAO();
		// 위시 리스트 가져와서 저장 
		Vector vec = wdao.getWishList(id);

		// 해당정보 request 저장
		ArrayList wishList = (ArrayList)vec.get(0);

		ArrayList lectureList = (ArrayList)vec.get(1);
		
		request.setAttribute("wishList", wishList);
		request.setAttribute("lectureList", lectureList);
		
		//request.setAttribute("basketList", vec.get(0));
		
		forward.setPath("./views/basket/goods_wishlist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
