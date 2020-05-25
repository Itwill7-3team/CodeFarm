<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- 									include libraries(jQuery, bootstrap) -->
									<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
									<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
									<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
									
<!-- 									include summernote css/js -->
									<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
									<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
									
</head>
<body>


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
													placeholder: '질문을 입력하세요 :-D',	//placeholder 설정
									
											  });
											});
									
											/* 이미지.. */
											$('#summernote').summernote('insertImage', url, function ($image) {
												  $image.css('width', $image.width() / 3);
												  $image.attr('data-filename', 'retriever');
												});
									})(jQuery);
									
									
									</script>
													
<%
String email="";
if(session.getAttribute("m_email")!=null){
email=(String)session.getAttribute("m_email");
}

%>
																									
									<div class="ask_form">
										<form action="AskAction.bo" method="post">
										<input type="hidden" name="num" value="1"> <!-- lecture num test값 -->
										<input type="hidden" name="writer" value="<%=email%>">
										제목 : <input type="text" name="title" style="width: 90%;">
										<textarea name="content" id="summernote">
										</textarea>
										<input type="submit" value="글쓰기">
										</form>
									</div>
									


</body>
</html>