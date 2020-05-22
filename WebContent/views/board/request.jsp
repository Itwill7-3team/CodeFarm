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

<div id="main" class="">
	<ol>
		<li><a href="#A">새로운 강좌 요청</a></li>
		<li><a href="#B">새로운 기능 요청</a></li>
		<li><a href="#C">개선 사항</a></li>
		<li><a href="#D">기타의견</a></li>
		<li><a href="#E">영상 관련 </a></li>
	</ol>
</div>
		<!-- A -->
<div id="A" class="req">
	<ol>
		<li><a href="#A-1">프로그래밍</a></li>
		<li><a href="#A-1">데이터과학 or 인공지능</a></li>
		<li><a href="#A-1">디자인 or 크리에이티브</a></li>
		<li><a href="#A-1">사무기술, 마케팅</a></li>
		<li><a href="#A-1">수학, 과학 </a></li>
		<li><a href="#A-1">기타 </a></li>
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