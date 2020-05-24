<%@page import="java.util.List"%>
<%@page import="com.ask.db.AskDTO"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-공지</title>
<link href="./css/askView.css" rel="stylesheet">
<style type="text/css">

</style>

</head>
<body>

<jsp:include page="/include/header.jsp"></jsp:include>
	<script>
/* $(document).ready(function() {
	
}); */
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

AskDTO bdto=(AskDTO)request.getAttribute("bdto");
LectureDTO ldto= (LectureDTO)request.getAttribute("ldto");
String pageNum=request.getAttribute("pageNum").toString();
//String askW = bdto.getWriter().substring(0,bdto.getWriter().indexOf("@"));
%>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>

<script type="text/javascript">

(function($){
  // 여기에 코드를 작성
	$(document).ready(function() {
		  $('#summernote').summernote({
			  height: 200,                 // set editor height
			  minHeight: null,             // set minimum height of editor
		      maxHeight: null,             // set maximum height of editor
		      focus: true,                  // set focus to editable area after initializing summernote
		      lang: "ko-KR",					// 한글 설정
				placeholder: '답글을 입력하세요 :-D',	//placeholder 설정

		  });
		});

		/* 이미지.. */
		$('#summernote').summernote('insertImage', url, function ($image) {
			  $image.css('width', $image.width() / 3);
			  $image.attr('data-filename', 'retriever');
			});
})(jQuery);


</script>

<section class="community_header">
	<div class="container">
		<h2>묻고 답해요</h2>
		<p>
			질문하고 답변해요~<br>
			모르면 질문하고 ,서로서로 해답을 찾아봐요
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
			<!--  -->

		<h1><span class="N">Q.</span><%=bdto.getTitle()%></h1>
		<hr>
		<!-- 이미지 -->
		<div class="img_side">
		<img alt="" src="./img/flower.png" style="width: 100%">
		
		</div>
		<!-- 이미지 -->
		<!-- 게시물 -->
		<div class="QnA_content">
		<p class="a_Info">
		<span>[질문] <%=bdto.getWriter() %></span>
		<span><script>var time=timeBefore("<%=bdto.getReg_date()%>");
							document.write(time);//sss
		</script></span>
		</p>	
		<%=bdto.getContent()%>
		
		
		</div>
		<!-- 게시물 -->	
		<!-- 사이드 -->
		<div class="content_side">
		<ul>
		<h4>해당 강의</h4>
		<li><a href="Detail.le?num=<%=ldto.getL_number()%>"><img src="./upload/<%=ldto.getL_img().split(",")[0]%>" style="width: 85%;"></a></li>
		<li><a href="Detail.le?num=<%=ldto.getL_number()%>"><p><%=ldto.getL_title()%></p></a></li>

		<h4>연관 강의</h4>

		
		</ul>
		</div>
		<!-- 사이드 -->
		<%if(email.equals(bdto.getWriter())){%>
		<button onclick="location.href='#';">수정하기</button>
		<button onclick="location.href='#';">삭제하기</button>
		<%}%>
		
		
		
	<!-- 답글목록 -->
<div class="answer_container">


<%
//답글 카운트가 있으면 나오도록 조건설정
int check=(int)request.getAttribute("check");
AskDTO adto= null;
if(check>0){

	List<AskDTO> answerList= (ArrayList)request.getAttribute("answerList");
	
	for(int i=0; i<answerList.size(); i++){
	adto= (AskDTO)answerList.get(i);
	
//	String answerW = adto.getWriter().substring(0,adto.getWriter().indexOf("@"));
	
	%>
	<!-- 이미지 -->
	<div class="img_side asw">
	<img alt="" src="./img/bee.png" style="width: 100%">
	
	</div>
	<!-- 이미지 -->
	<div class="A_content">
	<p class="a_Info">
	<span>[답글 <%=i+1%>] <%=adto.getWriter() %></span>
	<span><script>var time=timeBefore("<%=adto.getReg_date()%>");
							document.write(time);//sss
	</script></span>
	</p>
	<p><%=adto.getContent() %></p>	
<!-- 	<hr> -->
	</div>
	<%
	}
}
%>
</div>
	<!-- 답글목록 -->
		
		</div>
		<br>	
		<br>	
		<br>

	</div>

		
	<!-- 메인콘텐츠  -->
	</article>
<%-- 	<button onclick="location.href='askAnswer.bo?pageNum=<%=pageNum%>';">목록보기</a></button> --%>
<%
if(email!=""){
String id="id";
if(email.indexOf("@")>-1){ id= email.substring(0,email.indexOf("@"));}
else{	id=email; }
System.out.print("id:"+id);
%>	
	<!-- 답글쓰기폼 -->

	<div class="answer_form">
		<form action="AnswerAction.bo?" method="post">
		<input type="hidden" name="num" value="<%=bdto.getNum()%>">
		<input type="hidden" name="writer" value="<%=email%>">
		<input type="hidden" name="title" value="<%=bdto.getTitle()%>[답글]">
		<input type="hidden" name="re_lev" value="<%=bdto.getRe_lev()%>">
<%if(check>0){ //기존 답글이 있으면 seq+1%>
		<input type="hidden" name="re_seq" value="<%=adto.getRe_seq()+1%>">
<%} //기존 답글 없으면 seq=1%>
		<input type="hidden" name="re_seq" value="1">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		
		[답글] 글쓴이 : <%=id%><br>
		<textarea name="content" id="summernote">
		</textarea>
		<input type="submit" value="글쓰기">
		</form>
	</div>
	
<!-- 컨텐츠 -->
<%
} 
%>

<!-- 푸터 -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- 푸터 -->
</body>
</html>