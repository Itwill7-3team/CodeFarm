<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 코딩팜 - 주문 상세 내역 | 온라인 강의 플랫폼 </title>
</head>
<body>
 <jsp:include page="/include/header.jsp"/>
<h1> 나 오 나  요 </h1>

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
		   
	  구매 상세 내역 주문 번호: <%=odto.getO_b_num() %>
		   
		   

 	<h4>총 주문금액 : <%=total %> 원</h4>



<table>

<tr>
	<td>주문 상태</td>
	<td><%=odto.getO_status() %></td>
</tr>
<tr>
	<td>주문 시각</td>
	<td><%=odto.getO_t_date() %></td>
</tr>
<%-- 
 <span> <%=odto.getO_t_type() %></span>
 <span>  <%=odto.getO_t_bank() %></span>
 <span> 계좌번호 </span>
    <time>입금기한설정</time>  
 <span> 입금 후 15분 내로 수강권한이 주어집니다  </span>
   <span> 결제 취소 버튼</span>
   --%>
<%	
 }
%>

</table>

	<h3> <a href="./OrderList.or">뒤로가기</a> </h3>
	좋은 지식의 구매는 더 좋은 지식 창출을 위한 바탕으로 쓰입니다.<br>
함께해 주셔서 감사합니다. 🙇🏻‍♀️🙇🏻‍♂️


</section>


 <jsp:include page="/include/footer.jsp"/> 
</body>
</html>