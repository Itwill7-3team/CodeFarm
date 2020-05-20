<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/goods.css" rel="stylesheet">

<title>Insert title here</title>

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
	     <td><b>주문번호</b></td>
	     <td><b>상품명</b></td>
	     <td><b>주문금액</b></td>
	     <td><b>주문상태</b></td>
	     <td><b>주문일시</b></td>
	  </tr>

	  <%
	   for(int i=0;i<orderList.size();i++){
		   OrderDTO odto = (OrderDTO) orderList.get(i);
	  %>
	    <tr>
	     <td>
	       <%=odto.getO_b_num()%>
	           
	     </td>
	     <td><%=odto.getO_l_name() %></td>
	     <td><%=odto.getO_sum_money() %>원</td>
	     
	    <%--  <%
	     String msg = "";

	     
	     switch(odto.getO_status()){
	     
	     case 0:
	    	 msg="대기중";
	    	 break;
	     case 1:
	    	 msg="결제완료";
	    	 break;
	    	 default:
	    		 msg="관리자 문의바람";
	     }
	     
	     %>	     
	     <td><%=msg %></td> --%>
	     
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