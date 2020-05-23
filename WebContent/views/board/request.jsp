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
<link href="./css/request.css" rel="stylesheet">

<style type="text/css">
ol li{
list-style: upper-alpha;
}


</style>

</head>
<body>

	<jsp:include page="/include/header.jsp"></jsp:include>
	<script>
$(document).ready(function() {
	
});
function timeBefore(timedate){
    //현재시간
    var now = new Date(); 
    console.log(now);
    //글쓴 시간 
    var writeDay = new Date(timedate);
    var minus;
    var time;
    if(now.getFullYear() > writeDay.getFullYear()){
        minus= now.getFullYear()-writeDay.getFullYear();
        time = minus+"년 전";
        console.log(minus+"년 전");
    }else if(now.getMonth() > writeDay.getMonth()){
        minus= now.getMonth()-writeDay.getMonth();
        time = minus+"달 전";
        console.log(minus+"달 전");
    }else if(now.getDate() > writeDay.getDate()){
        minus= now.getDate()-writeDay.getDate();
        time = minus+"일 전";
        console.log(minus+"일 전");
    }else if(now.getDate() == writeDay.getDate()){
        var nowTime = now.getTime();
        var writeTime = writeDay.getTime();
        if(nowTime>writeTime){
            sec =parseInt(nowTime - writeTime) / 1000;
            day  = parseInt(sec/60/60/24);
            sec = (sec - (day * 60 * 60 * 24));
            hour = parseInt(sec/60/60);
            sec = (sec - (hour*60*60));
            min = parseInt(sec/60);
            sec = parseInt(sec-(min*60));
            if(hour>0){
            	time = hour+"시간 전";
                console.log(hour+"시간 전");
            }else if(min>0){
            	time = min+"분 전";
                console.log(min+"분 전");
            }else if(sec>0){
            	time = sec+"초 전";
                console.log(sec+"초 전");
            }
        }
    }
    return time;
}
</script>
	<section class="community_header">
	<div class="container">
		<h2>기능 요청</h2>
		<p>
			기능요청~ <br> 기능요청
		</p>
	</div>
	</section>
	<article class="community_content"> 
	<aside>
	<jsp:include page="/include/board-aside.jsp"></jsp:include>
	</aside> <!--메인콘텐츠  -->
	<div class="columns">
<div class="main_content">

<div id="first" class="content" step="1">
	<p>
		<h3>코드팜에 어떤것을 요청하고 싶으신가요??*</h3>
		<h4>문의사항은 화면 우측하단의 "문의하기" 잎사귀 버튼을 눌러주세요</h4>
	</p>
	<ol class="main_select">
		<li class="select_item" data-type="A">새로운 강좌 요청</li>
		<li class="select_item" data-type="B">새로운 기능 요청</li>
		<li class="select_item" data-type="C">개선 사항</li>
		<li class="select_item" data-type="D">기타의견</li>
		<li class="select_item" data-type="F">영상 관련 </li>
	</ol>
</div>
<div id="second" class="content" step="2">
	
</div>
<div id="last" class="content" step="3">

</div>
<script>
	$(document).ready(function() {
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
			+"<textarea name='confirm' placeholder='여기에 답변을 입력해주세요'></textarea>"
			+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>";
			var C="<p>"
				+"<h3>개선, 추가 되었으면 하는 기능에 대해 이야기 해주세요!이 질문은 필수입니다 *</h3>"
				+"<h4>의견을 남겨주시면 의견을 토대로 더 좋은 서비스를 만들겠습니다!</h4>"
				+"</p>"
				+"<textarea name='confirm' placeholder='여기에 답변을 입력해주세요'></textarea>"
				+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>";
			var D="<p>"
				+"<h3>저희에게 남기고 싶은 이야기를 해주세요. *</h3>"
				+"</p>"
				+"<textarea name='confirm' placeholder='여기에 답변을 입력해주세요'></textarea>"
				+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>";
			var E="<p>"
				+"<h3>강의명을 적어주시면 영상을 개선토록 하겠습니다!</h3>"
				+"</p>"
				+"<textarea name='confirm' placeholder='여기에 답변을 입력해주세요'></textarea>"
				+"<span>단락을 추가하려면 shift+Enter를 누릅니다.</span>";
				$("#first").children(".select_item").removeClass("select");
				$(this).addClass("select");
				$("#first").hide();
				$("#second").html(eval(data)); //문자열을 변수로 실행하게 만들어줌
			
		});
		
		$("second").on("click",".select_item",function(){
			$("#second").children(".select_item").removeClass("select");
			$(this).addClass("select");
		});
	});

</script>

		<!-- A -->
<div id="A" class="req">
	<ol>
		<li class="select_item"><a href="#A-1">프로그래밍</a></li>
		<li class="select_item"><a href="#A-1">데이터과학 or 인공지능</a></li>
		<li class="select_item"><a href="#A-1">디자인 or 크리에이티브</a></li>
		<li class="select_item" ><a href="#A-1">사무기술, 마케팅</a></li>
		<li class="select_item"><a href="#A-1">수학, 과학 </a></li>
		<li class="select_item"><a href="#A-1">기타 </a></li>
	</ol>
</div>
<div id="A-1" class="req">
<form action="">
개설되었으면 하는 강좌에 대해 알려주세요
<br>
	<textarea rows="5" cols="40">
	</textarea>
</form>
</div>
		<!-- A -->
		<!-- B -->
<div id="B" class="req">
<form action="">
추가되었으면 하는 기능에 대해 알려주세요
<br>
	<textarea rows="5" cols="40">
	</textarea>
</form>
</div>
		<!-- B -->
		<!-- C -->
<div id="C" class="req">
<form action="">
개선 되었으면 하는 기능에 대해 알려주세요
<br>
	<textarea rows="5" cols="40">
	</textarea>
</form>
</div>
		<!-- C -->
		<!-- D -->
<div id="D" class="req">
<form action="">
기타 의견을 알려주세요
<br>
	<textarea rows="5" cols="40">
	</textarea>
</form>
</div>
		<!-- D -->
		<!-- E -->
<div id="E" class="req">
<form action="">
해당 강좌명을 알려주세요
<br>
	<textarea rows="5" cols="40">
	</textarea>
</form>
</div>
		<!-- E -->		
</div>
		<!-- 컨트롤러 -->
	
			<!--  -->
		<div class="content_side">
		
		</div>
		</div>
		
	</div>


	</article>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>