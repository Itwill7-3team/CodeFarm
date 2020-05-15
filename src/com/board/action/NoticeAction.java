package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;
import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;

public class NoticeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//int num=Integer.parseInt(request.getParameter("num"));
		ActionForward forward= new ActionForward();
		System.out.println("@@@@@@NoticeAction_execute()실행");

		//세션처리
		
		NoticeDAO ndao= new NoticeDAO();

		ArrayList<NoticeDTO> noticeList= ndao.getNoticeList();

		request.setAttribute("noticeList", noticeList);
		forward.setPath("./views/board/notice.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
