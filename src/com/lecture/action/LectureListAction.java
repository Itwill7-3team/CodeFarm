package com.lecture.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class LectureListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureListAction_execute() 호출");
		
		LectureDAO ldao = new LectureDAO();
		
		
		/* 분류를 위한 방법 --보류 */
		String item = request.getParameter("item");
		if(item == null) {
			item = "all";
		}
		/* 분류를 위한 방법 --보류 */
		
		
		List<LectureDTO> lectureList = ldao.getLecutreList(item);
		
		request.setAttribute("lectureList", lectureList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/course2.jsp");
		forward.setRedirect(false);		
		
		
		return forward;
	}
}
