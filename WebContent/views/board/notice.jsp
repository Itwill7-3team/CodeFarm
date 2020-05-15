<%@page import="com.notice.db.NoticeDTO"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="java.util.Map"%>
<%@page import="com.review.db.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-수강평 모아보기</title>
<link href="./css/reView.css" rel="stylesheet">
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
		<h2>공지사항</h2>
		<p>
			공지사항
		</p>
	</div>
	</section>
	<article class="community_content"> <aside>
	<div class="side_container">
		<p class="small_tag">함께 공부해요</p>
		<ul>
			<li><a href=""><i class="fas fa-edit"></i> 묻고 답하기</a></li>
			<li><a href=""><i class="fas fa-star"></i> 수강평 모아보기</a></li>
		</ul>
		<p class="small_tag">코드팜</p>
		<ul>
			<li><a href=""><i class="fas fa-bullhorn"></i> 공지사항</a></li>
			<li><a href=""><i class="far fa-comments"></i> 강의.기능 요청</a></li>
		</ul>
	</div>
	</aside>
	 <!-- 메인콘텐츠  -->
	 	<div class="columns">
		<div class="main_content">
			<!--  -->
			<div class="content">
				<% ArrayList<NoticeDTO> noticeList= (ArrayList<NoticeDTO>)request.getAttribute("noticeList");
				for(int i=0; i<noticeList.size();i++){
					NoticeDTO ndto=noticeList.get(i);
					
			%>
				<div class="quest_list_item">
					<div class="item_content">
					<div class="post_title">
						<i class="fab fa-quora">.</i>
			<a href="noticeContent.bo?num=<%=ndto.getN_num()%>">
						<span><%=ndto.getN_title()%></span>
			</a>
						
					</div>
					<p class="post_metas">
						<span class="post_time">시간 : 
						<script>var time=timeBefore("<%=ndto.getReg_date()%>");
							document.write(time);//sss
						</script>
						</span>	
						<span class="post_writer">작성자 : <%=ndto.getN_writer()%></span>
					</p>
					</div>
					<div class="item_right">
					<div class="comment_cnt right_item">
					<hr>
					</div>
				</div>
				<%} %>
			</div>
			<button onclick="location.href='noticeWrite.bo';">글쓰기</button>
		</div>
	
	</div>
	 
	 
	 
	 
	 
	 
<%-- 	 <div class="columns">
		<div class="main_content">
			<div class="content">
			<% ArrayList<NoticeDTO> noticeList= (ArrayList<NoticeDTO>)request.getAttribute("noticeList");
				for(int i=0; i<noticeList.size();i++){
					NoticeDTO ndto=noticeList.get(i);
					
			%>
				<div class="notice_list_item">
					<div class="notice_left_item">
						<div class="post_metas">
						<div class="writer"><%=ndto.getN_writer() %></div>
						<div class="reg_date"><%=ndto.getReg_date() %></div>

					</div>
					</div>
					<div class="notice_right">
						<div class="img_item"></div>
					</div>
				</div>
				<%} %>
			</div>
		</div> --%>
		
		
		
		
		
	<!-- 	<div class="content_side">
		<div class="best_kingKnowledge">
			<h2>이달의 지식왕  <i class="fas fa-crown"></i></h2>
			<div class="best_list">
			<h4 class="best_name">이소영</h4>
			<h4 class="best_name">정민수</h4>
			<h4 class="best_name">김홍준</h4>
			<h4 class="best_name">박유준</h4>
			<h4 class="best_name">변재정</h4>
			<h4 class="best_name">최우형</h4>
			<h4 class="best_name">조수아</h4>
			</div>
		</div>
		</div> -->
		
	</div>
	<!-- 메인콘텐츠  -->
	</article>
<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>