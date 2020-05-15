package com.basket.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class JqBasket implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("JqBasket_execute() 호출");
		
		// 세션값을 사용해서 장바구니 사용 가능 
		// 세션값이 없을경우 장바구니 사용 불가능 (로그인 페이지 이동)
		
/*		
			HttpSession session = request.getSession();
		String id =(String)session.getAttribute("m_email");
		int l_number = (Integer)session.getAttribute("l_number");*/
		
	
		
		String id  = request.getParameter("m_email");
		int l_number = Integer.parseInt(request.getParameter("l_number")); 
		System.out.println("확인 : "+id+l_number);
		
		
		ActionForward forward = new ActionForward();
		if( id == null ){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;			
		}
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		LectureDTO ldto=new LectureDAO().getLectureDetail(l_number);
		
		BasketDTO bkdto = new BasketDTO();
		// b_num, b_m_id, b_l_num, b_date, b_l_price, b_l_name
				
		bkdto.setB_l_num(ldto.getL_number());
		bkdto.setB_m_id(id);
		
		System.out.println("bkdto:"+bkdto);
		
		BasketDAO bkdao = new BasketDAO();
		
		int check = bkdao.checkGoods(bkdto);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@check"+check);
		
		System.out.println("check: "+check);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.write(Integer.toString(check));
		out.close();
		
		
		return null;
	}

}
