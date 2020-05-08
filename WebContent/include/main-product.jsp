<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</head>
<body>
<%
List<LectureDTO> bestList = (List<LectureDTO>) request.getAttribute("bestList");
List<LectureDTO> newList = (List<LectureDTO>) request.getAttribute("newList");
List<LectureDTO> freeList = (List<LectureDTO>) request.getAttribute("freeList");

System.out.println("@@@@@@@@@@@@@@lectureList:"+bestList);
System.out.println("@@@@@@@@@@@@@@lectureList:"+newList);
System.out.println("@@@@@@@@@@@@@@lectureList:"+freeList);

%>


<article id="course">


<section id="lec">
<h1 class="title">베스트 강의</h1> 
<%
for(int i=0;i<bestList.size();i++){ 
	LectureDTO ldto = bestList.get(i);
%>
			
<div class="card">
<a href="#">
  <img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
    <h2><%=ldto.getL_title() %></h2>
</a>
	<p><%=ldto.getL_m_name() %></p> 
	<div class="card-in">
		<span class="fa fa-star checked"></span><!-- 찬하트 -->
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="far fa-star checked"></span><!--빈하트  -->
		<span class="review_cnt">(0)</span> 
		
		<span class="mg-l50">
		<a href="WishListAdd.wi?num=<%=ldto.getL_number() %>"><i class="fa fa-heart-o"></i></a>
		<a href="#"><i class="fa fa-cart-plus"></i></a>
		</span>
	
	<div class="mg-t10">
		<span class="tags tag"><%=ldto.getL_tag() %></span>
	
		<c:set var="price" value="<%=ldto.getL_price() %>"/>
		<span class="price">
		<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></span>
	</div>		

	</div>
</div>
<%} %>	

</section>


<!-- 프로덕트 카드 2번째줄 -->
<section id="lec">
<h1 class="title">새로운 강의</h1> 
<%
for(int i=0;i<newList.size();i++){ 
	LectureDTO ldto = newList.get(i);
%>
			
<div class="card">
<a href="#">
  <img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
    <h2><%=ldto.getL_title() %></h2>
</a>
	<p><%=ldto.getL_m_name() %></p> 
	<div class="card-in">
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="review_cnt">(0)</span> 
		
		<span class="mg-l50">
		<a href="#"><i class="fa fa-heart-o"></i></a>
		<a href="#"><i class="fa fa-cart-plus"></i></a>
		</span>
		
	<div class="mg-t10">
		<span class="tags tag"><%=ldto.getL_tag() %></span>
	
		<c:set var="price" value="<%=ldto.getL_price() %>"/>
		<span class="price">
		<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></span>
	</div>		

	</div>
</div>
<%} %>	

</section>

<!-- 프로덕트 카드 3번째줄 -->
<section id="lec">
<h1 class="title">무료 강의</h1> 
<%
for(int i=0;i<freeList.size();i++){ 
	LectureDTO ldto = freeList.get(i);
%>
			
<div class="card">
<a href="#">
  <img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
    <h2><%=ldto.getL_title() %></h2>
</a>
	<p><%=ldto.getL_m_name() %></p> 
	<div class="card-in">
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="review_cnt">(0)</span> 
		
		<span class="mg-l50">
		<a href="#"><i class="fa fa-heart-o"></i></a>
		<a href="#"><i class="fa fa-cart-plus"></i></a>
		</span>
		
	<div class="mg-t10">
		<span class="tags tag"><%=ldto.getL_tag() %></span>
	
		<c:set var="price" value="<%=ldto.getL_price() %>"/>
		<span class="price">
		<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></span>
	</div>		

	</div>
</div>
<%} %>	

</section>


</article>

</body>
</html>