package com.lecture.action;

import java.util.List;
import java.util.Map;

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
		
		Map<String, Object> bestMap = ldao.getLectureSelectList(item);
		
		request.setAttribute("bestList", bestMap.get("lectureList"));
		request.setAttribute("beststarList", bestMap.get("starList"));
		request.setAttribute("beststarCount", bestMap.get("starCount"));
		
		item = "new";
		Map<String, Object> newMap = ldao.getLectureSelectList(item);
				
		request.setAttribute("newList", newMap.get("lectureList"));
		request.setAttribute("newstarList", newMap.get("starList"));
		request.setAttribute("newstarCount", newMap.get("starCount"));
		
		
		
		item = "free";
		Map<String, Object> freeMap = ldao.getLectureSelectList(item);
		
		request.setAttribute("freeList", freeMap.get("lectureList"));
		request.setAttribute("freestarList", freeMap.get("starList"));
		request.setAttribute("freestarCount", freeMap.get("starCount"));
		
		List<BlogDTO> blogList= new BlogDAO().getBlogMainList();
		request.setAttribute("blogList", blogList);
		
		/*System.out.println("@@ best lectureList:"+bestList);
		System.out.println("@@ new lectureList:"+newList);
		System.out.println("@@ free lectureList:"+freeList);*/
		System.out.println("@@ blog List:"+blogList);
		ActionForward forward = new ActionForward();
		forward.setPath("./views/main/main.jsp");
		forward.setRedirect(false);		

		return forward;
	}
}
