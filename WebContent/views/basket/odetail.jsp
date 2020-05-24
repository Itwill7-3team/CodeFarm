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
<link href="./css/odetail.css" rel="stylesheet">
</head>
<style>
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


<body>
 <jsp:include page="/include/header.jsp"/>
<main id="mainee">

	<%
	List orderDetailList = (List)request.getAttribute("orderDetailList");
	List lectureList = (List)request.getAttribute("lectureList");
	MemberDTO MemberDTO =(MemberDTO) request.getAttribute("memberDTO");

    System.out.println("%%%$##$$$정보:"+orderDetailList+lectureList);
	%>





	<section id ="allle">
	<div class="all1"> <!-- container -->
 	<%
		OrderDTO orderDTO = (OrderDTO)orderDetailList.get(0);{ %> 
	
	<div class="saythx" >   
	  <h1>구매 상세 내역 <small style="font-size: 12px;"> (주문 번호:  <%=orderDTO.getO_b_num() %> )</small></h1></div>
	  
	
	 
	     
	 
	 <!--  -->
	<!--[all2 aa] orderlist -->
 <!-- <div class="all2 aa">  column is-7 -->
	 <div class="Ocolumns" > <!-- columns --> 
	 <%
	  int total = 0;
	   for(int i=0;i<orderDetailList.size();i++){
		   OrderDTO odto = (OrderDTO)orderDetailList.get(i);
		   LectureDTO ldto = (LectureDTO)lectureList.get(i);
		   total += (odto.getO_sum_money());
	 %> 
	 	<div class="boxx1" style=" display: inline-block;" > <!-- box product_item_list -->
			<div class="clearfix" >
				<div class="column menu" >
				<img class="img" style="float: left;" src="./upload/<%=ldto.getL_img().split(",")[0]%>">
			</div>
			
			<div class="column content" >
				<a href="Detail.le?num=<%=ldto.getL_number() %>"><%=ldto.getL_title()%></a>
				<p style="font-size: 12px;">
					<%=ldto.getL_m_email()%></p>
				<!-- basketDAO 추가 설정 -->
			</div> 
			 
		<!--  style="clear: both;" -->
 	<div class="amount">
			<c:set var="price" value="<%=ldto.getL_price()%>" />
			<span style="text-align: center;"> <fmt:setLocale
					value="ko_KR" />
				<fmt:formatNumber type="currency" value="${price}" />
			</span>
		</div>
		</div> 
	 
	</div>
	
	<%} %>
	
	</div> <!-- box product_item_list -->
	

	
	
	<div class="all2-bb">	 
	<div class="sacard">  
	<div class="sacard-content" >
	<div class="total_amount_con">
			<div class="total_a">
	 			<c:set var="total" value="<%=total%>" />
			 	<h2 style="font-size: 1.3rem; margin: 0;  color: #454545;">
			 	총 주문금액 
			 	<span style="float: right;"><fmt:setLocale value="ko_KR"/>
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
		<td colspan="2" style="border: none;"><button type="button" class="canbtn"
		onclick="canbtnfunction()"> 결제 취소 </button></td>
<%-- 		onclick="location.href='./OrderDelete.or?trade_num=<%=orderDTO.getO_b_num()%>'"> 결제 취소 </button></td> --%>
		</tr>
			</tbody>
		</table>




</div> <!-- total_amount_con -->
</div> <!-- sacard-content -->
</div> <!-- sacard -->

 <%} %> 
 </div> <!-- all bb -->
</div> <!-- columns -->
			<!-- <h3> <a href="./OrderList.or">뒤로가기</a> </h3> -->
			<div class="saythx"><p style="padding-top: 3%;">좋은 지식의 구매는 더 좋은 지식 창출을 위한 바탕으로 쓰입니다.<br>
		함께해 주셔서 감사합니다. 🙇🏻‍♀️🙇🏻‍♂️</p></div>


</section>

</main>


<section class="apply_section">
 <div class="apply_wrapper">
	<div class="apply_card">
		<div class="apply_title">
			지식공유자 되기
		</div>
		<div class="apply_desc">
			많은 사람들에게 배움의 기회를 주고,
			<br>
			경제적 보상을 받아보세요
		</div>
		<a class="apply_btn" href="#">지식공유참여</a>
	</div>

	<div class="apply_card">
		<div class="apply_title">
			기업 교육을 위한 코딩팜
		</div>
		<div class="apply_desc">
			"코딩팜 비즈니스"를 통해 모든 팀원이
			코딩팜의 강의들을
			<br>
			자유롭게 학습하는 환경을 제공하세요!
		</div>
		<a class="apply_btn" href="#">코딩팜 비즈니스</a>
	</div>
 </div>
</section>

<script type="text/javascript">

 function canbtnfunction() {
	if(confirm("구매를 취소하시겠습니까?") == true){
		location.href="./OrderDelete.or?trade_num=<%=orderDTO.getO_b_num()%>";
	}else{
		return;
	}
}

</script>




 <jsp:include page="/include/footer.jsp"/> 
</body>
</html>