package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.question.db.QuestionDAO;

public class ReViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		QuestionDAO qdao= new QuestionDAO();
		LectureDAO ldao =new LectureDAO();
		
	
		
		
		forward.setPath("./views/board/reView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
