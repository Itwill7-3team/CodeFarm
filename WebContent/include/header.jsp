<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="./css/header.css" rel="stylesheet">


<script src="https://kit.fontawesome.com/2441771e3f.js"
	crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
  crossorigin="anonymous"></script>
<meta name="viewport"
content="width=device-width, user-scalable=yes,
initial-scale=1.0, maximum-scale=3.0"/>
<%
	String loginEmail="";
	String nick="";
	if(session.getAttribute("m_email")!=null){
	 loginEmail=(String)session.getAttribute("m_email");
	 nick=(String)session.getAttribute("nick");
	}
%>
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
						<a href="Search.le" class="navbar-link bold"> <span>강의들</span> <i
							class="fas fa-angle-down"></i> <!-- <img alt="강의들" src="./../img/include-img/below.png"> -->
						</a>
						<ul class="navbar-dropdown step1 ">
							<li><a href="Search.le" class="navbar-item">IT프로그래밍</a>
								<ul class="navbar-dropdown step2">
									<li><a href="Search.le" class="navbar-item">웹개발</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">HTML/CSS</a></li>
											<li><a class="navbar-item" href="Search.le">JavaScript</a></li>
											<li><a class="navbar-item" href="Search.le">웹 개발</a></li>
											<li><a class="navbar-item" href="Search.le">Java</a></li>
											<li><a class="navbar-item" href="Search.le">Front-End</a></li>
											<li><a class="navbar-item" href="Search.le">Python</a></li>
											<li><a class="navbar-item" href="Search.le">Back-End</a></li>
											<li><a class="navbar-item" href="Search.le">웹 퍼블리싱</a></li>
											<li><a class="navbar-item" href="Search.le">Spring</a></li>
											<li><a class="navbar-item" href="Search.le">Node.js</a></li>
											<li><a class="navbar-item" href="Search.le">React</a></li>
											<li><a class="navbar-item" href="Search.le">Vue.js</a></li>
										</ul></li>
									<li><a href="Search.le" class="navbar-item">모바일앱</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">모바일앱</a></li>
											<li><a class="navbar-item" href="Search.le">Android</a></li>
											<li><a class="navbar-item" href="Search.le">iOS</a></li>
											<li><a class="navbar-item" href="Search.le">Swift</a></li>
											<li><a class="navbar-item" href="Search.le">Kotlin</a></li>
											<li><a class="navbar-item" href="Search.le">Firebase</a></li>
											<li><a class="navbar-item" href="Search.le">Java</a></li>
											<li><a class="navbar-item" href="Search.le">Javascript</a></li>
											<li><a class="navbar-item" href="Search.le">Google Flutter</a></li>
											<li><a class="navbar-item" href="Search.le">IONIC</a></li>
											<li><a class="navbar-item" href="Search.le">웹앱</a></li>
											<li><a class="navbar-item" href="Search.le">게임개발</a></li>
										</ul></li>
									<li><a href="Search.le" class="navbar-item">게임 개발</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">게임개발</a></li>
											<li><a class="navbar-item" href="Search.le">Unity</a></li>
											<li><a class="navbar-item" href="Search.le">Unreal
													Engine</a></li>
											<li><a class="navbar-item" href="Search.le">C#</a></li>
											<li><a class="navbar-item" href="Search.le">iOS</a></li>
											<li><a class="navbar-item" href="Search.le">Python</a></li>
											<li><a class="navbar-item" href="Search.le">UE Blueprints</a></li>
											<li><a class="navbar-item" href="Search.le">Javascript</a></li>
											<li><a class="navbar-item" href="Search.le">Scratch</a></li>
											<li><a class="navbar-item" href="Search.le">알고리즘</a></li>
											<li><a class="navbar-item" href="Search.le">C++</a></li>
											<li><a class="navbar-item" href="Search.le">Node.js</a></li>
										</ul></li>

									<li><a href="Search.le" class="navbar-item">데이터 사이언스</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">데이터 분석</a></li>
											<li><a class="navbar-item" href="Search.le">Python</a></li>
											<li><a class="navbar-item" href="Search.le">머신러닝</a></li>
											<li><a class="navbar-item" href="Search.le">딥러닝</a></li>
											<li><a class="navbar-item" href="Search.le">인공지능</a></li>
											<li><a class="navbar-item" href="Search.le">데이터 시각화</a></li>
											<li><a class="navbar-item" href="Search.le">웹 크롤링</a></li>
											<li><a class="navbar-item" href="Search.le">데이터 과학</a></li>
											<li><a class="navbar-item" href="Search.le">R</a></li>
											<li><a class="navbar-item" href="Search.le">Keras</a></li>
											<li><a class="navbar-item" href="Search.le">컴퓨터 비전</a></li>
											<li><a class="navbar-item" href="Search.le">Tensorflow</a></li>
										</ul></li>


									<li><a href="Search.le" class="navbar-item">보안</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">정보보안</a></li>
											<li><a class="navbar-item" href="Search.le">모의해킹</a></li>
											<li><a class="navbar-item" href="Search.le">Forensic</a></li>
											<li><a class="navbar-item" href="Search.le">리버싱</a></li>
											<li><a class="navbar-item" href="Search.le">시스템해킹</a></li>
											<li><a class="navbar-item" href="Search.le">Android</a></li>
											<li><a class="navbar-item" href="Search.le">악성코드</a></li>
											<li><a class="navbar-item" href="Search.le">네트워크</a></li>
											<li><a class="navbar-item" href="Search.le">Window-OS</a></li>
											<li><a class="navbar-item" href="Search.le">화이트해커</a></li>
											<li><a class="navbar-item" href="Search.le">Pyhton</a></li>
											<li><a class="navbar-item" href="Search.le">Metasploit</a></li>
										</ul></li>

									<li><a href="Search.le" class="navbar-item">인공지능</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">인공지능</a></li>
											<li><a class="navbar-item" href="Search.le">머신러닝</a></li>
											<li><a class="navbar-item" href="Search.le">딥러닝</a></li>
											<li><a class="navbar-item" href="Search.le">Python</a></li>
											<li><a class="navbar-item" href="Search.le">컴퓨터 비전</a></li>
											<li><a class="navbar-item" href="Search.le">Tensorflow</a></li>
											<li><a class="navbar-item" href="Search.le">Keras</a></li>
											<li><a class="navbar-item" href="Search.le">데이터 분석</a></li>
											<li><a class="navbar-item" href="Search.le">강화학습</a></li>
											<li><a class="navbar-item" href="Search.le">데이터 과학</a></li>
											<li><a class="navbar-item" href="Search.le">Javascript</a></li>
											<li><a class="navbar-item" href="Search.le">R</a></li>
										</ul></li>

									<li><a href="Search.le" class="navbar-item">알고리즘</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">알고리즘</a></li>
											<li><a class="navbar-item" href="Search.le">Python</a></li>
											<li><a class="navbar-item" href="Search.le">수학</a></li>
											<li><a class="navbar-item" href="Search.le">C++</a></li>
											<li><a class="navbar-item" href="Search.le">인공지능</a></li>
											<li><a class="navbar-item" href="Search.le">Java</a></li>
											<li><a class="navbar-item" href="Search.le">코딩 테스트</a></li>
											<li><a class="navbar-item" href="Search.le">SSAFY</a></li>
											<li><a class="navbar-item" href="Search.le">게임개발</a></li>
											<li><a class="navbar-item" href="Search.le">C</a></li>
											<li><a class="navbar-item" href="Search.le">딥러닝</a></li>
											<li><a class="navbar-item" href="Search.le">자료구조</a></li>
										</ul></li>
									<li><a href="Search.le" class="navbar-item">교양</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">수학</a></li>
											<li><a class="navbar-item" href="Search.le">깃(GIT)</a></li>
											<li><a class="navbar-item" href="Search.le">Python</a></li>
											<li><a class="navbar-item" href="Search.le">버전관리시스템</a></li>
											<li><a class="navbar-item" href="Search.le">Front_End</a></li>
											<li><a class="navbar-item" href="Search.le">사무실무</a></li>
											<li><a class="navbar-item" href="Search.le">함수형
													프로그래밍</a></li>
											<li><a class="navbar-item" href="Search.le">데이터 과학</a></li>
											<li><a class="navbar-item" href="Search.le">Java</a></li>
											<li><a class="navbar-item" href="Search.le">Github</a></li>
											<li><a class="navbar-item" href="Search.le">미적분</a></li>
											<li><a class="navbar-item" href="Search.le">취업</a></li>
										</ul></li>

									<li><a href="Search.le" class="navbar-item">서버</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">Back-End</a></li>
											<li><a class="navbar-item" href="Search.le">Java</a></li>
											<li><a class="navbar-item" href="Search.le">Linux</a></li>
											<li><a class="navbar-item" href="Search.le">Node.js</a></li>
											<li><a class="navbar-item" href="Search.le">Spring</a></li>
											<li><a class="navbar-item" href="Search.le">JPA</a></li>
											<li><a class="navbar-item" href="Search.le">cloud</a></li>
											<li><a class="navbar-item" href="Search.le">정보보안</a></li>
											<li><a class="navbar-item" href="Search.le">Firebase</a></li>
											<li><a class="navbar-item" href="Search.le">네트워크</a></li>
											<li><a class="navbar-item" href="Search.le">DevOps</a></li>
											<li><a class="navbar-item" href="Search.le">데이터베이스</a></li>
										</ul></li>

									<li><a href="Search.le" class="navbar-item">수학</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">수학</a></li>
											<li><a class="navbar-item" href="Search.le">알고리즘</a></li>
											<li><a class="navbar-item" href="Search.le">SSAFY</a></li>
											<li><a class="navbar-item" href="Search.le">선형대수학</a></li>
											<li><a class="navbar-item" href="Search.le">R</a></li>
											<li><a class="navbar-item" href="Search.le">미적분</a></li>
											<li><a class="navbar-item" href="Search.le">통계</a></li>
											<li><a class="navbar-item" href="Search.le">Tensorflow</a></li>
											<li><a class="navbar-item" href="Search.le">Raspberry
													Pi</a></li>
											<li><a class="navbar-item" href="Search.le">IoT</a></li>
											<li><a class="navbar-item" href="Search.le">머신러닝</a></li>
											<li><a class="navbar-item" href="Search.le">C++</a></li>
										</ul></li>

									<li><a href="Search.le" class="navbar-item">자동화</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">DevOps</a></li>
											<li><a class="navbar-item" href="Search.le">Ansible</a></li>
											<li><a class="navbar-item" href="Search.le">Python</a></li>
											<li><a class="navbar-item" href="Search.le">시스템자동화</a></li>
											<li><a class="navbar-item" href="Search.le">Back-End</a></li>
											<li><a class="navbar-item" href="Search.le">Linux</a></li>
											<li><a class="navbar-item" href="Search.le">Docker</a></li>
											<li><a class="navbar-item" href="Search.le">UiPath</a></li>
											<li><a class="navbar-item" href="Search.le">Raspberry
													Pi</a></li>
											<li><a class="navbar-item" href="Search.le">인공지능</a></li>
											<li><a class="navbar-item" href="Search.le">Firebase</a></li>
											<li><a class="navbar-item" href="Search.le">컴퓨터 비전</a></li>
										</ul></li>

									<li><a href="Search.le" class="navbar-item">데이터베이스</a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le">데이터베이스</a></li>
											<li><a class="navbar-item" href="Search.le">SQL</a></li>
											<li><a class="navbar-item" href="Search.le">데이터 분석</a></li>
											<li><a class="navbar-item" href="Search.le">Java</a></li>
											<li><a class="navbar-item" href="Search.le">JPA</a></li>
											<li><a class="navbar-item" href="Search.le">MYSQL</a></li>
											<li><a class="navbar-item" href="Search.le">Back-End</a></li>
											<li><a class="navbar-item" href="Search.le">Oracle</a></li>
											<li><a class="navbar-item" href="Search.le">Spring
													Data JPA</a></li>
											<li><a class="navbar-item" href="Search.le">Python</a></li>
											<li><a class="navbar-item" href="Search.le">Spring</a></li>
											<li><a class="navbar-item" href="Search.le">Spring
													Boot</a></li>
										</ul></li>
								</ul></li>
							<li><a href="Search.le" class="navbar-item">업무 스킬</a>
								<ul class="navbar-dropdown step2">
									<li><a href="Search.le" class="navbar-item"></a>
										<ul class="navbar-dropdown step3">
											<li><a class="navbar-item" href="Search.le"></a></li>
										</ul></li>
								</ul></li>
						</ul>
					</div>
					<!--커뮤니티  -->
					<div class="navbar-item">
						<a href="askAnswer.bo" class="navbar-link bold"> <span>커뮤니티</span> <i
							class="fas fa-angle-down"></i> <!-- <img alt="커뮤니티" src="./../img/include-img/below.png"> -->
						</a>
						<ul class="navbar-dropdown step1">
							<li><a href="askAnswer.bo" class="navbar-item"><i class="fas fa-edit"></i> 묻고 답하기</a></li>
							<li><a href="reView.bo" class="navbar-item"><i class="fas fa-star"></i> 수강평 모아보기</a></li>
							<li><a href="notice.bo" class="navbar-item"><i class="fas fa-bullhorn"></i> 공지사항</a></li>
							<li><a href="request.bo" class="navbar-item"><i class="far fa-comments"></i> 강의 기능 요청</a></li>
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
					<!-- 로그인 했을때 -->
					<%if(!loginEmail.equals("")){%>
					<!-- 대시보드 -->
					<div class="navbar-item">
						<a href="DashBoard.bo" class="navbar-item"> <button class="btn bold">대시보드</button></a>
						
					</div>
					<!-- 위시리스트  -->
					<div class="navbar-item carts">
						<a href="BasketList.ba"><i class="fas fa-shopping-cart cart"></i></a>
						<div class="cart_modal_cover">
						<div class="cart_modal">
							<div class="top_content">
								<span class="tab_menu active" data-type="basket">수강바구니</span>
								<span class="tab_menu " data-type="wish">위시 리스트</span>
							</div>
							<div class="bottom_content">
								<div class="list_content" id="list_content"></div>
								<div class="button_content">
								<button class="tab_btn wish_btn" onclick="location.href='WishList.wi'">위시리스트 로 이동</button>
								<button class="tab_btn basket_btn" onclick="location.href='BasketList.ba'">수강 바구니 로 이동</button>
								</div>
							</div>
						</div>
						</div>
					</div>
					<!-- 위시리스트 종료 -->
					<!-- 알림 -->
					<div class="navbar-item">
						<a href="#"><i class="fas fa-bell"></i> </a>
					</div>
					<!-- 사용자 정보 -->
					<div class="navbar-item profile">
						<div class="profile_hover">
							<span><img src="./img/sunny.png"></span>
						</div>
							<span class="profile_icon"></span>
							<div class="profile_modal_cover">
								<div class="profile_modal">
									<div class="profile_modal_info">
										<div class="user_content">
											<div class="left_content">
												<div class="img_content">
												<img src="./img/carrotIcon.png" alt="@@@님의 프로필"><!-- 코드팜 배너 -->
												<a href="#">설정</a>
												</div>
											</div>
											<div class="right_content">
											<a href="#"><span class="name"><%= nick %><!-- 회원이름  --></span></a>
											<span class="rank">학생<!-- 회원 등급 --></span>
											</div>
										</div>
									</div>
									<div class="profile_modal_menu">
									<div class="tab_content">
										<span class="tab_item">학생<!-- 회원 등급  --></span>
									</div>
									<div class="list_content">
										<ul>
											<a href="#"><li class="list_item">이어서 학습하기</li></a>
											<a href="#"><li class="list_item">수강중인 강의</li></a>
											<a href="#"><li class="list_item">참여중인 로드맵</li></a>
											<a href="#"><li class="list_item">내 질문 답변</li></a>
											<a href="#"><li class="list_item">구매내역</li></a>
											<a href="addLecture.in"><li class="list_item">강의등록하기</li></a>
										</ul>
									</div>
									</div>
									<div class="profile_modal_footer">
										<div class="left_footer">
										<a href="MemberLogout.me">로그아웃</a>
										</div>
										<div class="right_footer">
										<a href="#">고객센터</a>
										</div>
									</div>
								</div>
							</div>
						
					</div>
					<%}else{ %>
					<!-- 로그인 했을때  -->
					<!-- 로그인 안했을때  -->
						<div class="navbar-item">
							<a  class="navbar-item bold"> <button class="btn bold login_btn">로그인</button></a>
						</div>
						<div class="navbar-item">
							<a href="MemberJoin.me" class="navbar-item bold"> <button class="btn bold">회원가입</button></a>
						</div>
					<!--로그인 안했을때  -->
					<%} %>
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
					<a href="MemberLogin.me">로그인</a>
					<a href="MemberJoin.me">회원가입</a>
				
				</div>
				<div class="login">
					<div class="basket">
						
					</div>
					<div class="status"></div>
				</div>
			</div>
		</div>
		<!--모바일끝  -->
	</nav>
	
<script>
	$(".tab_menu").click(function() {
		$(".tab_menu").removeClass("active");
		$(this).addClass("active");
		getCarts();
	});
	$(".cart").mouseover(function() {
		getCarts();
	});
	
	
	$(".login_btn").click(function(){
	
		$.ajax({
			type : "POST",
			url : "./MemberLogin.me",
			data : {
				
				
			},

			success : function(data) {

				$(".login_form").html(data);
			},
			error : function(xhr, status, error) {
				alert("error: " + error);
			}

		});
	});

	
	 
	
	function getCarts(){
		var type = $(".tab_menu.active").attr("data-type");
		$.ajax({
			type : "post",
			url : "./carts.ba?type=" + type,
			data : {
				"id" : "<%=loginEmail%>"
				
			},
			dataType : "json",
			success : function(data) { // 서버에 대한 정상응답이 오면 실행, callback
				var tag="";
				for (var i = 0; i <data.length; i++) 
					{
					tag+=" <a class='list_el' href=num?'"+data[i].lecturedata.l_number+"'>"
						+"<div class='img_content'><img src='./upload/"+data[i].lecturedata.l_img.split(",")[0]+"'></div>"
						+"<div class='item_content'>"
						+"<p class='item_title'>"+data[i].lecturedata.l_title+"</p>"
						+"<p class='item_price'>"+data[i].lecturedata.l_price+"</p>"
						+"</div>"
						+"</a>" ; 
				}
				$("#list_content").html(tag);
				if(type=="wish"){
					$(".basket_btn").removeClass("active");
					$(".wish_btn").addClass("active");
				}
				if(type=="basket"){
					$(".wish_btn").removeClass("active");
					$(".basket_btn").addClass("active");
				}
			}
		});
	}
	$(".profile_hover").mouseover(function(){
		$(".profile_modal_cover").addClass("active");
	});
	$(".profile_hover").mouseout(function(){
		$(".profile_modal_cover").removeClass("active");
	});
</script>


</header>
<div class="login_form"></div> 