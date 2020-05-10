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
List<LectureDTO> lectureList = (List<LectureDTO>) request.getAttribute("lectureList");



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
									<a href="Search.le?All" class="accordion_content"> ALL </a>
									<a href="Search.le" class="accordion_content"> 웹개발 </a>
									<a href="Search.le" class="accordion_content"> 모바일 앱 </a> 
									<a href="Search.le" class="accordion_content"> 게임 개발 </a>
									<a href="Search.le" class="accordion_content"> 데이터 사이언스 </a>
									<a href="Search.le" class="accordion_content"> 보안 </a> 
									<a href="Search.le" class="accordion_content"> 인공지능 </a> 
									<a href="Search.le" class="accordion_content"> 알고리즘 </a> 
									<a href="Search.le" class="accordion_content"> 교양 </a> 
									<a href="Search.le" class="accordion_content"> 수학 </a> 
									<a href="Search.le" class="accordion_content"> 서버 </a> 
									<a href="Search.le" class="accordion_content"> 자동화 </a> 
									<a href="Search.le" class="accordion_content"> 데이터베이스 </a> 
									<a href="Search.le" class="accordion_content"> 개발도구 </a> 
									<a href="Search.le" class="accordion_content"> 프레임워크 및 라이브러리 </a> 
									<a href="Search.le" class="accordion_content"> 프로그래밍 언어 </a> 
									<a href="Search.le" class="accordion_content"> 서비스 개발 </a> 
									<a href="Search.le" class="accordion_content"> 인프라 </a> 
									<a href="Search.le" class="accordion_content"> 사물인터넷 </a> 
									<a href="Search.le" class="accordion_content"> 블록체인 </a>
								</div>
						</div><!-- IT 아코디언 -->

						<div class="accordion">
							<button class="accordion_header">크리에이티브</button>
								<div class="panel">
									<a href="Search.le" class="accordion_content"> ALL </a>
									<a href="Search.le" class="accordion_content"> 3D 모델링 </a> 
									<a href="Search.le" class="accordion_content"> 그래픽 디자인 </a> 
									<a href="Search.le" class="accordion_content"> 영상 편집, 유튜브 </a> 
									<a href="Search.le" class="accordion_content"> 영화 그래픽 </a> 
									<a href="Search.le" class="accordion_content"> 웹앱 디자인 </a> 
									<a href="Search.le" class="accordion_content"> 게임 디자인 </a> 
									<a href="Search.le" class="accordion_content"> UX/UI </a> 
									<a href="Search.le" class="accordion_content"> Sound </a> 
									<a href="Search.le" class="accordion_content"> AR/VR </a>
								</div>
						</div><!-- 크리에이티브 아코디언 -->

						<div class="accordion">
							<button class="accordion_header">업무 스킬</button>
								<div class="panel">
									<a href="Search.le" class="accordion_content"> ALL </a> 
									<a href="Search.le" class="accordion_content"> MS-OFFICE </a> 
									<a href="Search.le" class="accordion_content"> 마케팅 </a> 
									<a href="Search.le" class="accordion_content"> 금융, 주식, 투자 </a> 
									<a href="Search.le" class="accordion_content"> 데이터 분석 </a> 
									<a href="Search.le" class="accordion_content"> 업무 자동화 </a> 
									<a href="Search.le" class="accordion_content"> 회계, 재무 </a> 
									<a href="Search.le" class="accordion_content"> 경영지식 </a> 
									<a href="Search.le" class="accordion_content"> 기획 프로젝트 관리 </a> 
									<a href="Search.le" class="accordion_content"> 글쓰기 </a> 
									<a href="Search.le" class="accordion_content"> 자기 계발 </a> 
									<a href="Search.le"class="accordion_content"> 외국어 </a>
								</div>
						</div><!-- 업무스킬 아코디언 -->
					</nav><!-- accordion_category -->
				</aside><!-- sidebar_left -->
				
				<div class="column courses_body">
				
					<header class="courses_header">
						<div class="search">
							<input type="text" class="input" placeholder="강의 검색하기" value="">
							<button type="button" class="button search_button">검색</button>
						</div><!-- search -->					
					</header><!-- courses_header -->	

					<main id="courses_main">
						<nav class="breadcrumb">
							<ul>
								<li><a href="search.le" class="category_link">전체</a></li>
							</ul>
							<!--<button></button> für sidebar_left?? -->
							<div class="buttons select_view_button">
								<button class="button is-selected is-link" data-type="card"><i class="fas fa-th"></i></button>
								<button class="button" data-type="list"><i class="fas fa-list"></i></button>
							</div>
							<div class="select courses_order_selector">
								<select id="courses_order_select" name="order_select">
									<c:forEach var="item" items="${PagingDTO.item()}" begin="0" end="5" step="1"> 
										<option value="">${item}</option>
										<%-- <option value="<c:out value="${item}" />">
												<c:out value="${item}" /></option> --%>
									<!-- <option value="seq" id="seq">추천순</option>
									<option value="popular" id="popular">인기순</option>
									<option value="recent" id="recent">최신순</option>
									<option value="rating" id="ration">평점순</option>
									<option value="famous" id="famous">학생수순</option> -->
									</c:forEach>
								</select>
							</div>
						</nav><!-- breadcrumb -->
						<!-- <div class="courses_skills"></div>courses_skill 구현 가능성?? -->
						<div class="courses_container">
							<div class="columns is-multiline course_card_item">
								
<%
for(int i=0;i<lectureList.size();i++){ 
	LectureDTO ldto = lectureList.get(i);
%>
								
								<div class="column flip-card is-4-tablet is-desktop">
									<div class="card course flip-card-inner">
										<a class="flip-card-front" href='./lectureDetail.le?num=<%=ldto.getL_number()%>'>
											<div class="card_image">
												<figure class="image is_tumbnail">
													<img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
												</figure>
											</div>
											<div class="card_content">
												<div class="course_title"><%=ldto.getL_title() %></div>
												<div class="course_instructor"><%=ldto.getL_m_name() %></div>
												<!-- <div class="course_data columns is-multiline"> -->
													<div class="rating">
														<div class="rating_star">
															<div class="star_solid" style="width:0%"></div>
															<i class="far fa-star"></i>
															<i class="far fa-star"></i>
															<i class="far fa-star"></i>
															<i class="far fa-star"></i>
															<i class="far fa-star"></i>
														</div><!-- rating star -->
														<span class="review_cnt">(0)</span> 
													</div>
													 <c:set var="price" value="<%=ldto.getL_price() %>"/>
													<div class="course_price"><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${price}" /></div>
													<div class="tags">
														<span class="tag" style="background-color:hsl(155,40%,87%)"><%=ldto.getL_tag() %></span>
													</div>
												<!-- </div> --><!-- course_data -->
											</div>
										</a>
										<div class="flip-card-back course_card_back">
											<a href="#">
												<p class="course_decription"><%=ldto.getL_content() %></p>
												<div class="back_course_data">
													<div class="course_level">
														<span>
															<i class="fas fa-shoe-prints"></i>
															초급
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
													<i class="fas fa-cart-arrow-down fa-lg"></i>
													<span class="tooltiptext">바구니에 추가</span>
												</div>
												<div class="tooltip add_wishlist">
													<i class="fas fa-heartbeat fa-lg"></i>
													<span class="tooltiptext">위시리스트에 추가</span>
												</div>
											</div>
										</div>
									</div>
								</div>
<%} %>								
								
								
								
								
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
	$("#courses_order_select").change(
		function() {
			var orderSelect1 = $("#courses_order_select option:selected").val();
					/* alert(orderSelect1); */
				if (orderSelect1 == "seq") {
						location.href = "./Search.le?item=seq";
				} else if (orderSelect1 == "popular") {
						location.href = "./Search.le?item=popular";
				} else if (orderSelect1 == "recent") {
						location.href = "./Search.le?item=recent";
				} else if (orderSelect1 == "rating") {
						location.href = "./Search.le?item=rating";
				} else if (orderSelect1 == "famous") {
						location.href = "./Search.le?item=famous";
				}
		});
	$("#courses_order_select > option[value="+'<c:out value="${ param.item }"/>'+"]").attr("selected","selected");
	});
</script>
<!-- selectBox -->

</body>
</html>