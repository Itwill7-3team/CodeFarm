<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./css/askView.css" rel="stylesheet">
<title>코딩팜</title>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<section class="community_header">
	<div class="container">
		<h1>${bdto.title}</h1>
		<a href="#" class="a_btn">미해결질문</a>
	</div>
	</section>
	
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>