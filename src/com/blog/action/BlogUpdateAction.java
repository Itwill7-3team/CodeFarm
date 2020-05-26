package com.blog.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.db.BlogDAO;
import com.blog.db.BlogDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class BlogUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("@@@BlogUpdateAction_execute()실행");

		ActionForward forward= new ActionForward();
		//세션확인
		HttpSession session = request.getSession();

		String id =(String) session.getAttribute("m_email");
		
		if(id == null){
			forward.setPath("./Main.le");
			forward.setRedirect(true);
			return forward;
		}
		//한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		

		//파라미터받아서 DTO에 담기
		BlogDTO bdto=new BlogDTO();

		//1. 파일 업로드 (이미지4개)
		
				//파일 저장 위치
				ServletContext context=request.getServletContext();
				String realPath=request.getRealPath("/upload");
				System.out.println("파일이 저장되는 곳 (서버의HDD):"+realPath);
				
				//파일 크기 지정
				int maxSize=10*1024*1024;
				
				//파일 업로드(cos.jar활용)
				MultipartRequest multi= new MultipartRequest(
						request,
						realPath,
						maxSize,
						"utf-8",
						new DefaultFileRenamePolicy()
						);
				System.out.println("@multi~file 이름 확인 :"+multi.getFilesystemName("b_img"));

				bdto.setB_num(Integer.parseInt(multi.getParameter("b_num")));
				bdto.setB_img(multi.getFilesystemName("b_img"));
				//request.getParameter("b_num"); -> DAO에서 계산할것임
				bdto.setB_title(multi.getParameter("b_title"));
				bdto.setB_content(multi.getParameter("b_content"));
				bdto.setB_writer(multi.getParameter("b_writer"));
				bdto.setB_ip(request.getRemoteAddr());

		//NoticeDAO 객체생성, 글쓰기 메서드실행, 글 작성 (글작성 성공/실패 alert)후 페이지이동
		int check=new BlogDAO().updateBlog(bdto);
		
		if(check != 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			}
				
		forward.setPath("blog.bl");
		forward.setRedirect(false);
		
		return forward;
	}

}
