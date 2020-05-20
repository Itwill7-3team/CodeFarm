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


   <span> 주문상태!@!!@status</span>
 <span> <%=odto.getO_t_date() %></span>
 <span> <%=odto.getO_t_type() %></span>
 <span>  <%=odto.getO_t_bank() %></span>
 <span> 계좌번호 </span>
    <time>입금기한설정</time>  
 <span> 입금 후 15분 내로 수강권한이 주어집니다  </span>
   <span> 결제 취소 버튼</span>
  
<%	
 }
%>



	<h3> <a href="./OrderList.or">뒤로가기</a> </h3>
	


</section>


 <jsp:include page="/include/footer.jsp"/> 
</body>
</html>