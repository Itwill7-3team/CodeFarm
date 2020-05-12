package com.lecture.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.lecture.db.PagingDTO;

public class LectureListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureListAction_execute() 호출");
		
		LectureDAO ldao = new LectureDAO();
		
		/* 페이징 처리 */
		int page = 1;
		
		int count = ldao.getAllCount();
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		PagingDTO paging = new PagingDTO();
		paging.setTotalCount(count);
		paging.setPage(page);
		/* 페이징 처리 */
		
		/* 분류를 위한 방법 --보류 */
		String item = request.getParameter("item");
		if(item == null) {
			item = "all";
		}
		/* 분류를 위한 방법 --보류 */
		
		System.out.println("LectureListAction_execute() 11 호출");
		
		
		List<LectureDTO> lectureList = ldao.getLecutreList(item,paging);
		System.out.println("beginPage : "+page);
		request.setAttribute("lectureList", lectureList);
		request.setAttribute("paging", paging);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/course2.jsp");
		forward.setRedirect(false);		
		
		
		return forward;
	}
}
