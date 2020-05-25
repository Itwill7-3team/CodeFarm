package com.order.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.order.action.OrderAddAction;
import com.order.action.OrderListAction;


public class OrderFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("-----------[orderFrontController]doProcess호출---------");
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
		if(command.equals("/OrderAdd.or")){
			
			System.out.println("/OrderAdd.or 처리 (model)");
			
			// OrderAddAction() 객체 생성 
			action = new OrderAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/OrderList.or")){
			// /OrderList.or => model->view
			System.out.println("/OrderList.or 처리 (model->view)");
			// OrderListAction() 객체 생성
			action = new OrderListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/OrderDetail.or")){
			System.out.println("/OrderDetail.or 처리 (model -> view)");
			// OrderDetailAction() 객체 생성
			action = new OrderDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				
				e.printStackTrace();
			}
		}else if(command.equals("/OrderDelete.or")) {
			System.out.println("/OrderDelete.or 처리");
			// OrderDeleteAction 객체 생성
			action = new OrderDeleteAction();
		}try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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