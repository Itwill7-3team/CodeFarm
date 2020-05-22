package com.lecture.action;

import java.io.Console;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.action.LectureListAction;


public class LectureFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("-----------[lectureFrontController]doProcess호출---------");
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
		if(command.equals("/Main.le")){
			
			System.out.println("/model->view");

			action = new LectureMainListAction();

			try {
				forward = action.execute(request, response);
				System.out.println("command3 : " + command);
			} catch (Exception e) {
				e.printStackTrace();
			}

			/* 삭제 예정 */
			/*
			 * }else if(command.equals("/Search.le")){ forward=new
			 * ActionForward(); forward.setPath("./views/lecture/course2.jsp");
			 * forward.setRedirect(false);
			 */
			/* 삭제 예정 */

		} else if (command.equals("/Search.le")) {
			System.out.println("/Search.le 처리 model->view");

			action = new LectureListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/Detail.le")) {
			action = new LectureDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/DetailReview.le")) {
			action = new LectureReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/LectureVideo.le")){
			action = new LectureVideoAction();
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

