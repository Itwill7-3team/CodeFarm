<%@page import="com.board.db.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
var item=0;
function timeBefore(time,i){	//현재시간과  글쓴시간을 비교해서 지난 시간을 출력하는 메서드
	//사용하려면 class 에 sub 를 붙이면 가능
	//현재시간을 가져옴 var
	console.log(i);
	now = new Date();
	console.log(now); //글쓴 시간 
	var timestr="";
	var writeDay = new Date(time); //또는 파라미터로 시간을 넘겨받아서 계산할 수도 있음.. 
	var minus; //현재 년도랑 글쓴시간의 년도 비교 
	if(now.getFullYear() > writeDay.getFullYear()){
		minus= now.getFullYear()-writeDay.getFullYear(); //두개의 차이를 구해서 표시 
		document.getElementsByClassName("sub")[i].innerHTML ="시간 : "+ minus+"년 전"; 
		console.log(minus+"년 전"); 
	}else if(now.getMonth() > writeDay.getMonth()){//년도가 같을 경우 달을 비교해서 출력 
		minus= now.getMonth()-writeDay.getMonth();
		document.getElementsByClassName("sub")[i].innerHTML ="시간 : "+minus+"달 전"; 
		console.log(minus+"달 전"); 
	}else if(now.getDate() > writeDay.getDate()){ //같은 달일 경우 일을 계산 
		minus= now.getDate()-writeDay.getDate();
		document.getElementsByClassName("sub")[i].innerHTML ="시간 : "+ minus+"일 전"; 
		console.log(minus+"일 전"); 
	}else if(now.getDate() == writeDay.getDate()){
		//당일인 경우에는 var nowTime = now.getTime(); 
		var writeTime = writeDay.getTime(); if(nowTime>writeTime){//시간을 비교 
			sec =parseInt(nowTime - writeTime) / 1000; day = parseInt(sec/60/60/24); 
			sec = (sec - (day * 60 * 60 * 24)); hour = parseInt(sec/60/60); 
			sec = (sec - (hour*60*60)); 
			min = parseInt(sec/60); 
			sec = parseInt(sec-(min*60)); 
			if(hour>0){ //몇시간전인지 
				document.getElementsByClassName("sub")[i].innerHTML ="시간 : "+ hour+"시간 전"; 
			console.log(hour+"시간 전"); }else if(min>0){ //몇분전인지 
				document.getElementsByClassName("sub")[i].innerHTML ="시간 : "+ min+"분 전"; 
			console.log(min+"분 전"); }else if(sec>0){ //몇초전인지 계산 
				document.getElementsByClassName("sub")[i].innerHTML ="시간 : "+ sec+"초 전"; 
			console.log(sec+"초 전"); 
			} 
		} 
	}
	return timestr;
}

</script>
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
					int i=0;
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
						<span class="post_writer">글쓴이: <%=bdto.getWriter() %></span>
						<span class="post_time sub">
						<script>
						
						timeBefore("<%=bdto.getReg_date()%>", <%=i%>);
						
						</script>
						<%-- <%=bdto.getReg_date() %> --%></span>
						<span class="post_lectuer">강의명 : <%=bdto.getL_name() %></span>
					</p>
					</div>
					<div class="item_right">
					<div class="comment_cnt right_item">
					<span>답변 1개 </span></div>
					<div class="cooment_goods right_item"><i class="far fa-heart"> 0</i></div>
					<div class="comment_link right_item"><input type="button" value="질문으로 가기" onclick="location.href='askView.bo?num=<%=bdto.getNum()%>'"></div>
					</div>
				</div>
				<%i++;} %>
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
	<script>
	
	
				

	</script>
	
</body>
</html>