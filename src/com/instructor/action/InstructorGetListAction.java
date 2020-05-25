package com.instructor.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;



public class InstructorGetListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("InstructorGetListAction 실행");
		
		HttpSession session= request.getSession();
		if(session.getAttribute("m_email")==null){
			PrintWriter out= response.getWriter();
			out.write("<script>");
			out.write("location.href='Main.le'");
			out.write("</script>");
			out.close();
		}
		/*
		 *  강사인지 확인후 아니면 권한이 없다고 출력후 Main으로 
		 *  
		 * if(session.getAttribute("m_email")==null){
			PrintWriter out= response.g	etWriter();
			out.write("<script>");
			out.write("alert('접근 권한이 없습니다.');");
			out.write("location.href='main.le'");
			out.write("</script>");
			out.close();
		}*/
		String m_email=(String)session.getAttribute("m_email");
		LectureDAO ldao=new LectureDAO();
		ArrayList<LectureDTO> ldtolist=(ArrayList<LectureDTO>)ldao.getLectureList(m_email);
		request.setAttribute("lecturelist", ldtolist);
		ActionForward forward=new ActionForward();
		forward.setPath("./views/instructor/addLecturelist.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
