<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Paging</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
/* $(function(){
	var orderSelect1 = $("#courses_order_select option:selected").val();
	alert(orderSelect1);
}); */
</script>
</head>
<body>
<%-- <%

String item = "seq";
if(request.getParameter("item") == ""){
	item = request.getParameter("item");
}
%> item 값 오류 --%>
	<div class="pagination">
		<c:url var="pageAction" value="/Search.le"/>
			<c:if test="${param.prev} ">
				<a href="${pageAction}?item=${param.item}&page=${param.beginPage-1}">이전 페이지</a>
			</c:if> 
			<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
				<c:choose>
					<c:when test="${param.page == index} ">
						${index}
					</c:when>
					<c:otherwise>
						<a href="${pageAction}?t1=${param.t1}&t2=${param.t2 }&item=${param.item}&view=${param.view}&page=${index}">${index}</a>
					</c:otherwise>
				</c:choose>	
			</c:forEach>
			<c:if test="${param.next} ">
				<a href="${pageAction}?<%-- item=${param.item}& --%>page=${param.endPage+1}">다음 페이지</a>
			</c:if> 
	</div>
	
	
	<!-- <div class="pagination">
		<a href="#">&laquo;</a> 
		<a href="#" class="active">1</a> 
		<a href="#">2</a>
		<a href="#">3</a> 
		<a href="#">4</a> 
		<a href="#">5</a> 
		<a href="#">6</a>
		<a href="#" class="#">&raquo;</a>
	</div> -->
	
</body>
</html>

