<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./css/nav-footer.css" rel="stylesheet">
<script>
$(document).ready(function(){
	var data=document.location.href.split("/CodeFarm/");
	for(var i=0;i<$(".mg_auto").length;i++){
			if($(".mg_auto").eq(i).attr("href")==data[1]){
				console.log(i);
			$(".mg_auto").eq(i).addClass("active2");
				} 
	}
});

</script>
<div class="nav_content">
<a href="Main.le" class="mg_auto">
	<div class="home nav_btn">
		<span class="icon"><i class="fas fa-home"></i></span>
		<span class="name">홈</span>
	</div>
</a>
<a href="Search.le" class="mg_auto">
	<div class="lecture nav_btn">
		<span class="icon"><i class="far fa-list-alt"></i></span>
		<span class="name">강의</span>
	</div>
</a>
<a href="askAnswer.bo" class="mg_auto">
	<div class="feed nav_btn">
		<span class="icon"><i class="fab fa-pagelines"></i></span>
		<span class="name">피드</span>
	</div>
</a>	
<a href="DashBoard.bo" class="mg_auto">
	<div class="dashboard nav_btn">
		<span class="icon"><i class="fas fa-tachometer-alt"></i></span>
		<span class="name">대시보드</span>
	</div>
</a>	
<a href="#" class="mg_auto">
	<div class="etc nav_btn">
		<span class="icon"><i class="fas fa-ellipsis-h"></i></span>
		<span class="name">더보기</span>
	</div>
</a>

</div>
