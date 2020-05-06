package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.board.db.BoardDAO;
import com.board.db.BoardDTO;


public class AskAnswerAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("AskanswerAction 실행~!");
		BoardDAO bdao= new BoardDAO();
		
		ArrayList<BoardDTO> boardList=bdao.getboardList("askAnswer");
		
		ActionForward forward=new ActionForward();
		forward.setPath("./views/board/askAnswer.jsp");
		forward.setRedirect(false);
		request.setAttribute("boardList", boardList);
		return forward;
	}

}
