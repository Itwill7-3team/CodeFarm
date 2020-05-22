<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title> 코딩팜 - 구매 상세 내역 | 온라인 강의 플랫폼 </title>
<link rel="stylesheet" href="./css/basket.css">
</head>
<style>



.saythx {
	color: #595959;
	padding: .5rem;
    font-size: 1.25rem;
    font-weight: 700;
    text-align: center!important; 
	
}
h1,h2{font-size: 2.25rem;
    margin: 0;
    font-size: 100%;
    font-weight: 400;}
   
p{
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-size: 16px;
    margin: 0;
    line-height: 1.6;}
    

.detable {
	width: 100%;
	background-color: #fff;
    color: #363636;
     border-collapse: collapse;
    /*border-spacing: 0; */
    }

    
.sacard-content{
    padding: 1.5rem;
    background-color: transparent; }
 
    }  

   
    
.canbtn{
	background-color: #fff;
    border-color: #dbdbdb;
    border-width: 1px;
    color: #363636;
    cursor: pointer;
    justify-content: center;
    padding: calc(.375em - 1px) .75em;
    text-align: center;
    white-space: nowrap;
   }

 
.detable.bordered td, .detable.bordered th {
    border: 1px solid #ccc;
    color: #363636;
    text-align: left;
    padding: .5em .75em;
}

.canbtn {
	padding: 10px;
	border-radius: 4px; 
	align-items: center;
	border: 1px solid transparent;
	font-size: 1rem;
	background-color: #fff;
	border-color: #dbdbdb;
	col:h   	border-width: 1px;

}
.canbtn:HOVER {
	border-color: #b5b5b5;
    color: #363636;
    
}
.text-info{color: #3298dc!important;}


.all2 bb {
width: 41.66667%;
}


</style>


<body>
 <jsp:include page="/include/header.jsp"/>


	<%
	List orderDetailList = (List)request.getAttribute("orderDetailList");
	List lectureList = (List)request.getAttribute("lectureList");
	MemberDTO MemberDTO =(MemberDTO) request.getAttribute("memberDTO");

    System.out.println("%%%$##$$$정보:"+orderDetailList+lectureList);
	%>





	<section id = alll>
	<div class="all1"> <!-- container -->
 	<%
		OrderDTO orderDTO = (OrderDTO)orderDetailList.get(0);{ %> 
	
	<div class="saythx" >   
	  <h1>구매 상세 내역 <small> (주문 번호:  <%=orderDTO.getO_b_num() %> )</small></h1></div>
	  
	<div class="Ocolumns"> <!-- columns --> 
	 
	 
	 
	 <!--  -->
	<!--[all2 aa] orderlist -->
 <!-- <div class="all2 aa">  column is-7 -->
	 <div class="boxx" > <!-- box product_item_list -->
	 <%
	  int total = 0;
	   for(int i=0;i<orderDetailList.size();i++){
		   OrderDTO odto = (OrderDTO)orderDetailList.get(i);
		   LectureDTO ldto = (LectureDTO)lectureList.get(i);
		   total += (odto.getO_sum_money());
	 %> 
	 	
			<div class="clearfix" >
				<div class="column menu">
				<img class="img" src="./upload/<%=ldto.getL_img().split(",")[0]%>">
			</div>
			
			<div class="column content">
				<a href="#"><%=ldto.getL_title()%></a>
				<p style="font-size: 12px;">
					<%=ldto.getL_m_email()%></p>
				<!-- basketDAO 추가 설정 -->
			</div> 
			</div> 
		
 	<div class="amount">
			<c:set var="price" value="<%=ldto.getL_price()%>" />
			<span style="text-align: center;"> <fmt:setLocale
					value="ko_KR" />
				<fmt:formatNumber type="currency" value="${price}" />
			</span>
		</div>
		</div> 
	 
	
	
	<%} %>
	
	</div> <!-- box product_item_list -->
	</div> <!--column is-7  -->

	
	
	<div class="all2 bb">	 
	<div class="sacard">  
	<div class="sacard-content">
	<div class="total_amount_con">
			<div class="total_a">
 			<c:set var="total" value="<%=total%>" />
		 	<h2>총 주문금액 <span><fmt:setLocale value="ko_KR"/>
							<fmt:formatNumber type="currency" value="${total}"/></span></h2>
			</div> <!-- total_a -->
	<table class="detable bordered">
		<tbody>
	 	<%
		     String msg = "";
	
		     
		     switch(orderDTO.getO_status()){
		     
		     case 0:
		    	 msg="입금대기";
		    	 break;
		     case 1:
		    	 msg="결제완료";
		    	 break;
		    	 default:
		    		 msg="관리자 문의바람";
		     }
		     
		  %>	     

		<tr>
			<th>주문 상태</th>
			<td><%=msg %></td>
		</tr>
		<tr>
			<th>주문 시각</th>
			<td><%=orderDTO.getO_t_date() %></td>
		</tr>
		
		<tr>
			<th>결제 수단</th>
			<td><%=orderDTO.getO_t_type() %></td>
		</tr>
		<tr>
			<th>은행명</th>
			<td><%=orderDTO.getO_t_bank() %></td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td>0000</td>
		</tr>
		<tr>
			<th>입금기한</th>
			<td><%=orderDTO.getO_t_b_reg_date() %></td>
		</tr>
		<tr>
		<td colspan="2"><span class="text-info">입금 후 15분내로 수강권한이 주어집니다.</span></td>
		</tr>
	
		<tr>
		<td colspan="2" style="border: none;"><button type="button" class="canbtn" style="width: 100%;"> 결제 취소 </button></td>
		</tr>
			</tbody>
		</table>




</div> <!-- total_amount_con -->
</div> <!-- sacard-content -->
</div> <!-- sacard -->
</div> <!-- all3 -->
 <%} %> 
</div> <!-- columns -->
			<!-- <h3> <a href="./OrderList.or">뒤로가기</a> </h3> -->
			<div class="saythx"><p>좋은 지식의 구매는 더 좋은 지식 창출을 위한 바탕으로 쓰입니다.<br>
		함께해 주셔서 감사합니다. 🙇🏻‍♀️🙇🏻‍♂️</p></div>

</div>  <!-- all1 -->
</section>






 <jsp:include page="/include/footer.jsp"/> 
</body>
</html>