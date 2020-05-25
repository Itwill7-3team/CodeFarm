package com.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



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
////////문답
		if(command.equals("/askAnswer.bo")){
			action=new AskAnswerAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AskWrite.bo")){
			forward= new ActionForward();
			//글쓰기 뷰
			forward.setPath("/views/board/askForm.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/AskAction.bo")){
			action=new AskAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/AnswerAction.bo")){
			action=new AnswerAction();
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
		
////////리뷰
		}else if(command.equals("/reView.bo")){
			action=new ReViewAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
/////////공지	
		}else if(command.equals("/notice.bo")){
			//공지 게시판 리스트
			action=new NoticeAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/noticeWrite.bo")){
			//글쓰기 뷰
			
			//세션확인
			HttpSession session = request.getSession();

			String id =(String) session.getAttribute("m_email");
			
			forward= new ActionForward();
			
			if(id == null || !id.equals("admin@naver.com")){
				forward.setPath("/notice.bo");
				forward.setRedirect(true);
				
			}else{
			forward.setPath("/views/board/noticeWriteForm.jsp");
			forward.setRedirect(false);}		
			
		}else if(command.equals("/noticeWriteAction.bo")){
			//글쓰기 모델
			action=new NoticeWriteAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/noticeContent.bo")){
			//게시글 읽기 (모델-뷰)
			action=new NoticeContentAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/noticeUpdate.bo")){
			//게시글 읽기(모델-뷰)
			action=new NoticeUpdate();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/noticeUpdateAction.bo")){
			//게시글 읽기(모델-뷰)
			action=new NoticeUpdateAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/noticeDeleteAction.bo")){
			//게시글 삭제(모델)
			action=new NoticeDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
/////////리퀘스트			
		}else if(command.equals("/request.bo")){
			forward=new ActionForward();
			forward.setPath("./views/board/request.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/requestAction.bo")){
			action=new requestAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/requestView.bo")){
			action=new QuestAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
/////////대시보드			
		}else if(command.equals("/DashBoard.bo")){
		action=new dashboardAction();
		try{
			forward=action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
/////////내강의		
		}else if(command.equals("/MyLecture.bo")){
		action=new myLectureAction();
		try{
			forward=action.execute(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		}else if(command.equals("/ReviewComment.bo")) {
			action = new ReviewCommentAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MyaskAction.bo")) {
			action = new MyaskAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
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
