package com.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("-----------[boardFrontController]doProcess호출---------");
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
		if(command.equals("/askAnswer.bo")){
			action=new askAnswerAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/askView.bo")){
				action=new AskViewAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}

		}else if(command.equals("/reView.bo")){
			action=new ReViewAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/notice.bo")){
			
		}else if(command.equals("/request.bo")){
			
		}
	else if(command.equals("/DashBoard.bo")){
		action=new dashboardAction();
		try{
			forward=action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	else if(command.equals("/MyLecture.bo")){
		action=new myLectureAction();
		try{
			forward=action.execute(request, response);
		}catch (Exception e) {
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
