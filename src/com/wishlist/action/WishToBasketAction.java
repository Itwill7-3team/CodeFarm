package com.wishlist.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.wishlist.db.WishlistDAO;
import com.wishlist.db.WishlistDTO;

public class WishToBasketAction implements Action {
//위시리스트에서 삭제+장바구니에 추가
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("WishListToBasketAction_execute() 호출");
		
		// 세션값을 사용해서 장바구니 사용 가능 
		// 세션값이 없을경우 장바구니 사용 불가능 (로그인 페이지 이동)
		
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("m_email");
		//id="test";
		ActionForward forward = new ActionForward();
		if( id == null ){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;			
		}
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		int w_num = Integer.parseInt(request.getParameter("num"));
		int l_number = Integer.parseInt(request.getParameter("number"));
		
		//getLecture해서 lecture정보 저장
		LectureDTO ldto= new LectureDAO().getLectureDetail(l_number);
		
		// BasketDTO 객체 생성 -> 정보 저장
		BasketDTO bkdto = new BasketDTO();
	
		bkdto.setB_l_num(ldto.getL_number());
		bkdto.setB_l_name(ldto.getL_title());
		bkdto.setB_l_price(ldto.getL_price());
		bkdto.setB_m_id(id);
		
		// BasketDAO 객체생성
		BasketDAO bkdao = new BasketDAO();
		// 기존의 장바구니에 상품이 있는지 체크
		int check = bkdao.checkGoods(bkdto);
		
		// 없을경우 장바구니에 추가
		if(check != 1){
			bkdao.basketAdd(bkdto);
		}
		
		
		// WishListDAO 위시 삭제 메서드
		WishlistDAO wdao= new WishlistDAO();
		wdao.wishlistDelete(w_num);
		
		
		// 페이지 이동 (장바구니 목록 페이지)
		forward.setPath("./BasketList.ba");
		forward.setRedirect(true);	
		return forward;
	
	}

}
