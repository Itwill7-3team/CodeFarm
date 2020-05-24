<%@page import="com.quest.db.QuestDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜 - 묻고 답하기</title>
<link href="./css/request.css?ver=2" rel="stylesheet">

<style type="text/css">
ol li{
list-style: upper-alpha;
}


</style>

</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<section class="community_header">
	<div class="container">
		<h2>기능 요청</h2>
		<p>
			기능요청~ <br> 기능요청
		</p>
	</div>
	</section>
	<article class="community_content"> <aside> <jsp:include
		page="/include/board-aside.jsp"></jsp:include> </aside> <!--메인콘텐츠  -->
	<div class="columns">
		<div class="main_content">
			<form	id="">
<div id="first" class="content" step="1">
	<p>
		<h1>코드팜에 어떤것을 요청하고 싶으신가요??*</h1>
	</p>
	<ol class="main_select">
		<li class="select_item" data-type="A">새로운 강좌 요청</li>
		<li class="select_item" data-type="B">새로운 기능 요청</li>
		<li class="select_item" data-type="C">개선 사항</li>
		<li class="select_item" data-type="D">기타의견</li>
		<li class="select_item" data-type="E">영상 관련 </li>
	</ol>
</div>
<div id="second" class="content" step="2">
	
</div>
<div id="last" class="content" step="3">

</div>
</form>
<div id="buttons">
	<button class="pointer_btn up_btn" onclick="down_btn();"><i class="fas fa-angle-up" aria-hidden="true"></i></button>
	<button class="pointer_btn down_btn right" onclick="up_btn();"><i class="fas fa-angle-down" aria-hidden="true"></i></button>
</div>


<div id="A-1" class="req">
<form action="">
개설되었으면 하는 강좌에 대해 알려주세요
<br>
	<textarea rows="5" cols="40">
	</textarea>
</form>
</div>
</div>
</div>

	</article>
	<jsp:include page="/include/footer.jsp"></jsp:include>
<script>
	var max_value=1;
	var view=1;
	function disable_btn(){//일정 위치이상대면 버튼 작동 중지
		$(".down_btn").attr("disabled",view==max_value?true:false);
		$(".up_btn").attr("disabled",view==1?true:false);
	}
	function button_number(){//button number를 달아줌
		$(".down_btn").attr("step",view+1);
		$(".up_btn").attr("step",view-1);
	}
	function showview(){//view 인 step 만 보여줌
		console.log("view="+view);
		$(".content").hide();
		$("div[step="+view.toString()+"]").show();
	}
	function up_btn(){//view up키
		++view;
		showview();
		button_number();
		disable_btn();
	}
	function down_btn(){//view down키
		--view;
		showview();
		button_number();
		disable_btn();
	}
	$(document).ready(function() {
		showview();
		button_number();
		disable_btn();
		
		
		$("#first").on("click",".select_item",function(){
			var data =$(this).attr("data-type");//클릭한 데이터값을 찾음
			//바뀔 내용작성
			var A="<p>"	
				+"<h3>개설 되었으면 하는 강좌의 분야를 알려주세요.이 질문은 필수입니다 *</h3>"
				+"<ol class='second_select'>"
				+"<li class='select_item' data-type='A'>IT프로그래밍</li>"
				+"<li class='select_item' data-type='B'>크리에이티브</li>"
				+"<li class='select_item' data-type='C'>업무스킬</li>"
				+"<li class='select_item' data-type='D'>기타</li>"
				+"</ol>";
			var B="<p>"
				+"<h3>코드팜에 어떤것을 요청하고 싶으신가요??*</h3>"
				+"<h4>문의사항은 화면 우측하단의 문의하기 잎사귀 버튼을 눌러주세요</h4>"
				+"</p>"
				+"<textarea autocomplete='off' name='confirm' placeholder='여기에 답변을 입력해주세요..'></textarea>"
				+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>"
				+"<div class='submit'>"
				+"<button type='submit'>제출</button>"
				+"</div>";
			var C="<p>"
				+"<h3>개선, 추가 되었으면 하는 기능에 대해 이야기 해주세요!이 질문은 필수입니다 *</h3>"
				+"<h4>의견을 남겨주시면 의견을 토대로 더 좋은 서비스를 만들겠습니다!</h4>"
				+"</p>"
				+"<textarea name='confirm' placeholder='여기에 답변을 입력해주세요..'></textarea>"
				+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>"
				+"<div class='submit'>"
				+"<button type='submit'>제출</button>"
				+"</div>";
			var D="<p>"
				+"<h3>저희에게 남기고 싶은 이야기를 해주세요. *</h3>"
				+"</p>"
				+"<textarea name='confirm' placeholder='여기에 답변을 입력해주세요..'></textarea>"
				+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>"
				+"<div class='submit'>"
				+"<button type='submit'>제출</button>"
				+"</div>";
			var E="<p>"
				+"<h3>강의명을 적어주시면 영상을 개선토록 하겠습니다!</h3>"
				+"</p>"
				+"<textarea name='confirm' placeholder='여기에 답변을 입력해주세요..'></textarea>"
				+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>"
				+"<div class='submit'>"
				+"<button type='submit'>제출</button>"
				+"</div>";
				$("#first").children(".select_item").removeClass("select");
				$(this).addClass("select");
				$("#second").html(eval(data)); //문자열을 변수로 실행하게 만들어줌
				max_value=2;
				view++;
				showview();
				button_number();
				disable_btn();
		});
		
		$("#second").on("click",".select_item",function(){
			$("#second").children(".select_item").removeClass("select");
			$(this).addClass("select");
			var data="<p>"
				+"<h2>개설되었으면 하는 강좌에 대해 알려주세요.이 질문은 필수입니다 *</h2>"
				+"<h3>구체적인 주제와 참고할만한 주소(url)를 알려주시면 저희좋은 강좌를 만들겠습니다.</h3>"
				+"</p>"
				+"<textarea name='confirm' placeholder='여기에 답변을 입력해주세요..'></textarea>"
				+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>"
				+"<div class='submit'>"
				+"<button type='submit'>제출</button>"
				+"</div>";
			$("#last").html(data);
			
			max_value=3;
			view++;
			showview();
			button_number();
			disable_btn();
		});
		$(".main_content").on("keydown keyup change","textarea",function(){
			 $(this).height(1).height( $(this).prop('scrollHeight') );	
		});
	});
	$(".columns").on("click","button[type=submit]", function() {
		var main_select= $(".main_select").children(".select_item.select").html();
		var sub_select=$(".second_select").children(".select_item.select").html();
		
	});
</script>	
	
</body>
</html>