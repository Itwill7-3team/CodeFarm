<%@page import="com.member.db.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.review.db.ReviewDTO"%>
<%@page import="java.util.Map"%>
<%@page import="com.basket.db.BasketDTO"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>
<link href="./css/course1.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<%
/* 
m_id = "test"; */
request.setCharacterEncoding("UTF-8");
List<LectureDTO> lectureList = (List<LectureDTO>) request.getAttribute("lectureList");
List<BasketDTO> basketList = (List<BasketDTO>) request.getAttribute("basketList");
ArrayList<Double> starList= (ArrayList<Double>)request.getAttribute("starList");
ArrayList<Integer> starCount=(ArrayList<Integer>)request.getAttribute("starCount");
/* ArrayList<String> memberList=(ArrayList<String>)request.getAttribute("memberList"); */

String m_email = (String)session.getAttribute("m_email");
String item = "seq";
String s = "";
String t1 = "";
String t2 = "";
String view = "card";

if(request.getParameter("item") != null){
	item = request.getParameter("item");
}
if(request.getParameter("s") != null){
	s = request.getParameter("s"); 
}
if(request.getParameter("t1") != null){
	t1 = request.getParameter("t1"); 
}
if(request.getParameter("t2") != null){
	t2 = request.getParameter("t2"); 
}
if(request.getParameter("view") != null){
	view = request.getParameter("view");
}

/* String pageNum = (String)request.getAttribute("pageNum");
int count = (int)request.getAttribute("count");
int pageCount = ((Integer)(request.getAttribute("pageCount"))).intValue();
int pageBlock = (Integer)(request.getAttribute("pageBlock"));
int startPage = (Integer)(request.getAttribute("startPage"));
int endPage = (Integer)(request.getAttribute("endPage")); */
%>

	<div id="root">
		<jsp:include page="/include/header.jsp"/>	
		<main id="main">
			<div class="container">
	
				<div class="columns">	
				<aside class="column sidebar_left">

					<nav class="accordions accordion_category">
						<div class="accordion">
							<button class="accordion_header">IT 프로그래밍</button>
								<div class="panel">
									<a href="./Search.le?t1=it-programming" class="accordion_content"> ALL </a>
									<a href="./Search.le?t1=it-programming&t2=web-dev" class="accordion_content"> 웹개발 </a>
									<a href="./Search.le?t1=it-programming&t2=mobile-app" class="accordion_content"> 모바일 앱 </a> 
									<a href="./Search.le?t1=it-programming&t2=game-dev" class="accordion_content"> 게임 개발 </a>
									<a href="./Search.le?t1=it-programming&t2=data-science" class="accordion_content"> 데이터 사이언스 </a>
									<a href="./Search.le?t1=it-programming&t2=security" class="accordion_content"> 보안 </a> 
									<a href="./Search.le?t1=it-programming&t2=artificial-intelligence" class="accordion_content"> 인공지능 </a> 
									<a href="./Search.le?t1=it-programming&t2=algorithm" class="accordion_content"> 알고리즘 </a> 
									<a href="./Search.le?t1=it-programming&t2=culture" class="accordion_content"> 교양 </a> 
									<a href="./Search.le?t1=it-programming&t2=math" class="accordion_content"> 수학 </a> 
									<a href="./Search.le?t1=it-programming&t2=server-dev" class="accordion_content"> 서버 </a> 
									<a href="./Search.le?t1=it-programming&t2=automation" class="accordion_content"> 자동화 </a> 
									<a href="./Search.le?t1=it-programming&t2=database-dev" class="accordion_content"> 데이터베이스 </a> 
									<a href="./Search.le?t1=it-programming&t2=programming-tool" class="accordion_content"> 개발도구 </a> 
									<a href="./Search.le?t1=it-programming&t2=framework-library" class="accordion_content"> 프레임워크 및 라이브러리 </a> 
									<a href="./Search.le?t1=it-programming&t2=programming-lang" class="accordion_content"> 프로그래밍 언어 </a> 
									<a href="./Search.le?t1=it-programming&t2=service-dev" class="accordion_content"> 서비스 개발 </a> 
									<a href="./Search.le?t1=it-programming&t2=infra" class="accordion_content"> 인프라 </a> 
									<a href="./Search.le?t1=it-programming&t2=iot" class="accordion_content"> 사물인터넷 </a> 
									<a href="./Search.le?t1=it-programming&t2=blockchain" class="accordion_content"> 블록체인 </a>
								</div>
						</div><!-- IT 아코디언 -->

						<div class="accordion">
							<button class="accordion_header">크리에이티브</button>
								<div class="panel">
									<a href="./Search.le?t1=creative" class="accordion_content"> ALL </a>
									<a href="./Search.le?t1=creative&t2=3d_modeling" class="accordion_content"> 3D 모델링 </a> 
									<a href="./Search.le?t1=it-programming&t2=graphic-design" class="accordion_content"> 그래픽 디자인 </a> 
									<a href="./Search.le?t1=it-programming&t2=youtube" class="accordion_content"> 영상 편집, 유튜브 </a> 
									<a href="./Search.le?t1=it-programming&t2=movie-graphic" class="accordion_content"> 영화 그래픽 </a> 
									<a href="./Search.le?t1=it-programming&t2=webapp-design" class="accordion_content"> 웹앱 디자인 </a> 
									<a href="./Search.le?t1=it-programming&t2=game-design" class="accordion_content"> 게임 디자인 </a> 
									<a href="./Search.le?t1=it-programming&t2=ux-ui" class="accordion_content"> UX/UI </a> 
									<a href="./Search.le?t1=it-programming&t2=sound" class="accordion_content"> Sound </a> 
									<a href="./Search.le?t1=it-programming&t2=ar-vr" class="accordion_content"> AR/VR </a>
								</div>
						</div><!-- 크리에이티브 아코디언 -->

						<div class="accordion">
							<button class="accordion_header">업무 스킬</button>
								<div class="panel">
									<a href="./Search.le?t1=business" class="accordion_content"> ALL </a> 
									<a href="./Search.le?t1=business&t2=office" class="accordion_content"> MS-OFFICE </a> 
									<a href="./Search.le?t1=it-programming&t2=marketing" class="accordion_content"> 마케팅 </a> 
									<a href="./Search.le?t1=it-programming&t2=finance" class="accordion_content"> 금융, 주식, 투자 </a> 
									<a href="./Search.le?t1=it-programming&t2=data-analysis" class="accordion_content"> 데이터 분석 </a> 
									<a href="./Search.le?t1=it-programming&t2=task-automation" class="accordion_content"> 업무 자동화 </a> 
									<a href="./Search.le?t1=it-programming&t2=accounting" class="accordion_content"> 회계, 재무 </a> 
									<a href="./Search.le?t1=it-programming&t2=management" class="accordion_content"> 경영지식 </a> 
									<a href="./Search.le?t1=it-programming&t2=project-manage" class="accordion_content"> 기획 프로젝트 관리 </a> 
									<a href="./Search.le?t1=it-programming&t2=writing" class="accordion_content"> 글쓰기 </a> 
									<a href="./Search.le?t1=it-programming&t2=self-dev" class="accordion_content"> 자기 계발 </a> 
									<a href="./Search.le?t1=it-programming&t2=foreign-language"class="accordion_content"> 외국어 </a>
								</div>
						</div><!-- 업무스킬 아코디언 -->
					</nav><!-- accordion_category -->
				</aside><!-- sidebar_left -->
				
				<div class="column courses_body">
				
					<header class="courses_header">
						<div class="search">
							<input type="text" class="input" placeholder="강의 검색하기" value="">
							<button type="button" class="button search_button" >검색</button>
						</div><!-- search -->					
					</header><!-- courses_header -->	

					<main id="courses_main">
						<nav class="breadcrumb">
							<ul>
								<li><a href="./Search.le" class="category_link">전체</a></li>
							</ul>
							<!--<button></button> für sidebar_left?? -->
							<div class="buttons select_view_button">
								<button class="button switcher is-selected <%if(view.equals("card")) out.print("is-link"); %>"data-type="card" id="card-view"><i class="fas fa-th"></i></button>
								<button class="button switcher <%if(view.equals("list")) out.print("is-link"); %>" data-type="list" id="list-view"><i class="fas fa-list"></i></button>
							</div>
							<div class="select courses_order_selector">
								<select id="courses_order_select" name="order_select">
									<%-- <c:forEach var="item" items="${PagingDTO.item()}" begin="0" end="5" step="1"> 
										<option value="">${item}</option>
									</c:forEach>
										<option value="<c:out value="${item}" />">
												<c:out value="${item}" /></option> --%>
									<option value="seq" id="seq" selected>추천순</option>
									<option value="popular" id="popular" <%if(item.equals("popular")) out.print("selected"); %>>인기순</option>
									<option value="recent" id="recent"<%if(item.equals("recent")) out.print("selected"); %>>최신순</option>
									<option value="rating" id="rating"<%if(item.equals("rating")) out.print("selected"); %>>평점순</option>
									<option value="famous" id="famous"<%if(item.equals("famous")) out.print("selected"); %>>학생수순</option>
								</select>
							</div>
						</nav><!-- breadcrumb -->
						<!-- <div class="courses_skills"></div>courses_skill 구현 가능성?? -->
						<div class="courses_container">
							<div class="columns<%if(view.equals("card")) {out.print(" is-multiline course_card_item type-card");}else{out.print("type-list");}; %>">
								
<%
for(int i=0;i<lectureList.size();i++){ 
	LectureDTO ldto = lectureList.get(i);
	
	if(view.equals("card")){
	
	
%>
								
								<div class="column flip-card is-4-tablet is-desktop">
									<div class="card course flip-card-inner">
										<a class="flip-card-front" href='Detail.le?num=<%=ldto.getL_number()%>'>
											<div class="card_image">
												<figure class="image is_tumbnail">
													<img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
												</figure>
											</div>
											<div class="card_content">
												<div class= "l_m_id" style="display: none;"><%=ldto.getL_m_email() %></div>
												<div class= "l_number" style="display: none;"<%--  data-type="<%=ldto.getL_number() %>" --%>><%=ldto.getL_number() %></div>
												<div class= "l_reg_date" style="display:none;"><%=ldto.getL_reg_date()%></div>
												<div class="course_title"><%=ldto.getL_title() %></div>
												<div class="course_instructor">Instructor</div>
												<!-- <div class="course_data columns is-multiline"> -->
													<div class="rating">
														<div class="star_solid" style="width: <%=starList.get(i)*20 %>%">
															<c:forEach step="1" begin="1" end="5" var="i">
															<i class="fa fa-star" data-value="${i}" aria-hidden="true"></i>
															</c:forEach>
														</div>
															<c:forEach step="1" begin="1" end="5" var="i">
															<i class="far fa-star" data-value="${6-i}" aria-hidden="true"></i>
															</c:forEach>
														<span class="review_cnt"> (<%= starCount.get(i) %>개의 수강평) </span> 
													</div>
													 <c:set var="price" value="<%=ldto.getL_price() %>"/>
													<div class="course_price"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></div>
													<div class="tags">
														<span class="tag" style="background-color:hsl(155,40%,87%)">베스트셀러</span>
														<span class="tag" style="background-color: hsl(321,63%,90%);">할인중</span>
														<span class="tag" style="background-color: hsl(182,75%,94%);">신규강의</span>
													</div>
												<!-- </div> --><!-- course_data -->
											</div>
										</a>
										<div class="flip-card-back course_card_back" >
											<a href="Detail.le?num=<%=ldto.getL_number()%>">
												<p class="course_title"><%=ldto.getL_title() %></p>
												<p class="course_decription"><%=ldto.getL_description() %></p>
												<div class="back_course_data">
													<div class="course_level">
														<span>
															<i class="fas fa-shoe-prints"></i>
															<%=ldto.getL_level() %>
														</span>
													</div>
													<div class="course_category">
														<span>
															<i class="fab fa-accusoft"></i>
															<%=ldto.getL_type() %>
														</span>
													</div>
													<div class="course_skills">
														<span>
															<i class="fas fa-file-import"></i>
															 알고리즘, 개발자취업, 코딩 테스트
														</span>
													</div>
												</div>
											</a>
											<div class="card_action_btn">
												<div class="tooltip add_cart">
													<i class="fas fa-cart-arrow-down fa-lg" data-type="<%=ldto.getL_number() %>"></i>
													<span class="tooltiptext">바구니에 추가</span>
												</div>
												<div class="tooltip add_wishlist">
													<i class="fas fa-heartbeat fa-lg" data-type="<%=ldto.getL_number() %>"></i>
													<span class="tooltiptext">위시리스트에 추가</span>
												</div>
											</div>
										</div>
									</div>
								</div>
<%
}else{
%>							
								<div class="course-list-body list-action">
									<div class="box coures-list-item">
										<a href="#"class="image-left">
											<figure class="image is_tumbnail">
												<img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
											</figure>
										</a>
										<div class="content-container">
											<a href=""class="course-info">
												<h2 href="#" class="course-title"><%=ldto.getL_title() %></h2>
												<div class="tags">
													<span class="tag" style="background-color:hsl(155,40%,87%)">베스트셀러</span>
													<span class="tag" style="background-color: hsl(321,63%,90%);">할인중</span>
													<span class="tag" style="background-color: hsl(182,75%,94%);">신규강의</span>
												</div>
												<div class="rating">
													<div class="rating">
														<div class="star_solid" style="width: <%=starList.get(i)*20 %>%">
															<c:forEach step="1" begin="1" end="5" var="i">
															<i class="fa fa-star" data-value="${i}" aria-hidden="true"></i>
															</c:forEach>
														</div>
															<c:forEach step="1" begin="1" end="5" var="i">
															<i class="far fa-star" data-value="${6-i}" aria-hidden="true"></i>
															</c:forEach>
													<span class="review_cnt"> (<%= starCount.get(i) %>개의 수강평) </span>
													</div>
												</div>
											</a>
											<div class="course-price">
												<div class="product-amount">
													<c:set var="price" value="<%=ldto.getL_price() %>"/>
													<span class="course-price-kr"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></span>
												</div>
												<div class="cart-btn-container">
													<div class="cart-btn-controller">
														<div class="tooltip add_cart">
															<i class="fas fa-cart-arrow-down fa-lg" data-type="<%=ldto.getL_number() %>"></i>
															<span class="tooltiptext">바구니에 추가</span>
														</div>
														<div class="tooltip add_wishlist">
															<i class="fas fa-heartbeat fa-lg" data-type="<%=ldto.getL_number() %>"></i>
															<span class="tooltiptext">위시리스트에 추가</span>
														</div>
													</div>
												</div>
											</div>
										</div><!--content-container  -->
									</div><!-- course-list-item -->
								</div><!-- course-list-body -->
<%

 	}
} 
%>								
								
							</div><!-- course-card-item -->
						</div><!-- courses_ container-->
					</main><!-- course_main -->
					
					<footer class="courses_footer">
						<nav class="pagination_list">
						<jsp:include page="/include/paging.jsp">
							<jsp:param value="${paging.page}" name="page"/>
							<jsp:param value="${paging.beginPage}" name="beginPage"/>
							<jsp:param value="${paging.endPage}" name="endPage"/>
							<jsp:param value="${paging.prev}" name="prev"/>
							<jsp:param value="${paging.next}" name="next"/>
						</jsp:include>
						</nav><!-- pagination_list -->
					</footer><!--courses_footer  -->
					
				</div><!-- course_body -->
				</div><!-- columns -->
			</div><!-- container -->
		</main><!-- main -->
	</div> <!-- root -->
	


<!-- accordion -->
<script>
var acc = document.getElementsByClassName("accordion_header");
var i;
for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>
<!-- selectBox -->
<script>
$(function(){
	
	$("div.list-action .box.coures-list-item:first").css("border-top","none")

	function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

	
	
	$("#courses_order_select").change(
		function() {
			var orderSelect1 = $("#courses_order_select option:selected").val();
			var t1 = getParameterByName('t1');
			var t2 = getParameterByName('t2');
			
					/* alert(orderSelect1); */
				if (orderSelect1 == "seq") {
						location.href = "./Search.le?t1="+t1+"&t2="+t2+"&item=seq";
				} else if (orderSelect1 == "popular") {
						location.href = "./Search.le?t1="+t1+"&t2="+t2+"&item=popular";
				} else if (orderSelect1 == "recent") {
						location.href = "./Search.le?t1="+t1+"&t2="+t2+"&item=recent";
				} else if (orderSelect1 == "rating") {
						location.href = "./Search.le?t1="+t1+"&t2="+t2+"&item=rating";
				} else if (orderSelect1 == "famous") {
						location.href = "./Search.le?t1="+t1+"&t2="+t2+"&item=famous";
				}
		});
/* 	$("#courses_order_select > option[value="+'<c:out value="${ param.item }"/>'+"]").attr("selected","selected"); */
/* $("#courses_order_select>option[value="+'<c:out value="${ param.item }"/>'+"]").attr("selected","selected"); */
// 이 구문에 대한 검사 필요(이 구문을 사용하지 않을 시 select 오류가 발생)!!!!!!!!!!!!
/* selectBox */
/* search */
	$(".search_button").on("click",function(){
		alert($(".input").val());
		var search = $(".input").val();
		var orderSelect1 = $("#courses_order_select option:selected").val();
		var t1 = getParameterByName('t1');
		var t2 = getParameterByName('t2');
		var view = getParameterByName('view');
		var page = getParameterByName('page');
		/* var itime = getParameterByName('item');
		
		if(item == null){
			alert("확인"+item);
		} select 구문에 사용*/
		
		location.href = "./Search.le?t1="+t1+"&t2="+t2+"&item="+orderSelect1+"&view="+view+"&page="+page+"&s="+search;
	});
/* search */

/* 장바구니 아쟉스 */
	$(".flip-card").mouseover(function(){
		
		var m_email = "${m_email}";
		var l_number = $(this).find("i.fa-cart-arrow-down").attr('data-type'); 
		
		/* console.log("정보 확인1 : "+m_email+" 2 : "+l_number); */
		
		$.ajax({
			url : "./JqBasket.ba",
			type : "POST",
			data : {
				"m_email" : m_email,
				"l_number" : l_number
			},
			datatype : "json",
			success : function(check){
				if(check == 0){
					$("i.fa-cart-arrow-down[data-type="+l_number+"]").css('color','white');
				}else if(check == 1){
					$("i.fa-cart-arrow-down[data-type="+l_number+"]").css('color','#0000ff');
				}
			},error : function(xhr, error, code) {
				alert("시스템 오류입니다.");
			}
		});
	});
	$(".list-action").mouseover(function(){
		
		var m_email = "${m_email}";
		var l_number = $(this).find("i.fa-cart-arrow-down").attr('data-type'); 
		
		/* console.log("정보 확인1 : "+m_email+" 2 : "+l_number); */
		
		$.ajax({
			url : "./JqBasket.ba",
			type : "POST",
			data : {
				"m_email" : m_email,
				"l_number" : l_number
			},
			datatype : "json",
			success : function(check){
				if(check == 0){
					/* $("i.fa-cart-arrow-down[data-type="+l_number+"]").css('color','#fda011'); */
				}else if(check == 1){
					$("i.fa-cart-arrow-down[data-type="+l_number+"]").css('color','white');
				}
			},error : function(xhr, error, code) {
				alert("시스템 오류입니다.");
			}
		});
	});

	
	$("i.fa-cart-arrow-down").click(function(){
		var m_email = "${m_email}";
		var l_number = $(this).attr('data-type'); 
		
		if(m_email == ""){
			$(".login_btn").trigger("click");
		}else{
			
			console.log("정보 확인1 : "+m_email+" 2 : "+l_number);
			$(this).each(function(){
				console.log("정보"+l_number);
		
			/* $("div #num").text(data.num) */
			/* var l_m_id = $(".l_m_id").attr("data-type"); */
			<%-- var m_id = '<%=session.getAttribute("m_id") %>'; --%>
			/* var m_id = '${m_id}'; */
			/* var l_number = "aaa"; */
				$.ajax({
					url : "./JqBasketController.ba",
					type : "POST",
					data : {
						"m_email" : m_email,
						"l_number" : l_number
					},
					datatype : "json",
					success : function(check){
						if(check == 1){
						//$(".fa-cart-arrow-down.none").css('color','#0000ff');
						/* $(".fa-cart-arrow-down").css('color','#0000ff'); */
						/* $("i.fa-cart-arrow-down").each(function(){$(this).css('color','#0000ff');}); */
						$("i.fa-cart-arrow-down[data-type="+l_number+"]").css('color','#0000ff');
						/* l_number.css('color','#0000ff'); */
						}else if(check == 0){
						$("i.fa-cart-arrow-down[data-type="+l_number+"]").css('color','white');
						}
				
						/* $(this).css({"background-image":"url('icons/u.png')"}); */
						console.log("확인"+l_number);
					},error : function(xhr, error, code) {
						alert("시스템 오류입니다.");
					}
				});
			});
		}/* else */	
	});
/* 장바구니 아쟉스 */
	
	
/* 위시리스트 아쟉스 */
	$(".flip-card-inner").mouseover(function(){
		
		var m_email = "${m_email}";
		var l_number = $(this).find("i.fa-heartbeat").attr('data-type'); 
		
		/* console.log("정보 확인3 : "+m_email+" 4 : "+l_number); */
		
		$.ajax({
			url : "./JqWishlist.wi",
			type : "POST",
			data : {
				"m_email" : m_email,
				"l_number" : l_number
			},
			datatype : "json",
			success : function(check){
				if(check == 0){
					$("i.fa-heartbeat[data-type="+l_number+"]").css('color','white');
				}else if(check == 1){
					$("i.fa-heartbeat[data-type="+l_number+"]").css('color','red');
				}
			},error : function(xhr, error, code) {
				alert("시스템 오류입니다.");
			}
		});
	});
	$(".coures-list-item").mouseover(function(){
		
		var m_email = "${m_email}";
		var l_number = $(this).find("i.fa-heartbeat").attr('data-type'); 
		
		/* console.log("정보 확인3 : "+m_email+" 4 : "+l_number); */
		
		$.ajax({
			url : "./JqWishlist.wi",
			type : "POST",
			data : {
				"m_email" : m_email,
				"l_number" : l_number
			},
			datatype : "json",
			success : function(check){
				if(check == 0){
					/* $("i.fa-heartbeat[data-type="+l_number+"]").css('color','#fda011'); */
				}else if(check == 1){
					$("i.fa-heartbeat[data-type="+l_number+"]").css('color','white');
				}
			},error : function(xhr, error, code) {
				alert("시스템 오류입니다.");
			}
		});
	});

	$("i.fa-heartbeat").click(function(){
		var m_email = "${m_email}";
		var l_number = $(this).attr('data-type'); 
		
		if(m_email == ""){
			$(".login_btn").trigger("click");
		}else{
			
			console.log("정보 확인1 : "+m_email+" 2 : "+l_number);
			$(this).each(function(){
				console.log("정보"+l_number);
		
				$.ajax({
					url : "./JqWishlistController.wi",
					type : "POST",
					data : {
						"m_email" : m_email,
						"l_number" : l_number
					},
					datatype : "json",
					success : function(check){
						if(check == 1){
						$("i.fa-heartbeat[data-type="+l_number+"]").css('color','red');
						}else if(check == 0){
						$("i.fa-heartbeat[data-type="+l_number+"]").css('color','white');
						}
				
						console.log("확인"+l_number);
					},error : function(xhr, error, code) {
						alert("시스템 오류입니다.");
					}
				});
			});
		}
	});
/* 위시리스트 아쟉스 */

/* view switcher */
 	$("button.switcher").bind("click", function(e){
		e.preventDefault();
		var theid = $(this).attr("id");
		var theproducts = $("div.course_card_item");
		var thetypeC = $(".flip-card")
		var thetypeL = $(".list-action")
		var classNames = $(this).attr('class').split(' ');
		var orderSelect1 = $("#courses_order_select option:selected").val();
		var t1 = getParameterByName('t1');
		var t2 = getParameterByName('t2');
		
		if($(this).hasClass("is-link")) {
			return false;
		} else {

  			if(theid == "card-view") {
				$(this).addClass("is-link");
				/* $("#list-view").removeClass("is-link"); */
			
				theproducts.removeClass("type-list");
				theproducts.addClass("type-card");
				
				
				/* thetypeL.css('display','none');
				thetypeC.css('display','flex'); */
				
 				location.href = "./Search.le?t1="+t1+"&t2="+t2+"&item="+orderSelect1+"&view=card";
			}
			
			else if(theid == "list-view") {
				$(this).addClass("is-link");
				/* $("#card-view").removeClass("is-link"); */
					
				theproducts.removeClass("type-card")
				theproducts.addClass("type-list");
				
				
				/* thetypeL.css('display','block');
				thetypeC.css('display','none'); */
				
				
				location.href = "./Search.le?t1="+t1+"&t2="+t2+"&item="+orderSelect1+"&view=list";
			} 
		}
	});
/* view switcher */
});

/* tags */
$( ".flip-card" ).load(function() {
	 console.log($( this ).find(".l_reg_date").attr());
	
  /* if ( $( this ).find(".l_reg_date").attr()) {
    $( this ).addClass( "bigImg" );
  } */
});
/* tags */


</script>
</body>
</html>