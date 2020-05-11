package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.question.db.QuestionDAO;
import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;

public class ReViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		ReviewDAO rdao= new ReviewDAO();
		ArrayList<ReviewDTO> reviewlist =rdao.getReviewList();
		
		request.setAttribute("reviewlist", reviewlist);
		
		forward.setPath("./views/board/reView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
