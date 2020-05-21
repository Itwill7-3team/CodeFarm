package com.instructor.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class LectureAddImg implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("LectureAddImg 도착");
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/upload");
		System.out.println("파일이 저장되는곳 (서버의 HDD) :"+realPath);
		
		int maxSize = 10 * 1024 * 1024; // 10MB
		// 파일 업로드 (cos.jar)
				MultipartRequest multi =
						new MultipartRequest(
								request,
								realPath,
								maxSize,
								"UTF-8",
								new DefaultFileRenamePolicy()
								);
				
				System.out.println("파일 업로드 성공 (서버에 저장완료)");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out= response.getWriter();
				String data =multi.getFilesystemName("file");
				out.write(data);
				out.close();
				
		return null;
	}

	
}
