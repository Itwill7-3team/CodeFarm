package com.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;


public class NoticeUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("@@@@@ NoticeUpdate_execute()");
		//데이터 처리(num,pageNum)
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		NoticeDAO ndao=new NoticeDAO();
		
		NoticeDTO ndto=ndao.getNotice(num);
		
		request.setAttribute("ndto", ndto);
		request.setAttribute("pageNum", pageNum);
		
		//페이지이동(./board/noticeReWriteForm.jsp)
		ActionForward forward= new ActionForward();
		forward.setPath("./views/board/noticeReWriteForm.jsp");
		forward.setRedirect(false); //페이지 이동하면서 가상주소 가져간다 =>포워드 =false
		
		return forward;
	}

}
