package com.member.action;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

import util.Gmail;
import util.SHA256;
import util.Script;

public class emailSendAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("@@@@ emailSendAction_execute호출!!!");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
	    MemberDAO mdao = new MemberDAO();
	    String m_email = null;
	    if(session.getAttribute("m_email") != null){
	    	m_email = (String)session.getAttribute("m_email");
	    }
	    
	    boolean emailChecked = mdao.getUserEmailChecked(m_email);
	    if(emailChecked == true){
	    	Script.moving(response, "이미 인증된 회원입니다.");
	    }
	    
	    StringBuffer url = request.getRequestURL();
	    String path[] = url.toString().split("/");
	    String host = "";
	    for(int i=0; i<path.length-1; i++){
	    	host += path[i]+"/";
	    }
	    System.out.println("이메일 정보: "+m_email);
	    
	    String from = "mimimido12@naver.com";
	    String to = m_email;
	    String salt = mdao.getHash(m_email);
	    System.out.println("@@@hashCode"+salt);
	    String code = SHA256.getEncrypt(to, salt);

	    String subject = "회원가입을 위한 이메일 인증 메일입니다.";
	    String content = "다음 링크에 접속하여 이메일 인증을 진행해주세요."
	    	+"<a href='"+host+"emailCheckAction.me?code="+code+"&m_email="+m_email+"'>이메일인증확인</a>";
	    
	    Properties p = new Properties();	
	    p.put("mail.smtp.user", from);
	    p.put("mail.smtp.host", "smtp.googlemail.com");
	    p.put("mail.smtp.port", "465");
	    p.put("mail.smtp.starttls.enable", "true");
	    p.put("mail.smtp.auth", "true");
	    p.put("mail.smtp.debug", "true");
	    p.put("mail.smtp.socketFactory.port", "465");
	    p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    p.put("mail.smtp.socketFactory.fallback", "false");
	
	   try{
		   Authenticator auth = new Gmail();
		   Session ses = Session.getInstance(p, auth);
		   ses.setDebug(true);
		   
		   MimeMessage msg = new MimeMessage(ses);
		   msg.setSubject(subject);
		   
		   Address FromAddr = new InternetAddress(from);
		   msg.setFrom(FromAddr);
		   
		   Address toAddr = new InternetAddress(to);
		   msg.addRecipient(Message.RecipientType.TO, toAddr);
		   msg.setContent(content, "text/html; charset=UTF-8");
		   Transport.send(msg);

		   forward.setPath("./Main.le");
		   forward.setRedirect(true);
			session.removeAttribute("m_email");
	   }catch(Exception e){
		   Script.moving(response, "오류가 발생했습니다.");
	   }
	   return forward;
	}
}
