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
<style type="text/css">

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
		<h2>수강평(총 0개 ,만족도 0%)</h2>
		<p>
			실시간으로 올라오는 진짜 수강평!!!
		</p>
	</div>
	</section>
	<article class="community_content"> 
	<aside>
	<jsp:include page="/include/board-aside.jsp"></jsp:include>
	</aside>
	 <!-- 메인콘텐츠  -->
	 <div class="columns">
		<div class="main_content">
			<div class="content">
			<% ArrayList<Map<String, Object>> reviewlist= (ArrayList<Map<String, Object>>)request.getAttribute("reviewlist");
				for(int i=0; i<reviewlist.size();i++){
					Map<String, Object> map=reviewlist.get(i);
					LectureDTO ldto=(LectureDTO)map.get("ldto");
					ReviewDTO rdto=(ReviewDTO)map.get("rdto");
			%>
				<div class="review_list_item">
				
						<div class="left">
					<div class="star_item">
					<div class="rating_star">
					<div class="star_solid" style="width: <%=rdto.getR_rating()*20 %>%">
					<i class="fa fa-star" data-value="1" aria-hidden="true"></i><i class="fa fa-star" data-value="2" aria-hidden="true"></i><i class="fa fa-star" data-value="3" aria-hidden="true"></i><i class="fa fa-star" data-value="4" aria-hidden="true"></i><i class="fa fa-star" data-value="5" aria-hidden="true"></i>
					</div>
					<i class="far fa-star" data-value="5" aria-hidden="true"></i><i class="far fa-star" data-value="4" aria-hidden="true"></i><i class="far fa-star" data-value="3" aria-hidden="true"></i><i class="far fa-star" data-value="2" aria-hidden="true"></i><i class="far fa-star" data-value="1" aria-hidden="true"></i>
					</div>
					</div>
					<div class="content_item"><%=rdto.getR_content() %></div>
					<div class="post_metas">
							<span class="goods">좋아요:<%=ldto.getL_goods() %></span>
							<span class="writer">작성자:<%=rdto.getR_writer() %></span>
<%-- 							<span class="reg_date">등록일자:<%=rdto.getR_reg_date() %></span> --%>
							<span class="reg_date">
								<script>var time=timeBefore("<%=rdto.getR_reg_date()%>");
									document.write(time);//sss
								</script>
							</span>
							<span class="lecture_title">강의명:<%=ldto.getL_title() %></span>
					</div>
					</div>
					<div class="review_right">
						<div class="img_item">
							<img src="./upload/<%=ldto.getL_img().split(",")[0]%>" alt="">
						</div>
					</div>
				</div>
				<%} %>
			</div>
		</div>
		
		<div class="content_side">
		<div class="best_Lecture">
			<h2>최근 Hot한 강의들 </h2>
			<div class="best_list">
			<h4 class="best_l">Spring</h4>
			</div>
		</div>
		</div>
		
	</div>
	<!-- 메인콘텐츠  -->
	</article>
<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>