package com.lecture.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.lecture.db.FileDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.review.db.ReviewDAO;

public class LectureDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("LectureDetailAction_execute()");

		// main또는 search 에서 강의이미지 클릭=> num 파라미터를 넘겨 받습니다.
		int l_number = 2; // 테스트용_테스트 후 아래 코드 사용
		// int l_number = Integer.parseInt(request.getParameter("num"));
		int count = 2; // 처음 강의 상세 화면 로드시 리뷰 2개만 로드
		
		LectureDAO ldao = new LectureDAO();
		LectureDTO ldto = ldao.getLectureDetail(l_number); // 강의 상세 정보
		List<LectureDTO> lectureList = ldao.getLectureList(ldto.getL_m_email()); // 강사별 강의 목록
		ArrayList<ArrayList<FileDTO>> fileSet = ldao.getFileList(l_number); // 강의내 섹션별 파일 목록
		
		ArrayList<Integer> l_numList = new ArrayList<Integer>(); // 강사의 다른 강의 번호 저장
		for(int i=0; i<lectureList.size(); i++){
			l_numList.add(lectureList.get(i).getL_number());
		}
		
		ReviewDAO rdao = new ReviewDAO();
		Map<Integer, Map<String, Object>> ratingList = rdao.getAvgrating(l_numList); // 강의별 리뷰 전체 별점
	//	lecture 내 review 파트 완성 후 아래 코드 사용
	//	ArrayList<ReviewDTO> reviewList = rdao.getReviewList(l_number, count); // 강의별 리뷰 목록(2개)
		
		request.setAttribute("ldto", ldto);
		request.setAttribute("lectureList", lectureList);
		request.setAttribute("fileSet", fileSet);
		request.setAttribute("ratingList", ratingList);
	//	lecture 내 review 파트 완성 후 아래 코드 사용
	//	request.setAttribute("reviewList", reviewList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./views/lecture/courseDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
