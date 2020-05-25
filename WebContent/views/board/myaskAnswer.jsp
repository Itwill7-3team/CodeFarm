<%@page import="java.io.PrintWriter"%>
<%@page import="com.ask.db.AskDAO"%>
<%@page import="com.ask.db.AskDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜 - 내 질문</title>
<link href="./css/askAnswer.css" rel="stylesheet">
<link href="./css/dashboard.css" rel="stylesheet">
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
	
	<article class="community_content"> 
	<aside>
	<jsp:include page="/include/dash-aside.jsp"></jsp:include>
	</aside> <!--메인콘텐츠  -->
	<div class="columns">
		<div class="main_content" style="padding-top: 60px;">
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
				int Askcount = (int)request.getAttribute("count");
				
				if(Askcount<1){%>
				<h1>질문이 없습니다. 등록해주세요~</h1>
				<%	
				}else{
					String pageNum=request.getAttribute("pageNum").toString();
					ArrayList<AskDTO> boardList=(ArrayList<AskDTO>)request.getAttribute("boardList");
					for(AskDTO bdto: boardList){
				%>
				<div class="quest_list_item">
					<div class="item_content">
					<div class="post_title">
						<span class="Q">Q.</span>
						<span><a href="askView.bo?num=<%=bdto.getNum()%>&pageNum=<%=pageNum%>"><%=bdto.getTitle()%></a></span>
					</div>
					<p class="post_metas">
						<span class="post_writer">작성자 : <%=bdto.getWriter()%></span>
						<span class="post_time">시간 : 
						<script>var time=timeBefore("<%=bdto.getReg_date()%>");
							document.write(time);//sss
						</script>
						</span>	
						<span class="post_locuter"><%=bdto.getL_num() %></span>
					</p>
					</div>
					<div class="item_right">
					<div class="comment_cnt right_item">
					<%
					//답글유무 체크
					int check = new AskDAO().getAnswerCount(bdto.getNum());
// 					System.out.println("check:"+check); 
					%>
					<span>답변 <%=check %>개 </span></div>
					<div class="cooment_goods right_item"><i class="far fa-heart"> 0</i></div>
					<div class="comment_link right_item"><input type="button" value="질문으로 가기" onclick="location.href='./askView.bo?num=<%=bdto.getNum()%>&pageNum=<%=pageNum%>'"></div>
					</div>
				</div>
				<%
					}
				}
				%>
			</div>
		</div>

		
	</div>


	</article>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>