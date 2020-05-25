package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.quest.db.QuestDAO;
import com.quest.db.QuestDTO;

public class requestAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("requestAction 실행");
		
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		
		QuestDTO qdto= new QuestDTO();
		qdto.setQ_type(type);
		qdto.setQ_content(content);
		System.out.println(qdto.toString());
		QuestDAO qdao= new QuestDAO();
		qdao.insertQuest(qdto);
		
		
		return null;
	}

}
