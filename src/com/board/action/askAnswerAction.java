package com.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.db.NoticeDAO;
import com.notice.db.NoticeDTO;
import com.question.db.QuestionDAO;
import com.question.db.QuestionDTO;

public class askAnswerAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward= new ActionForward();
		QuestionDAO bdao= new QuestionDAO();
		

		//게시글 유,무 체크
		int check = bdao.getQuestionCount();
		
/////////////////////////////////////////////////////////////////////////////////////////////////		
//페이징 처리
//한페이지에 보여질 글 개수
int pageSize=10;
//현 페이지가 몇 페이지인지를 확인		
String pageNum=null;
pageNum = request.getParameter("pageNum");		

if(pageNum==null){
pageNum="1";
}

//시작행 계산
int currentPage=Integer.parseInt(pageNum);
int startRow= (currentPage-1)*pageSize+1;

//끝행 계산
int endRow= currentPage * pageSize;


//전체 페이지 수 계산하기
int pageCount=check/pageSize+(check%pageSize==0? 0:1);

//한 화면에 보여주는 블럭의 수(페이지 번호 개수)
int pageBlock=10;

//시작페이지
int startPage=((currentPage-1)/pageBlock)*pageBlock+1;

//끝페이지		
int endPage= startPage+pageBlock-1;
if(endPage>pageCount){
endPage=pageCount;
}


/////////////////////////////////////////////////////////////////////////////////////////////////
ArrayList<QuestionDTO> boardList=null;
		if(check != 0){ //글이 존재한다
				boardList= bdao.getBoardList(startRow,pageSize);
		}
		
		/// 페이징 처리 정보 저장
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", check);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		
		System.out.println("askAnswerAction 실행");
		request.setAttribute("boardList", boardList);
		forward.setPath("./views/board/askAnswer.jsp");
		forward.setRedirect(false);
		
		System.out.println("askAnswerAction 종료");
		return forward;
	}

}
