package com.member.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDTO;

import util.SHA256;
import util.Script;

import com.member.db.MemberDAO;

public class MemberJoinAction implements Action{
	// 회원가입 처리 Model객체 
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("@@@@ MemeberJoinAction_execute()");
		response.setContentType("text/html; charset=UTF-8"); 
		
		
		
		String url = "./emailSendAction.me";
		
		String salt =SHA256.generateSalt();
		String m_email = request.getParameter("m_email");
		String m_pw = request.getParameter("m_pw");
		String m_emailCheck = request.getParameter("m_emailCheck");
		String m_pwCheck = request.getParameter("m_pwCheck");
		System.out.println("@@@ MemberJoinAction_execute() ");
		
		if(m_email.equals("") || m_pw.equals("") ||m_emailCheck.equals("") ||  m_pwCheck.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 사항을 입력')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
		
		if(m_email.equals(m_emailCheck) == false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일이 다릅니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			}
		
		if(m_pw.equals(m_pwCheck) == false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 다릅니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			}
		
		
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 회원정보를 저장 객체생성(자바빈객체)
		MemberDTO mb = new MemberDTO();
		// 전달된 파라미터정보를 저장 
		mb.setM_email(m_email);
		mb.setM_pw(m_pw);
		mb.setM_emailHash(salt);
		mb.setM_emailCheck(false);
		// 확인
		//System.out.println(mb.toString());

		// DB에 값을 저장하기 위한 객체생성 (DAO객체)
		MemberDAO mdao = new MemberDAO();
		
		// insertMember(자바빈);
		int result = mdao.join(mb);
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("m_email", mb.getM_email());

			Script.moving(response, "입력하신 이메일로 인증해주세요.",url);
		}else if(result == -1){
			System.out.println("MemberJoinAction: sql error!!");
			Script.moving(response, "이미 존재하는 이메일입니다.");
			
		}
		// 페이지 이동(로그인 페이지로이동)
		// ActionForward 객체를 생성해서 값 저장 후 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./Main.le");
		forward.setRedirect(true);		
		
		return forward;
	}

	
	
	

}
