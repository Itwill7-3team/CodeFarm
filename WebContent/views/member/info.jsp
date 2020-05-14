<%@page import="com.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>

<!--   <link rel="stylesheet" href="https://cdn.inflearn.com/dist/css/MAIN.4cb95bc7bc2095575584.css"> -->
<link rel="stylesheet" href="./css/dashboard.css">
</head>
<link rel="stylesheet" href="./css/admin.css">
<body class="profile dashboard is_logged_in " >

    
<div id="root">
 <jsp:include page="/include/header.jsp"/>     
<section>

    
<!-- aside 영역 -->
<aside class="profile_aside">
		<ul class="menu-list">
		  <li class="menu1
		  is-active">
		    <a href="#">대시보드</a>
		  </li>
		  <li class="menu1">
		    <a href="#">알람</a>
		  </li>
		  <li class="menu1">
		    <a href="#">내 학습</a>
		    <ul>
		      <li class="menu2 "><a href="#">수강중인 강의</a></li>
		      <li class="menu2 "><a href="#">참여중인 로드맵</a></li>
		      <li class="menu2 "><a href="#">내 질문</a></li>
		    </ul>
		  </li>
		  <li class="menu1">
		    <a href="#">내 결제</a>
		    <ul>
		      <li class="menu2 "><a href="#">위시리스트</a></li>
		      <li class="menu2 "><a href="#">수강 바구니</a></li>
		      <li class="menu2 "><a href="#">내 쿠폰함</a></li>
		      <li class="menu2 "><a href="#">구매 내역</a></li>
		      <li class="menu2 "><a href="#">내 포인트</a></li>
		    </ul>
		  </li>
		  <li class="menu1">
		    <a href="#">모든 알림</a>
		  </li>
		  <li class="menu1">
		    <a href="#">설정</a>
		    <ul>
		      <li class="menu2 "><a href="#">프로필 설정</a></li>
		      <li class="menu2 "><a href="#">알림 설정</a></li>
		    </ul>
		  </li>
		</ul>
</aside>
<!-- aside 영역 -->
<% 
 	String m_email = (String)session.getAttribute("m_email");
	if(m_email == null){
		response.sendRedirect("Main.le");
	}
	MemberDTO mdto = (MemberDTO)request.getAttribute("mdto");
%>
<!-- 대시보드 -->
    <div class="main_container">
      	<div class="member_main">
      	<form action="./UpdateInfoAction.me">
      		<div class="email">
      			<span class="colum_name">이메일</span>
      			<input type="text" name="m_email" class="input_me" value="<%=mdto.getM_email()%>"> 
      		</div>
      	</form>	
   		</div>
  	</div>
 </section>

<!-- 대시보드 -->
      
<jsp:include page="/include/footer.jsp"/>
    
</div>




</body>

</html>