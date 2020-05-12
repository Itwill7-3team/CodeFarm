package com.lecture.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class LectureDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureDetailAction_execute()");

		// int l_number = 00000000002; // 테스트용
		// main또는 search 에서 강의이미지 클릭=> num 파라미터를 넘겨 받습니다.
		// DB lecture 테이블을 이용, 상세페이지 이동합니다.
		int l_number = Integer.parseInt(request.getParameter("num"));
		
		LectureDAO ldao = new LectureDAO();
		LectureDTO ldto = ldao.getLectureDetail(l_number);
		
		request.setAttribute("ldto", ldto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/courseDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
