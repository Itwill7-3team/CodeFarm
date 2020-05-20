package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;

public class BasketAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BasketAddAction_execute() 호출");
		
		// 세션값을 사용해서 장바구니 사용 가능 
		// 세션값이 없을경우 장바구니 사용 불가능 (로그인 페이지 이동)
		
		HttpSession session = request.getSession();
		String id =(String)session.getAttribute("m_email");
		if(id==null){
			id=request.getParameter("id");
		}
		//id="test";
		
		ActionForward forward = new ActionForward();
		if( id == null ){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;			
		}
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// BasketDTO 객체 생성 -> 정보 저장

				
		//강의 num에 맞는 Lecture DTO 가져와서 BasketDTO에 넣어서 BasketDAO 실행

		LectureDTO ldto=new LectureDAO().getLectureDetail(Integer.parseInt(request.getParameter("num")));

		BasketDTO bkdto = new BasketDTO();
		bkdto.setB_l_num(ldto.getL_number());
		bkdto.setB_l_name(ldto.getL_title());
		bkdto.setB_l_price(ldto.getL_price());
		bkdto.setB_m_id(id);
		
		System.out.println("bkdto:"+bkdto);
		// BasketDAO 저장
		BasketDAO bkdao = new BasketDAO();
		// 기존의 장바구니에 상품이 있는지 체크
		int check = bkdao.checkGoods(bkdto);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@check"+check);
		// 없을경우 장바구니에 추가
		if(check != 1){
			bkdao.basketAdd(bkdto);
		}
		else{
			bkdao.JqbasketDelete(Integer.parseInt(request.getParameter("num")));
		}
		
		// 페이지 이동 (장바구니 목록 페이지)
		forward.setPath("./BasketList.ba");
		forward.setRedirect(true);	
		return forward;
	}

}
