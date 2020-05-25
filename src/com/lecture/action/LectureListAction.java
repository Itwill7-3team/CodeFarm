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
	
		/*List<Integer> l_numList = new ArrayList<Integer>();
		ReviewDAO rdao = new ReviewDAO();
		Map<Integer, Map<String, Object>> ratingList = rdao.getAvgrating(l_numList); // 강의별 리뷰 전체 별점
		
		for(int i=0; i<l_numList.size(); i++){ // 별점 없는 강의 별점 초기화
			if(ratingList.get(l_numList.get(i)) == null){
				Map<String, Object> review_rating = new HashMap<String, Object>();
				review_rating.put("r_l_num", l_numList.get(i));
				review_rating.put("reviewAll", 0);
				review_rating.put("rating_avg", 0.0);
				review_rating.put("rating_5", 0);
				review_rating.put("rating_4", 0);
				review_rating.put("rating_3", 0);
				review_rating.put("rating_2", 0);
				review_rating.put("rating_1", 0);
				ratingList.put(l_numList.get(i), review_rating);
			}
		}*/
		
		
		System.out.println("LectureListAction_execute() 11 호출");
		
		Map<String, Object> map = ldao.getLecutreList(s,item,paging,t1,t2);
		ArrayList<LectureDTO> lectureList=(ArrayList<LectureDTO>)map.get("lectureList");
		ArrayList<Double> starList=(ArrayList<Double>)map.get("starList");
		ArrayList<Integer> starCount=(ArrayList<Integer>)map.get("starCount");
		System.out.println("beginPage : "+page);
		request.setAttribute("lectureList", lectureList);
		request.setAttribute("paging", paging);
		request.setAttribute("starList", starList);
		request.setAttribute("starCount", starCount);
		/*request.setAttribute("ratingList", ratingList);*/
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/course2.jsp");
		forward.setRedirect(false);		
		
		
		return forward;
	}
}
