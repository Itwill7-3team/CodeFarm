<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko-KR">
<head>
<style id="stndz-style"></style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<title>코딩팜</title>

<link rel="stylesheet"
	href="https://cdn.inflearn.com/dist/css/MAIN.fe7891b79f47d325600b.css">


<style type="text/css">
.container{
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
}


#my-wrap{
/* border: 1px pink solid; */
width: 100%;
}

.archive_btn_container{
display: block;
}

.order-lect, .find-lect{
/* border: 1px green solid; */
display: inline-block;
}

.order-lect{width: 60%;}
.find-lect{width: 30%;}

.columns{
/* border: 1px powderblue solid ; */
}

.main_container{
    flex-wrap: wrap;
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
			<aside class="column is-2 menu sidebar_left profile_aside">
			<ul class="menu-list">
				<li class="menu1  "><a href="DashBoard.bo">대시보드</a></li>
				<li class="menu1  "><a href="#">알람</a></li>
				<li class="menu1  is-active"><a href="#">내 학습</a>
					<ul>
						<li class="menu2 is_now"><a href="#">수강중인 강의</a></li>
						<li class="menu2 "><a href="#">참여중인 로드맵</a></li>
						<li class="menu2 "><a href="#">내 질문</a></li>
					</ul></li>
				<li class="menu1  "><a href="/wishlist">내 결제</a>
					<ul>
						<li class="menu2 "><a href="WishList.wi">위시리스트</a></li>
						<li class="menu2 "><a href="BasketList.ba">수강 바구니</a></li>
						<li class="menu2 "><a href="#">내 쿠폰함</a></li>
						<li class="menu2 "><a href="#">구매 내역</a></li>
						<li class="menu2 "><a href="#">내 포인트</a></li>
					</ul></li>
				<li class="menu1  "><a href="#">모든 알림</a></li>
				<li class="menu1  "><a href="#">설정</a>
					<ul>
						<li class="menu2 "><a href="#">프로필 설정</a></li>
						<li class="menu2 "><a href="#">알림 설정</a></li>
					</ul></li>
			</ul>

			</aside>
			<!-- aside -->
			
<div id="my-wrap">
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
										class="button is-small has-icon is-link"> <i
										class="far fa-pencil"></i>바로학습
									</a>
								</div>

								<div
									class="archive_icon_container tooltip is-tooltip-warning is-tooltip-left e_add_archive_course"
									data-tooltip="강의 숨기기">
									<i class="fal fa-archive"></i>
								</div>
							</div>
						</div>
						<!-- 강의카드 추가 -->
						<!-- 강의카드 추가 -->
						<!-- 강의카드 추가 -->
						
						</div>
						<div class="archive_btn_container">
							<a href="#" class="button"> <i
								class="far fa-boxes"></i> <span>숨긴 강의 보기</span></a>
						</div>
					</div><!-- #my-lecture -->


			

			</div>
		</div>
	</section> 
	</main>


</div>
<jsp:include page="/include/footer.jsp"/>
</body>

</html>