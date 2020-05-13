package com.lecture.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.review.db.ReviewDAO;

public class LectureDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureDetailAction_execute()");

		int l_number = 2; // 테스트용_테스트 후 아래 코드 사용
		//int l_number = Integer.parseInt(request.getParameter("l_number"));
		int count = 2;
		
		LectureDAO ldao = new LectureDAO();
		LectureDTO ldto = ldao.getLectureDetail(l_number);
		
		ReviewDAO rdao = new ReviewDAO();
		Map<String, Object> review_rating = rdao.getAvgrating(l_number);
		// lecture 내 review 파트 완성 후 아래 코드 사용
	//	ArrayList<ReviewDTO> reviewList = rdao.getReviewList(l_number, count);
		
		request.setAttribute("ldto", ldto);
		request.setAttribute("review_rating", review_rating);
		// lecture 내 review 파트 완성 후 아래 코드 사용
	//	request.setAttribute("reviewList", reviewList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/courseDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
