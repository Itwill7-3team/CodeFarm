package com.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;

public class NoticeWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//int num=Integer.parseInt(request.getParameter("num"));
		ActionForward forward= new ActionForward();
		System.out.println("@@@NoticeWriteAction_execute()실행");

		//세션확인
		HttpSession session = request.getSession();

		String id =(String) session.getAttribute("m_email");
		
		if(id == null || !id.equals("admin@naver.com")){
			forward.setPath("./Main.le");
			forward.setRedirect(true);
			return forward;
		}
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		//파라미터받아서 DTO에 담기
		NoticeDTO ndto=new NoticeDTO();
		
		//request.getParameter("n_num"); -> DAO에서 계산할것임
		ndto.setN_title(request.getParameter("n_title"));
		ndto.setN_content(request.getParameter("n_content"));
		ndto.setN_writer(request.getParameter("n_writer"));
		
		//NoticeDAO 객체생성, 글쓰기 메서드실행, 글 작성 (글작성 성공/실패 alert)후 페이지이동
		int check=new NoticeDAO().insertNotice(ndto);
		
		if(check != 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 실패!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			}
				
		forward.setPath("notice.bo");
		forward.setRedirect(false);
		
		return forward;
	}

}
