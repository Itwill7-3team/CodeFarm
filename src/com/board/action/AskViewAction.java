package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ask.db.AskDAO;
import com.ask.db.AskDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class AskViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		ActionForward forward= new ActionForward();
		
		AskDAO bdao =new AskDAO();
		AskDTO bdto=bdao.getBoard(num);
		
		LectureDAO ldao= new LectureDAO();
		LectureDTO ldto = ldao.getLectureDetail(bdto.getL_num());
		
		AskDAO bdao1 =new AskDAO();
		List<AskDTO> answerList =bdao1.getAnswerList(num);
		
		
		System.out.println("@@@@@@@@@@@@bdao:"+bdto);
		request.setAttribute("bdto", bdto);
		request.setAttribute("ldto", ldto);
		request.setAttribute("answerList", answerList);
		request.setAttribute("pageNum", pageNum);
		forward.setPath("./views/board/askView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
