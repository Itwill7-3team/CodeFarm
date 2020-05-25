package com.blog.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.db.BlogDAO;
import com.blog.db.BlogDTO;



public class BlogUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("@@@@@ BlogUpdate_execute()");
		
		ActionForward forward= new ActionForward();
		//세션확인
				HttpSession session = request.getSession();

				String id =(String) session.getAttribute("m_email");
				
				if(id == null){
					forward.setPath("./Main.le");
					forward.setRedirect(true);
					return forward;
				}
		
		//데이터 처리(num,pageNum)
		int num=Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum");
		
		BlogDAO bdao=new BlogDAO();
		
		BlogDTO bdto=bdao.getBlog(num);
		
		request.setAttribute("bdto", bdto);
		request.setAttribute("pageNum", pageNum);
		
		//페이지이동(./board/blogUpdateForm.jsp)
		forward.setPath("./views/blog/blogUpdateForm.jsp");
		forward.setRedirect(false); //페이지 이동하면서 가상주소 가져간다 =>포워드 =false
		
		return forward;
	}

}
