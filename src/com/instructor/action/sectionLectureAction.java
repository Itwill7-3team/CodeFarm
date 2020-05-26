package com.instructor.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.ast.FieldDeclaration;

import com.lecture.db.FileDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class sectionLectureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("sectionLectureAction_execute()");
		
		// VideoModal.jsp -> file DB저장 ajax용 Action
		
		int    f_l_num    = Integer.parseInt(request.getParameter("f_l_num"));
		String f_m_email  = request.getParameter("f_m_email");
		int    f_sec_list = Integer.parseInt(request.getParameter("f_sec_list"));
		String f_sec_name = request.getParameter("f_sec_name");
		int    f_col_list = Integer.parseInt(request.getParameter("f_col_list"));
		String f_col_name = request.getParameter("f_col_name");
		String f_name     = request.getParameter("f_name");
		
		FileDTO fdto = new FileDTO();
		fdto.setF_l_num(f_l_num);
		fdto.setF_m_email(f_m_email);
		fdto.setF_sec_list(f_sec_list);
		fdto.setF_sec_name(f_sec_name);
		fdto.setF_col_list(f_col_list);
		fdto.setF_col_name(f_col_name);
		fdto.setF_name(f_name);
		
		System.out.println(fdto);
		
		// fileDAO 생성 필요
		LectureDAO ldao = new LectureDAO();
		int check = ldao.addFile(fdto);
		
		if(check == 0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.write("데이터 저장 실패(중복 수업)!");
			out.close();
			return null;
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.write("데이터 저장 성공!");
			out.close();
			return null;
		}
    	
	}

}
