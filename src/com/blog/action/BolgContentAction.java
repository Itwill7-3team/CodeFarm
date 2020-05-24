package com.blog.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.db.BlogDAO;
import com.blog.db.BlogDTO;

public class BolgContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("@@@ BlogContentAction_execute()");
		
		
		//blogContent.bo?num=12&pageNum=1
		//파라미터 num, pageNum저장
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		//DAO 객체 생성
		BlogDAO bdao= new BlogDAO();
		
		//글내용 가져오기(num)
		BlogDTO bdto=bdao.getBlog(num);

		
	/*	////notice리스트-최근소식
		
		NoticeDAO ndao1= new NoticeDAO();
		
		//게시글 유,무 체크
		int check = ndao1.getNoticeCount();
		
		ArrayList<NoticeDTO> noticeList=null;
		if(check != 0){ //글이 존재한다
				noticeList= ndao1.getNoticeList(1,10);
		}*/
		
		/// 페이징 처리 정보 저장
/*		request.setAttribute("count", check);
		request.setAttribute("noticeList", noticeList);*/
		
		
		//저장 후 페이지 이동
		request.setAttribute("bdto", bdto);
		request.setAttribute("pageNum", pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/blog/blogContent.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
