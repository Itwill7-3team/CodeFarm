package com.basket.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.wishlist.db.WishlistDAO;
import com.wishlist.db.WishlistDTO;


public class BasketListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BasketListAction_execute() 호출");
		
		// 세션값(id)있을때만 처리 가능
		// 없을경우 로그인페이지 이동
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("m_email");
		//id="test";
		
		ActionForward forward = new ActionForward();
		if(id == null){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// BasketDAO 객체 생성
		BasketDAO bkdao = new BasketDAO();
		// 장바구 리스트 가져와서 저장 
		Vector vec = bkdao.getBasketList(id);

		
		//위시리스트 객체생성
		WishlistDAO wdao= new WishlistDAO();
		//위시리스트 객체 가져와서 저장
		Vector vec1 = wdao.getWishList(id);
		
		// 해당정보 request 저장
		ArrayList basketList = (ArrayList)vec.get(0);
		ArrayList lectureList = (ArrayList)vec.get(1);
		
		ArrayList wishlistList = (ArrayList)vec1.get(0);
		ArrayList wishLectureList = (ArrayList)vec1.get(1);
				
		request.setAttribute("basketList", basketList);
		request.setAttribute("lectureList", lectureList);
		request.setAttribute("wishlistList", wishlistList);
		request.setAttribute("wishLectureList", wishLectureList);
		
		//request.setAttribute("basketList", vec.get(0));
		
		forward.setPath("./views/basket/goods_basket.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
