<%@page import="com.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>

<link rel="stylesheet" href="./css/dashboard.css">
</head>
<link rel="stylesheet" href="./css/admin.css">
<body class="profile dashboard is_logged_in " >

    
<div id="root">
 <jsp:include page="/include/header.jsp"/>     
<section>

    
<!-- aside 영역 -->
<jsp:include page="/include/dash-aside.jsp"/>
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