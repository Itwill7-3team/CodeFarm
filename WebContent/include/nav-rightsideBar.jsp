<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href='./css/nav-rightsideBar.css?ver=2' rel="stylesheet">



<!-- <button onclick="on()">Turn on overlay effect</button> -->

<div id="overlay2" onclick="r_menu_off()">
	<!-- 오버레이 영역 -->
</div>
<!-- 오버레이끝 -->
<div id="right-nav_menu">
	<!-- 사이드영역 -->
	<div class="close_content">
		<span class="e_close_btn" data-type="close"> </span>
	</div>
	<!-- close content 종료 -->
	<div class="info_content">
		<div class="user_content">
			<div class="left_content">
				<div class="img_content">
					<img src="./img/carrotIcon.png" alt="@@@님의 프로필"> <a
						href="MemberInfo.me">설정</a>
				</div>
			</div>
			<div class="right_content">
				<a href="/dashboard"><span class="name">변재정</span><span
					class="icon"><i class="fas fa-chevron-right"></i></span></a>
				<div class="policy">지식공유자</div>
			</div>
		</div>
	</div>
	<!-- user info 종료 -->
	<div class="menu_content">
		<div class="tab_content">
			<span class="tab_menu active" data-id="0">학생</span><span
				class="tab_menu" data-id="1">지식공유</span>
		</div>
		<div class="list_content">
			<div class="tab_list active" data-id="0">
				<div class="list_el">
					<a href="/course/temp_325426/lecture/44284" class=""> <span
						class="icon"></span> <span class="name">이어서 학습하기</span>
					</a>
				</div>
				<div class="list_el">
					<a href="/my-courses" class=""> <span class="icon"></span> <span
						class="name">수강중인 강의</span>
					</a>
				</div>
				<div class="list_el">
					<a href="/my-roadmaps" class=""> <span class="icon"></span> <span
						class="name">참여중인 로드맵</span>
					</a>
				</div>
				<div class="list_el">
					<a href="/my-questions" class=""> <span class="icon"></span> <span
						class="name">내 질문 답변</span>
					</a>
				</div>
				<div class="list_el">
					<a href="/orders" class=""> <span class="icon"></span> <span
						class="name">구매내역</span>
					</a>
				</div>
			</div>
			<div class="tab_list" data-id="1">
				<div class="list_el">
					<a href="/instructor" class=""> <span class="icon"></span> <span
						class="name">대시보드</span>
					</a>
				</div>
				<div class="list_el">
					<a href="/instructor/courses" class=""> <span class="icon"></span>
						<span class="name">강의 관리</span>
					</a>
				</div>
				<div class="list_el">
					<a href="/create_course" class=""> <span class="icon"></span> <span
						class="name">강의 만들기</span>
					</a>
				</div>
				<div class="list_el">
					<a href="/instructor/questions" class=""> <span class="icon"></span>
						<span class="name">질문 리스트</span>
					</a>
				</div>
				<div class="list_el">
					<a href="/instructor/incomes" class=""> <span class="icon"></span>
						<span class="name">수익 확인</span>
					</a>
				</div>
				
			</div>

		</div>
	</div>
	<!-- 메뉴바 끝  -->
	<div class="footer_content">
      <span class="left_content">
        <a href="/signout" class="link">로그아웃</a>
      </span>
      <span class="right_content">
        
        <span class="link"><a href="/faq" class="link">고객센터 </a><span class="icon"><i class="fas fa-chevron-right" aria-hidden="true"></i></span></span>
      </span>
    </div>
</div>
<!-- 사이드끝 -->
<!-- <div id="exit" onclick="r_menu_off()"> </div>  여백누르면닫힘 -->

<!-- 오버레이 켜기/끄기 -->
<script>
	$(document).ready(function() {

		$(".tab_menu").click(function() {
			tab_menu();
		});

	});

	function tab_menu() {
		var tab_menu = $(".tab_menu.active").attr("data-id");
		console.log("실행");
		$(".tab_list").removeClass("active");
		$(".list_content").children("div[data-id=" + tab_menu + "]").addClass(
				"active");
	}
	function r_menu_on() {
		document.getElementById("overlay2").style.display = "block";
		$("#right-nav_menu").css("right", "0px");
		$("body").css("overflow", "hidden");

	}

	function r_menu_off() {
		document.getElementById("overlay2").style.display = "none";
		$("#right-nav_menu").css("right", "-300px");
		$("body").css("overflow", "auto");
	}
</script>


<!-- accordion -->
<script>
	var acc = document.getElementsByClassName("nav-accordion");
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

