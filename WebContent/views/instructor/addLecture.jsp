<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-강의 만들기</title>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<link href="./css/addLecture.css" rel="stylesheet">
<div class="main">
<main id="main">
<section class="pre_course_root">
  
<div class="pre_course_card">
  <div class="carousel_container">
    <div class="content step5">
      <h3>
        제목을 입력해주세요!<br>
        너무 고민하지마세요. 제목은 언제든 수정 가능해요 :)
      </h3>
      <form action="" id="complete" >
      <input class="input" type="text" name="title" placeholder="제목을 입력해주세요.">
     </form>
      <div class="error"></div>
    </div>
  </div>
  

  <div class="buttons">
    <button type="button" class="button complete">강의만들기</button>
  </div>
</div>
</section></main>
<script>
$(".button.complete").on("click",function(){
	$("#complete").attr("action","./insertInstructor.in");
	$("#complete").attr("method","post");
	$("#complete").submit();
});
</script>
</div>
</body>
</html>