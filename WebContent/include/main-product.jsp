<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</head>
<body>
<%
List<LectureDTO> bestList = (List<LectureDTO>) request.getAttribute("bestList");
List<LectureDTO> newList = (List<LectureDTO>) request.getAttribute("newList");
List<LectureDTO> freeList = (List<LectureDTO>) request.getAttribute("freeList");

System.out.println("@@@@@@@@@@@@@@lectureList:"+bestList);
System.out.println("@@@@@@@@@@@@@@lectureList:"+newList);
System.out.println("@@@@@@@@@@@@@@lectureList:"+freeList);

%>
<script>
	$(document).ready(function(){
		checkwish();
		checkbasket();
		$(".addwish_btn").click(function(){//sss
			var num=$(this).parents(".card").attr("data-type");
			 $.ajax({
				 type: "POST",
		            url: "./WishListAdd.wi",
		            data: {
						"id":"${m_email}",  
						"num":num
		            },

		            success:function(data){
		            	checkwish();
		            },
		            error: function (data) {
		            	alert("등록 실패!");
		            }
		        });
		});//wishlist ajax동작
			
	$(".addbasket_btn").click(function(){//sss
		var num=$(this).parents(".card").attr("data-type");
		console.log(num);
		 $.ajax({
			 type: "POST",
	            url: "./BasketAdd.ba",
	            data: {
					"id":"${m_email}",  
					"num":num
	            },

	            success:function(data){
	            	checkbasket();
	            },
	            error: function (data) {
	            	alert("등록 실패!");
	            }
	        });
		});
	});//ready종료

	function checkwish(){
		$.ajax({
			type : "post",
			url : "./carts.ba?type=wish",
			data : {
				"id" :"${m_email}"    
			},
			dataType : "json",
	            success:function(data){
	            	//다지우고 처음으로
	            	$(".card").find(".fa-heart").addClass("fa-heart-o").removeClass("fa-heart");
	            	var data_num=new Array();
	            	for(i=0;i<data.length;i++){
	            		data_num[i]=""+data[i].wishdata.w_l_num;
	            	}
	            	//card수만큼 반복
	            	$(".card").each(function(e, element) {
	            		if(data_num.indexOf($(this).attr("data-type"))!=-1){
	            			$(element).find(".fa-heart-o").addClass("fa-heart").removeClass("fa-heart-o");
	            		}
	            	});
	            },
	            error: function (data) {
	            	alert("등록 실패!");
	            }
	        });
	}
	function checkbasket(){
		$.ajax({
			type : "post",
			url : "./carts.ba?type=basket",
			data : {
				"id" :"${m_email}"    
			},
			dataType : "json",
	            success:function(data){
	            	//다지우고 처음으로
	            	$(".card").find(".fa-shopping-cart").addClass("fa-cart-arrow-down").removeClass("fa-shopping-cart");
	            	var data_num=new Array();
	            	for(i=0;i<data.length;i++){
	            		data_num[i]=""+data[i].basketdata.b_l_num;
	            	}
	            	//card수만큼 반복
	            	$(".card").each(function(e, element) {
	            		if(data_num.indexOf($(this).attr("data-type"))!=-1){
	            			$(element).find(".fa-cart-arrow-down").addClass("fa-shopping-cart").removeClass("fa-cart-arrow-down");
	            		}
	            	});
	            },
	            error: function (data) {
	            	alert("등록 실패!");
	            }
	        });
	}
	

</script>

<article id="course">


<section id="lec">
<h1 class="title">베스트 강의</h1> 
<%
for(int i=0;i<bestList.size();i++){ 
	LectureDTO ldto = bestList.get(i);
%>
			
<div class="card" data-type="<%=ldto.getL_number()%>">
<a href="Detail.le?num=<%=ldto.getL_number() %>">
  <img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
    <h2><%=ldto.getL_title() %></h2>
</a>
	<p><%=ldto.getL_m_email() %></p> 
	<div class="card-in">
		<span class="fa fa-star checked"></span><!-- 찬하트 -->
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="far fa-star checked"></span><!--빈하트  -->
		<span class="review_cnt">(0)</span> 
		
		<span class="mg-l50">
		<a class="addwish_btn"><i class="fa fa-heart-o"></i></a>
		<a class="addbasket_btn"><i class="fas fa-cart-arrow-down"></i></a>
		</span>
	
	<div class="mg-t10">
		<span class="tags tag"><%=ldto.getL_type() %></span>
	
		<c:set var="price" value="<%=ldto.getL_price() %>"/>
		<span class="price">
		<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></span>
	</div>		

	</div>
</div>
<%} %>	

</section>


<!-- 프로덕트 카드 2번째줄 -->
<section id="lec">
<h1 class="title">새로운 강의</h1> 
<%
for(int i=0;i<newList.size();i++){ 
	LectureDTO ldto = newList.get(i);
%>
			
<div class="card" data-type="<%=ldto.getL_number()%>">
<a href="Detail.le?num=<%=ldto.getL_number() %>">
  <img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
    <h2><%=ldto.getL_title() %></h2>
</a>
	<p><%=ldto.getL_m_email() %></p> 
	<div class="card-in">
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="review_cnt">(0)</span> 
		
		<span class="mg-l50">
		<a class="addwish_btn"><i class="fa fa-heart-o"></i></a>
		<a class="addbasket_btn"><i class="fas fa-cart-arrow-down"></i></a>
		</span>
		
	<div class="mg-t10">
		<span class="tags tag"><%=ldto.getL_type() %></span>
	
		<c:set var="price" value="<%=ldto.getL_price() %>"/>
		<span class="price">
		<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></span>
	</div>		

	</div>
</div>
<%} %>	

</section>

<!-- 프로덕트 카드 3번째줄 -->
<section id="lec">
<h1 class="title">무료 강의</h1> 
<%
for(int i=0;i<freeList.size();i++){ 
	LectureDTO ldto = freeList.get(i);
%>
			
<div class="card" data-type="<%=ldto.getL_number()%>">
<a href="Detail.le?num=<%=ldto.getL_number() %>">
  <img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
    <h2><%=ldto.getL_title() %></h2>
</a>
	<p><%=ldto.getL_m_email() %></p> 
	<div class="card-in">
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="review_cnt">(0)</span> 
		
		<span class="mg-l50">
		<a class="addwish_btn"><i class="fa fa-heart-o"></i></a>
		<a class="addbasket_btn"><i class="fas fa-cart-arrow-down"></i></a>
		</span>
		
	<div class="mg-t10">
		<span class="tags tag"><%=ldto.getL_type() %></span>
	
		<c:set var="price" value="<%=ldto.getL_price() %>"/>
		<span class="price">
		<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></span>
	</div>		

	</div>
</div>
<%} %>	

</section>


</article>


</body>
</html>