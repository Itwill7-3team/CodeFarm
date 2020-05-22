<%@page import="com.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
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
     <div class="info_title"><h2>회원 목록</h2></div>
       <%
          	// 세션값 제어( 로그인,관리자 여부 )
		String m_email = (String) session.getAttribute("m_email");
	    
	    if(m_email == null || !m_email.equals("admin@naver.com")){
	    	
	    	response.sendRedirect("Main.le");
	    	
	    }

		// 이전페이지에서 전달된 데이터를 처리 (회원목록리스트)
		// request 영역에 저장
		// request.setAttribute("memberList", memberList);
		List<MemberDTO> memberList 
		   = (List<MemberDTO>)request.getAttribute("memberList");

		// 표를 사용해서 데이터 출력
	%>
	  <table class="member_info">
	    <tr class="calum_info">
	      <th>아이디</th>
	      <th>등급</th>
	      <th>탈퇴</th>
	    </tr>
	    
	    <%
	    String rank = "";
	       for(int i=0;i<memberList.size();i++){
	    	   MemberDTO mdto = memberList.get(i);
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
	    	    <tr>
			      <td><a href="./SerchInfo.me?m_email=<%=mdto.getM_email() %>"><%=mdto.getM_email() %></a></td>
			      <td><%=rank %></td>
			      <td><input type="button" value="회원 탈퇴" onclick="del('<%=mdto.getM_email() %>')" ></td>
			    </tr>
	    	   <%
	       }
	    %>
	  </table>
          
  
          
          
          
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
<script type="text/javascript">
function del(m_email){
	if(confirm("정말 회원을 탈퇴 시키겠습니까?")){
	location.href='AdminDeleteAction.me?m_email='+m_email;
}
}
</script>
</html>