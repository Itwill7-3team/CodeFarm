package com.board.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ask.db.AskDAO;
import com.ask.db.AskDTO;
import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;

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

		
		////notice리스트-최근소식
		
		NoticeDAO ndao1= new NoticeDAO();
		
		//게시글 유,무 체크
		int check = ndao1.getNoticeCount();
		
		ArrayList<NoticeDTO> noticeList=null;
		if(check != 0){ //글이 존재한다
				noticeList= ndao1.getNoticeList(1,10);
		}
		
		/// 페이징 처리 정보 저장
		request.setAttribute("count", check);
		request.setAttribute("noticeList", noticeList);
		
		
		//저장 후 페이지 이동
		request.setAttribute("ndto", ndto);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/board/noticeContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
