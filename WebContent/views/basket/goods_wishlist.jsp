<%@page import="com.wishlist.db.WishlistDTO"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="com.member.db.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>



</head>
<link rel="stylesheet" href="./css/wishlist.css">
<!-- <link rel="stylesheet" href="./css/dashboard.css"> -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <link rel="stylesheet" href="../css/viewmodal.css"> -->
<style>

</style>
<body>
 <jsp:include page="/include/header.jsp"/>
 
 <!-- 
    request 영역에 저장된 객체 저장
    request.setAttribute("basketList", basketList);
	request.setAttribute("goodsList", goodsList);
  -->
  <%
     List wishList = (List)request.getAttribute("wishList");
     List lectureList = (List)request.getAttribute("lectureList");
     MemberDTO MemberDTO =(MemberDTO) request.getAttribute("memberDTO");
  
    System.out.println("######정보:"+wishList+lectureList);
  %>
<div class="ws_wrap">
   
<!-- aside 영역 -->
<aside class="profile_aside">
		<ul class="menu-list">
		  <li class="menu1
		  is-active">
		    <a href="DashBoard.bo">대시보드</a>
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
		      <li class="menu2 "><a href="WishList.wi">위시리스트</a></li>
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
   
   
   
   
   
   
   
  <section id="alll" >			<!-- 위시 수정 -->
   <h3 class="boxh3">위시리스트><a href="BasketList.ba" style="font-size: 16px;">장바구니</a></h3>
  <%
  int total=0;
  for(int i=0;i<wishList.size();i++){
	  WishlistDTO wdto = (WishlistDTO)wishList.get(i);
	  LectureDTO ldto = (LectureDTO)lectureList.get(i);
	  %>
		<div class="boxx" >
			<div class="clearfix">
  	      <div class="column menu">
		      <img class="image" src="./upload/<%=ldto.getL_img().split(",")[0]%>">
		         <!--  width="249" height="162" -->
		         </div>
		  <div class="column content"> 
		  <a href="#" ><%=ldto.getL_title() %></a>
		  <p style="font-size: 12px;"><%=ldto.getL_m_name() %></p>
		  </div>
		  
		   <div class="amount">
		  <c:set var="price" value="<%=ldto.getL_price() %>"/>
		   <span style="text-align: center;">
		  <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /><%--<%=ldto.getL_price() %> 원 --%>
		   </span>
		   
		  		   
		   <div class="tooltip">
		   <a href ="./WishListDelete.wi?w_num=<%=wdto.getW_num()%>">
		   <i class="fa fa-close"></i>    <span class="tooltiptext">위시리스트 삭제</span> </a><br>
		   </div>
		    <button class="d_btn d_btn2" type="button" onclick="location.href ='./WishToBasketAction.wi?w_num=<%=wdto.getW_num()%>&num=<%=wdto.getW_l_num()%>&name=<%=ldto.getL_title()%>&price=<%=ldto.getL_price() %>'">
		    장바구니 <i class='fas fa-heart'style='color:black;'></i></button>
		  </div>
		  
		  </div>
		  
		 
		  
	</div>
		
		  
<% 
  }  
  %>

</section>

</div> 
</body>
<!-- footer -->
 <jsp:include page="/include/footer.jsp"></jsp:include>
</html>