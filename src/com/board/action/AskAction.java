package com.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ask.db.AskDAO;
import com.ask.db.AskDTO;

public class AskAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AskAction 실행");
		ActionForward forward= new ActionForward();
	
		//세션확인
		HttpSession session = request.getSession();

		String id =(String) session.getAttribute("m_email");
				
		if(id == null){
			forward.setPath("./Main.le");
			forward.setRedirect(true);
			return forward;
		}
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		//
		//String num=request.getParameter("num");
		//String pageNum=request.getParameter("pageNum");
		String type= "ask";
		
		
		//정보받기 (글쓴이, 내용, re_ref, re_lev+1)
		AskDTO bdto= new AskDTO();
		bdto.setType(type);
		bdto.setTitle(request.getParameter("title"));
		bdto.setWriter(request.getParameter("writer"));
		bdto.setContent(request.getParameter("content"));
		bdto.setL_num(Integer.parseInt(request.getParameter("num")));
		
		AskDAO bdao= new AskDAO();
		
		//답글 메서드
		int check =bdao.insertAsk(bdto);
		//답글 작성 실패시 알림
		if(check != 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 실패!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			}
		if(check == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓰기 성공!')");
			//out.println("location.href='askAnswer.bo'");
			out.println("</script>");
			out.close();
		}
				
		//페이지 이동

		System.out.println("AnswerAction 종료");
		return null;
	}

}
