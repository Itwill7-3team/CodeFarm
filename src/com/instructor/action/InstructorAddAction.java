package com.instructor.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.instructor.action.ActionForward;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;


public class InstructorAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("GoodsAddAction_execute() 호출");
		
		// 1. 파일 업로드 (이미지 4개)
		
		// 파일 저장 위치
		ServletContext context = request.getServletContext();
		String realPath = context.getRealPath("/upload");
		System.out.println("파일이 저장되는곳 (서버의 HDD) :"+realPath);
		
		// 파일 크기 지정
		int maxSize = 10 * 1024 * 1024; // 10MB
		
		// 파일 업로드 (cos.jar)
		MultipartRequest multi =
				new MultipartRequest(
						request,
						realPath,
						maxSize,
						"UTF-8"
						//new DefaultFileRenamePolicy()
						);
		
		System.out.println("파일 업로드 성공 (서버에 저장완료)");
		
		
		// 2-0 DB테이블 생성 : model2_goods
		
		// 2. GoodsDTO 객체 생성 (전달받은 정보를 저장)
		LectureDTO ldto = new LectureDTO();
		
		ldto.setPay_count(Integer.parseInt(multi.getParameter("pay_count")));
		ldto.setL_content(multi.getParameter("l_content"));
		ldto.setL_goods(Integer.parseInt(multi.getParameter("l_goods")));
		ldto.setL_m_email(multi.getParameter("l_m_email"));
		ldto.setL_pct(Integer.parseInt(multi.getParameter("l_pct")));
		ldto.setL_price(Integer.parseInt(multi.getParameter("l_price")));
		/*ldto.setL_reg_date(l_reg_date);*/
		ldto.setL_title(multi.getParameter("l_title"));
		ldto.setL_type(multi.getParameter("l_type"));
		/*ldto.setPct_date(pct_date);*/
		String image = multi.getFilesystemName("file1")+","
				+multi.getFilesystemName("file2")+","
				+multi.getFilesystemName("file3")+","
				+multi.getFilesystemName("file4");
		ldto.setL_img(image);
		
		/*
		ldto.setAmount(Integer.parseInt(multi.getParameter("amount")));
		gdto.setBest(0); // 인기상품 정보 - 0
		gdto.setCategory(multi.getParameter("category"));
		gdto.setColor(multi.getParameter("color"));
		gdto.setContent(multi.getParameter("content"));
		//gdto.setDate(date); -> DB에서 입력
		gdto.setName(multi.getParameter("name"));
		//gdto.setNum(Integer.parseInt(multi.getParameter("num")));
		// ->DB에서 입력
		gdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		gdto.setSize(multi.getParameter("size"));
		
		String image = multi.getFilesystemName("file1")+","
				+multi.getFilesystemName("file2")+","
				+multi.getFilesystemName("file3")+","
				+multi.getFilesystemName("file4");
		gdto.setImage(image);*/
		
		System.out.println("이미지 파일 정보 : "+image);
		System.out.println("GoodsDTO 저장완료 : "+ldto.toString());
		
		// 3. AdminGoodsDAO 객체를 생성해서 처리 
		//  -> insertGoods(dto)
		
		
		
		// 4. 페이지 이동 (List페이지)
		ActionForward forward = new ActionForward();
		forward.setPath("./InstructorLectureList.in");
		forward.setPath("./Search.le");
		forward.setRedirect(true);	
		return forward;
		
		
	}
}
