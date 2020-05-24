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
 display: inline-block;
 }
 
.list-title{
font-family: 'NotoSansCJKkr-Bold';
font-size: 1.3em;
}


table {
margin-top: 1%;
border-collapse: collapse;
border-top: 1px solid #ff6d5a;;
width: 1000px;

}  

 th, td {
    
    padding: 15px;
  } 
  
aside.profile_aside .menu-list .is-active>a {
    background: none;
    color: #1dc078;
    font-weight: 700;
}
.profile_aside {
    display: inline-block;
    width: 15%;
    min-width: 230px;
    height: 900px;
    padding: 3em 0;
    vertical-align: top;
    /* border: 1px solid; */
}
.menu-list a {
    border-radius: 2px;
    color: #454545;
    display: block;
    padding: .5em .75em;
}
.Owrap{
    width: 70%;
    margin: 0 auto;
    display: flex;
    min-height: 500px;
}

@media screen and (max-width: 1085px) {

	/* 모바일   */
	.profile_aside{
	display: none !important;
	}
	
}

@media screen and (max-width: 1360px) {
	

	.profile_aside>ul{
	padding: 0 0 0 1em;
	}
	.Owrap{
	width: 100% !important;
	}
	#alll{
	margin: 4em 1em !important;
	}
}
@font-face{
	font-family: 'NotoSansCJKkr-Regular';
	src: url(./fonts/NotoSansCJKkr-Regular.otf) format('truetype')
	}
@font-face{
	font-family: 'NotoSansCJKkr-Light';
	src: url(./fonts/NotoSansCJKkr-Light.otf) format('truetype')
	}
@font-face{
	font-family: 'NotoSansCJKkr-Bold';
	src: url(./fonts/NotoSansCJKkr-Bold.otf) format('truetype')
	}

</style>
</head>
<body>
<div class="Owrap">
<!-- aside 영역 -->
<jsp:include page="/include/dash-aside.jsp"/>
<!-- aside 영역 -->   

	<%
	  ArrayList orderList 
	    = (ArrayList) request.getAttribute("orderList");
	
	%>
	<section id="alll" >
	<span class="list-title"> 내 구매 내역 </span>
	
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
		<fmt:formatNumber type="currency" value="${total}" /></td>
	    
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
</div>
<jsp:include page="/include/footer.jsp"/>


</body>
</html>