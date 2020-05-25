<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko-KR">
<head>
<style id="stndz-style"></style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>


<style type="text/css">

@media screen and (max-width: 1085px) {

	/* 모바일   */
	.profile_aside{
	display: none !important;
	}
	
	
	.main_container{
	width: 100% !important;
	}
	
	.is-half{
	width: 100% !important;
	padding: 0.5rem 3rem !important;
	}
	
	#my-wrap{
	width: 60% !important;
	margin: 0 auto;
	}
	
}

@media screen and (max-width: 1360px) {
	.profile_aside>ul{
	padding: 0 0 0 1em !important;
	}
	.container{
	width: 100% !important;
	}
	#alll{
	margin: 4em 1em !important;
	}
}



section *{  
	margin:0 auto;
	box-sizing: border-box;
	
}


body{
	display: block;
	min-height: 1040px;
}

nav ul{
	padding: 0.5rem 1rem;
	
}

h3{padding: 0 1rem;
clear: both;}

.container{
/* 	border: 1px solid blue; */
	width: 70%; /* 90%; */
	margin: 0 auto;
}

/*  */

.profile_aside{
	display: inline-block;
    width: 15%;
    min-width:230px;
    height: 900px;
    padding: 3em 0;
    vertical-align: top;
/*     border: 1px solid; */
	
}

aside.profile_aside .menu-list .is-active>a {
    background: none;
    color: #1dc078;
    font-weight: 700;
}

.menu-list a:hover {
    background-color: #fff;
    color: #363636;
}

.menu-list a {
    border-radius: 2px;
    color: #454545;
    display: block;
    padding: .5em .75em;
}

section .container{
/* border: 1px blue solid; */
min-height:1000px; 
}

#my-lecture{
/* border: 1px red solid; */
display: block;
}

#my-lecture{
height: 70%;
}

.column{
/* border: 1px solid; */
}

.control, .field{
display: inline-block;
margin: 0.2rem 0;
}


/* #my-wrap{ */

/*     width: 70%; */
/*     display: inline-block; */
/* } */

.columns{
width: 100%;
}

.archive_btn_container{
display: block;
}

.order-lect, .find-lect{
/* border: 1px green solid; */
display: inline-block;
padding: 0.2rem;
margin: 0.2rem;
vertical-align: bottom;
}

.order-lect{
min-width: 260px;
/* width:60%;
max-height: 65px;
overflow: hidden;
 *//*  border: 1px powderblue solid ; */
}
.find-lect{max-width: 240px;}

.main_container {
    flex-wrap: wrap;
    display: inline-block;
    margin-top: 30px;
}
/*  */
.select:not(.is-multiple) {
    height: 2.25em;
}

.select, .input, .button{
    border:1px #dbdbdb solid; /* 회색 */
    border-radius: 4px;
    display: block;
    max-width: 100%;
    position: relative;
     cursor: pointer;
    display: block;
    font-size: 1em;
    max-width: 100%;
    outline: none;
}

.profile.my_courses #main .main_container .control_container .control.has_btn .button {
    position: absolute;
    bottom: 0;
}
.button.is-hovered, .button:hover {
    border-color: #b5b5b5;
    color: #363636;
}
.order-lect .button {
    background-color: #fff;
    border-color: #dbdbdb;
    border-width: 1px;
    color: #363636;
    cursor: pointer;
    justify-content: center;
    padding: calc(.375em - 1px) .75em;
    text-align: center;
    white-space: nowrap;
}

.control_container{
font-size: 13px;
max-height: 62px;
min-width: 490px;

}

.field.has-addons {
    display: flex;
    justify-content:flex-start;
}

.input {
    border-radius: 3px;
    box-shadow: none;
    background: #f6f6f6;
    color: #5f5f5f;
/*     border: 1px solid transparent; */
border: none !important;

}

.field.has-addons .control .button:not([disabled]).is-hovered, .field.has-addons .control .button:not([disabled]):hover, .field.has-addons .control .input:not([disabled]).is-hovered, .field.has-addons .control .input:not([disabled]):hover, .field.has-addons .control .select select:not([disabled]).is-hovered, .field.has-addons .control .select select:not([disabled]):hover {
    z-index: 2;
}
.field.has-addons .control:last-child:not(:only-child) .button, .field.has-addons .control:last-child:not(:only-child) .input, .field.has-addons .control:last-child:not(:only-child) .select select {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}
    
.button.is-info.is-hovered, .button.is-info:hover {
    background-color: #2793da;
    border-color: transparent;
    color: #fff;
}

.button.is-info {
    background-color: #3298dc;
    border-color: transparent;
    color: #fff;
}

*, :after, :before {
    box-sizing: inherit;
}

.select select:not([multiple]) {
    padding-right: 2.5em;
}

.button, .file-cta, .file-name, .input, .pagination-ellipsis, .pagination-link, .pagination-next, .pagination-previous, .select select, .textarea {
    -webkit-appearance: none;
    align-items: center;
/*     border: 1px solid transparent; */
    border-radius: 4px;
    box-shadow: none;
    height: 2.25em;
    justify-content: flex-start;
    line-height: 1.5;
    padding: calc(.375em - 1px) calc(.625em - 1px);
    position: relative;
    vertical-align:middle;
}

body, button, input, select, textarea {
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
}


.navbar-link:not(.is-arrowless):after, .select:not(.is-multiple):not(.is-loading):after {
    border: 3px solid transparent;
    border-radius: 2px;
    border-right: 0;
    border-top: 0;
    content: " ";
    display: block;
    height: .625em;
    margin-top: -.4375em;
    pointer-events: none;
    position: absolute;
    top: 50%;
    transform: rotate(-45deg);
    transform-origin: center;
    width: .625em;
}

.select:not(.is-multiple):not(.is-loading):after {
    border-color: #1dc078;
    right: 1.125em;
    z-index: 4;
    
}



/*  */

.course.card {
    height: 100%;
    box-shadow: none;
}
.card {
    background-color: #fff;
    box-shadow: 0 2px 3px rgba(0,10,18,.1), 0 0 0 1px rgba(0,10,18,.1);
    color: #454545;
    max-width: 100%;
    position: relative;
}
.card-image {
    display: block;
    position: relative;
}

.image img{
margin:1em 0;
width: 290px;
height: 190px;
}

.course.card .course_card_front .card-content .course_title {
    font-weight: 700;
    margin-bottom: 0;
    line-height: 1.5em;
    height: 3rem;
    font-size: .95rem;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    white-space: pre-wrap;
}

.course.card .course_card_front .card-content {
    padding: .5rem 0;
}

.card-content, .card-footer, .my_course {
    background-color: transparent;
    width: 300px;
    display: inline-block;
}


.course.card.my_course .dashboard_button_container .button.is-link {
    padding: .125rem .25rem;
    height: inherit;
    display: inline-block;
    
}

.button.is-link.is-hovered, .button.is-link:hover {
    background-color: #1bb571;
    border-color: transparent;
    color: #fff;
}
.button.is-small {
    border-radius: 2px;
    font-size: .75rem;
}
.button.is-link {
    background-color: #1dc078;
    border-color: transparent;
    color: #fff;
}
.button{
    display: inline-block;
border:1px #dbdbdb solid;
}
.breadcrumb li {
    float: left;
    margin-right: 1em;
}

</style>

</head>

<div id="root">
 <jsp:include page="/include/header.jsp"/>    
	<main id="main" class=""> 
	<section>
	<div class="container">
		<div class="columns">

			<!-- aside -->
			<jsp:include page="/include/dash-aside.jsp"/>

			<!-- aside -->
			
 <div class="main_container">
				<div class="column is-10 main_container">
					<small class="is-hidden-mobile"> <nav class="breadcrumb"
							aria-label="breadcrumbs">
						<ul>
							<li><a href="#">내 학습</a></li>
							<li><a href="#">수강중인 강의</a></li>
						</ul>
						</nav>
					</small>

					<h3 class="heading is-hidden-mobile">내 강의</h3>
					<div class="control_container">
				<div class="order-lect">
						<div class="control order_by">
							<label class="label is-hidden-mobile">정렬 기준</label>

							<div class="select">
								<select>
									<option value="recent">최근 공부한 순</option>
									<option value="abc">제목순</option>
								</select>
							</div>
						</div>
						<div class="control filter_progress">
							<label class="label is-hidden-mobile">진행률</label>
							<div class="select">
								<select>
									<option value="now_learning">학습중</option>
									<option value="finished">완강</option>
									<option value="all">모두보기</option>
								</select>
							</div>
						</div>
						<div class="control has_btn is-hidden-mobile">
							<button class="button e_modal_certification">수강확인증</button>
						</div>
				</div><!-- order-lect -->
				<div class="find-lect">
						<div class="field has-addons ">
							<div class="control">
								<input class="input e_search_input" type="text"
									placeholder="검색어 입력">
							</div>

							<div class="control">
								<a class="button is-info e_search_btn">검색</a>
							</div>
					
						</div>
				</div> <!--find-lect  -->
				</div>
</div>
		
				<div class="my-lecture">
					<div class="columns is-mobile courses_card_list_body is-multiline">
						<div
							class="column is-3-fullhd is-3-widescreen is-4-desktop is-4-tablet is-6-mobile">
							<div class="card course my_course">

								<a class="course_card_front"
									href="#">
									<div class="card-image">
										<figure class="image is_thumbnail"> 
										<img src="https://cdn.inflearn.com/wp-content/uploads/git-3.jpg"
											alt="git과 github"> </figure>
									</div>

									<div class="card-content">
										<div class="course_title">git과 github</div>
										<div class="course_meta">
											<div class="inf_progress">
												<label>진도율 : 6강/14강 (42.86%)</label>
												<progress class="progress is-link" value="42.86" max="100">42.86%</progress>
											</div>
											<span class="prgress"> <span class="is-hidden-mobile">진행률:42.86%
													| </span> 기한: 무제한
											</span>
										</div>
									</div>
								</a>

								<div class="dashboard_button_container is-hidden-mobile">
									<a href="#"
										class="button is-small has-icon is-link"> 
										<!-- <i class="far fa-pencil"></i> -->바로학습
									</a>
								</div>

								<div
									class="archive_icon_container tooltip is-tooltip-warning is-tooltip-left e_add_archive_course"
									data-tooltip="강의 숨기기">
									<!-- <i class="fal fa-archive"></i> -->
								</div>
							</div>
						</div>
						<!-- 강의카드 추가 -->
						<!-- 강의카드 추가 -->
						<!-- 강의카드 추가 -->
						
						</div>
						<div class="archive_btn_container">
							<a href="#" class="button"> <!-- <i class="far fa-boxes"></i> --> <span>숨긴 강의 보기</span></a>
						</div>
					</div><!-- #my-lecture -->


			

			</div>
		</div>
	</section> 
	</main>


</div>
</body>
</html>
<jsp:include page="/include/footer.jsp"/>