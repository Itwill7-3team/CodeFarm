package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;

public class ReviewCommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureReviewListAction_execute()");
		// courseDetail.jsp -> comment 작성 ajax용 Action
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int l_number = Integer.parseInt(request.getParameter("r_l_num"));
		String r_content = request.getParameter("r_content");
		String r_writer  = request.getParameter("r_writer");
		int r_rating  = Integer.parseInt(request.getParameter("r_rating"));
		int r_re_lev  = Integer.parseInt(request.getParameter("r_re_lev"));
		int r_re_ref  = Integer.parseInt(request.getParameter("r_re_ref"));
		int r_re_seq  = Integer.parseInt(request.getParameter("r_re_seq"));
		
		ReviewDTO rdto = new ReviewDTO();
		rdto.setR_l_num(l_number);
		rdto.setR_content(r_content);
		rdto.setR_writer(r_writer);
		rdto.setR_rating(r_rating);
		rdto.setR_re_lev(r_re_lev);
		rdto.setR_re_ref(r_re_ref);
		rdto.setR_re_seq(r_re_seq);
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO rcdto = rdao.addReComment(rdto);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String commentDto = gson.toJson(rcdto);
		response.getWriter().print(commentDto);
		
		return null;
	}

}
