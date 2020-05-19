package com.instructor.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class addLectureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Action페이지 진입");
		LectureDTO ldto= new LectureDTO();
		
		String id="";
		System.out.println(request.getParameter("id"));
		if(request.getParameter("id")!=null)
			id=request.getParameter("id");
		String title="";
		if(request.getParameter("title")!=null)
		title= request.getParameter("title");
    	String abilities="";
    	if(request.getParameter("abilities")!=null)
    	abilities =request.getParameter("abilities");
    	String targets="";
    	if(request.getParameter("targets")!=null)
    	targets=request.getParameter("targets");
    	String based="";
    	if(request.getParameter("based")!=null)
    	based=request.getParameter("based");
    	String description="";
    	if(request.getParameter("description")!=null)
    	description=request.getParameter("description");
    	String body="";
    	if(request.getParameter("body")!=null)
    	body= request.getParameter("body");
    	String type="";
    	String type2="";
    	if(request.getParameter("category")!=null){
    	type=request.getParameter("category").split("/")[0];
    	type2=request.getParameter("category").split("/")[1];
    	}
    	String level="";
    	if(request.getParameter("level")!=null)
    	level=request.getParameter("level");
    	String img="";
    	if(request.getParameter("img")!=null)
    	img=request.getParameter("img");
    	int price=0;
    	if(request.getParameter("price")!=null)
    	price=Integer.parseInt(request.getParameter("price"));
		ldto.setL_m_email(id);
    	ldto.setL_title(title);
    	ldto.setL_abilities(abilities);
    	ldto.setL_targets(targets);
    	ldto.setL_based(based);
    	ldto.setL_description(description);
    	ldto.setL_content(body);
    	ldto.setL_type(type);
    	ldto.setL_type2(type2);
    	ldto.setL_level(level);
    	ldto.setL_img(img);
    	ldto.setL_price(price);
    	System.out.println(ldto.toString());
    	LectureDAO ldao= new LectureDAO();
		ldao.insertLecture(ldto);
    	System.out.println("성공적으로 종료");
    	
		return null;
	}

}
