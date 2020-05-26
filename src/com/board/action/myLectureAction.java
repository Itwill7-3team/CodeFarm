package com.board.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.db.LectureDAO;
import com.order.db.OrderDAO;
import com.order.db.OrderDTO;

public class myLectureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

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
		
		//결제된 강의정보 vec
		Vector MyOrderV =new OrderDAO().getPaidOrderList(id);
		
		//vec.add(0, orderDetailList);
		//vec.add(1, lectureList);
		
		ArrayList orderDeatilList = (ArrayList)MyOrderV.get(0);
		ArrayList lectureList = (ArrayList)MyOrderV.get(1);
		
		
		//강의정보 담기
		request.setAttribute("orderDeatilList", orderDeatilList);
		request.setAttribute("lectureList", lectureList);
		
		
		forward.setPath("./views/dashboard/my-lectures.jsp");
		forward.setRedirect(false);
		
		System.out.println("myLectureAction 종료");
		return forward;
	
	}

}
