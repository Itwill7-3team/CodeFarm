<%@page import="com.notice.db.NoticeDTO"%>
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
</head>
<body>
<!-- 헤더 -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- 헤더 -->
<!-- 컨텐츠 -->

<%
// 세션받아와서 글쓴이에 id 넣기
// 비밀번호 따로 안받음. 관리자만 쓰게 할것임. id 관리자 아니면 메인으로 나가도록


// 글쓰기 에디터 써머에디터사용
%>
<h1>WebContent/board/NoticeWriteForm.jsp</h1>
	<h1>게시판 글쓰기(정보입력)</h1>
<fieldset>
<legend>공지 글쓰기</legend>
<form action="./NoticeWriteAction.bo" method="post">
글쓴이 : <input type="text" name="n_writer"><br>
제목 : <input type="text" name="n_title"><br>
내용<br>
<textarea rows="10" cols="30" name="n_content">


</textarea><br>
<input type="submit" value="글쓰기">
</form>
</fieldset>
<h2><a href="notice.bo">공지 게시판 글 목록보기</a></h2>

<!-- 컨텐츠 -->
<!-- 푸터 -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- 푸터 -->
</body>
</html>