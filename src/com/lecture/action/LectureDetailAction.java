package com.lecture.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.db.FileDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.member.db.MemberDAO;
import com.member.db.MemberDTO;
import com.order.db.OrderDAO;
import com.order.db.OrderDTO;
import com.review.db.ReviewDAO;
import com.review.db.ReviewDTO;
import com.wishlist.db.WishlistDAO;
import com.wishlist.db.WishlistDTO;

public class LectureDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureDetailAction_execute()");
		
		HttpSession session = request.getSession();

		// main또는 search 에서 강의이미지 클릭=> num 파라미터를 넘겨 받습니다.
		//int l_number = 2; // 테스트용_테스트 후 아래 코드 사용
		int l_number = Integer.parseInt(request.getParameter("num"));
		String m_email = (String)session.getAttribute("m_email");
		
		MemberDAO mdao = new MemberDAO();
		WishlistDAO wdao = new WishlistDAO();
		if(m_email != null){
			MemberDTO mdto = mdao.getInfo(m_email); // 회원 정보
			request.setAttribute("mdto", mdto);
			
			OrderDAO odao = new OrderDAO();
			List<OrderDTO> orderList = odao.getOrderList(m_email); // 회원 주문 확인
			request.setAttribute("orderList", orderList);
			
			Vector vec = wdao.getWishList(m_email); // 회원별 위시 확인
			ArrayList<WishlistDTO> wishList = (ArrayList<WishlistDTO>)vec.get(0);
			for(int i=0; i<wishList.size(); i++){
				if(wishList.get(i).getW_l_num() == l_number){
					WishlistDTO wdto = wishList.get(i);
					request.setAttribute("wdto", wdto);
					//break;
				}
			}
		}
		int wCount = wdao.getWishListCount(l_number); // 강의 위시 수
		
		LectureDAO ldao = new LectureDAO();
		LectureDTO ldto = ldao.getLectureDetail(l_number); // 강의 상세 정보
		MemberDTO lmdto = mdao.getInfo(ldto.getL_m_email()); // 강사 정보
		List<LectureDTO> lectureList = ldao.getLectureList(ldto.getL_m_email()); // 강사별 강의 목록
		List<ArrayList<FileDTO>> fileSet = ldao.getFileList(l_number); // 강의내 섹션별 파일 목록
		
		List<Integer> l_numList = new ArrayList<Integer>(); // 강사의 다른 강의 번호 저장
		for(int i=0; i<lectureList.size(); i++){
			l_numList.add(lectureList.get(i).getL_number());
		}
		
		ReviewDAO rdao = new ReviewDAO();
		List<ReviewDTO> reviewList = rdao.getReviewList(l_number); // 강의별 리뷰 목록
		Map<Integer, Map<String, Object>> ratingList = rdao.getAvgrating(l_numList); // 강의별 리뷰 전체 별점
		
		for(int i=0; i<l_numList.size(); i++){ // 별점 없는 강의 별점 초기화
			if(ratingList.get(l_numList.get(i)) == null){
				Map<String, Object> review_rating = new HashMap<String, Object>();
				review_rating.put("r_l_num", l_numList.get(i));
				review_rating.put("reviewAll", 0);
				review_rating.put("rating_avg", 0.0);
				review_rating.put("rating_5", 0);
				review_rating.put("rating_4", 0);
				review_rating.put("rating_3", 0);
				review_rating.put("rating_2", 0);
				review_rating.put("rating_1", 0);
				ratingList.put(l_numList.get(i), review_rating);
			}
		}
		
		request.setAttribute("ldto", ldto);
		request.setAttribute("lmdto", lmdto);
		request.setAttribute("wCount", wCount);
		request.setAttribute("fileSet", fileSet);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("ratingList", ratingList);
		request.setAttribute("lectureList", lectureList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/courseDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
