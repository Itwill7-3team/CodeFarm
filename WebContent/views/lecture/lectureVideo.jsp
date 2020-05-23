<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/lecture.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/2441771e3f.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width, user-scalable=yes,initial-scale=1.0, maximum-scale=3.0"/>
</head>
<body>
	<div id="root">
		<main id ="main">
			<section class="lecture_container">
				<a class="toggle_left"></a>
				<aside class="lecture_nav_left" id="mySidenavL">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNavL()">&times;</a>
					<div class="lecture_nav_left_header">
						<h5>웹 게임을 만들며 배우는 React</h5>
						<P>
							<span class="period">기간 : </span>
							 무제한
						</P>
						<div class="progress_container">
							<div class="farm_progress">
								<label for="farm_mv">진도율 : 0강/64강 (0%) | 시간 : 0분/764분</label>
								<progress class="progress" id="farm_mv" value="0" max="100">0%</progress>
							</div>
						</div>
					</div>
					<div class="curriculum">
						<ul>
							<li class="list unit unit_section">
								<span class="list_item unit_title">구구단</span>
							</li>
							<li class="list unit unit_lecture is_now">
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
							<button class="button go_out_course">
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
								
								<!-- <iframe width="100%" height="100%"
  										src="https://www.youtube.com/embed/60ctvQsY7ws?rel=0&amp;modestbranding=1&amp;vq=hd720&amp;autoplay=1&amp;enablejsapi=1" 
  										frameborder="0" allow="autoplay; encrypted-media" allowfullscreen="allowfullscreen" 
  										data-gtm-yt-inspected-8964582_7="true" id="212470628">
								</iframe> -->
								
								<!-- <iframe src="https://www.youtube.com/embed/60ctvQsY7ws?rel=0&amp;modestbranding=1&amp;vq=hd720&amp;autoplay=1&amp;enablejsapi=1"
								x-webkit-airplay="allow" preload="none" style="width: 100%; height: 100%; object-fit: contain; transition: filter 0.2s linear 0s; min-height: auto; max-height: none; min-width: auto; max-width: none;"
								></iframe> -->
								
								<iframe src="https://www.youtube.com/embed/60ctvQsY7ws?rel=0&amp;modestbranding=1&amp;vq=hd720&amp;autoplay=1&amp;enablejsapi=1"
								style="display:block; width:90vw; height: 85vh; border: none;" id="iframe_1">
								
								</iframe>
								
								
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
							<button class="button is_no_border">
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
								<div class="buttons">
									<input type="button" value="질문하기">								
								</div>
								<div class="editor">
								
									<!-- include libraries(jQuery, bootstrap) -->
									<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
									<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
									<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
									
									<!-- include summernote css/js -->
									<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
									<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
									
									<script type="text/javascript">
									
									(function($){
									  // 여기에 코드를 작성
										$(document).ready(function() {
											  $('#summernote').summernote({
												  height: 200,                 // set editor height
												  minHeight: null,             // set minimum height of editor
											      maxHeight: null,             // set maximum height of editor
											      focus: true,                  // set focus to editable area after initializing summernote
											      lang: "ko-KR",					// 한글 설정
													placeholder: '답글을 입력하세요 :-D',	//placeholder 설정
									
											  });
											});
									
											/* 이미지.. */
											$('#summernote').summernote('insertImage', url, function ($image) {
												  $image.css('width', $image.width() / 3);
												  $image.attr('data-filename', 'retriever');
												});
									})(jQuery);
									
									
									</script>
																	
																	
																	
										<div class="ask_form">
										<form action="AskAction.bo?" method="post">
										<input type="hidden" name="num" value="1"> <!-- test값 -->
										<input type="hidden" name="writer" value="admin"> <!-- test값 -->
										제목 : <input type="text" name="title">
										<textarea name="content" id="summernote">
										</textarea>
										<input type="submit" value="글쓰기">
										</form>
									</div>
									
									
									
								</div>
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
	
<script>
function openNavL() {
	document.getElementById("mySidenavL").style.width = "330px";
	}
function closeNavL() {
	document.getElementById("mySidenavL").style.width = "0";
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

</script>
</body>
</html>