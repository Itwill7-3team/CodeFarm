package com.board.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.review.db.ReviewDAO;

public class ReViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		ReviewDAO rdao= new ReviewDAO();
		ArrayList<Map<String, Object>> reviewlist =rdao.getReviewList();
		
		request.setAttribute("reviewlist", reviewlist);
		
		forward.setPath("./views/board/reView.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
