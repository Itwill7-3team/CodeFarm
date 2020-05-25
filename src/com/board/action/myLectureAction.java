package com.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.LectureDAO;
import com.order.db.OrderDAO;
import com.order.db.OrderDTO;

public class myLectureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		
		//나의 결제정보 받아서
		List<OrderDTO> MyOrder =new OrderDAO().getPaidOrderList(request.getAttribute("m_email").toString());
		
		//강의 리스트 만들고
		//new LectureDAO().getLectureList();
		
		//강의정보 뿌리기(MyLectureList)
		
		
		
		
		forward.setPath("./views/dashboard/my-lectures.jsp");
		forward.setRedirect(false);
		
		System.out.println("myLectureAction 종료");
		return forward;
	
	}

}
