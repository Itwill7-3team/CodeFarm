package com.wishlist.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wishlist.db.WishlistDAO;
import com.wishlist.db.WishlistDTO;

public class WishListRegAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("WishListRegAction_execute()");
		// courseDetail.jsp -> wishlist update용 ajax Action
		
		int l_number = Integer.parseInt(request.getParameter("l_number"));
		String m_email = request.getParameter("m_email");
		
		WishlistDTO wdto = new WishlistDTO();
		wdto.setW_l_num(l_number);
		wdto.setW_m_id(m_email);
		WishlistDAO wdao = new WishlistDAO();
		String check = wdao.wishListReg(wdto);

		response.getWriter().print(check);
		
		return null;
	}
}
