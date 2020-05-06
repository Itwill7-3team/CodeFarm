package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.db.BoardDAO;
import com.board.db.BoardDTO;

public class askAnswerAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		BoardDAO bdao= new BoardDAO();
		
		ArrayList<BoardDTO> boardlist=bdao.getBoardList("askAnswer");
		request.setAttribute("boardList", boardlist);
		forward.setPath("./views/board/askAnswer.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
