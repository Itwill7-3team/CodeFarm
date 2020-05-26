package com.lecture.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.lecture.db.PagingDTO;
import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;

public class LectureListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureListAction_execute() 호출");
		
		LectureDAO ldao = new LectureDAO();

	/* 분류를 위한 방법  */
		
		/* 1번째 side-bar 파리미터 */
		String t1 = request.getParameter("t1");
		String t2 = request.getParameter("t2");
		System.out.println("t1 : "+t1+"t2 : "+t2);
		if(t1 == null) {
			t1 = "";
		}
		if(t2 == null) {
			t2 = "";
		}
		/* side-bar */
		
		/* 2번째 order-selecter 파라미터 */
		String item = request.getParameter("item");
		System.out.println("item : "+item);
		if(item == null) {
			item = "seq";
		}
		System.out.println("item : "+item);
		/* order-selecter */
		
		/* 3번째 view-switcher 파라미터 */
		String view = request.getParameter("view");
		System.out.println("view : "+view);
		if(view == null){
			view = "card";
		}
		/*view-switcher*/
		
		
		/* 4번째 페이징 처리 와 그 파리미터 */ 
		int page = 1;
		
		int count = ldao.getAllCount();
		
		if(request.getParameter("page")!=null) { 
			page = Integer.parseInt(request.getParameter("page"));
		}
		PagingDTO paging = new PagingDTO();
		paging.setTotalCount(count);
		paging.setPage(page);
		/* 페이징 처리 */
		
		 /* 5번째 search-bar 파라미터 */
		String s = request.getParameter("s");
		System.out.println("s : "+s);
		if(s == null) {
			s = "";
		}
		/* search-bar */
		
	/* 분류를 위한 방법  */
	
		
		
		System.out.println("LectureListAction_execute() 11 호출");
		
		Map<String, Object> map = ldao.getLecutreList(s,item,paging,t1,t2);
		ArrayList<LectureDTO> lectureList=(ArrayList<LectureDTO>)map.get("lectureList");
		ArrayList<Double> starList=(ArrayList<Double>)map.get("starList");
		ArrayList<Integer> starCount=(ArrayList<Integer>)map.get("starCount");
		ArrayList<String> memberList=(ArrayList<String>)map.get("memberList");
		
		System.out.println("beginPage : "+page);
		request.setAttribute("lectureList", lectureList);
		request.setAttribute("paging", paging);
		request.setAttribute("starList", starList);
		request.setAttribute("starCount", starCount);
		request.setAttribute("memberList", memberList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/course2.jsp");
		forward.setRedirect(false);		
		
		
		return forward;
	}
}
