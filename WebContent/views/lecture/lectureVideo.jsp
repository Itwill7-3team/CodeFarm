<%@page import="java.util.ArrayList"%>
<%@page import="com.lecture.db.FileDTO"%>
<%@page import="com.lecture.db.LectureDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코딩팜 - ${ ldto.l_title }</title>
<script src="https://kit.fontawesome.com/2441771e3f.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width, user-scalable=yes,initial-scale=1.0, maximum-scale=3.0"/>

<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<link href="./css/lecture.css" rel="stylesheet">
</head>
<body>
<%
String m_email = (String)session.getAttribute("m_email");
int l_number = Integer.parseInt(request.getParameter("l_number"));
int f_num = Integer.parseInt(request.getParameter("f_num"));

LectureDTO ldto  = (LectureDTO)request.getAttribute("ldto");
List<List<FileDTO>> fileSet = (List<List<FileDTO>>)request.getAttribute("fileSet");

/* 파일 개수, 시간 계산 */
int fileCount = 0;
double totalTime = 0;
int total_Hour = 0;
int total_Min = 0;
ArrayList<FileDTO> fileList = new ArrayList<FileDTO>();

for(int i=0; i<fileSet.size(); i++){
	for(int j=0; j<fileSet.get(i).size(); j++){
		fileList.add(fileSet.get(i).get(j));
		totalTime += fileList.get(fileCount).getF_playtime();
		fileCount++;
	}
}

if(totalTime >= 3600){
	total_Hour = (int)(totalTime / 3600);
	total_Min = (int)((totalTime - (total_Hour * 3600)) / 60);
}else{
	total_Hour = 0;
	total_Min = (int)(totalTime / 60);
}
/* 파일 개수, 시간 계산 */

%>

	<div id="root">
		<main id ="main">
			<section class="lecture_container">
				<a class="toggle_left"></a>
				<aside class="lecture_nav_left" id="mySidenavL">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNavL()">&times;</a>
					<div class="lecture_nav_left_header">
						<h5>${ ldto.l_title }</h5>
						<P>
							<span class="period">기간 : </span>
							 무제한
						</P>
						<div class="progress_container">
							<div class="farm_progress">
								<label for="farm_mv">진도율 : 0강/<%= fileCount %>강 (0%) | 시간 : 0분/<%=total_Min %>분</label>
								<progress class="progress" id="farm_mv" value="0" max="100">0%</progress>
							</div>
						</div>
					</div>
					<div class="curriculum">
						<ul>
<%
fileCount = 0;
for(int i=0; i<fileSet.size(); i++){
	List<FileDTO> fdto = fileSet.get(i);
%>
							<li class="list unit unit_section">
								<span class="list_item unit_title">섹션 <%= i %>.<%= fdto.get(fileCount).getF_sec_name() %></span>
							</li>
<%
for(int j=0; j<fileSet.get(i).size(); j++){
%>						
							
							<li class="list unit unit_lecture" href="./LectureVideo.le?l_number=<%= ldto.getL_number() %>&f_num=<%= fdto.get(j).getF_num() %>">
								<span class="list_item unit_title"><%= fdto.get(j).getF_col_name() %></span>
								<span class="unit_checked icon">
									<i class="far fa-check-square" ></i>
								</span>
							</li>
<% }} %>

							<li class="list unit unit_section">
								<span class="list_item unit_title">구구단</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-1. 리액트를 왜 쓰는가</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-2. 첫 리액트 컴포넌트</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-3. HTML 속성과 상태(state)</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-4. JSX와 바벌(babel)</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-5. 첫 번째 Q&A</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-6. 구구단 리액트로 만들기</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-7. 클래스 메서드</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-8. Fragment와 기타 팁</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-9. 함수형 setState</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">1-10. ref</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_section">
								<span class="list_item unit_title">끝말잇기</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">2-1. React Hooks 사용하기</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
							<li class="list unit unit_lecture">
								<span class="list_item unit_title">2-2. Class와 Hooks 비교하기</span>
								<span class="unit_checked icon">
									<i class="far fa-check-square"></i>
								</span>
							</li>
						</ul>
					</div>
				</aside><!-- lecture_nav_left -->
				<div class="content_container center" id="center">
					<header class="content_header_nav">
						<div class="toggle_left">
							<a class="button is_open"  onclick="openNavL()">
								<span>&#9776; open</span>
							</a>
						</div>
						<div class="unit_title">
							<h1> 1-1. 리액트를 왜 쓰는가</h1>
						</div>
						<div class="right_buttons">
							<button class="button go_out_course" onclick="location.href='Detail.le?num=<%=l_number%>';">
								<span>
									<i class="fas fa-door-open"></i>
								</span>
								<span class="">나가기</span>
							</button>
							<button class="button toggle_right" onclick="openNavR()">
								<span>
									<i class="fab fa-quora"></i>
								</span>
								<span class="">질문하기</span>
							</button>
						</div>
					</header>
					<div class="content unit_body">
						<div class="player_cover">
							<div class="video_container">
								
								
								 <!-- <iframe src="https://www.youtube.com/embed/60ctvQsY7ws?rel=0&amp;modestbranding=1&amp;vq=hd720&amp;autoplay=1&amp;enablejsapi=1"
								x-webkit-airplay="allow" preload="none" style="width: 100%; height: 100%; object-fit: contain; transition: filter 0.2s linear 0s; min-height: auto; max-height: none; min-width: auto; max-width: none;"
								></iframe>  -->
																
									<div class="playjs">
										<div class="playjs2">
										
								 <!-- <iframe width="100%" height="100%"
  										src="https://www.youtube.com/embed/60ctvQsY7ws?rel=0&amp;modestbranding=1&amp;vq=hd720&amp;autoplay=1&amp;enablejsapi=1" 
  										frameborder="0" allow="autoplay; encrypted-media" allowfullscreen="allowfullscreen" 
  										data-gtm-yt-inspected-8964582_7="true" id="212470628">
								</iframe> -->
										<video src="./css/Pasta-33256.mp4" controls autoplay frameborder="0">
										
										</video>
										<!-- <iframe src="./css/Pasta-33256.mp4"
										frameborder="0" allow="autoplay; encrypted-media" x-webkit-airplay="allow" preload="none" allowfullscreen="allowfullscreen" id="iframe_1">
										</iframe> -->
										</div>
									</div>
								
							</div>
						</div>
					</div>
					<footer class="content_footer_nav navbar">
						<div class="navbar_item toggle_right" onclick="openNavR()">
							<button class="button is_no_border">
								<i class="fab fa-quora"></i>
								 질문하기
							</button>
						</div>
						<div class="navbar_item">
							<button class="button is_checked">
								<i class="fas fa-book-open"></i>
							</button>
						</div>
						<div class="navbar_item">
							<button class="button is_no_border" onclick="location.href='LectureVideo.le?l_number=<%=l_number %>&f_num=<%=f_num+1%>';">
								<i class="fas fa-step-forward"></i>
								다음강의
							</button>
						</div>
					</footer>
				</div><!-- content_container -->
				<aside>
					<div class="lecture_nav lecture_nav_right" id="mySidenavR">
						<div class="right_header">
							<a href="javascript:void(0)" class="closebtn toggle_right" onclick="closeNavR()">&times;</a>
							<h3>질문 게시판</h3>
							<div class="post_editor">
								<div class="search search_bar">
									<input type="text" class=input placeholder="질문검색">
									<i class="fas fa-search"></i>
								</div>
								<div class="buttons askBtn">
									<input type="button" class="button" value="직접입력">								
								</div>
								<!-- askForm -->
								<div class="editor" style="display: none;">
								<iframe src="AskWrite.bo" name="askF"></iframe>
								</div>
								<!-- askForm -->
							</div>
						</div>
						<div class="unit_post_list">
							<ul></ul>
						</div>
					</div>
				</aside>
			</section><!-- lecture_container -->
		</main><!-- main -->
	</div><!-- root -->
<script type="text/javascript">
$(".askBtn").click(function(){
  $(".editor").toggle();
});
</script>
	
	
<script>
function openNavL() {
	$("#mySidenavL").animate({'left':0},'slow');
	document.getElementById("mySidenavL").style.width = "330px";
	}
function closeNavL() {
	$("#mySidenavL").animate({'left':'-330px'},'slow');
	
	}
function openNavR() {
	document.getElementById("mySidenavR").style.width = "420px";
	document.getElementById("center").style.marginRight = "420px";
	}
function closeNavR() {
	document.getElementById("mySidenavR").style.width = "0";
	document.getElementById("center").style.marginRight = "0";
	}
	
$(function(){
	$(".toggle_right").click(function(){
		if($(".content_container").hasClass("right_opend")){
			$(".content_container").removeClass("right_opend");
			document.getElementById("mySidenavR").style.width = "0";
	  		document.getElementById("center").style.marginRight = "0";
		}else{
			$(".content_container").addClass("right_opend");
			/* document.getElementById("iframe_1").style.marginRight = "420px"; */
		}
	});
	$(".closebtn.toggle_right").click(function(){
		$(".content_container").removeClass("right_opend");
	});
});
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}



/* function is_now(){
	var f_num = getParameterByName("f_num");
	var unit = document.getElementByClass(".unit_lecture").href */
	/* var unit = document.getElementByClass(".unit_lecture").href */
/* 	var loc = window.location.href
	console.log("F"+f_num+"U"+unit+"L"+loc);
	if(document.getElementById(".unit_lecture").href == window.location.href){
		$(".unit_lecture").addClass("is_now");
	}
}

$(".unit_lecture").click(function(){
	is_now();
	document.location.href = $(this).attr("href");
}); */


</script>
</body>
</html>