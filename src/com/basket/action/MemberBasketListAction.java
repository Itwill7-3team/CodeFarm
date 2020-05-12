package com.basket.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;
import com.cart.db.CartDTO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.lecture.db.LectureDTO;
import com.wishlist.db.WishlistDAO;
import com.wishlist.db.WishlistDTO;

public class MemberBasketListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		String type=request.getParameter("type");
		Gson  gson =new Gson();
		if(type.equals("basket")){
			System.out.println("type basket 진입");
			BasketDAO bdao= new BasketDAO();
			ArrayList<CartDTO> cartList=bdao.getMemberBasketList(id);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			String data =gson.toJson(cartList);
			out.write(data);
			out.close();
			return null;
		}
		if(type.equals("wish")){
			System.out.println("type wish 진입");
			WishlistDAO wdao =new WishlistDAO();
			ArrayList<CartDTO> cartlist=wdao.getMemberWishList(id);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			String data =gson.toJson(cartlist);
			out.write(data);
			out.close();
			return null;
		}
		return null;
	}
}
