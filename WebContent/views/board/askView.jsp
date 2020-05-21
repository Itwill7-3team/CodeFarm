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
<%
String email="";
String nick="";
if(session.getAttribute("m_email")!=null){
email=(String)session.getAttribute("m_email");
nick=(String)session.getAttribute("nick");

}

AskDTO bdto=(AskDTO)request.getAttribute("bdto");
LectureDTO ldto= (LectureDTO)request.getAttribute("ldto");
String pageNum=request.getAttribute("pageNum").toString();
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

		<h1><span class="N">Q.</span><%=bdto.getTitle()%></h1>
		<hr>
		<!-- 게시물 -->
		<div class="QnA_content">
		<p>작성자: <%=bdto.getWriter()%></p>
		<%=bdto.getContent()%>
		
		
		</div>
		<!-- 게시물 -->	
		
		<div class="content_side">
		<ul>
		<h4>해당 강의</h4>
		<li><a href="Detail.le?num=<%=ldto.getL_number()%>"><img src="./upload/<%=ldto.getL_img().split(",")[0]%>" style="width: 85%;"></a></li>
		<li><a href="Detail.le?num=<%=ldto.getL_number()%>"><p><%=ldto.getL_title()%></p></a></li>

		<h4>연관 강의</h4>

		
		</ul>
		</div>
<!--  -->
		<%if(email.equals(bdto.getWriter())){%>
		<button onclick="location.href='#';">수정하기</button>
		<button onclick="location.href='#';">삭제하기</button>
		<%}%>
		<button onclick="location.href='askAnswer.bo?pageNum=<%=pageNum%>';">목록보기</a></button>
		
		
		
	<!-- 답글목록 -->
<div class="A_content">


<%
//답글 카운트가 있으면 나오도록 조건설정
int check=(int)request.getAttribute("check");
AskDTO adto= null;
if(check>0){

	List<AskDTO> answerList= (ArrayList)request.getAttribute("answerList");
	
	for(int i=0; i<answerList.size(); i++){
	adto= (AskDTO)answerList.get(i);
	%>
	<h3><%=adto.getWriter() %></h3>	
	<h3><%=adto.getContent() %></h3>	
	<hr>	
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
	
	<!-- 답글쓰기폼 -->
<%
// String id="id";
// int idx= email.indexOf("@");
// id= email.substring(0,idx);
// System.out.print("id"+id);
%>
	<div class="answer_form">
		<form action="AnswerAction.bo?" method="post">
		<input type="hidden" name="num" value="<%=bdto.getNum()%>">
		<input type="hidden" name="writer" value="<%=nick%>">
		<input type="hidden" name="title" value="<%=bdto.getTitle()%>">
		<input type="hidden" name="re_lev" value="<%=bdto.getRe_lev()%>">
<%if(check>1){ %>
		<input type="hidden" name="re_seq" value="<%=adto.getRe_seq()+1%>">
<%} %>
		<input type="hidden" name="re_seq" value="1">
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		
		[답글] 글쓴이 : <%=nick%><br>
		<textarea name="content" id="summernote">
		</textarea>
		<input type="submit" value="글쓰기">
		</form>
	</div>
	
<!-- 컨텐츠 -->


<!-- 푸터 -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- 푸터 -->
</body>
</html>