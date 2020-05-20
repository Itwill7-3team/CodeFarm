<%@page import="com.notice.db.NoticeDTO"%>
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
<link href="./css/notice.css" rel="stylesheet">
<style type="text/css">
.content{
width: 50%;
margin: 0 auto;
min-height: 700px;
}

textarea {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-bottom: 10px;
  width: 100%;
}

</style>

</head>
<body>

<jsp:include page="/include/header.jsp"></jsp:include>
<%
String email="";
if(session.getAttribute("m_email")!=null){
email=(String)session.getAttribute("m_email");
}

NoticeDTO ndto=(NoticeDTO)request.getAttribute("ndto");
String pageNum=request.getAttribute("pageNum").toString();

%>

<section class="community_header">
	<div class="container">
		<h2>공지사항</h2>
		<p>
			공지사항
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

		<h1><span class="N">N.</span><%=ndto.getN_title()%></h1>
		<%-- 작성자 :<%=ndto.getN_writer()%><br> --%>
		<hr>
		<div class="notice_content">
		<%=ndto.getN_content() %>
		</div>
		
		<div class="content_side">
		<ul>
		<h4>최근 소식</h4>
			<% ArrayList<NoticeDTO> noticeList= (ArrayList<NoticeDTO>)request.getAttribute("noticeList");
				for(int i=0; i<noticeList.size();i++){
					ndto=noticeList.get(i);
					
			%>
		<li><a href="noticeContent.bo?num=<%=ndto.getN_num()%>&pageNum=<%=pageNum%>"><p><%=ndto.getN_title()%></p></a></li>
		<%} %>
		
		</ul>
		</div>
		<!-- 관리자제어 -->
		<%if(email.equals("admin@naver.com")){%>
		<button onclick="location.href='noticeUpdate.bo?num=<%=ndto.getN_num()%>&pageNum=<%=pageNum%>';">수정하기</button>
		<button onclick="location.href='noticeDeleteAction.bo?num=<%=ndto.getN_num()%>&pageNum=<%=pageNum%>';">삭제하기</button>
		
		<%}%>
		<button onclick="location.href='notice.bo?pageNum=<%=pageNum%>';">목록보기</a>	
		
		
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