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
<link rel="stylesheet" href="../css/viewmodal.css">
<style>

body {margin: 0;
/* border: 1px red solid; */
}
.image {width: 130px; height: auto;}
h3 {border-bottom:2px solid pink; padding-bottom: 10px; width: 700px;
margin-bottom: 10px;
}

#alll{
margin: 5em auto 30% auto; 
width: 1000px; height: auto;
overflow:hidden;
/* border: 1px blue solid; */
}

.boxx{float:left; 
border-bottom:1px solid pink; 
width: 700px; height: auto;  
padding: 10px 10px 20px 0;
/* border: 1px green solid; */
}

.boxx2{display: inline-block;
width:320px; height:auto; 
margin-left: 30px;
/* border: 1px green solid; */
}

a {text-decoration: none;}

.amount {text-align: center; width: 100px; float: left; 
 padding-top: 10px; }
 
 .menu {margin-left: 10px; padding-top: 5px;}
 
.column {float: left;  }
.content {width:350px; padding: 5px 20px 5px 30px; 
word-wrap: break-word;}

.boxh3 {float: left; padding-left: 10px;}


@media only screen and (max-width: 600px) {
  .si_columns {
    width: 100%;
    
  }
}
.si_btn {
  background-color: #F25E5E;
  border: none;
  color: white;
  width: 100%;
  text-align: center;
  text-decoration: none;
  font-size: 15px;
  border-bottom: 1px solid #eee;
  padding: 10px;
  text-align: center;
  cursor: pointer;
  opacity: 1;
  transition: 0.3s;
  
  }

.si_btn:hover {opacity: 0.6} 

/* 위시리스트 */
 .d_btn {
  background-color: #F28379;
  border: none;
  color: #262523;
  padding: 5px 10px;
  text-align: center;
  font-size: 12px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;}
  
.d_btn:hover {opacity: 1}
 .d_btn:HOVER>.fa-heart {color: red !important;} 
		

/* 툴팁 */
.tooltip {
  position: relative;
  display: inline-block;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 80px;
  background-color: #F25E5E;
  color: white;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  top: -5px;
  left: 110%;
  font-size: 10px;
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 48%;
  right: 100%;
  margin-top: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: transparent #F25E5E transparent transparent;
}
.tooltip:hover .tooltiptext {
  visibility: visible;
}

/* Set a style for all buttons */
.btn {
  border: none;
  background-color: inherit;
  padding:0;
  font-size: 8px;
  cursor: pointer;
  display: inline-block;
}

.btn:hover {color: red;}


.default {color: black;}



/* Add padding and center-align text to the container */
.Vcontainer {
  padding: 16px;
  
}


/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}


/* Clear floats */
.Vclearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .deletebtn {
     width: 100%;
  }
}
</style>
<body>
 <jsp:include page="../include/header.jsp"/>
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
		   <i class="fa fa-close"></i>    <span class="tooltiptext">장바구니 삭제</span> </a><br>
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
 <jsp:include page="../include/footer.jsp"></jsp:include>
</html>