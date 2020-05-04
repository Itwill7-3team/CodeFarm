<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome Icon Library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>

</style>
</head>
<body>

<article id="course">


<section id="lec">
<h1 class="title">추천 강의</h1> 
<!-- 외관 보여주려고 HTML 통으로 다 썼지만, 
나중에는 자바 써서 반복문 돌려서 DB에서 데이터 가져와서 뿌리는식으로.. -->
<!-- 별점도 가능하면 반복문으로 해결하도록 -->

<div class="card">
  <img src="../img/lect_1.png" alt="lecture" style="width:100%">
    <h2>Java</h2>
	<div class="card-in">
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		
		
		<span class="price">$19.99</span> 
		<a href="#"><i class="fa fa-heart-o"></i></a>
		<a href="#"><i class="fa fa-cart-plus"></i></a>
		<p>Some text about the lecture.</p> 
	</div>
</div>
<div class="card">
  <img src="../img/lect_2.png" alt="lecture" style="width:100%">
    <h2>lecture</h2>

<!-- <span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
  <span class="price">$19.99</span>
  <p>Some text about the lecture.</p>
  <p><button>Add to Cart</button></p> -->
  
  	<div class="card-in">
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star checked"></span>
		<span class="fa fa-star"></span>
		
		<span class="price">$19.99</span> 
		<a href="#"><i class="fa fa-heart-o"></i></a>
		<a href="#"><i class="fa fa-cart-plus"></i></a>
		<p>Some text about the lecture.</p> 
	</div>
  
</div>

<div class="card">
  <img src="../img/lect_3.png" alt="lecture" style="width:100%">
    <h2>lecture</h2>
		<div class="card-in">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			
			<span class="price">$19.99</span> 
			<a href="#"><i class="fa fa-heart-o"></i></a>
			<a href="#"><i class="fa fa-cart-plus"></i></a>
			<p>Some text about the lecture.</p> 
		</div>
</div>


<div class="card">
  <img src="../img/lect_4.png" alt="lecture" style="width:100%">
    <h2>HTML&CSS3</h2>
		<div class="card-in">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
						
			<span class="price">$19.99</span> 
			<a href="#"><i class="fa fa-heart-o"></i></a>
			<a href="#"><i class="fa fa-cart-plus"></i></a>
			<p>Some text about the lecture.</p> 
		</div>
</div>

<div class="card">
  <img src="../img/lect_5.png" alt="lecture" style="width:100%">
    <h2>lecture</h2>
		<div class="card-in">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star"></span>
			
			<span class="price">$19.99</span> 
			<a href="#"><i class="fa fa-heart-o"></i></a>
			<a href="#"><i class="fa fa-cart-plus"></i></a>
			<p>Some text about the lecture.</p> 
		</div>
</div>
</section>


<!-- 프로덕트 카드 2번째줄 -->

<section id="lec">
<h1 class="title">인기 강의 <a href="#">&#10095;</a></h1>
<div class="card">
  <img src="../img/lect_6.png" alt="lecture" style="width:100%">
    <h2>Spring</h2>
		<div class="card-in">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			
			<span class="price">$19.99</span> 
			<a href="#"><i class="fa fa-heart-o"></i></a>
			<a href="#"><i class="fa fa-cart-plus"></i></a>
			<p>Some text about the lecture.</p> 
		</div>
</div>

<div class="card">
  <img src="../img/lect_7.png" alt="lecture" style="width:100%">
    <h2>Node.js</h2>
		<div class="card-in">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			
			<span class="price">$19.99</span> 
			<a href="#"><i class="fa fa-heart-o"></i></a>
			<a href="#"><i class="fa fa-cart-plus"></i></a>
			<p>Some text about the lecture.</p> 
		</div>
</div>

<div class="card">
  <img src="../img/lect_8.png" alt="lecture" style="width:100%">
    <h2>Python</h2>
		<div class="card-in">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			
			<span class="price">$19.99</span> 
			<a href="#"><i class="fa fa-heart-o"></i></a>
			<a href="#"><i class="fa fa-cart-plus"></i></a>
			<p>Some text about the lecture.</p> 
		</div>
</div>


<div class="card">
  <img src="../img/lect_9.png" alt="lecture" style="width:100%">
    <h2>Vew.js</h2>
		<div class="card-in">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			
			<span class="price">$19.99</span> 
			<a href="#"><i class="fa fa-heart-o"></i></a>
			<a href="#"><i class="fa fa-cart-plus"></i></a>
			<p>Some text about the lecture.</p> 
		</div>
</div>

<div class="card">
  <img src="../img/lect_10.png" alt="lecture" style="width:100%">
    <h2>React</h2>
		<div class="card-in">
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			<span class="fa fa-star checked"></span>
			
			<span class="price">$19.99</span> 
			<a href="#"><i class="fa fa-heart-o"></i></a>
			<a href="#"><i class="fa fa-cart-plus"></i></a>
			<p>Some text about the lecture.</p> 
		</div>
</div>
</section>

</article>

</body>
</html>