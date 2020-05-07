<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="./css/header.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/2441771e3f.js"
	crossorigin="anonymous"></script>
<meta name="viewport"
content="width=device-width, user-scalable=yes,
initial-scale=1.0, maximum-scale=3.0"/>
<jsp:include page="nav-footer.jsp" />
<header class="sticky">

	<nav class="navbar">
		<!-- 데스크탑 -->
		<div class="descktop_content">
			<!-- 로고 -->
			<div class="banner">
				<a href="Main.le" class="logo"><span><img alt="logo" src="./img/logo.png"></span></a>
			</div>
			<!--메뉴  -->
			<div class="navbar-menu">
				<!--좌측   -->
				<div class="navbar-left">
					<!-- 강의들  -->
					<div class="navbar-item h-back">
						<a href="#" class="navbar-link bold"> <span>강의들</span> <i
							class="fas fa-angle-down"></i> <!-- <img alt="강의들" src="./../img/include-img/below.png"> -->
						</a>
						<ul class="navbar-dropdown step1">
							<li class="h-back"><a href="Search.le" class="navbar-item">IT
									프로그래밍</a>
								<ul class="navbar-dropdown step2">
									<li><a href="Search.le" class="navbar-item">웹개발</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">HTML/CSS</a></li>
											<li><a class="navbar-item" href="Search.le">JavaScript</a></li>
											<li><a class="navbar-item" href="Search.le">웹 개발</a></li>
											<li><a class="navbar-item" href="Search.le">Java</a></li>
											<li><a class="navbar-item" href="Search.le">FrontEnd</a></li>
											<li><a class="navbar-item" href="Search.le"></a></li>
										</ul></li>
									<li><a href="Search.le" class="navbar-item">모바일앱</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le"></a></li>
											<li><a class="navbar-item" href="Search.le"></a></li>
											<li><a class="navbar-item" href="Search.le"></a></li>
											<li><a class="navbar-item" href="Search.le"></a></li>
											<li><a class="navbar-item" href="Search.le"></a></li>
											<li><a class="navbar-item" href="Search.le"></a></li>
										</ul></li>
								</ul></li>
							<li><a href="Search.le" class="navbar-item">크리에이티브</a>
								<ul class="navbar-dropdown step2">
									<li><a href="Search.le" class="navbar-item"></a>
										<ul class="navbar- dropdown step3">
											<li><a class="navbar-item" href="Search.le"></a></li>
										</ul></li>
								</ul></li>
							<li><a href="Search.le" class="navbar-item">업무 스킬</a>
								<ul class="navbar-dropdown step2">
									<li><a href="Search.le" class="navbar-item"></a>
										<ul class="navbar- dropdown step3">
											<li><a class="navbar-item" href="Search.le"></a></li>
										</ul></li>
								</ul></li>
						</ul>
					</div>
					<!--커뮤니티  -->
					<div class="navbar-item">
						<a href="#" class="navbar-link bold"> <span>커뮤니티</span> <i
							class="fas fa-angle-down"></i> <!-- <img alt="커뮤니티" src="./../img/include-img/below.png"> -->
						</a>
						<ul class="navbar-dropdown">
							<li><a href="askAnswer.bo" class="navbar-item">묻고 답하기</a></li>
							<li><a href="star.bo" class="navbar-item">수강평 모아보기</a></li>
							<li><a href="notice.bo" class="navbar-item">공지사항</a></li>
							<li><a href="request.bo" class="navbar-item">강의 기능 요청</a></li>
						</ul>
					</div>
					<!-- 로드맵  -->
					<div class="navbar-item">
						<a href="#" class="navbar-link bold"> <span>로드맵 보기</span> <!-- <img alt="로드맵 보기" src="./../img/include-img/below.png"> -->
						</a>
					</div>
				</div>
				<!-- 좌측 메뉴 끝 -->
				<!--우측메뉴  -->
				<div class="navbar-right">
					<!--검색 메뉴  -->
					<div class="search_bar">
						<input type="text" class=""><i class="fas fa-search"></i>
					</div>
					<!--지식공유 참여  -->
					<div class="navbar-item">
						<a href="#" class="navbar-link bold">지식공유참여</a>
					</div>
					<!-- 대시보드 -->
					<div class="navbar-item">
						<a href="#" class="navbar-item bold"> <span class="button">대시보드</span></a>
					</div>
					<!-- 위시리스트  -->
					<div class="navbar-item">
						<a href="BasketList.ba"><i class="fas fa-shopping-cart"></i></a>
					</div>
					<!-- 알림 -->
					<div class="navbar-item">
						<a href="#"><i class="fas fa-bell"></i> </a>
					</div>
					<!-- 사용자 정보 -->
					<div class="navbar-item"></div>
				</div>
				<!--우측메뉴 끝 -->
			</div>
		</div>
		<!--데스크탑 끝  -->
		<!-- 모바일 -->
		<jsp:include page="./nav-sideBar.jsp"/><!-- 사이드바 -->
		<div class="mobile_content">
			<!--왼쪽  -->
			<div class="mobile_left">

				<div class="mobile_Search">
					<a href="#" onclick="on()"><i class="fas fa-bars"></i></a>
				</div>
				<!-- 가운데 -->
			</div>
			<div class="logo"><img alt="logo" src="./img/logo.png"></div>
			<!-- 오른쪽 -->
			<div class="mobile_right">
				<div class="noLogin">
					<a href="#">로그인</a>
					<a href="#">회원가입</a>
				
				</div>
				<div class="login">
					<div class="basket"></div>
					<div class="status"></div>
				</div>
			</div>
		</div>
		<!--모바일끝  -->
	</nav>

</header>