package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;

public class BasketAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("BasketAddAction_execute() 호출");
		
		// 세션값을 사용해서 장바구니 사용 가능 
		// 세션값이 없을경우 장바구니 사용 불가능 (로그인 페이지 이동)
		
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if( id == null ){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;			
		}
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// BasketDTO 객체 생성 -> 정보 저장
		BasketDTO bkdto = new BasketDTO();
		// num,amount,size,color, + id
		bkdto.setB_l_num(Integer.parseInt(request.getParameter("num")));
		bkdto.setB_l_price(Integer.parseInt(request.getParameter("price")));
		bkdto.setB_m_id(id);
		
		// BasketDAO 저장
		BasketDAO bkdao = new BasketDAO();
		// 기존의 장바구니에 상품이 있는지 체크
/*		int check = bkdao.checkGoods(bkdto);
		
		// 없을경우 장바구니에 추가
		if(check != 1){
			bkdao.basketAdd(bkdto);
		}
		*/
		// 페이지 이동 (장바구니 목록 페이지)
		forward.setPath("./BasketList.ba");
		forward.setRedirect(true);	
		return forward;
	}

}
