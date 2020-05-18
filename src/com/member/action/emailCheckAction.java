package com.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

import util.SHA256;
import util.Script;

public class emailCheckAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8"); 
		String url = request.getContextPath()+"/index.html";
		MemberDAO mdao = new MemberDAO();
		String m_email = null;
		HttpSession session = request.getSession();
		if(request.getParameter("m_email") != null){
			m_email = (String)request.getParameter("m_email");
		}
		
		String code = request.getParameter("code");
		String salt = mdao.getHash(m_email);
		String emailHash = SHA256.getEncrypt(m_email,salt);
		
		boolean isTrue = emailHash.equals(code)? true : false;
		
		if(isTrue){
			int result = mdao.update_emailcheck(m_email);
			if(result == 1){
				Script.moving(response, "인증에 성공하였습니다.",url);
			}else{
				Script.moving(response, "데이터베이스 오류");
				
			}
			
		}else{
			Script.moving(response, "인증에 실행하였습니다.");
		}
		return null;
	}
}
