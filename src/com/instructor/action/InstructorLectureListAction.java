package com.instructor.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InstructorLectureListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("GoodsListAction-execute()");

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.write("<script>");
		out.write("location.href='main.le'");
		out.write("</script>");
		out.close();
		
		
		
		return null;
	}

}
