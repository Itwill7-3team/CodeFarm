<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="./css/header.css" rel="stylesheet">
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js" ></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

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
	int rank=0;
	if(session.getAttribute("m_email")!=null){
	 loginEmail=(String)session.getAttribute("m_email");
	 nick=(String)session.getAttribute("nick");
	 if(session.getAttribute("m_rank")!=null){
	 rank=(int)session.getAttribute("m_rank");
	 }
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
									<li><a href="Search.le" class="navbar-item">ALL</a>
										</li>
									<li><a href="Search.le" class="navbar-item">웹개발</a>
										</li>
									<li><a href="Search.le" class="navbar-item">모바일앱</a>
										</li>
									<li><a href="Search.le" class="navbar-item">게임 개발</a>
										</li>

									<li><a href="Search.le" class="navbar-item">데이터 사이언스</a>
										</li>


									<li><a href="Search.le" class="navbar-item">보안</a>
										</li>

									<li><a href="Search.le" class="navbar-item">인공지능</a>
										</li>

									<li><a href="Search.le" class="navbar-item">알고리즘</a>
										</li>
									<li><a href="Search.le" class="navbar-item">교양</a>
										</li>

									<li><a href="Search.le" class="navbar-item">수학</a>
										</li>


									<li><a href="Search.le" class="navbar-item">서버</a>
										</li>

									<li><a href="Search.le" class="navbar-item">자동화</a>
										</li>
										
									<li><a href="Search.le" class="navbar-item">개발도구</a>
										</li>
									<li><a href="Search.le" class="navbar-item">프레임워크 및 라이브러리</a>
										</li>
									<li><a href="Search.le" class="navbar-item">프로그래밍 언어</a>
										</li>
									<li><a href="Search.le" class="navbar-item">서비스 개발</a>
										</li>
									<li><a href="Search.le" class="navbar-item">인프라</a>
										</li>
									<li><a href="Search.le" class="navbar-item">사물인터넷</a>
										</li>
									<li><a href="Search.le" class="navbar-item">블록체인</a>
										</li>
								</ul></li>
							<li><a href="Search.le" class="navbar-item">크리에이티브</a>
								<ul class="navbar-dropdown step2">
									<li><a href="Search.le" class="navbar-item">ALL</a>
										</li>
									<li><a href="Search.le" class="navbar-item">3D 모델링</a>
										</li>
									<li><a href="Search.le" class="navbar-item">그래픽 디자인</a>
										</li>

									<li><a href="Search.le" class="navbar-item">영 상 편집, 유튜브</a>
										</li>


									<li><a href="Search.le" class="navbar-item">영화 그래픽</a>
										</li>

									<li><a href="Search.le" class="navbar-item">웹앱 디자인</a>
										</li>

									<li><a href="Search.le" class="navbar-item">게임 디자인</a>
										</li>
									<li><a href="Search.le" class="navbar-item">UX/UI</a>
										</li>

									<li><a href="Search.le" class="navbar-item">Sound</a>
										</li>

									<li><a href="Search.le" class="navbar-item">AR/VR</a>
										</li>

								</ul></li>
							<li><a href="Search.le" class="navbar-item">업무 스킬</a>
								<ul class="navbar-dropdown step2">
									<li><a href="Search.le" class="navbar-item">ALL</a>
										</li>
									<li><a href="Search.le" class="navbar-item">MS-OFFICE</a>
										</li>
									<li><a href="Search.le" class="navbar-item">마케팅</a>
										</li>
									<li><a href="Search.le" class="navbar-item">금융,주식,투자</a>
										</li>
									<li><a href="Search.le" class="navbar-item">데이터 분석</a>
										</li>
									<li><a href="Search.le" class="navbar-item">업무 자동화</a>
										</li>
									<li><a href="Search.le" class="navbar-item">회계,재무</a>
										</li>
									<li><a href="Search.le" class="navbar-item">경영지식</a>
										</li>
									<li><a href="Search.le" class="navbar-item">기획,프로젝트 관리</a>
										</li>
									<li><a href="Search.le" class="navbar-item">글쓰기</a>
										</li>
									<li><a href="Search.le" class="navbar-item">자기 계발</a>
										</li>
									<li><a href="Search.le" class="navbar-item">외국어</a>
										</li>
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
					<!-- 블로그  -->
					<div class="navbar-item">
						<a href="blog.bl" class="navbar-link bold"> <span>블로그</span>
						<!-- <i class="fas fa-angle-down"></i> --> <!-- <img alt="블로그 보기" src="./../img/include-img/below.png"> -->
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
					<%if(rank<2) {%>
					<div class="navbar-item">
						<a href="#" id="tech_request" class="navbar-link bold">지식공유참여</a>
					</div>
					<%} %>
					<!-- 로그인 했을때 -->
					<%if(!loginEmail.equals("")){%>
					<!-- 대시보드 -->
					<div class="navbar-item">
						<a href="DashBoard.bo" class="navbar-item"> <button class="btn bold">대시보드</button></a>
						
					</div>
					<!-- 위시리스트  -->
					<div class="navbar-item carts">
<!-- 						<a href="BasketList.ba"><i class="fas fa-shopping-cart cart"></i></a> -->
						<div class="profile_hover">
							<span><img src="./img/cart.png"></span>
						</div>
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
<!-- 						<a href="#"><i class="fas fa-bell"></i> </a> -->
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
												<a href="MemberInfo.me">설정</a>
												</div>
											</div>
											<div class="right_content">
											<a href="#"><span class="name"><%= nick %><!-- 회원이름  --></span></a>
											 <span class="rank">
											 <%if(rank>1){%> 강사<%}else{%>학생<%}%>
											 <!-- 회원 등급 --></span>
											</div>
										</div>
									</div>
									<div class="profile_modal_menu">
									<div class="tab_content">
										<span class="tab_item isActive" data-type="students_list">학생<!-- 회원 등급  --></span>
										<%if(rank>1){%><span class="tab_item" data-type="instructor_list">지식공유<!-- 회원 등급  --></span><%} %>
									</div>
									<div class="list_content">
										<ul class="students_list">
											<a href="LectureVideo.le"><li class="list_item">이어서 학습하기</li></a>
											<a href="MyLecture.bo"><li class="list_item">수강중인 강의</li></a>
<!-- 											<a href="#"><li class="list_item">참여중인 로드맵</li></a> -->
											<a href="MyaskAction.bo"><li class="list_item">내 질문 답변</li></a>
											<a href="OrderList.or"><li class="list_item">구매내역</li></a>
											
										</ul>
										<%if(rank>1){ %>
										<ul class="instructor_list" style="display:none;">
											<a href="addLecture.in"><li class="list_item">강의등록하기</li></a>
											<a href="addLectureList.in"><li class="list_item">강의목록</li></a>
										</ul>
										<%} %>
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
							<a  class="navbar-item bold"> <button id="login_btn" class="btn bold login_btn">로그인</button></a>
							
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
	$(".carts").mouseover(function() {
		getCarts();
	});
	
	
	$(".login_btn").click(function(){
		
		$.ajax({
			type : "POST",
			url : "./MemberLogin.me",
			success : function(data) {

				$(".login_form").html(data);
			},
			error : function(xhr, status, error) {
				alert("error: " + error);
				
			}

		});
	});
	
	//강사 신청 폼
	$("#tech_request").click(function(){
	
		$.ajax({
			type : "POST",
			url : "./TechRequest.me",

			success : function(data) {

				$(".login_form").html(data);
			},
			error : function(xhr, status, error) {
				alert("error: " + error);
			}

		});
	});


	//profile 학생 지식공유자 선택
	$(".profile_modal_menu").on("click",".tab_item",function(){
		$(".tab_item").removeClass("isActive");		
		$(this).addClass("isActive");
	if($(this).attr("data-type")=="students_list"){
			$(".students_list").show();
			$(".instructor_list").hide();
	}else{
		$(".students_list").hide();
		$(".instructor_list").show();
	}
	
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
					tag+=" <a class='list_el' href='Detail.le?num="+data[i].lecturedata.l_number+"'>"
						+"<div class='img_content'><img src='./upload/"+data[i].lecturedata.l_img.split(",")[0]+"'></div>"
						+"<div class='item_content'>"
						+"<p class='item_title'>"+data[i].lecturedata.l_title+"</p>"
						+"<p class='item_price'>"+numberWithCommas(data[i].lecturedata.l_price)+"</p>"
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
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	
</script>

<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "5d9693cd-a636-4fc4-ae9c-264858e7b59b"
  });
</script>

</header>
<div class="login_form"></div> 