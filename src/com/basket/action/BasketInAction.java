package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class BasketInAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BasketInAction_execute()");
		
		HttpSession session = request.getSession();
		
		String id =(String)session.getAttribute("m_email");
		if(id == null){
			id = request.getParameter("id");
		}
		
		ActionForward forward = new ActionForward();
		if( id == null ){
			forward.setPath("./Main.le");
			forward.setRedirect(true);
			return forward;			
		}
		
		request.setCharacterEncoding("UTF-8");
		
		LectureDTO ldto = new LectureDAO().getLectureDetail(Integer.parseInt(request.getParameter("num")));

		BasketDTO bkdto = new BasketDTO();
		bkdto.setB_l_num(ldto.getL_number());
		bkdto.setB_l_name(ldto.getL_title());
		bkdto.setB_l_price(ldto.getL_price());
		bkdto.setB_m_id(id);
		
		BasketDAO bkdao = new BasketDAO();
		int check = bkdao.checkGoods(bkdto);
		// 없을경우 장바구니에 추가
		if(check != 1){
			bkdao.basketAdd(bkdto);
		}
		
		forward.setPath("./BasketList.ba");
		forward.setRedirect(true);	
		return forward;
	}

}
