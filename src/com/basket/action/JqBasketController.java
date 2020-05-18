package com.basket.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class JqBasketController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("JqBasketController_execute() 호출");
		
		String m_email  = request.getParameter("m_email");
		int l_number = Integer.parseInt(request.getParameter("l_number")); 
		System.out.println("확인 : "+m_email+l_number);
		
		request.setCharacterEncoding("UTF-8");
		
		LectureDTO ldto=new LectureDAO().getLectureDetail(l_number);
		
		BasketDTO bkdto = new BasketDTO();
		// b_num, b_m_id, b_l_num, b_date, b_l_price, b_l_name
				
		bkdto.setB_l_num(ldto.getL_number());
		bkdto.setB_l_name(ldto.getL_title());
		bkdto.setB_l_price(ldto.getL_price());
		bkdto.setB_m_id(m_email);
		
		System.out.println("bkdto:"+bkdto);
		
		BasketDAO bkdao = new BasketDAO();
		
		int check = bkdao.checkGoods(bkdto);
		System.out.println("확인 check 1 : "+check);
		
		if(check == 0){
			bkdao.basketAdd(bkdto);
			check = 1;
		}else if(check == 1){
			bkdao.JqbasketDelete(l_number);
			check = 0;
		}
		System.out.println("확인 check 2 : "+check);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.write(Integer.toString(check));
		out.close();
		
		return null;
	}

}
