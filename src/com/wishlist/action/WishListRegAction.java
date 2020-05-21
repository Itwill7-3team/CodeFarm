package com.wishlist.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
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
		String wishCheck = wdao.wishListReg(wdto);
		int wishCount = wdao.getWishListCount(wdto.getW_l_num());
		
		Map<String, Object> gsonMap = new HashMap<String, Object>();
		gsonMap.put("wishCheck", wishCheck);
		gsonMap.put("wishCount", wishCount);
		
		new Gson().toJson(gsonMap, response.getWriter());
		
		return null;
	}
}
