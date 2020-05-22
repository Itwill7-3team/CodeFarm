package com.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class SerchInfoAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String m_email = request.getParameter("m_email");
		HttpSession session = request.getSession();
		if (session.getAttribute("m_email").equals("admin@naver.com") == false) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('관리자 아이디로 로그인해주세요.');");
			out.print("location.href='Main.le';");
			out.print("</script>");
			out.close();
			return null;
		}
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getInfo(m_email);

		// request 영역에 저장
		request.setAttribute("mdto",mdto );
		
		ActionForward forward = new ActionForward();
		
		forward.setPath("./views/member/serch_info.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
