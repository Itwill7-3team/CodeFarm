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
</head>
<style>
.detable {
	display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
    background-color: transparent;
    width: 100%;
    background-color: #fff;
    color: #363636;
    border-collapse: collapse;
    border-spacing: 0;}

.sacard {    
	background-color: #fff;
    box-shadow: 0 2px 3px rgba(0,10,18,.1), 0 0 0 1px rgba(0,10,18,.1);
    color: #454545;
    max-width: 100%;
    position: relative;}
    
.sacard-content{
    padding: 1.5rem;
    background-color: transparent;}
    
.all1 {
	margin-left: -.75rem;
    margin-right: -.75rem;
    margin-top: -.75rem;
        padding: .5rem;}  
.all2{
    flex: none;
    width: 41.66667%;
}  
    
    
    
    
    
</style>


<body>
 <jsp:include page="/include/header.jsp"/>


	<%
	List orderDetailList =
	(List)request.getAttribute("orderDetailList");

	%>





	<section id = jall>

	

	 <%
	  int total = 0;
	   for(int i=0;i<orderDetailList.size();i++){
		   OrderDTO odto = (OrderDTO)orderDetailList.get(i);
		   total += (odto.getO_sum_money());
	 %>
		<div class="saythx" >   
	  구매 상세 내역 주문 번호: <%=odto.getO_b_num() %></div>
	<div class="all1">   
	<div class="all2"></div>
	<div class="all3">	 
	<div class="sacard">  
	<div class="sacard-content">
	<div class="total_amount_con">
			<div class="total_a">
			<c:set var="total" value="<%=total%>" />
		 	<h2>총 주문금액 :  <span><fmt:setLocale value="ko_KR"/>
							<fmt:formatNumber type="currency" value="${total}"/></span></h2>
			</div> <!-- total_a -->
	<table class="detable">
		<%
		     String msg = "";
	
		     
		     switch(odto.getO_status()){
		     
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
			<td>주문 상태</td>
			<td><%=msg %></td>
		</tr>
		<tr>
			<td>주문 시각</td>
			<td><%=odto.getO_t_date() %></td>
		</tr>
		
		<tr>
			<td>결제 수단</td>
			<td><%=odto.getO_t_type() %></td>
		</tr>
		<tr>
			<td>은행명</td>
			<td><%=odto.getO_t_bank() %></td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td>0000</td>
		</tr>
		<tr>
			<td>입금기한</td>
			<td><%=odto.getO_t_b_reg_date() %></td>
		</tr>
		<tr>
		<td colspan="2">입금 후 15분내로 수강권한이 주어집니다.</td>
		</tr>
		<%	
		 }
		%>
		
		</table>

<button type="button"> 결제 취소 </button>


</div> <!-- total_amount_con -->
</div> <!-- sacard-content -->
</div> <!-- sacard -->
</div> <!-- all3 -->
</div> <!-- all1 -->

			<!-- <h3> <a href="./OrderList.or">뒤로가기</a> </h3> -->
			<div class="saythx" style="text-align: center;">좋은 지식의 구매는 더 좋은 지식 창출을 위한 바탕으로 쓰입니다.<br>
		함께해 주셔서 감사합니다. 🙇🏻‍♀️🙇🏻‍♂️</div>


</section>






 <jsp:include page="/include/footer.jsp"/> 
</body>
</html>