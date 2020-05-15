package com.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;
import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;

public class NoticeContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("@@@ NoticeContentAction_execute()");
		
		
		//BoardContent.bo?num=12&pageNum=1
		//파라미터 num, pageNum저장
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		//NoticeDAO 객체 생성
		NoticeDAO ndao= new NoticeDAO();
		
		//글내용 가져오기(num)
		NoticeDTO ndto=ndao.getNotice(num);

		
		//저장 후 페이지 이동
		request.setAttribute("ndto", ndto);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/board/noticeContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
