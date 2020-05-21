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
<section class="community_header">
	<div class="container">
		<h2>수강평(총 0개 ,만족도 0%)</h2>
		<p>
			실시간으로 올라오는 진짜 수강평!!!
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
			<div class="content">
			<% ArrayList<Map<String, Object>> reviewlist= (ArrayList<Map<String, Object>>)request.getAttribute("reviewlist");
				for(int i=0; i<reviewlist.size();i++){
					Map<String, Object> map=reviewlist.get(i);
					LectureDTO ldto=(LectureDTO)map.get("ldto");
					ReviewDTO rdto=(ReviewDTO)map.get("rdto");
			%>
				<div class="review_list_item">
					<div class="review_left_item">
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
						<div class="goods"><%=ldto.getL_goods() %></div>
						<div class="writer"><%=rdto.getR_writer() %></div>
						<div class="reg_date"><%=rdto.getR_reg_date() %></div>
						<div class="lecture_title"><%=ldto.getL_title() %></div>
					</div>
					</div>
					<div class="review_right">
						<div class="img_item"></div>
					</div>
				</div>
				<%} %>
			</div>
		</div>
		
		<div class="content_side">
		<div class="best_kingKnowledge">
			<h2>이달의 지식왕  <i class="fas fa-crown"></i></h2>
			<div class="best_list">
			<h4 class="best_name">이소영</h4>
			<h4 class="best_name">정민수</h4>
			<h4 class="best_name">김홍준</h4>
			<h4 class="best_name">박유준</h4>
			<h4 class="best_name">변재정</h4>
			<h4 class="best_name">최우영</h4>
			<h4 class="best_name">조수아</h4>
			</div>
		</div>
		</div>
		
	</div>
	<!-- 메인콘텐츠  -->
	</article>
<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>