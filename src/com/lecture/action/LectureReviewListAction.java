package com.lecture.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;

public class LectureReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureReviewListAction_execute()");
		// courseDetail.jsp -> review load ajax용 Action
		response.setCharacterEncoding("UTF-8");
		int l_number = Integer.parseInt(request.getParameter("l_number"));
		
		ReviewDAO rdao = new ReviewDAO();
		List<ReviewDTO> reviewList = rdao.getReviewList(l_number);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String review = gson.toJson(reviewList);
		response.getWriter().print(review);
		
		return null;
	}

}
