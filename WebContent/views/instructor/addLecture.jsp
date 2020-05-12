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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<script>
		$(document).ready(function() {
			$(".side_item").click(function() {
				$(".side_item").removeClass("active");
				$(this).addClass("active");
			});
		});
	</script>
	<div class="header">
		<span class="header_title">내 강의 만들기</span>
	</div>
	<div class="content">
		<aside class="sidebar">
		<div class="side_menu">
			<div class="side_title">강의제작</div>
			<div class="side_items">
				<div class="side_item active">
					<i class="fas fa-check-circle"></i><span class="item_title mouse">강의정보</span>
				</div>
				<div class="side_item ">
					<i class="fas fa-check-circle"></i><span class="item_title mouse">상세소개</span>
				</div>
				<div class="side_item">
					<i class="fas fa-check-circle"></i><span class="item_title mouse">커리큘럼</span>
				</div>
				<div class="side_item final">
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

			<div class="submit_button">
				<button class="btn">제출하기</button>
			</div>
		</div>
		</aside>
		<div class="main_content_cover">
			<div class="main_content">
				<div class="title input_item">
					<label class="menu_label">강의 제목</label> <input class="input"
						name="title" placeholder="제목을 입력해주세요" autocomplete="off">

				</div>
				<div class="title input_item">
					<label class="menu_label">이런걸 배울수 있어요 <span class="tip">Tip></span></label>
					<input class="input" name="title" placeholder="ex)리액트 네이티브 개발"
						autocomplete="off">
					<button class="addInput btn">추가하기</button>
				</div>
				<div class="title input_item">
					<label class="menu_label">이런 분들에게 추천해요 <span class="tip">Tip></span></label>
					<input class="input" name="title" placeholder="ex)코딩을 처음 접하는 사람"
						autocomplete="off">
					<button class="addInput btn">추가하기</button>
				</div>
				<div class="title input_item">
					<label class="menu_label">선수 지식이 필요하다면 무엇인가요? <span
						class="select">(선택)</span></label> <input class="input" name="title"
						placeholder="ex)c언어" autocomplete="off">
					<button class="addInput btn">추가하기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(".addInput").click(function() {
			var name = $(this).prev(["input"]).attr("name");
			var placeholder = $(this).prev(["input"]).attr("placeholder");
			var label = $(this).prev(["label"]).val();
			console.log(name + placeholder + label);
		});
		function xSize(e) {
			e.style.height = '1px';
			e.style.height = (e.scrollHeight + 12) + 'px';
		}
	</script>
</body>
</html>