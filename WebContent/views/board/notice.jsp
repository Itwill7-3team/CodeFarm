<%@page import="com.notice.db.NoticeDTO"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-공지사항</title>
<link href="./css/notice.css" rel="stylesheet">
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

<%
String email="";
if(session.getAttribute("m_email")!=null){
email=(String)session.getAttribute("m_email");
}

//페이징 정보
String pageNum=(String)request.getAttribute("pageNum");
int count = (Integer)request.getAttribute("count");
int pageCount=(Integer)request.getAttribute("pageCount");
int pageBlock=(int)request.getAttribute("pageBlock");
int startPage=(int)request.getAttribute("startPage");
int endPage=(int)request.getAttribute("endPage");




%>

<section class="community_header">
	<div class="container">
		<h2>공지사항</h2>
		<p>
			공지사항
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
		<%
		if(count < 1){
			System.out.println("공지없음");
		%>
		
		<h1>등록된 공지사항이 없습니다 :-D</h1>
		<span class="file-cta">
        <img class="thumbnail_image" 
				src="./img/carrotIcon.png" style="width: 200px; height: 200px; opacity: 0.5;"> <!-- 당근이미지 -->
        </span>
        <div class="notice_list">
		<%	
		}else{
		%>
			<!--  -->
			<div class="content">
				<% ArrayList<NoticeDTO> noticeList= (ArrayList<NoticeDTO>)request.getAttribute("noticeList");
				for(int i=0; i<noticeList.size();i++){
					NoticeDTO ndto=noticeList.get(i);
			%>
				<div class="notice_list_item">
					<div class="item_content">
					<div class="post_title">
						<span class="N">N.</span>
						<a href="noticeContent.bo?num=<%=ndto.getN_num()%>&pageNum=<%=pageNum%>">
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

						</div>
					</div>
				</div>
				<%} %>
				
			</div>
		<!--  -->
		<div class="pageNation">
						<%
						if(startPage > pageBlock){
							//페이지 [이전]
						%>
							<a href="./notice.bo?pageNum=<%=startPage-pageBlock%>">[이전]</a>
						<%
						}
						%>
						<%
						if(count != 0){
							for(int i=startPage;i<=endPage;i++){
							//페이지 숫자 뿌리기
							%>
							<a href="./notice.bo?pageNum=<%=i%>"><%=i %></a>
							<%
							}
						}
						%>
						<%
						if(endPage < pageCount){
							//페이지 [다음]
						%>
							<a href="./notice.bo?pageNum=<%=startPage+pageBlock%>">[다음]</a>
						<%
						}
						%>
						
						<%if(email.equals("admin@naver.com")){%>
						<button onclick="location.href='noticeWrite.bo';">글쓰기</button>
						<%}
						
						}%>
					
		</div>	
		<!--  -->
		</div>
	</div>
</div>

	
	 
		
	
	<!-- 메인콘텐츠  -->
	</article>
<jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>