package com.lecture.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.db.BlogDAO;
import com.blog.db.BlogDTO;
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
		
		List<BlogDTO> blogList= new BlogDAO().getBlogMainList();
		request.setAttribute("blogList", blogList);
		
		System.out.println("@@ best lectureList:"+bestList);
		System.out.println("@@ new lectureList:"+newList);
		System.out.println("@@ free lectureList:"+freeList);
		System.out.println("@@ blog List:"+blogList);
		ActionForward forward = new ActionForward();
		forward.setPath("./views/main/main.jsp");
		forward.setRedirect(false);		

		return forward;
	}
}
