

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
  <div class="container">
    <div class="columns">
    
<!-- aside 영역 -->
<jsp:include page="/include/dash-aside.jsp"/>
<!-- aside 영역 -->

<!-- 대시보드 -->
      <div class="main_container">
      <div class="member_main">
     <div class="info_title"><h2>회원 정보</h2></div>
       <%
          	// 세션값 제어( 로그인,관리자 여부 )
		String m_email = (String) session.getAttribute("m_email");
	    
	    if(m_email == null || !m_email.equals("admin@naver.com")){
	    	
	    	response.sendRedirect("Main.le");
	    	
	    }

		// 이전페이지에서 전달된 데이터를 처리 (회원목록리스트)
		// request 영역에 저장
		// request.setAttribute("memberList", memberList);
		MemberDTO mdto 
		   = (MemberDTO)request.getAttribute("mdto");

		// 표를 사용해서 데이터 출력
	%>
	  <table class="member_info">
	    <tr class="calum_info">
	      <th>이메일</th>
	      <td><%= mdto.getM_email() %></td>
	    </tr>
	    <%
	    String rank = "";
	    String name = mdto.getM_name();
	    String phone = mdto.getM_phone();
	    String intro = mdto.getM_intro();
	    String addr = mdto.getM_addr();
	    if(intro == null || intro.equals("자신을 소개해주세요.")  ){
	    	intro = "미등록";
	    }
	    
	    if(phone == null){
	    	phone ="미등록";
	    }
	    if(name == null){
	    	name ="미등록";
	    }
	    if(addr == null){
	    	addr ="미등록";
	    }
	    
	    if(mdto.getM_rank()==0){
  		  rank ="비회원";
  		  
  	   }else if(mdto.getM_rank()==1){
  		   rank ="회원";
  	   }else if(mdto.getM_rank()==2){
  		   rank ="강사";
  	   }else if(mdto.getM_rank()==3){
  		   rank ="관리자"; 
  	   }
	    %>
	    <tr class="calum_info">
	      <th>회원 구분</th>
	      <td><%=rank %></td>
	    </tr>
	    
	    <tr class="calum_info">
	      <th>이름</th>
	      <td><%=name %></td>
	    </tr>
	    
	    <tr class="calum_info">
	      <th>닉네임</th>
	      <td><%=mdto.getM_nick() %></td>
	    </tr>
	    
		<tr class="calum_info">
	      <th>전화번호</th>
	      <td><%=phone %></td>
	    </tr>
	    
	    <tr class="calum_info">
	      <th>블로그 주소</th>
	      <td><%=addr %></td>
	    </tr>
	    
	    <tr class="calum_info">
	      <th>자기소개</th>
	      <td><%=intro %></td>
	    </tr>
	     
	      
	  </table>
         <button class="button" onclick="history.back();">목록</button> 
  
          
          
          
        </div>
      </div>
    </div>
  </div>
 </section>

<!-- 대시보드 -->
      
<jsp:include page="/include/footer.jsp"/>
    
</div>

</iframe>



</body>

</html>