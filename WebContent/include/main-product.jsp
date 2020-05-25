<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.db.BlogDTO"%>
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
ArrayList<LectureDTO> bestList = (ArrayList<LectureDTO>)request.getAttribute("bestList");
ArrayList<Double> beststarList=(ArrayList<Double>) request.getAttribute("beststarList");
ArrayList<Integer> beststarCount=(ArrayList<Integer>) request.getAttribute("beststarCount");
ArrayList<LectureDTO> freeList = (ArrayList<LectureDTO>) request.getAttribute("freeList");
ArrayList<Double> freestarList=(ArrayList<Double>) request.getAttribute("freestarList");
ArrayList<Integer> freestarCount=(ArrayList<Integer>) request.getAttribute("freestarCount");
ArrayList<LectureDTO> newList = (ArrayList<LectureDTO>) request.getAttribute("newList");
ArrayList<Double> newstarList=(ArrayList<Double>) request.getAttribute("newstarList");
ArrayList<Integer> newstarCount=(ArrayList<Integer>) request.getAttribute("newstarCount");
ArrayList<BlogDTO> blogList = (ArrayList<BlogDTO>) request.getAttribute("blogList");


System.out.println("@@@ best lectureList:"+bestList);
System.out.println("@@@ new lectureList:"+newList);
System.out.println("@@@ free lectureList:"+freeList);
System.out.println("@@@ blog List:"+blogList);

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
		<div class="rating_star">
					<div class="star_solid" style="width: <%-- <%=beststarList.get(i)*20 %> --%>%">
					<i class="fa fa-star" data-value="1" aria-hidden="true"></i><i class="fa fa-star" data-value="2" aria-hidden="true"></i><i class="fa fa-star" data-value="3" aria-hidden="true"></i><i class="fa fa-star" data-value="4" aria-hidden="true"></i><i class="fa fa-star" data-value="5" aria-hidden="true"></i>
					</div>
					<i class="far fa-star" data-value="5" aria-hidden="true"></i><i class="far fa-star" data-value="4" aria-hidden="true"></i><i class="far fa-star" data-value="3" aria-hidden="true"></i><i class="far fa-star" data-value="2" aria-hidden="true"></i><i class="far fa-star" data-value="1" aria-hidden="true"></i>
					</div>
		<span class="review_cnt">(<%=beststarCount.get(i)%>)</span> 
		
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
		<div class="rating_star">
					<div class="star_solid" style="width: <%=newstarList.get(i)*20 %>%">
					<i class="fa fa-star" data-value="1" aria-hidden="true"></i><i class="fa fa-star" data-value="2" aria-hidden="true"></i><i class="fa fa-star" data-value="3" aria-hidden="true"></i><i class="fa fa-star" data-value="4" aria-hidden="true"></i><i class="fa fa-star" data-value="5" aria-hidden="true"></i>
					</div>
					<i class="far fa-star" data-value="5" aria-hidden="true"></i><i class="far fa-star" data-value="4" aria-hidden="true"></i><i class="far fa-star" data-value="3" aria-hidden="true"></i><i class="far fa-star" data-value="2" aria-hidden="true"></i><i class="far fa-star" data-value="1" aria-hidden="true"></i>
					</div>
		<span class="review_cnt">(<%=newstarCount.get(i)%>)</span> 
		
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
		<div class="rating_star">
					<div class="star_solid" style="width: <%=freestarList.get(i)*20 %>%">
					<i class="fa fa-star" data-value="1" aria-hidden="true"></i><i class="fa fa-star" data-value="2" aria-hidden="true"></i><i class="fa fa-star" data-value="3" aria-hidden="true"></i><i class="fa fa-star" data-value="4" aria-hidden="true"></i><i class="fa fa-star" data-value="5" aria-hidden="true"></i>
					</div>
					<i class="far fa-star" data-value="5" aria-hidden="true"></i><i class="far fa-star" data-value="4" aria-hidden="true"></i><i class="far fa-star" data-value="3" aria-hidden="true"></i><i class="far fa-star" data-value="2" aria-hidden="true"></i><i class="far fa-star" data-value="1" aria-hidden="true"></i>
					</div>
		<span class="review_cnt">(<%=freestarCount.get(i)%>)</span> 
		
		<span class="mg-l50">
		<a class="addwish_btn"><i class="fa fa-heart-o"></i></a>
		<a class="addbasket_btn"><i class="fas fa-cart-arrow-down"></i></a>
		</span>
		
	<div class="mg-t10">
		<span class="tags tag"><%=ldto.getL_type() %></span>
		<c:set var="price" value="<%=ldto.getL_price() %>"/>
		<span class="price">
	<%
	if(ldto.getL_price()==0){
	%>
	무료
	<%
	}else{
	%>
		<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" />
	<%
	}
	%>
	</span>
	</div>		

	</div>
</div>
<%} %>	

</section>


<!-- 컨텐츠 -->


<section id="more">
<h1 class="title">관심사</h1> 
<!-- <a href="#">&#10095;</a> -->
<div class="interest">
<a href="#">  <img src="./img/main-img/ic1.png" alt="웹개발" > </a>
<a href="#">  <img src="./img/main-img/ic2.png" alt="앱개발" > </a>
<a href="#">  <img src="./img/main-img/ic3.png" alt="통계" > </a>
<a href="#">  <img src="./img/main-img/ic4.png" alt="엑셀" > </a>
<a href="#">  <img src="./img/main-img/ic5.png" alt="게임" > </a>
<a href="#">  <img src="./img/main-img/ic6.png" alt="리액트" > </a>
<a href="#">  <img src="./img/main-img/ic7.png" alt="보안" > </a>
<a href="#">  <img src="./img/main-img/ic8.png" alt="자바" > </a>
<a href="#">  <img src="./img/main-img/ic9.png" alt="알고리즘" > </a>
<a href="#">  <img src="./img/main-img/ic10.png" alt="수학" > </a>
<a href="#">  <img src="./img/main-img/ic11.png" alt="파이썬" > </a>
<a href="#">  <img src="./img/main-img/ic12.png" alt="자바스크립트" > </a>
<a href="#">  <img src="./img/main-img/ic13.png" alt="더보기" > </a>
</div>


</section>


<section id="blg">
<h1 class="title">읽어보기</h1> 

<div class="Bwrap">
<%
for(int i=0;i<blogList.size();i++){ 
	BlogDTO bdto = blogList.get(i);
%>

<div class="card-c">
<a href="blogContent.bl?num=<%=bdto.getB_num()%>&pageNum=1">
  <img src="./upload/<%=bdto.getB_img() %>" alt="" style="width:100%">
    <h2><%=bdto.getB_title() %></h2>
</a>
  	<div class="text-in">
		<p>
		<%=bdto.getB_content() %>
		</p>  
	</div>
</div>
<%} %>
</div>
</section>


</article>


</body>
</html>