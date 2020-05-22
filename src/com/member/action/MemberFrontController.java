package com.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class MemberFrontController extends HttpServlet{
	// Controller(서블릿) 생성
	
	//* get방식/post 방식 모두 처리 하는 메서드
	protected void doProcess(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		
		// 가상주소를 비교해서 처리 

		// 가상주소의 정보를 가져오기
		String requestURI = request.getRequestURI();
		System.out.println("URI : "+requestURI);
		
		//String requestURL = request.getRequestURL().toString();
		//System.out.println("URL : "+requestURL);
		
		// 프로젝트명을 가져오기 
		String contextPath = request.getContextPath();
		System.out.println("ContextPath : "+contextPath);
		
		// 실제 변경되는 가상주소
		String command = requestURI.substring(contextPath.length());
		System.out.println("Command : "+command);
		System.out.println("----------주소계산 완료-------------------");
		
		
		
		
		//////////////////////////////////////////////////////////////////
		// 계산한 가상주소와  특정페이지가 같으면 
		// 페이지의 동작에 따라서 이동 
		
		// 처리 페이지정보 객체 (인터페이스-execute())
		Action action = null;
		// 페이지 이동정보 저장 객체 
		ActionForward forward = null;
		
		
		
		if(command.equals("/MemberLogin.me")){
			// 로그인 페이지
			System.out.println("/MemberLogin.me 주소요청 ");
			// ActionForward 객체 생성
			forward = new ActionForward();
			forward.setPath("./views/member/login.jsp");
			forward.setRedirect(false);		
			
		}else if(command.equals("/MemberJoin.me")){
			// 회원가입 처리페이지 (/MemberJoin.me)
			// 회원가입처리 페이지로 바로 이동
			System.out.println("/MemberJoin.me 주소요청 ");
			
			// ActionForward 객체 생성
			forward = new ActionForward();
			forward.setPath("./views/member/insert.jsp");
			forward.setRedirect(false);		
			
		}else if(command.equals("/MemberJoinAction.me")){
			System.out.println("/MemberJoinAction.me 주소 요청");
			//회원가입 동작
			action = new MemberJoinAction();		
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/emailSendAction.me")) {
			System.out.println("/emailSendAction.me 주소 요청");
			action = new emailSendAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/emailCheckAction.me")) {
			// 이메일 인증 요청
			System.out.println("/emailCheckAction.me 주소 요청");
			action = new emailCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/idCheck.me")) {
			//회원  가입시 아이디 확인 
			System.out.println("/idCheck.me 주소 요청");
			
			action = new idCheck();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		}else if(command.equals("/MemberLoginAction.me")){
			// 로그인 처리 (Model객체 필요)
			System.out.println("MemberLoginAction.me 주소 요청");
			
			action = new MemberLoginAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MemberPw.me")){
			// 비밀번호 찾기
			System.out.println("MemberPw.me 주소 요청");
			
			forward = new ActionForward();
			forward.setPath("./views/member/MemberPw.jsp");
			forward.setRedirect(false);	
			
		}else if(command.equals("/MemberPwAction.me")){
			// 비밀번호 찾기
			System.out.println("MemberPwAction.me 주소 요청");
			action = new MemberPwAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
		}else if(command.equals("/MemberLogout.me")){
			// DB 사용(X), 로그아웃 처리로직 =>Action페이지 처리 
			// MemberLogoutAction 객체 생성 
			action = new MemberLogoutAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberAdmin.me")){
			//관리자 회원 관리
			// MemberAdminAction 객체 생성 
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MemberInfo.me")){
			//회원정보 보기
			// MemberAdminAction 객체 생성 
			action = new MemberInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/TechRequestAction.me")) {	
			// 강사신청 동작
			action = new TechRequestAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/TechRequest.me")) {
			//강사 신청 페이지
			forward = new ActionForward();
			forward.setPath("./views/member/tech_request.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/IntroUpdateAction.me")) {
			action = new IntroUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				e.printStackTrace();
			}
			
		}else if(command.equals("/PwUpdateAction.me")){
			action = new PwUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/MemberDeleteAction.me")){
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/MemberTechRequestAction.me")) {
			action = new TechRequestAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/test.me")){
			// 회원가입 처리페이지 (/MemberJoin.me)
			// 회원가입처리 페이지로 바로 이동
			System.out.println("/MemberJoin.me 주소요청 ");
			
			// ActionForward 객체 생성
			forward = new ActionForward();
			forward.setPath("./views/member/test.jsp");
			forward.setRedirect(false);		
			
		}else if(command.equals("/naverLogin.me")){
			// 회원가입 처리페이지 (/MemberJoin.me)
			// 회원가입처리 페이지로 바로 이동
			System.out.println("/naverLogin.me 주소요청 ");
			
			// ActionForward 객체 생성
			forward = new ActionForward();
			forward.setPath("./views/member/naver_login.jsp");
			forward.setRedirect(false);		
			
		}else if(command.equals("/apiLoginAction.me")){
			System.out.println("apiLoginAction.me호출");	

			action = new apiLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/naverLoginAction.me")){
			// 회원가입 처리페이지 (/MemberJoin.me)
			// 회원가입처리 페이지로 바로 이동
			System.out.println("/naverLoginAction.me 주소요청 ");
			
			// ActionForward 객체 생성
			forward = new ActionForward();
			forward.setPath("./views/member/naver_login_action.jsp");
			forward.setRedirect(false);		
			
		}else if(command.equals("/SerchInfo.me")) {
			//관리자 회원정보 검색
			System.out.println("/SerchInfo.me 주소 요청");
			action = new SerchInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/AdminDeleteAction.me")) {
			System.out.println("/AdminDeleteAction.me 주소 요청");
			action = new AdminDeleteAcion();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		// 페이지 이동처리 
		if(forward != null){ // 페이지 이동정보가 있을때 
			
			// 페이지 이동  sendRedirect/forward
			if(forward.isRedirect()){ // true
				response.sendRedirect(forward.getPath());
			}else{ // false
			   RequestDispatcher dis =
					   request.getRequestDispatcher(forward.getPath());
			   
			   dis.forward(request,response);				
			}		
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
	}	
	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet!!");
		doProcess(request, response);
	
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost!!");
		doProcess(request, response);
		
	}

	
	
	
	

}
