package com.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDTO;
import com.member.db.MemberDAO;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println(" @@@ MemberListAction_execute()");
		
		// 세션값 처리
		// 로그인 여부, 관리자 여부
		
		HttpSession session = request.getSession();
		String m_email = (String)session.getAttribute("m_email");
		
		ActionForward forward = new ActionForward();
		if( m_email == null ||  !m_email.equals("admin@naver.com") ){
			session.removeAttribute("m_email");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('관리자 아이디로 로그인해주세요.');");
			out.print("location.href='Main.le';");
			out.print("</script>");
			out.close();
			/*
			 * forward.setPath("./Main.le"); forward.setRedirect(true);
			 * 
			 * return forward;
			 */
		}
		
		// DB 처리객체  MemberDAO 생성
		MemberDAO mdao = new MemberDAO();
		// getMemberList() -> 회원 목록 List정보를 가져오기
		List<MemberDTO> memberList = mdao.getMemberList(); 
		
		// request 영역에 저장
		request.setAttribute("memberList", memberList);		
		
		// 페이지 이동 (./member/memberList.jsp)
		forward.setPath("./views/member/admin.jsp");
		forward.setRedirect(false);		
		return forward;
	}
	

}
