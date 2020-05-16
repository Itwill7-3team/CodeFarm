<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://kit.fontawesome.com/2441771e3f.js"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-강의만들기</title>
<link href="./css/addLecture.css" rel="stylesheet">

	

	
</head>
<body>
	<jsp:include page="/include/header.jsp" />
	<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>

	<div class="header">
		<div class="header_center">
			<span class="header_title">내 강의 만들기</span>
			<div class="header_right">
				<button class="right_btn">강의보기</button>
				<button class="right_btn green">저장</button>
			</div>
		</div>
	</div>
	<div class="content_cover">
		<div class="content">
			<aside class="sidebar">
			<div class="side_menu">
				<div class="side_title">강의제작</div>
				<div class="side_items">
					<div class="side_item active" data-type="information">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">강의정보</span>
					</div>
					<div class="side_item " data-type="introduction">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">상세소개</span>
					</div>
					<div class="side_item" data-type="curriculum">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">커리큘럼</span>
					</div>
					<div class="side_item" data-type="cover-img">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">커버이미지</span>
					</div>
				</div>

			</div>
			<div class="side_menu">
				<div class="side_title">설정</div>
				<div class="side_items">
					<div class="side_item">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">강의설정</span>
					</div>
					<div class="side_item">
						<i class="fas fa-check-circle"></i><span class="item_title mouse">지식공유자
							설정</span>
					</div>
				</div>

			</div>
			<div class="submit_button">
				<button class="button submit">제출하기</button>
				<button class="button red" onclick="javascript:history.back();">나가기</button>
			</div>
			</aside>
			<div class="main_content_cover">
				<h4 class="title_heading">강의제작</h4>
				<h4 class="title_sub_heading">강의 정보</h4>
				<div class="main_content" id="information">
				<div class="field">
					<div class="title input_item">
						<label class="menu_label">강의 제목</label>
						<div class="input_box">
							<input class="box_input" name="title" placeholder="제목을 입력해주세요"
								autocomplete="off">
						</div>
					</div>
				</div>
				<div class="field">
					<div class="label_box">
						<label class="menu_label">이런걸 배울수 있어요 <span class="tip">Tip<i
								class="fas fa-angle-right"></i></span></label>
					</div>
						<input class="box_input" name="title" placeholder="ex)리엑트 네이티브 개발" autocomplete="off">
						<button class="addInput button" data-name="abilities" value="1">추가하기</button>
					<div class="warn_wrap"><span>두개이상 넣어주세요</span></div>
						<ol class="boxes abilities">
						</ol>
				</div>
				<div class="field">
					<div class="label_box">
						<label class="menu_label">이런 분들에게 추천해요 <span class="tip">Tip
						<i class="fas fa-angle-right"></i></span></label>
					</div>
						<input class="box_input" name="title" placeholder="ex)코딩 처음 접하는 사람" autocomplete="off">
						<button class="addInput button" data-name="targets" value="1">추가하기</button>
						<div class="warn_wrap"><span>두개이상 넣어주세요</span></div>
						<ol class="boxes targets">
						</ol>
				</div>
				<div class="field">
					<div class="label_box">
						<label class="menu_label">선수 지식이 필요하다면 무엇인가요? <span
							class="select">(선택)</span></label>
					</div>
						<input class="box_input" name="title" placeholder="ex)C언어" autocomplete="off">
						<button class="addInput button" data-name="based" value="1">추가하기</button>
						
						<ol class="boxes based">
						</ol>
				</div>
					<div class="field">
						<div class="label_box">
							<label class="menu_label">카테고리 </label>
							<div class="button_box">
								<button class="button category1" value="IT프로그래밍">IT프로그래밍</button>
								<button class="button category1" value="크리에이티브">크리에이티브</button>
								<button class="button category1" value="업무스킬">업무스킬</button>
								<button class="button category1" value="그외">그외</button>
							</div>
						</div>
					</div>
					<div class="field">
						<div class="title button_item">
							<label class="menu_label">강의수준</label>
							<div class="button_box">
								<button class="button level" value="입문">입문</button>
								<button class="button level" value="초급">초급</button>
								<button class="button level" value="중급">중급</button>
								<button class="button level" value="고급">고급</button>
							</div>
							<input type="hidden">
						</div>
					</div>
				</div>
				<div class="main_content" id="introduction">
					<div class="title textarea_item">
						<label class="menu_label">강의 두줄 요약 </label>
						<textarea class="textarea" name="title"
							placeholder="주제에 대한 설명을 적어주세요" autocomplete="off"></textarea>
					</div>
					<hr>
					<div class="notification">
						<h3 class="bold">소개글을 충실히 작성해 주세요</h3>
						<p>
							강의 소개글은 강의 수강신청 및 판매율에 결정적인 영향을 끼칩니다.<br> 최소 7줄 이상의 소개를
							부탁드려요!<br> 강의 소개글 분량이 모자란 경우, 제출 후 반려될 수 있습니다.
						</p>
						<br> <br>
						<h3 class="bold">매력적인 소개글</h3>
						<p>
							학생들이 강의 소개를 볼 때 수강하고 싶도록 마음껏 내 강의의 매력을 어필해 보세요.<br> <span
								class="bold">사진, 그래프, 영상</span>등 설득될만한 자료를 꼭 첨부해 주세요!
						</p>
						<br> <br>
						<p>
							혹시 강의 소개 작성이 막막한 분들을 위해 가이드를 준비했어요<br> 가이드를 보고 싶은 분들은 <a
								href="#">이곳</a> 을 클릭!!
						</p>
					</div>
					<div class="body textarea_item">
						<label class="menu_label">강의 상세 내용(해당내용은 강의 상세페이지에서
							보여집니다.)</label>
						<!-- 에디터 넣는자리  시작 -->
						<div id="summernote">Hello Summernote</div>
						<!-- 에디터 넣는자리 끝  -->
					</div>
				</div>
				<div class="main_content" id="curriculum">
					<div class="notification">
						<h3 class="bold">영상 등록</h3>
						<p>
							강의의 커리큘럼을 모두 작성한 뒤 수업마다 영상을 연결해 주셨나요?<br> 일부 영상에 재생 에러가 발생할
							경우, 파일명을 바꿔서 재업로드해주세요.<br> 강의 커리큘럼이 확정되지 않으면 강의를 오픈할 수 없습니다.
						</p>
						<br> <br>
						<h3 class="bold">무료공개 수업 최소 1개 이상!</h3>
						<p>
							무료공개 수업을 최소 한 개 이상 설정해주세요.<br> 강의를 잘 표현 할 수 있는 좋은 수업을 보여준다면
							수강신청률이 올라갑니다.
						</p>
						<br> <br>
						<h3 class="bold">여러개의 섹션으로 나눠주세요</h3>
						<p>
							수업들을 여러 섹션으로 잘게 묶어 놓으면 학생들이 훨씬 효과적으로 학습할 수 있습니다.<br> 보통 1개
							섹션당 4~6개의 수업으로 구성하면 좋아요!
						</p>
					</div>
					<div class="section_cover">
						<div class="section input_item">
							<label class="menu_label">섹션 0</label> <input type="text"
								class="box_input" placeholder="섹션제목을 적어주세요" autocomplete="off">
							<input class="addvideo button" value="영상추가하기" type="file">영상
							추가하기
							</button>
						</div>
					</div>
					<button class="addsection button" value="1">섹션 추가하기</button>
				</div>
				<div class="main_content" id="cover-img">
					<div class="title input_item">
						<button class="addimg button" value="1">메인 사진 추가하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//태그 다완성되면 시작됨
		
$(document).ready(function() {
	$("header").removeClass("sticky");
	//시작할때 하나 화면출력
	$("#information").css("display", "block");
	 //에디터

	$('#summernote').summernote({
			  height: 500,                 // set editor height
			  minHeight: null,             // set minimum height of editor
		      maxHeight: null,             // set maximum height of editor
		      focus: true,                  // set focus to editable area after initializing summernote
		      lang: "ko-KR",					// 한글 설정
				placeholder: '내용을 입력하세요 :-D',	//placeholder 설정

		  });


	//에디터 끝 
	
	
	//클릭하면 display 나옴
	$(".side_item").click(function() {
		$(".side_item.active").addClass("final");
		$(".side_item").removeClass("active");
		$(this).addClass("active");
		var active = $(this).attr("data-type");
		$(".main_content").css("display", "none");
		$('#' + active).css("display","block");
		$(".title_sub_heading").html(
		$(this).children("span").html());
	});
	//btn클릭시  active클래스 추가
	$(".level").click(function() {
		$(".level").removeClass("active");
		$(this).addClass("active");
	});
		$(".category1").click(function() {
		$(".category1").removeClass("active");
		$(this).addClass("active");
	});
	//input버튼 새로 추가하는 액션
	$(".addInput").click(function() {
		var type=$(this).attr("data-name");
		var name = $(this).prev("input:first").attr("name");
		var placeholder = $(this).prev("input:first").attr("placeholder");
		var value=$(this).prev("input:first").val();
		console.log(name + placeholder+ value);
		$(this).siblings(".boxes").append(
		'<li class="dynamic_box" data-content='+type+'>'
			+'<div class="content_box">'
				+value
			+"</div>"
			+'<div class="btns">'
				+'<a class="btn_icon del">'+'<i class="fas fa-trash-alt"></i>'+'</a>'
				+'<span class="btn_icon handle">'+'<i class="fas fa-grip-lines"></i>'+'</span>'
			+'</div>'
		+'</li>');
	});
	//동영상 추가 이벤트

	//섹션추가 이벤트
	var sectionNum = 1;
	$(".addsection").click(function() {
		$(this).parent().children(".section_cover").append(
		'<div class="section input_item">'
		+ '<label class="menu_label">섹션 '
		+ sectionNum
		+ '</label>'
		+ '<input type="text" class="input" placeholder="섹션제목을 적어주세요" autocomplete="off">'
		+ '<button class="addvideo button" value="1">영상 추가하기</button>'
		+ '</div>');
	sectionNum++;
	});

	//textarea 자동으로 세로너비 증가
	function xSize(e) {
	e.style.height = '1px';
	e.style.height = (e.scrollHeight + 12) + 'px';
	}

	//제출하기 버튼 누르면 발생하는 이벤트
	$(".button.submit").click(
	function() {
	var title = $(".title.input_item").val();
	var content = $(".course_summary.input_item").children(".input_box").children(".input");
	});
});
	</script>

</body>
</html>