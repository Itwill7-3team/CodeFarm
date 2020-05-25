<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.db.BlogDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Font Awesome Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/blog.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-블로그</title>
<style type="text/css">


</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- 헤더 -->
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
<article id="content">


	<section id="blg">
	<h1 class="title Blg">Blog</h1> 
	
	<%
	if(count < 1){ %>
	<h1>블로그 글이 없습니다! 새로운 글을 등록해주세요~</h1>
	<%
	}else{
	
	ArrayList<BlogDTO> blogList= (ArrayList<BlogDTO>)request.getAttribute("blogList");
				for(int i=0; i<blogList.size();i++){
					BlogDTO bdto=blogList.get(i);
					
					String id="id";
					if(bdto.getB_writer().indexOf("@")>-1){
					id= bdto.getB_writer().substring(0,bdto.getB_writer().indexOf("@"));}
					else{ id= bdto.getB_writer();}

			%>
	<div class="blog-c">
	<a href="blogContent.bl?num=<%=bdto.getB_num()%>&pageNum=<%=pageNum%>">
	  <img src="./upload/<%=bdto.getB_img() %>" alt="" style="width:100%">
	    <h2><%=bdto.getB_title() %></h2>
	</a>
	  	<div class="text-in">
		<div>
			<c:set var="date" value="<%=bdto.getB_reg_date() %>"/>
			<span class="date">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${date}" />
			</span>
<%-- 			<%=id %> --%>
		</div>		
		<p>
		</p>  
		</div>
	</div>
	<%}} %>
	
	</section>
	
		<!--  -->
		<div class="pageNation">
						<%
						if(startPage > pageBlock){
							//페이지 [이전]
						%>
							<a href="./blog.bl?pageNum=<%=startPage-pageBlock%>">[이전]</a>
						<%
						}
						%>
						<%
						if(count != 0){
							for(int i=startPage;i<=endPage;i++){
							//페이지 숫자 뿌리기
							%>
							<a href="./blog.bl?pageNum=<%=i%>"><%=i %></a>
							<%
							}
						}
						%>
						<%
						if(endPage < pageCount){
							//페이지 [다음]
						%>
							<a href="./blog.bl?pageNum=<%=startPage+pageBlock%>">[다음]</a>
						<%
						}
						%>
						
						
						<button onclick="location.href='blogWrite.bl';">글쓰기</button>

					
		</div>	
		<!--  -->

</article>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>