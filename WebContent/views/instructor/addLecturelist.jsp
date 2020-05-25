<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://kit.fontawesome.com/2441771e3f.js"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜-강사로 속한 강의들</title>
<link href="./css/addLectureList.css" rel="stylesheet">



	

	
</head>
<body>
<%
	ArrayList<LectureDTO> lecturelist=(ArrayList<LectureDTO>)request.getAttribute("lecturelist");
		
%>
	<jsp:include page="/include/header.jsp" />

	<div class="header">
		<div class="header_center">
			<span class="header_title"><h2>가르치고 있는 강의들</h2></span>
			
		</div>
	</div>
	<div class="content_cover">
		<div class="content">
			<div class="aside">
				<div class="menu_container">
					<p class="menu_label">대시보드</p>
					<ul class="menu_list">
						<li><i class="fas fa-home"></i> 대시보드</li>
					</ul>
					<p class="menu_label">강의관리</p>
					<ul class="menu_list">
						<li class="active"><i class="fas fa-chalkboard"></i> 강의관리</li>
					</ul>
					<p class="menu_label">강의만들기</p>
					<ul class="menu_list">
						<li onclick="location.href='addLecture.in'"><i class="fas fa-magic"></i> 강의 만들기</li>
					</ul>
				</div>
			</div>
			<!-- side 테이블 -->
			<div class="main_content">
				<table >
					<tr>
						<th>이미지</th>
						<th>강의명</th>
						<th>평점</th>
						<th>총 수강생</th>
						<th>총 수입</th>
						<th>상태</th>
						<th>관리</th>
					</tr>
					<%
					for(int i=0;i<lecturelist.size();i++){
						LectureDTO ldto=lecturelist.get(i);						
					%>
					<tr>
						<td class="main_img"><img src="<%=ldto.getL_img()%>"></img></td>
						<td class="course_title"><a href="Detail.le?num=<%=ldto.getL_number()%>"><%=ldto.getL_title() %></a></td>
						<td class="course_star">0</td>
						<td class="course_students"><%=ldto.getPay_count() %></td>
						<td class="course_pay">₩<%=ldto.getPay_count()*ldto.getL_price() %></td>
						<td class="course_info"><%if(ldto.getRecord()==1) {%>
							판매중
							<%} else{%>
							임시저장
							<%} %>
						</td>
						<td class="course_btn"><button class="remove_btn" step=<%=ldto.getL_number() %>>❌삭제</button></td>
					</tr>
					<%} %>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp" />
<script>
	$(".menu_container li").on("click",function(){
		$(".menu_container li").removeClass("active");
		$(this).addClass("active");
	});
	$(".remove_btn").on("click",function(){
		location.href="removeInstructor.in?num="+$(this).attr("step");
	});
</script>

</body>
</html>