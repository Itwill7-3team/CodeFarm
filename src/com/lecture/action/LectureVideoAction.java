package com.lecture.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.db.FileDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class LectureVideoAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureVideoAction_execute() 호출");
		
		HttpSession session = request.getSession();
		
		int l_number = Integer.parseInt(request.getParameter("l_number"));
		String m_email = (String)session.getAttribute("m_email");
		
		LectureDAO ldao = new LectureDAO();
		LectureDTO ldto = ldao.getLectureDetail(l_number);
		List<ArrayList<FileDTO>> fileSet = ldao.getFileList(l_number);
		
		request.setAttribute("ldto", ldto);
		request.setAttribute("fileSet", fileSet);
		
		System.out.println("LectureVideoAction_execute() setAttribute 저장");
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/lectureVideo.jsp");
		forward.setRedirect(false);		
	
		return forward;
	}
}
