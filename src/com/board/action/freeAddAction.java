package com.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.db.FileDTO;
import com.lecture.db.LectureDAO;
import com.lecture.db.LectureDTO;
import com.member.db.MemberDAO;
import com.member.db.MemberDTO;
import com.order.db.OrderDAO;
import com.order.db.OrderDTO;

public class freeAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("freeAddAction_execute()");
		
		int l_number = Integer.parseInt(request.getParameter("l_number"));
		String m_email = request.getParameter("m_email");
		int check = 0;
		
		OrderDAO odao = new OrderDAO();
		ArrayList<OrderDTO> orderList =  (ArrayList<OrderDTO>) odao.getOrderDetail(m_email);
		for(int i=0; i<orderList.size(); i++){
			if(orderList.get(i).getO_l_num() == l_number){
				check = 1;
				break;
			}
		}
		
		int f_num1 = 0;
		LectureDAO ldao = new LectureDAO();
		List<ArrayList<FileDTO>> fileSet = ldao.getFileList(l_number);
		for(int j=0; j<fileSet.size(); j++){
			for(int k=0; k<fileSet.get(j).size(); k++){
				if(fileSet.get(j).get(k).getF_col_list() == 1){
					f_num1 = fileSet.get(j).get(k).getF_num();
					break;
				}
			}
		}
		
		if(check == 0){
			ldao = new LectureDAO();
			LectureDTO ldto = ldao.getLectureDetail(l_number);
			
			MemberDAO mdao = new MemberDAO();
			MemberDTO mdto = mdao.getInfo(m_email);
			
			odao.addFreeOrder(ldto, mdto);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("./LectureVideo.le?l_number=" + l_number + "&f_num=" + f_num1);
		forward.setRedirect(true);
		return forward;
	}
}
