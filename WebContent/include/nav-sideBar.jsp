<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome Icon Library -->


<style>

</style>
</head>
<body>

   


<!-- <button onclick="on()">Turn on overlay effect</button> -->

<div id="overlay"><!-- 오버레이 영역 -->
	<div id="m-side-menu"><!-- 사이드영역 -->
			<aside class="nav-container columns nav-col sbar_left" >
				<nav class="accors accordion_category">
					<div class="accord">
						<button class="nav-accordion">IT 프로그래밍</button>
							<div class="panel">
								<a href="./Search.le?t1=it-programming" class="acco_ctt"> ALL </a>
								<a href="./Search.le?t1=it-programming&t2=web-dev" class="acco_ctt"> 웹개발 </a>
								<a href="./Search.le?t1=it-programming&t2=mobile-app" class="acco_ctt"> 모바일 앱 </a> 
								<a href="./Search.le?t1=it-programming&t2=game-dev" class="acco_ctt"> 게임 개발 </a>
								<a href="./Search.le?t1=it-programming&t2=data-science" class="acco_ctt"> 데이터 사이언스 </a>
								<a href="./Search.le?t1=it-programming&t2=security" class="acco_ctt"> 보안 </a> 
								<a href="./Search.le?t1=it-programming&t2=artificial-intelligence" class="acco_ctt"> 인공지능 </a> 
								<a href="./Search.le?t1=it-programming&t2=algorithm" class="acco_ctt"> 알고리즘 </a> 
								<a href="./Search.le?t1=it-programming&t2=culture" class="acco_ctt"> 교양 </a> 
								<a href="./Search.le?t1=it-programming&t2=math" class="acco_ctt"> 수학 </a> 
								<a href="./Search.le?t1=it-programming&t2=server-dev" class="acco_ctt"> 서버 </a> 
								<a href="./Search.le?t1=it-programming&t2=automation" class="acco_ctt"> 자동화 </a> 
								<a href="./Search.le?t1=it-programming&t2=database-dev" class="acco_ctt"> 데이터베이스 </a> 
								<a href="./Search.le?t1=it-programming&t2=programming-tool" class="acco_ctt"> 개발도구 </a> 
								<a href="./Search.le?t1=it-programming&t2=framework-library" class="acco_ctt"> 프레임워크 및 라이브러리 </a> 
								<a href="./Search.le?t1=it-programming&t2=programming-lang" class="acco_ctt"> 프로그래밍 언어 </a> 
								<a href="./Search.le?t1=it-programming&t2=service-dev" class="acco_ctt"> 서비스 개발 </a> 
								<a href="./Search.le?t1=it-programming&t2=infra" class="acco_ctt"> 인프라 </a> 
								<a href="./Search.le?t1=it-programming&t2=iot" class="acco_ctt"> 사물인터넷 </a> 
								<a href="./Search.le?t1=it-programming&t2=blockchain" class="acco_ctt"> 블록체인 </a>
							</div>
					</div><!-- IT 아코디언 -->
			
					<div class="accord">
						<button class="nav-accordion">크리에이티브</button>
							<div class="panel">
								<a href="./Search.le?t1=creative" class="acco_ctt"> ALL </a>
								<a href="./Search.le?t1=creative&t2=3d_modeling" class="acco_ctt"> 3D 모델링 </a> 
								<a href="./Search.le?t1=it-programming&t2=graphic-design" class="acco_ctt"> 그래픽 디자인 </a> 
								<a href="./Search.le?t1=it-programming&t2=youtube" class="acco_ctt"> 영상 편집, 유튜브 </a> 
								<a href="./Search.le?t1=it-programming&t2=movie-graphic" class="acco_ctt"> 영화 그래픽 </a> 
								<a href="./Search.le?t1=it-programming&t2=webapp-design" class="acco_ctt"> 웹앱 디자인 </a> 
								<a href="./Search.le?t1=it-programming&t2=game-design" class="acco_ctt"> 게임 디자인 </a> 
								<a href="./Search.le?t1=it-programming&t2=ux-ui" class="acco_ctt"> UX/UI </a> 
								<a href="./Search.le?t1=it-programming&t2=sound" class="acco_ctt"> Sound </a> 
								<a href="./Search.le?t1=it-programming&t2=ar-vr" class="acco_ctt"> AR/VR </a>
							</div>
					</div><!-- 크리에이티브 아코디언 -->
			
					<div class="accord">
						<button class="nav-accordion">업무 스킬</button>
							<div class="panel">
								<a href="./Search.le?t1=business" class="acco_ctt"> ALL </a> 
								<a href="./Search.le?t1=business&t2=office" class="acco_ctt"> MS-OFFICE </a> 
								<a href="./Search.le?t1=it-programming&t2=marketing" class="acco_ctt"> 마케팅 </a> 
								<a href="./Search.le?t1=it-programming&t2=finance" class="acco_ctt"> 금융, 주식, 투자 </a> 
								<a href="./Search.le?t1=it-programming&t2=data-analysis" class="acco_ctt"> 데이터 분석 </a> 
								<a href="./Search.le?t1=it-programming&t2=task-automation" class="acco_ctt"> 업무 자동화 </a> 
								<a href="./Search.le?t1=it-programming&t2=accounting" class="acco_ctt"> 회계, 재무 </a> 
								<a href="./Search.le?t1=it-programming&t2=management" class="acco_ctt"> 경영지식 </a> 
								<a href="./Search.le?t1=it-programming&t2=project-manage" class="acco_ctt"> 기획 프로젝트 관리 </a> 
								<a href="./Search.le?t1=it-programming&t2=writing" class="acco_ctt"> 글쓰기 </a> 
								<a href="./Search.le?t1=it-programming&t2=self-dev" class="acco_ctt"> 자기 계발 </a> 
								<a href="./Search.le?t1=it-programming&t2=foreign-language"class="acco_ctt"> 외국어 </a>
							</div>
					</div><!-- 업무스킬 아코디언 -->
				</nav><!-- accordion_category -->
			</aside><!-- sbar_left -->
	</div><!-- 사이드끝 --> 
	<div id="exit" onclick="off()"> </div><!--   여백누르면닫힘 -->
</div><!-- 오버레이끝 -->

<!-- 오버레이 켜기/끄기 -->
<script>
function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
}
</script>


<!-- accordion -->
<script>
var acc = document.getElementsByClassName("nav-accordion");
var i;
	$(".accord").on("click",function(){
		console.log("click");
		var panel = $(this).children(".panel").prop("scrollHeight");
		if($(this).children(".panel").css("maxHeight")!="0px"){
			$(this).children(".panel").css("maxHeight","0px");
		}else{
		$(this).children(".panel").css("maxHeight",panel+"px");
		}
	});
	
/* for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
    	
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
} */
</script>

</body>
</html>
