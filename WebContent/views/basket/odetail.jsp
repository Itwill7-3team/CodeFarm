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

</head>
<style>
* {}
body {
    }

html {
    }
    
#jall{
	flex-grow: 1;
    margin: 0 auto;
    position: relative;
    width: auto;
    max-width: 1000px;

}

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
tbody {
	/* display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
    background-color: transparent; */
}
.detable tr {/* display: table-row;
    vertical-align: inherit;
    border-color: inherit; */}

    
.sacard {    
	/* background-color: #fff;
    box-shadow: 0 2px 3px rgba(0,10,18,.1), 0 0 0 1px rgba(0,10,18,.1);
    color: #454545;
    max-width: 100%;
    position: relative;
        box-sizing: inherit; */}
    
.sacard-content{
    padding: 1.5rem;
    background-color: transparent; }
    
.all1 {
	margin-left: -.75rem;
    margin-right: -.75rem;
    margin-top: -.75rem;
    padding: .5rem;
	display: flex;
	margin-bottom: .75rem;
	margin: 0;
	    }  

    
    }  
.all2 bb{
width: 41.66667%;
flex: none;
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
.detable th{}

 
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
	color: #363636;
   	border-width: 1px;

}
.canbtn:HOVER {
	border-color: #b5b5b5;
    color: #363636;
    
}
.text-info{color: #3298dc!important;}

.all1 {
	background-color: #fff;
	border-radius: 4px;
    color: #333;
    padding: 0;
    border-radius: .2rem;
    border-radius: 6px;
    box-shadow: 0 2px 3px rgba(0,10,18,.1), 0 0 0 1px rgba(0,10,18,.1);
    color: #454545;
    display: block;
    padding: 1.25rem;
 
}

.all2 aa {
	display: flex;
	width: 58.33333%;
	margin-bottom: .75rem;
	margin: 0;
	
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





	<section id = jall>
	
 	<%
	for(int i=0;i<orderDetailList.size();i++){
		OrderDTO orderDTO = (OrderDTO)orderDetailList.get(i); %> 
	
	<div class="saythx" >   
	  <h1>구매 상세 내역 <small> (주문 번호:  <%=orderDTO.getO_b_num() %> )</small></h1></div>
	  
	 <%} %> 
	 
	 
	 
	 <!--  -->
	<div class="all1"> 
 
	 <%
	  int total = 0;
	   for(int i=0;i<orderDetailList.size();i++){
		   OrderDTO odto = (OrderDTO)orderDetailList.get(i);
		   LectureDTO ldto = (LectureDTO)lectureList.get(i);
		   total += (odto.getO_sum_money());
	 %> 
		
	  
	   
	<!--[all2 aa] orderlist -->
	<div class="all2 aa">
	 <div class="all2 aa-a">
			<div class="all2 aa-img">
				<img class="image" src="./upload/<%=ldto.getL_img().split(",")[0]%>">
			</div>
			<div class="all2 aa-title">
				<a href="#"><%=ldto.getL_title()%></a>
				<p style="font-size: 12px;">
					<%=ldto.getL_m_email()%></p>
				<!-- basketDAO 추가 설정 -->
			</div> 
		</div>
		
 	<div class="all2 aa-price">
			<c:set var="price" value="<%=ldto.getL_price()%>" />
			<span style="text-align: center;"> <fmt:setLocale
					value="ko_KR" />
				<fmt:formatNumber type="currency" value="${price}" />
			</span>

		</div> 
	</div>
	
	
</div>  <!-- all1 -->	
	
	
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
			<th>주문 상태</th>
			<td><%=msg %></td>
		</tr>
		<tr>
			<th>주문 시각</th>
			<td><%=odto.getO_t_date() %></td>
		</tr>
		
		<tr>
			<th>결제 수단</th>
			<td><%=odto.getO_t_type() %></td>
		</tr>
		<tr>
			<th>은행명</th>
			<td><%=odto.getO_t_bank() %></td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td>0000</td>
		</tr>
		<tr>
			<th>입금기한</th>
			<td><%=odto.getO_t_b_reg_date() %></td>
		</tr>
		<tr>
		<td colspan="2"><span class="text-info">입금 후 15분내로 수강권한이 주어집니다.</span></td>
		</tr>
		<%	
		 }
	   
		%>
		<tr>
		<td colspan="2" style="border: none;"><button type="button" class="canbtn" style="width: 100%;"> 결제 취소 </button></td>
		</tr>
			</tbody>
		</table>




</div> <!-- total_amount_con -->
</div> <!-- sacard-content -->
</div> <!-- sacard -->
</div> <!-- all3 -->


			<!-- <h3> <a href="./OrderList.or">뒤로가기</a> </h3> -->
			<div class="saythx"><p>좋은 지식의 구매는 더 좋은 지식 창출을 위한 바탕으로 쓰입니다.<br>
		함께해 주셔서 감사합니다. 🙇🏻‍♀️🙇🏻‍♂️</p></div>


</section>






 <jsp:include page="/include/footer.jsp"/> 
</body>
</html>