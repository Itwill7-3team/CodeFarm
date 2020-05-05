<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>


/* 아코디언시작 */

.accordion_header {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;/*  */
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
  
}
.active, .accordion_header:hover {
  background-color: #ccc;
}
.accordion_header:after {
  content: '\002B';
  color: #777;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}
.active:after {
  content: "\2212";
}
.panel {
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  /* padding: 0 18px; */
}
/* 아코디언 끝  */

.container{
	display: block;
	flex-grow: 1;
    margin: 0 auto	0 0;
    position: relative;
}


/* sidebar_left */
.accordions .accordion:not(:last-child) {
    margin-bottom: 0;
}
.accordions .accordion .accordion_header { 
    cursor: pointer;
    align-items: center;
    line-height: 1.25;
    position: relative;
}
.container .accordions .accordion_header {
    border-bottom: 1px solid #e4e4e4;
    border-right: 1px solid #e4e4e4;
    border-left: 1px solid #e4e4e4;
    color: #fff;
    background: #FD8E6A;
    justify-content: center;
    height: 50px;
    border-radius: 0;
    white-space: nowrap;
    font-weight: 700;

}
.container .accordions .accordion:first-of-type .accordion_header {
    border-top: 1px solid #e4e4e4;
}
.accordions .accordion .accordion_header+.panel {
    overflow-y: hidden;
    max-height: 0;
    border-radius: 4px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    transition: max-height .2s ease;
}
.container .accordions .panel {
    color: #595959;
    background: #fff;
    border: 0;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.accordions .accordion:not(:last-child) .accordion_content {
    border-radius: 0;
}
.accordions .accordion a:not(.button):not(.tag) {
    color: currentColor;
}
.container .accordions .accordion_content {
    display: inline-flex;
    text-decoration: none;
    width: 100%;/*  */
    white-space: nowrap;
    cursor: pointer;
    align-items: center;
    justify-content: center;
    background: #fff;
    border-bottom: 1px solid #e4e4e4;
    border-right: 1px solid #e4e4e4;
    border-left: 1px solid #e4e4e4;
    height: 50px;
    padding: 0;
}

/* 오버레이 */
#overlay {
  position: fixed;
  display: none;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0,0,0,0.2);
  z-index: 2;
  cursor: pointer;
}

#m-side-menu{ /* 사이드메뉴들어감 */
  position: absolute;
  background-color:white;
  top: 50%;
  left: 25%;
  width: 50%;
  color: white;
  transform: translate(-50%,-50%);
  -ms-transform: translate(-50%,-50%);
  overflow: auto;
  height: 100%;
}

#exit{ /* 반투명 회색 여백 클릭하면 나가게 */
  position: absolute;
  top: 50%;
  left: 75%;
  width: 50%;
  height: 100%;
  font-size: 50px;
  color: white;
  transform: translate(-50%,-50%);
  -ms-transform: translate(-50%,-50%);
}


</style>
</head>
<body>

   


<!-- <button onclick="on()">Turn on overlay effect</button> -->

<div id="overlay"><!-- 오버레이 영역 -->
	<div id="m-side-menu"><!-- 사이드영역 -->
			<aside class="container columns column sidebar_left" >
				<nav class="accordions accordion_category">
					<div class="accordion">
						<button class="accordion_header">IT 프로그래밍</button>
							<div class="panel">
								<a href="#" class="accordion_content"> ALL </a>
								<a href="#" class="accordion_content"> 웹개발 </a>
								<a href="#" class="accordion_content"> 모바일 앱 </a> 
								<a href="#" class="accordion_content"> 게임 개발 </a>
								<a href="#" class="accordion_content"> 데이터 사이언스 </a>
								<a href="#" class="accordion_content"> 보안 </a> 
								<a href="#" class="accordion_content"> 인공지능 </a> 
								<a href="#" class="accordion_content"> 알고리즘 </a> 
								<a href="#" class="accordion_content"> 교양 </a> 
								<a href="#" class="accordion_content"> 수학 </a> 
								<a href="#" class="accordion_content"> 서버 </a> 
								<a href="#" class="accordion_content"> 자동화 </a> 
								<a href="#" class="accordion_content"> 데이터베이스 </a> 
								<a href="#" class="accordion_content"> 개발도구 </a> 
								<a href="#" class="accordion_content"> 프레임워크 및 라이브러리 </a> 
								<a href="#" class="accordion_content"> 프로그래밍 언어 </a> 
								<a href="#" class="accordion_content"> 서비스 개발 </a> 
								<a href="#" class="accordion_content"> 인프라 </a> 
								<a href="#" class="accordion_content"> 사물인터넷 </a> 
								<a href="#" class="accordion_content"> 블록체인 </a>
							</div>
					</div><!-- IT 아코디언 -->
			
					<div class="accordion">
						<button class="accordion_header">크리에이티브</button>
							<div class="panel">
								<a href="#" class="accordion_content"> ALL </a>
								<a href="#" class="accordion_content"> 3D 모델링 </a> 
								<a href="#" class="accordion_content"> 그래픽 디자인 </a> 
								<a href="#" class="accordion_content"> 영상 편집, 유튜브 </a> 
								<a href="#" class="accordion_content"> 영화 그래픽 </a> 
								<a href="#" class="accordion_content"> 웹앱 디자인 </a> 
								<a href="#" class="accordion_content"> 게임 디자인 </a> 
								<a href="#" class="accordion_content"> UX/UI </a> 
								<a href="#" class="accordion_content"> Sound </a> 
								<a href="#" class="accordion_content"> AR/VR </a>
							</div>
					</div><!-- 크리에이티브 아코디언 -->
			
					<div class="accordion">
						<button class="accordion_header">업무 스킬</button>
							<div class="panel">
								<a href="#" class="accordion_content"> ALL </a> 
								<a href="#" class="accordion_content"> MS-OFFICE </a> 
								<a href="#" class="accordion_content"> 마케팅 </a> 
								<a href="#" class="accordion_content"> 금융, 주식, 투자 </a> 
								<a href="#" class="accordion_content"> 데이터 분석 </a> 
								<a href="#" class="accordion_content"> 업무 자동화 </a> 
								<a href="#" class="accordion_content"> 회계, 재무 </a> 
								<a href="#" class="accordion_content"> 경영지식 </a> 
								<a href="#" class="accordion_content"> 기획 프로젝트 관리 </a> 
								<a href="#" class="accordion_content"> 글쓰기 </a> 
								<a href="#" class="accordion_content"> 자기 계발 </a> 
								<a href="#"class="accordion_content"> 외국어 </a>
							</div>
					</div><!-- 업무스킬 아코디언 -->
				</nav><!-- accordion_category -->
			</aside><!-- sidebar_left -->
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

</body>
</html>