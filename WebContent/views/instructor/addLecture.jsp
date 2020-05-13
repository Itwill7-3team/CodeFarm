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
  src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
  integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs="
  crossorigin="anonymous"></script>
</head>
<body>
	
	<div class="header">
		<span class="header_title">내 강의 만들기</span>
	</div>
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
				<div class="side_item final" data-type="cover-img">
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
				<button class="btn">제출하기</button>
				<button class="btn red" onclick="javascript:history.back();">나가기</button>
			</div>
		</aside>
		<div class="main_content_cover">
			<div class="main_content" id="information">
				<div class="title input_item">
					<label class="menu_label">강의 제목</label> 
					<div class="input_box">
					<input class="input"
						name="title" placeholder="제목을 입력해주세요" autocomplete="off">
						</div>
				</div>
				<div class="title input_item">
					<label class="menu_label">이 강의는</label> <div class="input_box">
					<input class="input"
						name="title" placeholder="강의에 대한 짧은 설명을 적어주세요" autocomplete="off">
						</div>
				</div>
				<div class="title input_item">
					<label class="menu_label">이런걸 배울수 있어요 <span class="tip">Tip<i class="fas fa-angle-right"></i></span></label>
					<div class="input_box">
					<input class="input"
						name="title" placeholder="ex)리엑트 네이티브 개발" autocomplete="off">
						</div>
					<button class="addInput btn" value="1">추가하기</button>
				</div>
				<div class="title input_item">
					<label class="menu_label">이런 분들에게 추천해요 <span class="tip">Tip<i class="fas fa-angle-right"></i></span></label>
					<div class="input_box">
					<input class="input"
						name="title" placeholder="ex)코딩 처음 접하는 사람" autocomplete="off">
						</div>
					<button class="addInput btn" value="1">추가하기</button>
				</div>
				<div class="title input_item">
					<label class="menu_label">이강의에서 다루는 툴<span class="tip">Tip<i class="fas fa-angle-right"></i></span></label>
					<div class="input_box">
					<input class="input"
						name="title" placeholder="ex)코딩 처음 접하는 사람" autocomplete="off">
						</div>
					<button class="addInput btn" value="1">추가하기</button>
				</div>
				<div class="title input_item">
					<label class="menu_label">선수 지식이 필요하다면 무엇인가요? <span class="select">(선택)</span></label>
					<div class="input_box">
					<input class="input"
						name="title" placeholder="ex)C언어" autocomplete="off">
						</div>
					<button class="addInput btn" value="1">추가하기</button>
				</div>
				
				<div class="title input_item">
					<label class="menu_label">카테고리 </label> 
					<div class="button_box">
					<button class="btn category1" value="IT프로그래밍">IT프로그래밍</button>
					<button class="btn category1" value="크리에이티브">크리에이티브</button>
					<button class="btn category1" value="업무스킬">업무스킬</button>
					<button class="btn category1" value="그외">그외</button>
					</div>
				</div>
				<div class="title input_item">
					<label class="menu_label">강의수준</label> 
					<div class="button_box">
					<button class="btn level" value="입문">입문</button>
					<button class="btn level" value="초급">초급</button>
					<button class="btn level" value="중급">중급</button>
					<button class="btn level" value="고급">고급</button>
					</div>
					<input type="hidden" >
				</div>
			</div>
			<div class="main_content" id="introduction">
				<div class="title input_item">
					<label class="menu_label">주제 소개</label> 
					<textarea class="textarea"
						name="title" placeholder="주제에 대한 설명을 적어주세요" autocomplete="off"></textarea>
				</div>
				<div class="title input_item">
					<label class="menu_label">왜 배워야 하는지</label> 
					<textarea class="textarea"
						name="title" placeholder="주제에 대한 설명을 적어주세요" autocomplete="off"></textarea>
				</div>
				<div class="title input_item">
					<label class="menu_label">이강의에서 배우는 것들</label> 
					<textarea class="textarea"
						name="title" placeholder="주제에 대한 설명을 적어주세요" autocomplete="off"></textarea>
				</div>
				<div class="title input_item">
					<label class="menu_label">강의 특징</label> 
					<textarea class="textarea"
						name="title" placeholder="주제에 대한 설명을 적어주세요" autocomplete="off"></textarea>
				</div>
				<div class="title input_item">
					<label class="menu_label">여기서 다루는 툴</label> 
					<textarea class="textarea"
						name="title" placeholder="주제에 대한 설명을 적어주세요" autocomplete="off"></textarea>
				</div>
				<div class="title input_item">
					<label class="menu_label">예상되는 질문 Q&A</label> 
					<textarea class="textarea"
						name="title" placeholder="주제에 대한 설명을 적어주세요" autocomplete="off"></textarea>
				</div>
				<div class="title input_item">
					<label class="menu_label">강사소개</label> 
					<textarea class="textarea"
						name="title" placeholder="주제에 대한 설명을 적어주세요" autocomplete="off"></textarea>
				</div>
			</div>
		</div>
	</div>
	<script>
	//태그 다완성되면 시작됨
$(document).ready(function() {
		//시작할때 하나 화면출력
		$("#information").css("display", "block");
		//클릭하면 display 나옴
		$(".side_item").click(function() {
			$(".side_item").removeClass("active");
			$(this).addClass("active");
			var active = $(this).attr("data-type");
			$(".main_content").css("display","none");
			$('#'+active).css("display","block");
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
			var name = $(this).parent(".input_item").children(".input_box").children("input:first").attr("name");
			var placeholder = $(this).parent(".input_item").children(".input_box").children("input:first").attr("placeholder");
			var value=Number($(this).val())+1;
			$(this).val(value);
			console.log(name + placeholder +value);
			$(this).parent(".input_item").children(".input_box").append('<input class="input" name="'+name+value+'" placeholder="'+placeholder+'" autocomplete="off">'); //=; 
		//textarea 자동으로 세로너비 증가
		});
		function xSize(e) {
			e.style.height = '1px';
			e.style.height = (e.scrollHeight + 12) + 'px';
		}
		});
	</script>
</body>
</html>