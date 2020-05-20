package com.wishlist.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wishlist.db.WishlistDAO;
import com.wishlist.db.WishlistDTO;

public class JqWishlist implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("JqWishList_execute() 호출");
		
		String m_email  = request.getParameter("m_email");
		int l_number = Integer.parseInt(request.getParameter("l_number")); 
		System.out.println("확인 : "+m_email+l_number);
		
		request.setCharacterEncoding("UTF-8");

		WishlistDTO wdto = new WishlistDTO();
			wdto.setW_l_num(l_number);
			wdto.setW_m_id(m_email);
		WishlistDAO wdao = new WishlistDAO();
			int checkWish = wdao.checkGoods(wdto);
		
		System.out.println("확인 checkWish : "+checkWish);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.write(Integer.toString(checkWish));
		out.close();
		
		return null;
	}
}
