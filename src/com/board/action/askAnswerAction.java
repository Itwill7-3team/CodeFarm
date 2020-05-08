package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;

public class askAnswerAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		QuestionDAO bdao= new QuestionDAO();
		
		ArrayList<QuestionDTO> boardlist=bdao.getBoardList();
		System.out.println("askAnswerAction 실행");
		request.setAttribute("boardList", boardlist);
		forward.setPath("./views/board/askAnswer.jsp");
		forward.setRedirect(false);
		
		System.out.println("askAnswerAction 종료");
		return forward;
	}

}
