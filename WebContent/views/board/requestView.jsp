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
<link href="./css/askAnswer.css" rel="stylesheet">

<style type="text/css">
body{
position: relative;
}

.pageNation{
position: absolute;
bottom: 5em;
left: 40%;
text-align: center;
width:300px;
}
.pageNation a{
border: 1px #ccc solid;
padding: 0.5em;
color: #00c471;
border-radius: 5px;
}

.pageNation a:HOVER{
background-color: #00c471;
color: #ffff;
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
		<h2>회원 요청 사항 보기</h2>
		<p></p>
	</div>
	</section>
	<article class="community_content"> 
	<aside>
	<jsp:include page="/include/board-aside.jsp"></jsp:include>
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
				<!-- <div class="selector ">
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
				</div> -->
			</div>
			<!--  -->
			<div class="content">
				<%
				//페이징 정보
				String pageNum=(String)request.getAttribute("pageNum");
				int count = (Integer)request.getAttribute("count");
				int pageCount=(Integer)request.getAttribute("pageCount");
				int pageBlock=(int)request.getAttribute("pageBlock");
				int startPage=(int)request.getAttribute("startPage");
				int endPage=(int)request.getAttribute("endPage");

				
//					String pageNum=request.getAttribute("pageNum").toString();
					ArrayList<QuestDTO> boardList=(ArrayList<QuestDTO>)request.getAttribute("boardList");
					for(QuestDTO bdto: boardList){
				%>
				<div class="quest_list_item">
					<div class="item_content">
					<div class="post_title">
						<span class="Q">Rq.</span>
						<span><a href="#"><%=bdto.getQ_content()%></a></span>
					</div>
					<p class="post_metas">
						<span class="post_writer">타입 : <%=bdto.getQ_type()%></span>
						<span class="post_time">시간 : 
						<script>var time=timeBefore("<%=bdto.getQ_reg_date()%>");
							document.write(time);//sss
						</script>
						</span>	
						<span class="post_locuter"><%--  --%></span>
					</p>
					</div>
					<div class="item_right">
					<div class="comment_cnt right_item">
<!-- 					<span> </span> -->
					</div>
					<div class="cooment_goods right_item"><!--  -->
					</div>
					<div class="comment_link right_item"><%--  --%>
					</div>
					</div>
				</div>
				<%} %>
			</div>
		</div>
		<div class="content_side">
		
		</div>
		</div>
		
	</div>


	</article>
	
				<!--  -->
		<div class="pageNation" style="">
						<%
						if(startPage > pageBlock){
							//페이지 [이전]
						%>
							<a href="./requestView.bo?pageNum=<%=startPage-pageBlock%>">[이전]</a>
						<%
						}
						%>
						<%
						if(count != 0){
							for(int i=startPage;i<=endPage;i++){
							//페이지 숫자 뿌리기
							%>
							<a href="./requestView.bo?pageNum=<%=i%>"><%=i %></a>
							<%
							}
						}
						%>
						<%
						if(endPage < pageCount){
							//페이지 [다음]
						%>
							<a href="./requestView.bo?pageNum=<%=startPage+pageBlock%>">[다음]</a>
						<%
						}
						%>

					
		</div>	
		<!--  -->
	
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>