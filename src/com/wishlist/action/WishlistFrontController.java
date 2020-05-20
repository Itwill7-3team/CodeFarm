package com.wishlist.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.basket.action.BasketAddAction;
import com.basket.action.BasketDeleteAction;
import com.basket.action.BasketListAction;
import com.basket.action.JqBasket;
import com.lecture.action.LectureDetailAction;


public class WishlistFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("-----------[wishlistFrontController]doProcess호출---------");
		Action action = null;
		ActionForward forward = null;
		
		String requestURI = request.getRequestURI();
		System.out.println("URI : " + requestURI);

		String contextPath = request.getContextPath();
		System.out.println("ContextPath(프로젝트명) : " + contextPath);

		String command = requestURI.substring(contextPath.length());
		System.out.println("command : " + command);

		System.out.println("----------페이지 주소 계산 완료----------------------");
		
		System.out.println("----------------------페이지구분(view/model)--------------------");
		if(command.equals("/WishListAdd.wi")){
			action = new WishListAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			else if(command.equals("/WishList.wi")){
			System.out.println("/WishList.wi 처리 (model->view)");
			action = new WishListAction();
			try {
				forward = action.execute(request, response);
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		} 
			else if (command.equals("/WishListDelete.wi")) {
			// WishListDelete.wi -> 삭제처리(model)
			System.out.println("/WishListDelete.wi 주소 처리(model)");
			// WishListDeleteAction 객체
			action = new WishListDeleteAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
			else if (command.equals("/WishToBasket.wi")) {
				System.out.println("/WishToBasket.wi 주소 처리(model)");
				// WishToBasketAction 객체
				action=new WishToBasketAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}else if(command.equals("/JqWishlist.wi")){
			System.out.println("/JqWishlist.wi");
				
			action = new JqWishlist();
			try {
				/*forward = */action.execute(request, response);
			} catch (Exception e) {
					e.printStackTrace();
			}
		}else if(command.equals("/JqWishlistController.wi")){
			System.out.println("/JqWishlistController.wi");
				
			action = new JqWishlistController();
			try {
				/*forward = */action.execute(request, response);
			} catch (Exception e) {
					e.printStackTrace();
			}
		} else if (command.equals("/WishListReg.wi")) {
			action = new WishListRegAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
		System.out.println("-----------페이지 이동(redirect(true)/forward(false))---------------");
		// 페이지 이동정보가 있을때만 페이지 이동
		
		if (forward != null) {
			if (forward.isRedirect()) {
				// true
				System.out.println("sendRedirect() 이동 : " + forward.getPath());
				response.sendRedirect(forward.getPath());
			} else {
				// false
				System.out.println("forward() 이동: " + forward.getPath());
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}

	
	}
}
