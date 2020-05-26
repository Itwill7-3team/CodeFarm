<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
#f_overlay {
    position: fixed;
    display: none;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0,0,0,0.5);
    z-index: 74;
    cursor: pointer;
}

#f_more {
    position: fixed;
    bottom: 5px;
    width: 100%;
    height: 200px;
    background-color: white;
    border-radius: 30px;
}

.f_more_box{
/* border:1px pink solid; */
margin: 0 auto;
width: 416px;
}

.f_box{
/* border: 1px blue solid; */
display:inline-block;
width: 100px;
width: 100px;
height: 100px;
}
.f_icon{
border: 1px solid;
width: 50px;
height: 50px;
border-radius: 50%;
margin: 1em auto 0.2em;
}


.f_box p{
margin: 0;
text-align: center;
}
</style>

</head>
<body>

   



<div id="f_overlay" class="nav_content" onclick="off();"><!-- 오버레이 영역 -->

<div id="f_more">
<!-- f_more<br> -->

<div class="f_more_box">
<span class="f_box">
<div class="f_icon">

</div>
<p>묻고답하기</p>
</span>

<span class="f_box">
<div class="f_icon">

</div>
<p>공지사항</p>
</span>
<span class="f_box">
<div class="f_icon">

</div>
<p>기능요청</p>
</span>
<span class="f_box">
<div class="f_icon">

</div>
<p>블로그</p>
</span>
</div>

</div>


</div><!-- 오버레이끝 -->

<!-- 오버레이 켜기/끄기 -->
<script>
function on() {
  document.getElementById("f_overlay").style.display = "block";
}

function off() {
  document.getElementById("f_overlay").style.display = "none";
}
</script>


</body>
</html>
