package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;

public class AskViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num=Integer.parseInt(request.getParameter("num"));
		ActionForward forward= new ActionForward();
		QuestionDAO bdao =new QuestionDAO();
		
		QuestionDTO bdto=bdao.getBoard(num);
		request.setAttribute("bdto", bdto);
		forward.setPath("./views/board/askView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
