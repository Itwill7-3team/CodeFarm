<%@page import="com.board.db.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>
<link href="./css/askAnswer.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<section class="community_header">
	<div class="container">
		<h1>묻고 답해요</h1>
		<p>
			질문하고 답변해요~ <br> 모르면 질문하고 ,서로서로 해답을 찾아봐요
		</p>
	</div>
	</section>
	<article> <aside>
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
	</aside> <!--메인콘텐츠  -->
	<div class="columns">
		<div class="main_content">
			<!-- 컨트롤러 -->
			<div class="main_controler">
				<div class="selector">
					<select class="Q-sel controle_btn" name="solution">
						<option value="해결/미해결">해결/미해결</option>
						<option value="해결">해결</option>
						<option value="미해결">미해결</option>
					</select>
				</div>
				<div class="selector ">
					<select class="Q-sel controle_btn" name="cls">
						<option value="최신순">최신순</option>
						<option value="최근답변순">최근답변순</option>
						<option value="미답변순">미답변순</option>
						<option value="추천순">추천순</option>
					</select>
				</div>
				<div class="search">
					<input type="text" name="search" class="controle_btn input"><i
						class="fas fa-search"></i>
				</div>
			</div>
			<!--  -->
			<div class="content">
				<%
					ArrayList<BoardDTO> boardList=(ArrayList<BoardDTO>)request.getAttribute("boardList");
					for(BoardDTO bdto: boardList){
				%>
				<div class="quest_list_item">
					<div class="item_content">
					<div class="post_title">
						<i class="fab fa-quora">.</i>
						<span><%=bdto.getTitle() %></span>
					</div>
					<p class="post_metas">
						<span class="post_writer"><%=bdto.getWriter() %></span>
						<span class="post_time"><%=bdto.getReg_date() %></span>
						<span class="post_locuter"><%=bdto.getL_name() %></span>
					</p>
					</div>
					<div class="item_right">
					<div class="comment_cnt right_item">
					<span>답변 1개 </span></div>
					<div class="cooment_goods right_item"><i class="far fa-heart"> 0</i></div>
					<div class="comment_link right_item"><input type="button" value="질문으로 가기"></div>
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
			<h4 class="best_name">최우형</h4>
			<h4 class="best_name">조수아</h4>
			</div>
		</div>
		</div>
		
	</div>


	</article>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>