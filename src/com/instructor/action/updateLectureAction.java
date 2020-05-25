package com.instructor.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class updateLectureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Action페이지 진입");
		LectureDTO ldto= new LectureDTO();
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("m_email");
		
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
    	System.out.println(request.getParameter("price"));
    	if(request.getParameter("price")!=null && request.getParameter("price")!="")
    	price=Integer.parseInt(request.getParameter("price"));
    	String start_msg="";
    	if(request.getParameter("start_msg")!=null && request.getParameter("start_msg")!="")
    		start_msg=(String)request.getParameter("start_msg").replace("/n", "<br>");
    	String end_msg="";
    	if(request.getParameter("end_msg")!=null && request.getParameter("end_msg")!="")
    		end_msg=(String)request.getParameter("end_msg").replace("/n", "<br>");
    	int l_number=Integer.parseInt(request.getParameter("num"));
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
    	ldto.setStart_msg(start_msg);
    	ldto.setEnd_msg(end_msg);
    	ldto.setL_number(l_number);
    	System.out.println(ldto.toString());
    	LectureDAO ldao= new LectureDAO();
		int check=ldao.updateLecture(ldto);
		if(check==0){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.write("데이터 저장 실패!(아이콘텍스트 +이미지 변경시 이름긴것 사용불가!!)");
			out.close();
			return null;
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out= response.getWriter();
			out.write("데이터 저장 성공!");
			out.close();
			return null;
		}
    	
	}

}
