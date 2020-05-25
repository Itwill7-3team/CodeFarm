<%@page import="com.blog.db.BlogDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-블로그</title>
<link href="./css/blogContent.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">

</style>

</head>
<body>

<jsp:include page="/include/header.jsp"></jsp:include>
<%
String email="";
if(session.getAttribute("m_email")!=null){
email=(String)session.getAttribute("m_email");
}

BlogDTO bdto=(BlogDTO)request.getAttribute("bdto");
String pageNum=request.getAttribute("pageNum").toString();

String id="id";
if(bdto.getB_writer().indexOf("@")>-1){
id= bdto.getB_writer().substring(0,bdto.getB_writer().indexOf("@"));}
else{ id= bdto.getB_writer(); }

%>


<!-- 	<section class="community_header"> -->
<!-- 	<div class="container"> -->
<!-- <!-- 컨테이너 내용 --> 
<!-- 	</div> -->
<!-- 	</section> -->
	<aside>
	<button class="blg_btn" onclick="history.back();"><i class='fas fa-arrow-left'></i>
	</button>
	</aside>
	<article class="community_content"> 
<!-- 메인콘텐츠  -->
<!-- 	<div class="columns"> -->
		<div class="main_content">
<!--  -->
		<div class="blg_content">
			<div class="B_img">
				<img src="./upload/<%=bdto.getB_img() %>" style="width: 100%;">
			</div>
			<div class="B_ctc">
				<h1><span class="Blg">Blg.</span><%=bdto.getB_title()%></h1>
				<p class="Bwriter">작성자 :<%=id%></p>
				<hr>
				<p class="Bcontent"><%=bdto.getB_content() %>
			</div>
	
		</div>
		
	
		<!-- 글수정/삭제 -->
		<%if(email.equals(bdto.getB_writer())){%>
 		<button onclick="location.href='blogUpdate.bl?num=<%=bdto.getB_num()%>&pageNum=<%=pageNum%>';">수정하기</button>
		<button onclick="location.href='blogDeleteAction.bl?num=<%=bdto.getB_num()%>&pageNum=<%=pageNum%>';">삭제하기</button>
		<button onclick="location.href='blog.bl?pageNum=<%=pageNum%>';">목록보기</a> 	
		<%}%>
		
		
		</div>
		<br>	
		<br>	
		<br>	

<!-- 	</div> -->
	 
		
		
	 
		
	<!-- 메인콘텐츠  -->
	</article>

<!-- 컨텐츠 -->
<!-- 푸터 -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- 푸터 -->
</body>
</html>