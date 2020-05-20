<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="com.question.db.QuestionDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-공지</title>
<link href="./css/askView.css" rel="stylesheet">
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

QuestionDTO bdto=(QuestionDTO)request.getAttribute("bdto");
LectureDTO ldto= (LectureDTO)request.getAttribute("ldto");
String pageNum=request.getAttribute("pageNum").toString();
%>

<section class="community_header">
	<div class="container">
		<h2>묻고 답해요</h2>
		<p>
			질문하고 답변해요~<br>
			모르면 질문하고 ,서로서로 해답을 찾아봐요
		</p>
	</div>
	</section>
	<article class="community_content"> <aside>
	<div class="side_container">
		<p class="small_tag">함께 공부해요</p>
		<ul>
			<li><a href=""><i class="fas fa-edit"></i> 묻고 답하기</a></li>
			<li><a href=""><i class="fas fa-star"></i> 수강평 모아보기</a></li>
		</ul>
		<p class="small_tag">코드팜</p>
		<ul>
			<li><a href=""><i class="fas fa-bullhorn"></i> 공지사항</a></li>
			<li><a href=""><i class="far fa-comments"></i> 강의.기능 요청</a></li>
		</ul>
	</div>
	</aside>
	 <!-- 메인콘텐츠  -->
	<div class="columns">
		<div class="main_content">
			<!--  -->

		<h1><span class="N">Q.</span><%=bdto.getQ_title()%></h1>
		<%-- 작성자 :<%=ndto.getN_writer()%><br> --%>
		<hr>
		<div class="QnA_content">
		<p>작성자: <%=bdto.getQ_writer() %></p>
		<%=bdto.getQ_content() %>
		
		
		
		
		</div>
			
		
		<div class="content_side">
		<ul>
		<h4>해당 강의</h4>
		<li><a href="Detail.le?num=<%=ldto.getL_number()%>"><p><%=ldto.getL_title()%></p></a></li>
		<li><a href="Detail.le?num=<%=ldto.getL_number()%>"><img src="./upload/<%=ldto.getL_img().split(",")[0]%>" style="width: 100%;"></a></li>

		<h4>연관 강의</h4>

		
		</ul>
		</div>
<!-- 		<!-- 관리자제어 -->
		<%if(email.equals(bdto.getQ_writer())){%>
<%-- 		<button onclick="location.href='askAnswerUpdate.bo?num=<%=bdto.getQ_num()%>&pageNum=<%=pageNum%>';">수정하기</button> --%>
<%-- 		<button onclick="location.href='askAnswerDeleteAction.bo?num=<%=bdto.getQ_num()%>&pageNum=<%=pageNum%>';">삭제하기</button> --%>
		
		<%}%>
		<button onclick="location.href='askAnswer.bo?pageNum=<%=pageNum%>';">목록보기</a>	
		
		
		</div>
		<br>	
		<br>	
		<br>	

	</div>
	 
		
		
	 
		
	<!-- 메인콘텐츠  -->
	</article>

<!-- 컨텐츠 -->
<!-- 푸터 -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- 푸터 -->
</body>
</html>