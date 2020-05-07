package com.lecture.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class LectureMainListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureMainListAction_execute() 호출");
		
		LectureDAO ldao = new LectureDAO();
		
		String item = "best";
		
		List<LectureDTO> bestList = ldao.getLectureSelectList(item);
		
		request.setAttribute("bestList", bestList);
		
		LectureDAO ldao2 = new LectureDAO();
		
		item = "new";
		List<LectureDTO> newList = ldao2.getLectureSelectList(item);
				
		request.setAttribute("newList", newList);
		
		
		LectureDAO ldao3 = new LectureDAO();
		
		item = "free";
		List<LectureDTO> freeList = ldao3.getLectureSelectList(item);
		
		request.setAttribute("freeList", freeList);
		
		
		System.out.println("@@@@@@@@@@@ lectureList:"+bestList);
		System.out.println("@@@@@@@@@@@ lectureList:"+newList);
		System.out.println("@@@@@@@@@@@ lectureList:"+freeList);
		ActionForward forward = new ActionForward();
		forward.setPath("./views/main/main.jsp");
		forward.setRedirect(false);		

		return forward;
	}
}
