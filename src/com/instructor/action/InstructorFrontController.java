package com.instructor.action;

import java.io.Console;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.instructor.action.InstructorAddAction;

public class InstructorFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
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
		
		if(command.equals("/InstructorAdd.in")){
			//관리자가 상품등록 페이지 (view)
			// ./admingoods/admin_goods_write.jsp
			System.out.println("/Instructor.in 처리완료 (view 이동)");
			
			forward = new ActionForward();
			forward.setPath("./views/instructor/admin_goods_write.jsp");
			forward.setRedirect(false);			
		}else if(command.equals("/InstructorAddAction.in")){
			// 관리자가 상품등록한 페이지 처리 (model)
			System.out.println("/InstructorAddAction.in 처리완료 (model 이동)");
			// GoodsAddAction() 객체 생성
			action = new InstructorAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			//데이터 들고 업데이트로 감
		}else if(command.equals("/InstructorLecturelist.in")){
			System.out.println("/InstrucotrLectureList.in 페이지처리(Model->view)");
			
			action = new InstructorLectureListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/updateLecture.in")){
			action=new InstructorLectureListAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/addLectureImg.in")){
			action=new LectureAddImg();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/updateLectureAction.in")){
			action=new updateLectureAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/addLectureList.in")){
			action = new InstructorGetListAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/addLecture.in")){
			forward=new ActionForward();
			forward.setPath("./views/instructor/addLecture.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/insertInstructor.in")){
			action=new insertLectureAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/removeInstructor.in")){
			action=new removeInstructorAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/recordUpdate.in")){
			action =new RecordUpdateAction();
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
