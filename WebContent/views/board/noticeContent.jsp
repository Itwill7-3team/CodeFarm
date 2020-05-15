<%@page import="com.notice.db.NoticeDTO"%>
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
<link href="./css/reView.css" rel="stylesheet">
<style type="text/css">
.content{
width: 50%;
margin: 0 auto;
min-height: 700px;
}

textarea {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-bottom: 10px;
  width: 100%;
}

</style>

</head>
<body>
<!-- 헤더 -->
<jsp:include page="/include/header.jsp"></jsp:include>
<!-- 헤더 -->
<!-- 컨텐츠 -->

<%

NoticeDTO ndto=(NoticeDTO)request.getAttribute("ndto");
String pageNum=request.getAttribute("pageNum").toString();

%>

<fieldset class="content">
<legend>Notice</legend>
<h2><%=ndto.getN_title()%></h2>
<%-- 작성자 :<%=ndto.getN_writer()%><br> --%>
<hr>
<%=ndto.getN_content() %>


<button onclick="location.href='noticeUpdate.bo?num=<%=ndto.getN_num()%>&pageNum=<%=pageNum%>';">수정하기</button>
<button onclick="location.href='noticeDeleteAction.bo?num=<%=ndto.getN_num()%>&pageNum=<%=pageNum%>';">삭제하기</button>
<br>


</fieldset>
<h3 style="width:50%; margin: 0 auto;"><a href="notice.bo?pageNum=<%=pageNum%> %>" >목록보기</a></h3>
<br>

<!-- 컨텐츠 -->
<!-- 푸터 -->
<jsp:include page="/include/footer.jsp"></jsp:include>
<!-- 푸터 -->
</body>
</html>