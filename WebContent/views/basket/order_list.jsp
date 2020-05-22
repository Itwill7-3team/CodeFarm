<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>코딩팜 - 구매 내역 | 온라인 강의 플랫폼</title>

<jsp:include page="/include/header.jsp"/>
<style type="text/css">

#alll{
margin: 5% auto 20% auto; 
width: 1000px; height: auto;
 box-sizing: inherit;
 font-size: 15px;
 }

table {
border-collapse: collapse;
border-top: 1px solid pink;
width: 1000px;

}  

 th, td {
    
    padding: 15px;
  }   
</style>
</head>
<body>

	<%
	  ArrayList orderList 
	    = (ArrayList) request.getAttribute("orderList");
	
	%>
	<section id="alll" >
	<h2> 구매 내역 </h2>
	
	<table>

	  <tr>
	     <td><b>주문 번호</b></td>
	     <td><b>주문명</b></td>
	     <td><b>금액</b></td>
	     <td><b>상태</b></td>
	     <td><b>주문 날짜</b></td>
	  </tr>

	  <%
	  int total = 0;
	   for(int i=0;i<orderList.size();i++){
		   OrderDTO odto = (OrderDTO) orderList.get(i);
	  %>
	    <tr>
	     <td>
	       <a href="./OrderDetail.or?trade_num=<%=odto.getO_b_num()%>">
	       <%=odto.getO_b_num()%>
	       </a>   
	     </td>
	     <td><%=odto.getO_l_name() %></td>
	     
	     <%
	      total = odto.getO_sum_money();
	     %>
	     
	     <%-- <td><%=odto.getO_sum_money() %></td> --%> 
	   <td> <c:set var="total" value="<%=total%>" />
	     <fmt:setLocale value="ko_KR" />
		<fmt:formatNumber type="currency" value="${total}" /> 원</td>
	    
	    <!-- status 수정 -->
	    

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

	     <td><%=msg %></td> 
	     
	     <td><%=odto.getO_t_date() %></td>
	   
	  	</tr>
	  <%
	   }
	  %>
	
	</table>

</section>

<jsp:include page="/include/footer.jsp"/>


</body>
</html>