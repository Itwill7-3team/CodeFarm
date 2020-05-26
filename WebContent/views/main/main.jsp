<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/main.css?ver=1">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>
<style>

</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<div class="slideshow-container">

<div class="mySlides fade" style="background-color:#D5E5BB">
  <img src="./img/main-img/b1.png" class="sld">
<!--     <div class="text">Caption Text</div> -->
</div>

<div class="mySlides fade" style="background-color:#FEEBB6">
  <img src="./img/main-img/b2.png" class="sld">
</div>

<div class="mySlides fade" style="background-color:#4FCAF4">
  <img src="./img/main-img/b3.png" class="sld">
</div>

<div class="mySlides fade" style="background-color:#283C49">
  <img src="./img/main-img/b4.png" class="sld">
</div>

<div class="mySlides fade" style="background-color:#EEEEEE">
  <img src="./img/main-img/b5.png" class="sld">
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

<div style="text-align:center" class="dots">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>

</div>
<br>

<jsp:include page="/include/main-product.jsp"/>


<jsp:include page="/include/footer.jsp"/>



<script>
var slideIndex = 0;
showSlides(slideIndex);
carousel();

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}
function carousel() {

	/* sleep(2000); */

	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";	/* 안보이게 */
	    dots[i].className = dots[i].className.replace(" active", "");/*클래스삭제  */
	   
	  }
	  slideIndex++;
	  if (slideIndex > x.length) {slideIndex = 1}	/*max 보다 크면 1로변환  */
	  dots[slideIndex-1].className += " active";	/*클래스 추가 */
	  x[slideIndex-1].style.display = "block";		/*보이게  */
	  setTimeout(carousel, 3000); // 이미지 변환 시간
	}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>

</body>
</html> 