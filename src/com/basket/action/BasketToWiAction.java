package com.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.db.BasketDAO;
import com.basket.db.BasketDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.wishlist.db.WishlistDAO;
import com.wishlist.db.WishlistDTO;

public class BasketToWiAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BasketToWiAction_execute 호추리");
		
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("m_email");
		
		ActionForward forward = new ActionForward();
		if( id == null ){
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;			
		}
		
		request.setCharacterEncoding("UTF-8");
		
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		int l_number = Integer.parseInt(request.getParameter("number"));
		
		//getLecture해서 lecture정보 저장
				LectureDTO ldto= new LectureDAO().getLectureDetail(l_number);
				
				
				// BasketDTO 객체 생성 -> 정보 저장
				
				WishlistDTO wdto = new WishlistDTO();

				wdto.setW_l_num(ldto.getL_number());

			/*	wdto.setw(ldto.getL_title());
				wdto.setB_l_price(ldto.getL_price());*/
				wdto.setW_m_id(id);
				
				// BasketDAO 객체생성
				WishlistDAO wdao = new WishlistDAO();
				// 기존의 위시에 상품이 있는지 체크
				int check = wdao.checkGoods(wdto);
				
				// 없을경우 장바구니에 추가
				if(check != 1){
					wdao.wishlistAdd(wdto);
				}
				
				// WishListDAO 위시 삭제 메서드
				BasketDAO bkdao = new BasketDAO();
				bkdao.basketDelete(b_num);
				
				
				// 페이지 이동 (장바구니 목록 페이지)
				forward.setPath("./BasketList.ba");
				forward.setRedirect(true);	
				return forward;
			
			}
}
