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

</head>
<body>
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
									<option value="seq">추천순</option>
									<option value="popular">인기순</option>
									<option value="recent" selected>최신순</option>
									<option value="rating">평점순</option>
									<option value="famous">학생수순</option>
								</select>
							</div>
						</nav><!-- breadcrumb -->
						<!-- <div class="courses_skills"></div>courses_skill 구현 가능성?? -->
						<div class="courses_container">
							<div class="columns is-multiline course_card_item">
								<div class="column flip-card is-4-tablet is-desktop">
									<div class="card course flip-card-inner">
										<a class="flip-card-front" href="#">
											<div class="card_image">
												<figure class="image is_tumbnail">
													<img src="./img/course-img/koala.jpg" alt="">
													<div class="course_card_ribbon">
														<i class="fas fa-cut"></i>
														25% 할인중
														<small>(<span>12</span>일 남음)
														</small>
													</div>
												</figure>
											</div>
											<div class="card_content">
												<div class="course_title">[연재할인]진짜 현업에서 쓰이는 직장인의 실무 엑셀 - 데이터 가공부터 분석까지</div>
												<div class="course_instructor">제주코딩베이스센터</div>
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
													<div class="course_price">
														<del>￦22,000</del><br>
														<span class="pay_price">￦16.500</span>
													</div>
													<div class="tags">
														<span class="tag" style="background-color:hsl(155,40%,87%)">독점</span>
														<span class="tag" style="background-color:hsl(321,63%,90%)">베스트셀러</span>
													</div>
												<!-- </div> --><!-- course_data -->
											</div>
										</a>
										<div class="flip-card-back course_card_back">
											<a href="#">
												<p class="course_decription">다가오는 코딩 테스트에 대비하여 기본적으로 알아야 할 개념을 복습하고 Python, Javascript를 통해 알고리즘 문제를 풀어볼 수 있습니다.</p>
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
															프로그래밍 언어
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
								<div class="column flip-card is-4-tablet is-desktop">
									<div class="card course flip-card-inner">
										<a class="flip-card-front" href="#">
											<div class="card_image">
												<figure class="image is_tumbnail">
													<img src="./img/course-img/mlik-cow.jpg" alt="">
												</figure>
											</div>
											<div class="card_content">
												<div class="course_title">진짜 현업에서 쓰이는 직장인의 실무 엑셀 - 데이터 가공부터 분석까지</div>
												<div class="course_instructor">제주코딩베이스센터</div>
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
													<div class="course_price">￦16.500</div>
													<div class="tags">
														<span class="tag" style="background-color:hsl(155,40%,87%)">독점</span>
														<span class="tag" style="background-color:hsl(321,63%,90%)">베스트셀러</span>
													</div>
												<!-- </div> --><!-- course_data -->
											</div>
										</a>
										<div class="flip-card-back course_card_back">
											<a href="#">
												<p class="course_decription">다가오는 코딩 테스트에 대비하여 기본적으로 알아야 할 개념을 복습하고 Python, Javascript를 통해 알고리즘 문제를 풀어볼 수 있습니다.</p>
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
															프로그래밍 언어
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
								
								
								
								
								
							</div><!-- course-card-item -->
						</div><!-- courses_ container-->
					</main><!-- course_main -->
					
					<footer class="courses_footer">
						<nav class="pagination_list">
						<div class="pagination">
							<a href="#">&laquo;</a> 
							<a href="#" class="active">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#" class="#">&raquo;</a>
						</div>
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
<script>

</script>

</body>
</html>