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

<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<link rel="stylesheet" href="./css/wishlist.css">
<link rel="stylesheet" href="./css/main.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<jsp:include page="/include/dash-aside.jsp"/>
<!-- aside 영역 -->   
   
  <section id="lec">
<div class="column is-10 main_container">
					<small class="is-hidden-mobile"> <nav class="breadcrumb"
							aria-label="breadcrumbs">
						<ul>
							<li><a href="#">내 결제</a></li>
							<li><a href="#">위시리스트</a></li>
						</ul>
						</nav>
					</small>

					<h3 class="heading is-hidden-mobile">위시리스트</h3>
</div>					
<%
for(int i=0;i<wishList.size();i++){ 
	 WishlistDTO wdto = (WishlistDTO)wishList.get(i);
	  LectureDTO ldto = (LectureDTO)lectureList.get(i);
%>
			
<div class="card">
<a href="Detail.le?num=<%=ldto.getL_number() %>">
  <img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
    <h2><%=ldto.getL_title() %></h2>
</a>
	<p><%=ldto.getL_m_email() %></p> 
	<div class="card-in">
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="far fa-star checked"></span>
		<span class="review_cnt">(0)</span> 
		
		<span class="mg-l50">
		<a href="WishListDelete.wi?num=<%=wdto.getW_num() %>"><i class="fa fa-heart"></i></a><!-- 위시리스트 삭제 -->
		<a href="WishToBasket.wi?num=<%=wdto.getW_num() %>&number=<%=ldto.getL_number() %>"><i class="fa fa-cart-plus"></i></a><!-- wish to basket -->
		</span>
	
	<div class="mg-t10">
		<span class="tags tag"><%=ldto.getL_type() %></span>
	
		<c:set var="price" value="<%=ldto.getL_price() %>"/>
		<span class="price">
		<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></span>
	</div>		

	</div>
</div>
<%} %>	

</section> 
   
</div> 
</body>
<!-- footer -->
 <jsp:include page="/include/footer.jsp"></jsp:include>
</html>