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
		  </div>
		  
		  <div class="amount">
		   <span style="text-align: center;"><%=ldto.getL_price() %> 원</span>		   <%-- <button class="d_btn" type="button" onclick="location.href ='./BasketDelete.ba?b_num=<%=bdto.getB_num()%>'">장바구니 삭제</button> --%>
		   <div class="tooltip">
		   <a href ="./WishListDelete.wi?w_num=<%=wdto.getW_num()%>">
		   <i class="fa fa-close"></i>    <span class="tooltiptext">위시리스트 삭제</span> </a><br>
		   </div>
		    <button class="d_btn d_btn2" type="button" onclick="location.href ='./WishToBasketAction.wi?w_num=<%=wdto.getW_num()%>&num=<%=wdto.getW_l_num()%>&name=<%=ldto.getL_title()%>&price=<%=ldto.getL_price() %>'">
		    장바구니 <i class='fas fa-heart'style='color:black;'></i></button>
		  </div>
		  
	</div>
		
		  
<% 
  }  
  %>

</section> 
</body>
<!-- footer -->
 <jsp:include page="/include/footer.jsp"></jsp:include>
</html>