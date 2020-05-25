package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ask.db.AskDAO;
import com.ask.db.AskDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class AskViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		//세션확인
		HttpSession session = request.getSession();

		String id =(String) session.getAttribute("m_email");
		
	
				
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");

		//해당 글 내용 불러오기
		AskDAO bdao =new AskDAO();
		AskDTO bdto=bdao.getBoard(num);
		
		//해당 글 관련 강의
		LectureDAO ldao= new LectureDAO();
		LectureDTO ldto = ldao.getLectureDetail(bdto.getL_num());
		
		//답글유무 체크
		int check = new AskDAO().getAnswerCount(num);
//		System.out.println("check:"+check);
		
		//답글 리스트
		List<AskDTO> answerList =new AskDAO().getAnswerList(num);		
		
		System.out.println("@@@@@@@@@@@@bdao:"+bdto);
		request.setAttribute("bdto", bdto);
		request.setAttribute("ldto", ldto);
		request.setAttribute("check", check);
		request.setAttribute("answerList", answerList);
		request.setAttribute("pageNum", pageNum);
		forward.setPath("./views/board/askView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
