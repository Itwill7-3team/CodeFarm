package com.wishlist.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wishlist.db.WishlistDAO;
import com.wishlist.db.WishlistDTO;

public class WishListAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("WishListAddAction_execute() 호출");
		
		// 세션값을 사용해서 장바구니 사용 가능 
		// 세션값이 없을경우 장바구니 사용 불가능 (로그인 페이지 이동)
		
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("m_email");
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
		// WishDTO 객체 생성 -> 정보 저장
		WishlistDTO wdto = new WishlistDTO();
	
		wdto.setW_l_num(Integer.parseInt(request.getParameter("num")));
		wdto.setW_m_id(id);
		
		// WishlistDAO 저장
		WishlistDAO wdao = new WishlistDAO();
		// 기존의 위시리스트에 상품이 있는지 체크 => 상품이 있으면 토스트로 이미 존재하는상품 안내
		int check = wdao.checkGoods(wdto);
		
		// 없을경우 위시리스트에 추가
		if(check != 1){
			wdao.wishlistAdd(wdto);	
			System.out.println("상품정보 등록");
			
			
		}
		else{
			wdao.JqwishlistDelete(Integer.parseInt(request.getParameter("num")));
			System.out.println("상품정보 제거");
		}
		// 페이지 이동 (장바구니 목록 페이지)
		forward.setPath("./Main.le");
		forward.setRedirect(true);	
		return forward;
	
	}

}
