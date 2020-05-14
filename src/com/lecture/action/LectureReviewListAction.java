package com.lecture.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;

public class LectureReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureDetailAction_execute()");
		// courseDetail.jsp -> review load ajax용 Action
		
		int l_number = Integer.parseInt(request.getParameter("l_number"));
		
		ReviewDAO rdao = new ReviewDAO();
		
		int count = rdao.getReviewCount(l_number);
		ArrayList<ReviewDTO> reviewList = rdao.getReviewList(l_number, count);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String review = gson.toJson(reviewList);
		
		response.getWriter().print(review);
		
		return null;
	}

}
