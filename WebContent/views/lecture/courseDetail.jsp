<%@page import="com.order.db.OrderDTO"%>
<%@page import="com.order.action.OrderListAction"%>
<%@page import="com.review.db.ReviewDTO"%>
<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.lecture.db.FileDTO"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<html lang="ko-KR">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>코딩팜 - ${ ldto.l_title }</title>

<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="./css/courseDetail.css">
<link rel="stylesheet" href="./css/bulma.css">

</head>

<script type="text/javascript">
	function numberFormat(inputNumber) {
		return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>

<body class="course_detail">
	<%
	/* 받아오는 값 */
		LectureDTO ldto = (LectureDTO)request.getAttribute("ldto"); // 강의 정보
		MemberDTO  mdto = (MemberDTO)request.getAttribute("mdto");  // 회원 정보
		
		List<LectureDTO>    lectureList = (List<LectureDTO>)request.getAttribute("lectureList"); // 강사의 전체 강의 정보
		List<ReviewDTO>     reviewList  = (List<ReviewDTO>)request.getAttribute("reviewList");   // 리뷰 정보
		List<List<FileDTO>> fileSet     = (List<List<FileDTO>>)request.getAttribute("fileSet");  // 파일 정보
		List<OrderDTO>      orderList   = (List<OrderDTO>)request.getAttribute("orderList"); // 개인 결제 정보
		Map<Integer, Map<String, Object>> ratingList = (Map<Integer, Map<String, Object>>)request.getAttribute("ratingList"); // 별점 정보
	/* 받아오는 값 */
	
	/* request, session 저장 */
		request.setAttribute("l_number", ldto.getL_number());
	/* request, session 저장 */
	
	/* 현 강의 결제 유무 */
		boolean payCheck = false;
		if(mdto != null && orderList != null){
			for(int i=0; i<orderList.size(); i++){
				if(orderList.get(i).getO_l_num() == ldto.getL_number()){
					payCheck = true;
					return;
				}
			}
		}
	/* 현 강의 결제 유무 */
	
	/* 파일 개수, 시간 계산 */
		int fileCount = 0;
		double totalTime = 0;
		int total_Hour = 0;
		int total_Min = 0;
		ArrayList<FileDTO> fileList = new ArrayList<FileDTO>();
		
		for(int i=0; i<fileSet.size(); i++){
			for(int j=0; j<fileSet.get(i).size(); j++){
				fileList.add(fileSet.get(i).get(j));
				totalTime += fileList.get(fileCount).getF_playtime();
				fileCount++;
			}
		}
		
		if(totalTime >= 3600){
			total_Hour = (int)(totalTime / 3600);
			total_Min = (int)((totalTime - (total_Hour * 3600)) / 60);
		}else{
			total_Hour = 0;
			total_Min = (int)(totalTime / 60);
		}
	/* 파일 개수, 시간 계산 */
	%>
	<div id="root">
	
<!-- include header -->	
	<jsp:include page="/include/header.jsp"/>
<!-- include header -->	
		
		<main id="main">
		<section class="course_header_container">
			<div class="container">
				<div class="columns">
				
				<!-- title_bar -->
					<div class="column is-8">
						<div class="columns">
						
						<!-- lecture thumbnail -->
							<div class="column is-4-tablet thumbnail_container ">
								<div class="image is_thumbnail">
									<img src="./img/main-img/<%= ldto.getL_img().split(",")[0] %>" alt="<%= ldto.getL_title() %>">
								</div>
							</div>
						<!-- lecture thumbnail -->
						
						<!-- lecture title -->
							<div class="column course_title">
								<div>
									<h1><%= ldto.getL_title()%></h1>
									<div class="course_meta">
										<span>
										
										<!-- review 별점 전체 평균  -->
											<div class='rating_star'>
												<div class='star_solid' style="width:<%= (double)ratingList.get(ldto.getL_number()).get("rating_avg") * 20 %>%">
												<% for(int i=1; i<6; i++){ %><i class="fa fa-star"  data-value="<%= i %>"></i><% } %>
												</div>
												<% for(int i=5; i>0; i--){ %><i class="far fa-star" data-value="<%= i %>"></i><% } %>
											</div>
										<!-- review 별점 전체 평균  -->

											<small>(<%= ratingList.get(ldto.getL_number()).get("reviewAll") %>개의 수강평)</small>
										</span>
										<br class="is-hidden-mobile">
										<small class="student_cnt"><%= ldto.getPaynum() %>명의 수강생</small>
										<br>
										
									<!-- lecture_type_category -->
										<small class="course_skills">
<!-- 주소변경 - 강의 태그 카테고리별 링크 카테고리 t1,t2 넘겨주기 -->
											<a href="./Search.le?t1=<%= ldto.getL_type() %>&t2=<%= ldto.getL_type2() %>"><%= ldto.getL_type3() %></a>
										</small>
									<!-- lecture_type_category -->
										
									</div>
								</div>
							</div>
						<!-- lecture title -->
						
						</div>
					</div>
				<!-- title_bar -->
				
				<!-- SideMenu -->
					<div class="column is-4 enroll_btn_container">
						<div class="course_floating_btn">
							<div class="course_floating_top">
								<div class="course_price_cover">
								
								<!-- SideMenu_price -->
									<div class="course_price_section">
										<div class="course_price">
											<% if (ldto.getL_price() == 0) { %>
												무료
											<% } else { %>
											<script type="text/javascript">
												document.write(numberFormat(${ ldto.l_price }));					
											</script>원
											<% } %>
										</div>
									</div>
								<!-- SideMenu_price -->
									
								<!-- SideMenu_button -->
									<div class="course_btn_section">
										<div class="course_btn_cover">
										<% if (ldto.getL_price() == 0 || payCheck) { %>
											<button class="lecbtn is_fullwidth course_btn learn_btn is_primary">바로 학습하기</button>
										</div>
										<% } else { %>
<!-- 수강 신청 onCilck 링크 추가 필요 & 결제 내역 확인 후 강의 보기 버튼 추가
ssssssssssssssssss orderaction 참조
	prompt -> 결제page
-->
											<button class="lecbtn is_fullwidth course_btn learn_btn purchase_btn is_primary cartBtn">수강 신청</button>
										</div>
											<div class="course_btn_cover">
												<button class="is_outlined course_sub_btn course_wish_btn wishBtn">
<!-- 위시리스트 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->
													<span class="wish">
														<i class="fa fa-heart-o"></i>
														<span class="wish_cnt"><%= ldto.getL_goods() %></span>
													</span>
													<span class="text">위시</span>
												</button>
<!-- 장바구니 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ -->
												<button class="is_outlined course_sub_btn course_cart_btn cartBtn" onclick="location.href='BasketAdd.ba?num=<%=ldto.getL_number() %>';">
											    	<i class="fa fa-cart-plus"></i><span class="text"> 수강 바구니</span>
											    </button>
										    </div>
										<% } %>
									</div>
								<!-- SideMenu_button -->
								
								</div>
								
							<!-- SideMenu_info -->
								<div class="course_info_cover">
									<div class="course_info_row">
<!-- 강사 페이지 주소 수정 -->
										<i class="fas fa-user-tie"></i>지식공유자 · <a href="/Instructors.le?m_num=<%= ldto.getL_m_id() %>"><%= ldto.getL_m_name() %></a>
									</div>
									<div class="course_info_row">
										<i class="far fa-play-circle"></i><%
											out.println(fileCount + "회 수업 · 총 ");
											if(total_Hour != 0){ out.print(total_Hour + "시간" + total_Min + "분 수업"); }
											else { out.print(total_Min + "분 수업"); }
										%>
									</div>
<!--시청 기간, 수료증, 난이도 삭제 예정
									<div class="course_info_row">
										<i class="far fa-clock"></i><span class="has-text-weight-bold">평생</span> 무제한 시청
									</div>
									<div class="course_info_row">
										<i class="fas fa-certificate"></i><span class="has-text-weight-bold">수료증 미발급</span> 강의
									</div>
									<div class="course_info_row">
										<i class="fas fa-signal"></i>수강 난이도 <span class="has-text-weight-bold">입문</span>
									</div>
시청 기간, 수료증, 난이도 삭제 예정  -->
								</div>
							<!-- SideMenu_info -->
						
							</div>
							<div class="course_relation_cover course_floating_bottom is-hidden-mobile">
							
							<!-- SideMenu_another_list -->
								<div class="course_relation_tabs">
									<div class="course_relation_tab divactive" id="course_another_tab">다른 강의</div>
								</div>
								<div class="course_another_cover course_relation_list_cover divactive">
									<div class="course_another_list">
									<%
									int lec_loop = 0;
									if(lectureList.size() > 2) { lec_loop = 2; }
									else if(lectureList.size() == 2) { lec_loop = 1; }
									else{ lec_loop = 0; }
										int ja = 0;
									
									if(lec_loop == 2 || lec_loop == 1){
										for(int i=0; i<lec_loop; i++){
											if(lectureList.get(ja).getL_number() == ldto.getL_number()){
												ja += 1; // 현재 강의 제외
											}
									%>
										<li>
<!-- 강의  이미지 등록 주소ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
											<a href="/Detail.le?num=<%-- <% lectureList.get(i).getL_number() %> --%>">
												<div class="el_thumbnail">
													<img src="./img/main-img/<%= lectureList.get(ja).getL_img().split(",")[0] %>" alt="<%= lectureList.get(ja).getL_title() %>">
												</div>
												<div class="el_info">
													<div class="el_title"><%= lectureList.get(ja).getL_title() %></div>
													<div class="el_subinfo">
														<div class="el_subtitle">
															<span>
															<script type="text/javascript">
																document.write("￦" + numberFormat(${ lectureList.get(ja).getL_price() }));					
															</script>
															</span>
														</div>
														<div class="el_metas">
															<i class="fas fa-user"></i> <%= lectureList.get(ja).getPaynum() %> 
															<i class="fas fa-star"></i> <%= ratingList.get(lectureList.get(ja).getL_number()).get("rating_avg") %>
														</div>
													</div>
												</div>
											</a>
										</li>
									<%
										ja++;
										} 
									} else {
									%>
										<div class="course_relation_no_result">아직 다른 강의가 없어요.</div>
									<% } %>
									</div>
								<% if(lectureList.size() > 2){ %>
									<div class="course_another_btn course_relation_btn">
<!-- 강사 페이지 주소 수정 -->
										<a href="/Instructors.le?m_num=<%= ldto.getL_m_id() %>">+ 다른 강의 더보기</a>
									</div>
								<% } %>
								</div>
							<!-- SideMenu_another_list -->
									
							</div>
						</div>
					</div>
				<!-- SideMenu -->
					
				</div>
			</div>
		</section>
		<section class="course_description_container">
		
		<!-- 강의 상세 Navbar -->
			<div class="tabs">
				<ul class="container">
					<li class="tabs_li description is-active">
						<a href="#">강의소개</a>
					</li>
					<li class="tabs_li curriculum ">
						<a href="#curriculum">교육과정</a>
					</li>
					<li class="tabs_li reviews ">
						<a href="#reviews">수강후기</a>
					</li>
				</ul>
			</div>
		<!-- 강의 상세 Navbar -->
		
			<div class="container">
				<div class="course_description">
					<div class="columns">
						<div class="column is-8">
							<div class="content">
							
							<!-- 강의 소개 -->
								<article class="description" id="description">
								
								<!-- 강의 소개 1 -->
									<div class="course_summary description_sub">
										<h3 class="sub_heading has-icon">
											이 강의는 <i class="far fa-lightbulb"></i>
										</h3>

<!-- 강의 등록 페이지 -> DB 확인 -> 내용 등록 -->	
	<!-- DB lecture -> content 작성 후 삭제 -->
										대학 새내기 시절 코딩이 너무 어려웠습니다. 잘해보려 아등바등 노력해 봤지만 매번 실패하다가 결국 미워하게
										돼버렸습니다. 지금 돌아보면 그렇게 미워할 정도는 아니었는데 말이죠. 지금도 저와 같은 고민을 하는 분들이 많을
										거라고 생각합니다. 그 때 그 시절 이런 강의가 있었으면 어땠을까 하는 마음으로 만든 강의가 바로
										미운코딩새끼입니다.미운코딩새끼는 코딩이 너무 어려워 포기한 분, 또는 코딩을 처음 접하는 분을 위한 강의입니다.
										파이썬이라는 프로그래밍 언어의 기초 문법을 쉽게 배울 수 있습니다. 코딩을 왜 배워야 하는지, 왜 필요한지에
										대해서 답을 주지는 않지만 코딩이란 이런 거구나, 파이썬이란 이런 거구나 하는 정도의 감을 잡을 수
										있습니다.코딩은 쉽지 않습니다. 그렇기 때문에 처음 시작하는 분들에게는 정말 쉬운 강의가 필요합니다.
										미운코딩새끼는 파이썬의 모든 것을 가르쳐 주지 않습니다. 대신 가장 중요하고 자주 쓰는 문법만 빠르고 가볍게
										다룹니다. 코딩을 처음 접하는 분들도 단숨에 끝낼 수 있습니다. 과정 후 파이썬을 더 공부할 마음이 든다면
										혼자서 얼마든지 공부할 수 있습니다.자, 그럼 이제 잉끼유튜버 김왼손과 함께 파이썬의 매력 속으로 풍덩
										빠져볼까요? :^)
	<!-- DB lecture -> content 작성 후 삭제 -->
										<%= ldto.getL_content() %>
									</div>
								<!-- 강의 소개 1 -->
									
								<!-- 강의 소개 2 -->
									<div class="body" itemprop="articleBody">
										<div>
	<!-- upload or link 동영상 등록 시 태그 수정 -->
											<div class="iframe_container" style="padding:56.25% 0 0 0; position: relative;">
												<iframe src="https://www.youtube.com/embed/UrwFkNRzzT4?list=PLGPF8gvWLYyontH0PECIUFFUdvATXWQEL?rel=0&amp;modestbranding=1&amp;vq=hd720"
													frameborder="0" allow="autoplay; encrypted-media" allowfullscreen="allowfullscreen"
													style="position: absolute; top: 0px; bottom: 0px; left: 0px; right: 0px; height: 100%; width: 100%;" data-gtm-yt-inspected-8964582_7="true" id="669956749">
												</iframe>
											</div>
	<!-- upload or link 동영상 등록 시 태그 수정 -->
										</div>
										<div>
	<!-- 강의 등록 페이지 -> DB 확인 -> 내용 등록 -->
											<%= ldto.getL_content() %>
											<h2>김왼손의 한입에 쏙 파이썬 - 파이썬 입문</h2>
											한입에 쏙 파이썬은 미운코딩새끼의 업그레이드 버전 강의입니다. 자세한 내용은
											<a href="https://www.inflearn.com/course/%ED%8C%8C%EC%9D%B4%EC%8D%AC-%EC%9E%85%EB%AC%B8-hello-coding/">
												[저자직강]	Hello Coding 한입에 쏙 파이썬: 크리에이터 김왼손의 쉽고 빠른 파이썬 강의
											</a>
												에서 확인하실 수	있습니다.=====&nbsp;
	<!-- upload or link 동영상 등록 시 태그 수정 -->
												<div class="iframe_container" style="padding:56.25% 0 0 0; position: relative;">
													<iframe width="100%" height="100%" src="https://www.youtube.com/embed/c2mpe9Xcp0I?rel=0&amp;modestbranding=1&amp;vq=hd720" frameborder="0" allowfullscreen="allowfullscreen"
														style="position: absolute; top: 0px; bottom: 0px; left: 0px; right: 0px; height: 100%; width: 100%;" data-gtm-yt-inspected-8964582_7="true" id="830993609">
													</iframe>
												</div>
	<!-- upload or link 동영상 등록 시 태그 수정 -->
											* 인스타그램 김왼손(<a href="https://www.instagram.com/lefty_khim/">@lefty_khim</a>)을 팔로우하세요!* 미운코딩새끼 전자책 ▶
											<a href="https://wikidocs.net/book/1421" target="_blank" rel="noopener">https://wikidocs.net/book/1421</a>
											* 더 많은 무료 강의 ▶ <a href="https://goo.gl/AwAwUT" target="_blank" rel="noopener">https://goo.gl/AwAwUT</a>
											<h3>
												<strong>
													<span style="color: #ff0000;">1.</span> 강좌 소개
												</strong>
											</h3>
											<ul>
												<li>코딩이 너무 어려워 미워지려고 하는 분들을 위한 강의입니다.</li>
												<li>파이썬의 기초를 쉽고 빠르고 가뿐하게 배울 수 있습니다.</li>
												<li>코딩을 처음 접하는 분들이 들어도 좋습니다.</li>
											</ul>
											대학 새내기 시절 코딩이 너무 어려웠습니다. 잘해보려 아등바등 노력해 봤지만 매번 실패하다가 결국 미워하게
											돼버렸습니다. 지금 돌아보면 그렇게 미워할 정도는 아니었는데 말이죠. 지금도 저와 같은 고민을 하는 분들이
											많을 거라고 생각합니다. 그 때 그 시절 이런 강의가 있었으면 어땠을까 하는 마음으로 만든 강의가 바로
											미운코딩새끼입니다.미운코딩새끼는 코딩이 너무 어려워 포기한 분, 또는 코딩을 처음 접하는 분을 위한
											강의입니다.?파이썬이라는 프로그래밍 언어의 기초 문법을 쉽게 배울 수 있습니다. 코딩을 왜 배워야 하는지, 왜
											필요한지에 대해서 답을 주지는 않지만?코딩이란 이런 거구나, 파이썬이란 이런 거구나 하는 정도의 감을 잡을
											수?있습니다.코딩은 쉽지 않습니다. 그렇기 때문에 처음 시작하는 분들에게는 정말 쉬운 강의가 필요합니다.
											미운코딩새끼는 파이썬의 모든 것을 가르쳐 주지 않습니다. 대신?가장?중요하고 자주 쓰는 문법만 빠르고 가볍게
											다룹니다. 코딩을 처음 접하는?분들도 단숨에 끝낼 수 있습니다. 과정 후 파이썬을 더 공부할 마음이 든다면
											혼자서 얼마든지 공부할 수 있습니다.자, 그럼 이제 잉끼유튜버 김왼손과 함께 파이썬의 매력
											속으로?풍덩?빠져볼까요? :^)
											<h3>
												<span style="color: #ff0000;">2.</span> 학습목표
											</h3>
											<ul>
												<li class="m_-7880752960710192036p1">
													<span class="m_-7880752960710192036s1">파이썬의 기초를 쉽게 배울 수 있습니다.</span>
												</li>
												<li class="m_-7880752960710192036p1">
													파이썬이 뭔지, 코딩이 뭔지 감을 잡게 됩니다.
												</li>
												<li class="m_-7880752960710192036p1">
													<span class="m_-7880752960710192036s1">혼자서도 코딩을 공부할 수 있는 법을 배웁니다.</span>
												</li>
												<li>다음 단계를 위한 준비를 할 수 있습니다.</li>
												<li>컴퓨터처럼 문제를 해결하는 방법을 배웁니다.</li>
												<li>나도 할 수 있다는 자신감을 얻게 됩니다.</li>
											</ul>
											<h3>
												<span style="color: #ff0000;">3.</span> 도움이 되는 분들
											</h3>
											<ul>
												<li class="m_-7880752960710192036p1">
													<span class="m_-7880752960710192036s1">코딩을 한 번도 해본 적 없는 분</span>
												</li>
												<li class="m_-7880752960710192036p1">
													<span class="m_-7880752960710192036s1">아무리 열심히 해도 코딩이 어려운 분</span>
												</li>
												<li>코딩이라는게 뭔지 맛보고 싶은 분</li>
												<li class="m_-7880752960710192036p1">
													반복되는 포기로 코딩이 미워지려고 하는 분
												</li>
											</ul>
											<h3>
												<span style="color: #ff0000;">4.</span> 강사 소개
											</h3>
											<p class="m_-7880752960710192036p1">
												<strong>
													<span class="m_-7880752960710192036s1">김왼손</span>
												</strong>
											</p>
											<blockquote>
												<p class="m_-7880752960710192036p1">
													<span class="m_-7880752960710192036s1">
														자동차에 세상을 보여주는 연구원. 좋아하는 일만 하며 재미있게 살고 싶은 요즘 젊은이. 가르치는 게 좋아 공부하는 선생이자, 배우는 게 좋아 가르치는 학생. 프로그래밍이라면 치를 떨던 프포자였지만,
														지금은 ‘<a href="https://www.youtube.com/channel/UC0h8NzL2vllvp3PjdoYSK4g?sub_confirmation=1" target="_blank" rel="noopener">김왼손의 왼손코딩</a>’을 운영하는 잉끼 유튜버.
													</span>
												</p>
											</blockquote>
										</div>
<!-- 강의 등록 페이지 -> DB 확인 -> 내용 등록 -->

									</div>
								<!-- 강의 소개 2 -->

								</article>
							<!-- 강의 소개 -->
								
							<!-- 강사 소개 페이지 -->
								<article class="course_instructor">
									<h3 class="sub_heading">지식공유자 소개</h3>
									<div class="profile">
										<div class="course_instructor_profile">
											<figure class="image">
<!-- DB에 회원 아이콘 등록 후 아래 코드 사용  -->
												<img class="is-rounded" src="./img/main-img/b4.png<%-- <%= mdto.getM_nick() %> --%>">
											</figure>
										</div>
										<h4 class="name">
<!-- 강사 페이지 주소 수정 -->
											<a href="/Instructors.le?m_num=<%= ldto.getL_m_id() %>"><%= ldto.getL_m_name() %></a>
										</h4>
									</div>
									<p class="introduce"></p>
								</article>
							<!-- 강사 소개 페이지 -->
								
							<!-- 교육 과정 -->
								<article class="curriculum" id="curriculum">
									<h3 class="sub_heading">교육과정</h3>
									<div class="curriculum_accordion unit_section_list">
									
									<!-- video count, playtime -->
										<div class="curriculum_header">
											<span class="section_all"></span>
											<span class="curriculum_length"><%= fileCount %> 강의</span>
											<span class="curriculum_runtime">
										<%
											if(total_Hour != 0){ out.print(total_Hour + "시간" + total_Min + "분"); }
											else { out.print(total_Min + "분"); }
										%>
											</span>
										</div>
									<!-- video count, playtime -->
										
									<!-- section_content -->
									<%
									fileCount = 0;
									double sec_Total = 0;
									
									for(int i=0; i<fileSet.size(); i++){
									%>
										<div class="section_cover">
											<div class="section_header">
												<div class="section_header_left">
													<span class="section_header_icon plus"><i class="fa fa-plus"></i></span>
													<span class="section_header_icon minus"><i class="fa fa-minus"></i></span>
													<span class="unit_title">섹션 <%= i %>. <%= fileList.get(fileCount).getF_sec_name() %></span>
												</div>
												<div class="section_header_right is-hidden-mobile">
													<span class="unit_length"><%= fileSet.get(i).size() %> 강의</span>
													<span class="unit_time"><i class="far fa-clock"></i><%
														/* 섹션별 시간 계산 */
														for(int t=0; t<fileSet.get(i).size(); t++){
															sec_Total += fileList.get(t).getF_playtime();
														}
														int sec_Min = (int)(sec_Total / 60);
														int sec_Sec = (int)(sec_Total - sec_Min * 60);
														
														String sMin_Str = sec_Min <= 10 ? "0" + Integer.toString(sec_Min) : Integer.toString(sec_Min);
														String sSec_Str = sec_Sec <= 10 ? "0" + Integer.toString(sec_Sec) : Integer.toString(sec_Sec);
														
														out.println(sMin_Str + " : " + sSec_Str);
														%>
													</span>
												</div>
											</div>
											
										<!-- video_play -->
											<div class="lecture_cover">
											
											<!-- video -->
											<%
											for(int j=0; j<fileSet.get(i).size(); j++){
											
											int col_Min = (int)(fileList.get(j).getF_playtime() / 60);
											int col_Sec = (int)(fileList.get(j).getF_playtime() - col_Min * 60);
											
											String cMin_Str = col_Min <= 10 ? "0" + Integer.toString(col_Min) : Integer.toString(col_Min);
											String cSec_Str = col_Sec <= 10 ? "0" + Integer.toString(col_Sec) : Integer.toString(col_Sec);
											
												if(payCheck){
											%>
<!-- 영상 재생 페이지 이동 주소 확인 -->
												<a class="unit_item" href="/lecturePlay.le?l_number=<%= ldto.getL_number() %>&f_num=<%= fileList.get(j).getF_num() %>">
													<div class="unit_item_left">
														<i class="fa fa-play-circle-o"></i><span class="unit_title"><%= fileList.get(j).getF_col_name() %></span>
													</div>
													<div class="unit_item_right">
														<span class="unit_preview">
															<button class="button is-link is-small">
																<span class="is-hidden-mobile">강의보기</span>
																<span class="is-hidden-tablet">
																	<i class="fa fa-smile-o"></i>
																</span>
															</button>
														</span>
														<span class="unit_time is-hidden-mobile"><i class="far fa-clock"></i>
														<% out.println(cMin_Str + " : " + cSec_Str); %>
														</span>
													</div>
												</a>
												<% } else { %>
												<div class="unit_item">
													<div class="unit_item_left">
														<i class="fa fa-play-circle-o"></i><span class="unit_title"><%= fileList.get(j).getF_col_name() %></span>
													</div>
													<div class="unit_item_right">
														<span class="unit_preview"></span>
														<span class="unit_time is-hidden-mobile">
															<i class="far fa-clock"></i><% out.println(cMin_Str + " : " + cSec_Str); %>
														</span>
													</div>
												</div>
												<% } %>
											<!-- video -->
											<% fileCount++; } %>
										
											</div>
										<!-- video_play -->
										</div>
									<% } %>
									<!-- section_content -->
									
									</div>
								</article>
							<!-- 교육 과정 -->
							
							<!-- 수강 후기 -->
								<article class="course_date">
									<h4 class="sub_heading">공개 일자</h4>
<!-- update 날짜 DB추가 후 뒤쪽 날짜 변경 -->	
									<div>
										<%= new SimpleDateFormat("yyyy년 M월 d일").format(ldto.getL_reg_date()) %><span class="last_update_date"> <%= new SimpleDateFormat("yyyy년 M월 d일").format(ldto.getL_reg_date()) %></span>
									</div>
								</article>
								
							<!-- 수강 후기 -->
								<article class="reviews" id="reviews">
									<h4 class="sub_heading">수강 후기</h4>
									<div class="review_summary">
									
									<% if(reviewList.size() != 0){ %>
									<!-- (위쪽과 동일) 수강 후기  review 평점  -->
										<div class="average">
											<span class="average_num"><%= ratingList.get(ldto.getL_number()).get("rating_avg") %></span>
											<span class="average_star">
												<div class='rating_star'>
													<div class='star_solid' style="width:<%= (double)ratingList.get(ldto.getL_number()).get("rating_avg") * 20 %>%">
													<% for(int i=1; i<6; i++){ %><i class="fa fa-star"  data-value="<%= i %>"></i><% } %>
													</div>
													<% for(int i=5; i>0; i--){ %><i class="far fa-star" data-value="<%= i %>"></i><% } %>
												</div>
											</span>
											<h5 class="review_total"><%= ratingList.get(ldto.getL_number()).get("reviewAll") %>개의 수강평</h5>
										</div>
									<!-- (위쪽과 동일) 수강 후기  review 평점  -->
										
									<!-- 평점 progress_bar -->
										<div class="progress_bars">
										<% for(int i=5; i>0; i--){ %>
											<div class="review_counting">
												<label><%= i %>점</label>
												<progress class="progress is-link" max="<%= ratingList.get(ldto.getL_number()).get("reviewAll") %>" value="<%= ratingList.get(ldto.getL_number()).get("rating_" + i) %>"></progress>
											</div>
										<% } %>
										</div>
									<!-- 평점 progress_bar -->
									
									<% } else { %>
										<p class="not_yet_reviews">아직 평가를 충분히 받지 못한 강의 입니다.<br>모두에게 도움이 되는 수강평의 주인공이 되어주세요!😄️️</p>
									<% } %>
									</div>
									<div class="review_list">
									
								<!-- review_container -->
									<%
									if(reviewList.size() != 0){
										for(int r_loop=0; r_loop<2; r_loop++){
									%>
										<div class="article_container">
											<article class="media review_item">
											
											<% if(reviewList.get(r_loop).getR_re_lev() == 0){ %>
											<!-- 회원 아이콘 등록 -->
												<figure class="media-left image is-64x64">
													<img src='./img/main-img/lect_10.png' class='swiper-lazy is-rounded' alt='default_profile.png'>
												</figure>
											
												<div class="media-content">
													<div class="content">
													
													<!-- 회원별 별점 정보 -->
														<span>
															<div class='rating_star'>
																<div class='star_solid'>
																<% for(int i=1; i<reviewList.get(r_loop).getR_rating() + 1; i++){ %><i class="fa fa-star"  data-value="<%= i %>"></i><% } %>
																</div>
																<% for(int i=5; i>0; i--){ %><i class="far fa-star" data-value="<%= i %>"></i><% } %>
															</div>
														</span>
											
													<!-- 회원 이름 -->
														<strong><%= reviewList.get(r_loop).getR_writer() %></strong>
													
													<!-- 작성 일자 -->
														<small class="review updated_at">
															<span><%= new SimpleDateFormat("yyyy-MM-dd").format(reviewList.get(r_loop).getR_reg_date()) %></span>
															<span class="option"></span>
														</small><br>
														
													<!-- 리뷰 내용 -->
														<div class="review_body">
															<%= reviewList.get(r_loop).getR_content() %>
														</div>
													
													<!-- 답글 등록 버튼 -->
													<% if(mdto != null && mdto.getM_rank().equals("강사")){ %>
														<div class="reactions">
															<button class="button is-link is-small">
																<span class="is-hidden-mobile">답글 쓰기</span>
																<span class="is-hidden-tablet"><i class="fa fa-commenting-o"></i></span>
															</button>
														</div>
													<% } %>
													
													</div>
												<% if(reviewList.get(r_loop + 1).getR_re_lev() == 1 && reviewList.get(r_loop).getR_re_ref() == reviewList.get(r_loop + 1).getR_re_ref()){ %>
												<!-- review_comment -->
													<div class="review_comments">
														<div class="article_container">
															<article class="media comment">
																<figure class="media-left image is-32x32">
																	<img src="./img/main-img/lect_9.png" alt="<%= reviewList.get(r_loop).getR_writer() %>">
																</figure>
																<div class="media-content">
																	<div class="content">
																		<p>
																		<!-- 회원 이름, 작성 일자, 내용 -->
																			<small>
																				<span class="author"><strong><%= reviewList.get(r_loop).getR_writer() %></strong></span>
																				<span class="updated_at"><%= new SimpleDateFormat("yyyy-MM-dd").format(reviewList.get(r_loop).getR_reg_date()) %></span>
																			</small><br>
																			<span class="article_body">
																				<%= reviewList.get(r_loop).getR_content() %>
																			</span>
																		<!-- 회원 이름, 작성 일자, 내용 -->
																		</p>
																	</div>
																</div>
															</article>
														</div>
													</div>
												<!-- review_comment -->
												<% } %>
												</div>
											</article>
										</div>
									<%
											} //if(reviewList.get(r_loop).getR_re_lev() == 0){
										} //for(int r_loop=0; r_loop<reviewList.size(); r_loop++)
									} //if(reviewList.size() != 0)
									%>
								<!-- review_container -->
										
									</div>
								</article>
							<!-- 수강 후기 -->
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		</main>
	</div>
	
	<script type="text/javascript">
		
	$(document).ready(function(){
		
	/* 수강평 더 보기 버튼 생성 */
		var review_cnt = $(".review_list .article_container").length;
		if(review_cnt < ${ fn:length(reviewList) }){
			$("<button class='is-fullwidth button is-link e_show_more_review'>다른 수강평 보기</button>").appendTo(".review_list");
		}
	/* 수강평 더 보기 버튼 생성 */
		
	/* 수강평 로드 */
		$(".e_show_more_review").click(function(){
			$.ajax({
				url      : "/CodeFarm/DetailReview.le",
				type     : "POST",
				dataType : "json",
				data: {
					l_number : ${ ldto.getL_number() }
				},
				success: function (json){
					var output = "";
					var pre_count = $(".review_list>.article_container").length;
					for(var i=pre_count; i<json.length; i++){
						if(json[i].r_re_lev == 0){
						output += "<div class='article_container'><article class='media review_item'>"
								+ "  <figure class='media-left image is-64x64'>"
								+ "    <img src='./img/main-img/lect_10.png' class='swiper-lazy is-rounded' alt='default_profile.png'>"
								+ "  </figure>"
								+ "  <div class='media-content'>"
								+ "    <div class='content'>"
								+ "      <span><div class='rating_star'>"
								+ "        <div class='star_solid'>";
							for(var innerStar=1; innerStar<json[i].r_rating + 1; innerStar++){
								output += "<i class='fa fa-star' data-value="+innerStar+"></i>";
							}
						output += "          </div>"
							for(var outerStar=5; outerStar>0; outerStar--){
								output += "<i class='far fa-star' data-value="+outerStar+"></i>";
							}
						output += "      </div></span>"
								+ "      <strong>" + json[i].r_writer + "</strong>"
								+ "      <small class='review updated_at'>"
								+ "        <span>" + json[i].r_reg_date + "</span><span class='option'></span>"
								+ "      </small><br>"
								+ "      <div class='review_body'>" + json[i].r_content + "</div>";
							if(${ mdto != null && mdto.getM_rank().equals("강사") }){
							output += "      <div class='reactions'>"
									+ "        <button class='button is-link is-small'>"
									+ "          <span class='is-hidden-mobile'>답글 쓰기</span>"
									+ "          <span class='is-hidden-tablet'><i class='fa fa-commenting-o'></i></span>"
									+ "        </button>"
									+ "      </div>";
							}
						 	if(json[i + 1].r_re_lev == 1 && json[i].r_re_ref == json[i + 1].r_re_ref) {
							output += "<div class='review_comments'><div class='article_container'><article class='media comment'>"
									+ "  <figure class='media-left image is-32x32'>"
									+ "    <img src='./img/main-img/lect_9.png' alt='" + json[i].r_writer + "'>"
									+ "  </figure>"
									+ "  <div class='media-content'><div class='content'><p>"
									+ "    <small>"
									+ "      <span class='author'><strong>" + json[i].r_writer + "</strong></span>"
									+ "      <span class='updated_at'>" + json[i].r_reg_date + "</span>"
									+ "    </small><br>"
									+ "    <span class='article_body'>" + json[i].r_content + "</span>"
									+ "  </p></div></div>"
									+ "</article></div></div>";
							}
						 }
						output += "  </article></div>";
					}
					$(".review_list>.article_container:last").after(output);
					$("button").remove(".e_show_more_review");
				}
			});
		});
	/* 수강평 로드 */
	
	/* 스크롤 변경시 Navbar_sticky & 주소 변경 */
		var t_Nav   = $(".tabs");
		var h_Nav   = $("header");
		var m_Nav   = $("#main");
		
		var t_Top   = t_Nav.offset().top;
		var d_Top   = $("#description").offset().top;
		var c_Top   = $("#curriculum").offset().top;
		var r_Top   = $("#reviews").offset().top;
		
		var desc    = $(".tabs_li.description");
		var curr    = $(".tabs_li.curriculum");
		var reviews = $(".tabs_li.reviews");
		
		$(window).on('scroll', function(){
			var offsetY = $(document).scrollTop();
			var Y_ex = offsetY + (window.innerHeight / 10);
				
			if(offsetY < t_Top){
				t_Nav.removeClass("sticky");
				m_Nav.removeClass("sticky");
				h_Nav.removeClass("is-hidden");
			}else if(offsetY > t_Top){
				t_Nav.addClass("sticky");
				m_Nav.addClass("sticky");
				h_Nav.addClass("is-hidden");
			}
			
			if(Y_ex < d_Top){
				desc.addClass("is-active");
				curr.removeClass("is-active");
				reviews.removeClass("is-active");
				history.pushState("", "", "#");
			}else{
				if(Y_ex < c_Top){
					desc.addClass("is-active");
					curr.removeClass("is-active");
					reviews.removeClass("is-active");
					history.pushState("", "", "#description");
				}else{
					if(Y_ex < r_Top){
						desc.removeClass("is-active");
						curr.addClass("is-active");
						reviews.removeClass("is-active");
						history.pushState("", "", "#curriculum");
					}else{
						desc.removeClass("is-active");
						curr.removeClass("is-active");
						reviews.addClass("is-active");
						history.pushState("", "", "#reviews");
					}
				}
			}
		});
	/* 스크롤 변경시 Navbar_sticky & 주소 변경 */
	
	/* 강의 목록 opne */
	    $(".section_header").on('click', function () {
	    	var $this = $(this);
	    	var checkElement = $this.children();
	        
	    	if($this.is(".section_header") && ($this.nextAll().css('max-height') != '0px')){
	    		$this.removeClass('open');
	    		$this.nextAll().css('max-height', '0');
	    	} else if($this.is(".section_header") && ($this.nextAll().css('max-height') == '0px')){
	    		$this.addClass('open');
	    		$this.nextAll().css('max-height', 'max-content');
	    	}
	    });
	/* 강의 목록 opne */
		
	});
	
	</script>
	
</body>
</html>