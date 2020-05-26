<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

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


/* 하얀 컨텐츠영역 */
#f_more {
    position: fixed;
    bottom: 0;
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
/* border: 1px solid; */
background-color:#dedede;
width: 50px;
height: 50px;
padding:0.8em;
border-radius: 50%;
margin: 1em auto 0.2em;
box-sizing: border-box;
}


.f_box p{
margin: 0;
text-align: center;
font-size: 12px;
}
.f_icon i{
 font-size:24px;
 height:24px;
 width:24px;
 color: #5a5a5a;
 text-align: center;
 vertical-align: middle;
}
</style>


</head>
<body>

   



<div id="f_overlay" onclick="f_overlay_off();"><!-- 오버레이 영역 -->

<div id="f_more">
<!-- f_more<br> -->

<div class="f_more_box">
<span class="f_box" onclick="location.href='./askAnswer.bo'">
<div class="f_icon">
<i class='far fa-question-circle'></i>
</div>
<p>묻고답하기</p>
</span>

<span class="f_box" onclick="location.href='./notice.bo'">
<div class="f_icon">
<i class="fas fa-leaf"></i>
<!-- <i class="fas fa-bullhorn"></i> -->
</div>
<p>공지사항</p>
</span>
<span class="f_box" onclick="location.href='./request.bo'">
<div class="f_icon">
<i class="fab fa-gripfire"></i>
<!-- <i class="fab fa-medapps"></i> -->
</div>
<p>기능요청</p>
</span>
<span class="f_box" onclick="location.href='./blog.bl'">
<div class="f_icon">
<i class="fas fa-pen-fancy"></i>
</div>
<p>블로그</p>
</span>
</div>

</div>


</div><!-- 오버레이끝 -->

<!-- 오버레이 켜기/끄기 -->
<script>
function f_overlay_on() {
  document.getElementById("f_overlay").style.display = "block";
}

function f_overlay_off() {
  document.getElementById("f_overlay").style.display = "none";
}
</script>


</body>
</html>
