package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;

public class AskViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		ActionForward forward= new ActionForward();
		
		QuestionDAO bdao =new QuestionDAO();
		QuestionDTO bdto=bdao.getBoard(num);
		
		LectureDAO ldao= new LectureDAO();
		LectureDTO ldto = ldao.getLectureDetail(bdto.getQ_l_num());
		
		System.out.println("@@@@@@@@@@@@bdao:"+bdto);
		request.setAttribute("bdto", bdto);
		request.setAttribute("ldto", ldto);
		request.setAttribute("pageNum", pageNum);
		forward.setPath("./views/board/askView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
