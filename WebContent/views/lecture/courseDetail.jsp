<%@page import="com.wishlist.db.WishlistDTO"%>
<%@page import="com.lecture.db.LectureDTO"%>
<%@page import="com.review.db.ReviewDTO"%>
<%@page import="com.member.db.MemberDTO"%>
<%@page import="com.lecture.db.FileDTO"%>
<%@page import="com.order.db.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<body class="course_detail">
	<%
	/* 받아오는 값 */
		int wCount = (int)request.getAttribute("wCount"); // 위시 수
		int bCheck = (int)request.getAttribute("bCheck"); // 장바구니 여부
		LectureDTO  ldto = (LectureDTO)request.getAttribute("ldto");  // 강의 정보
		MemberDTO   mdto = (MemberDTO)request.getAttribute("mdto");   // 회원 정보
		MemberDTO  lmdto = (MemberDTO)request.getAttribute("lmdto");  // 강사 정보
		WishlistDTO wdto = (WishlistDTO)request.getAttribute("wdto"); // 위시 정보 
		
		List<LectureDTO>    lectureList = (List<LectureDTO>)request.getAttribute("lectureList"); // 강사의 전체 강의 정보
		List<ReviewDTO>     reviewList  = (List<ReviewDTO>)request.getAttribute("reviewList");   // 리뷰 정보
		List<List<FileDTO>> fileSet     = (List<List<FileDTO>>)request.getAttribute("fileSet");  // 파일 정보
		List<OrderDTO>      orderList   = (List<OrderDTO>)request.getAttribute("orderList"); // 개인 결제 정보
		Map<Integer, Map<String, Object>> ratingList = (Map<Integer, Map<String, Object>>)request.getAttribute("ratingList"); // 별점 정보
	/* 받아오는 값 */
	
	/* 현 강의 결제 유무 */
		boolean payCheck = false;
		if(mdto != null && mdto.getM_email() != null && orderList != null){
			for(int i=0; i<orderList.size(); i++){
				if(orderList.get(i).getO_l_num() == ldto.getL_number()){
					payCheck = true;
					break;
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
			total_Min  = (int)((totalTime - (total_Hour * 3600)) / 60);
		}else{
			total_Hour = 0;
			total_Min = (int)(totalTime / 60);
		}
	/* 파일 개수, 시간 계산 */
	%>
	<div id="root">
	
<%-- include header --%>	
	<jsp:include page="/include/header.jsp"/>
<%-- include header --%>	
		
		<main id="main">
		<section class="course_header_container">
			<div class="container">
				<div class="columns">
				
				<%-- title_bar --%>
					<div class="column is-8">
						<div class="columns">
						
						<%-- lecture thumbnail --%>
							<div class="column is-4-tablet thumbnail_container ">
								<div class="image is_thumbnail">
									<img src="./upload/<%= ldto.getL_img() %>" alt="<%= ldto.getL_title() %>">
								</div>
							</div>
						<%-- lecture thumbnail --%>
						
						<%-- lecture title --%>
							<div class="column course_title">
								<div>
									<h1><%= ldto.getL_title()%></h1>
									<div class="course_meta">
										
									<%-- review 별점 전체 평균  --%>
										<span>
											<div class='rating_star'>
												<div class='star_solid' style="width:<%= (double)ratingList.get(ldto.getL_number()).get("rating_avg") * 20 %>%">
												<% for(int i=1; i<6; i++){ %><i class="fa fa-star"  data-value="<%= i %>"></i><% } %>
												</div>
												<% for(int i=5; i>0; i--){ %><i class="far fa-star" data-value="<%= i %>"></i><% } %>
											</div>
											<small>(<%= ratingList.get(ldto.getL_number()).get("reviewAll") %>개의 수강평)</small>
										</span>
										<br class="is-hidden-mobile"><small class="student_cnt"><%= ldto.getPay_count() %>명의 수강생</small><br>
										
									<%-- lecture_type_category --%>
										<small class="course_skills">
											<a href="./Search.le?t1=<%= ldto.getL_type() %>&t2=<%= ldto.getL_type2() %>"><%= ldto.getL_type2() %></a>
										</small>
										
									</div>
								</div>
							</div>
						<%-- lecture title --%>
						
						</div>
					</div>
				<%-- title_bar --%>
				
				<%-- SideMenu --%>
					<div class="column is-4 enroll_btn_container">
						<div class="course_floating_btn">
							<div class="course_floating_top">
								<div class="course_price_cover">
								
								<%-- SideMenu_price --%>
									<div class="course_price_section">
										<div class="course_price">
											<% if (ldto.getL_price() == 0) { %>
												무료
											<% } else { %>
											<fmt:formatNumber value="<%= ldto.getL_price() %>" />원
											<% } %>
										</div>
									</div>
								<%-- SideMenu_price --%>
									
								<%-- SideMenu_button --%>
									<div class="course_btn_section">
										<div class="course_btn_cover">
										<% if (ldto.getL_price() == 0 || payCheck) { %>
											<button class="lecbtn is_fullwidth course_btn learn_btn is_primary">바로 학습하기</button>
										</div>
										<% } else { %>
											<button class="lecbtn is_fullwidth course_btn learn_btn purchase_btn is_primary">수강 신청</button>
										</div>
										<% } %>
											<div class="course_btn_cover">
												<button class="is_outlined course_sub_btn course_wish_btn wishBtn">
													<span class="wish">
														<i></i><span class="wish_cnt"><%= wCount %></span>
													</span>
													<span class="text">위시</span>
												</button>
												<button class="is_outlined course_sub_btn course_cart_btn cartBtn">
											    	<i></i><span class="text"> 수강 바구니</span>
											    </button>
										    </div>
									</div>
								<%-- SideMenu_button --%>
								
								</div>
								
							<%-- SideMenu_info --%>
								<div class="course_info_cover">
									<div class="course_info_row">
<%-- #003 강사 페이지 & 주소 변경 --%>
										<i class="fas fa-user-tie"></i>지식공유자 · <a href="/DashBoard.bo?m_nick=<%= lmdto.getM_nick() %>"><%= lmdto.getM_nick() %></a>
									</div>
									<div class="course_info_row">
										<i class="far fa-play-circle"></i><%
											out.println(fileCount + "회 수업 · 총 ");
											if(total_Hour != 0){ out.print(total_Hour + "시간" + total_Min + "분 수업"); }
											else { out.print(total_Min + "분 수업"); } %>
									</div>
									<div class="course_info_row">
										<i class="far fa-clock"></i><span class="has-text-weight-bold">평생</span> 무제한 시청
									</div>
									<div class="course_info_row">
										<i class="fas fa-signal"></i>수강 난이도 <span class="has-text-weight-bold"><%= ldto.getL_level() %></span>
									</div>
								</div>
							<%-- SideMenu_info --%>
						
							</div>
							<div class="course_relation_cover course_floating_bottom is-hidden-mobile">
							
							<%-- 다른 강의 더보기 --%>
								<div class="course_relation_tabs">
									<div class="course_relation_tab divactive" id="course_another_tab">다른 강의</div>
								</div>
								<div class="course_another_cover course_relation_list_cover divactive">
									<div class="course_another_list">
								<%
									int ja = 0;
									int lec_loop = 0;
									if(lectureList.size() > 2) { lec_loop = 2; }
									else if(lectureList.size() == 2) { lec_loop = 1; }
									else{ lec_loop = 0; }
									
									if(lec_loop == 2 || lec_loop == 1){
										for(int i=0; i<lec_loop; i++){
											if(lectureList.get(ja).getL_number() == ldto.getL_number()){
												ja += 1; // 현재 강의 제외
											}
								%>
										<li>
<%-- #003 강사 페이지 & 주소 변경 --%>
											<a href="/Instructors.le?m_nick=<%= lmdto.getM_nick() %>">
												<div class="el_thumbnail">
													<img src="./upload/<%= lectureList.get(ja).getL_img() %>" alt="<%= lectureList.get(ja).getL_title() %>">
												</div>
												<div class="el_info">
													<div class="el_title"><%= lectureList.get(ja).getL_title() %></div>
													<div class="el_subinfo">
														<div class="el_subtitle">
															<span>
																<fmt:setLocale value="ko_KR"/>
																<fmt:formatNumber value="<%= lectureList.get(ja).getL_price() %>" type="currency" />
															</span>
														</div>
														<div class="el_metas">
															<i class="fas fa-user"></i> <%= lectureList.get(ja).getPay_count() %> 
															<i class="fas fa-star"></i> <%= ratingList.get(lectureList.get(ja).getL_number()).get("rating_avg") %>
														</div>
													</div>
												</div>
											</a>
										</li>
								<%
										ja++;
										} // for
									} else {
										out.println("<div class='course_relation_no_result'>아직 다른 강의가 없어요.</div>");
									}
								%>
									</div>
								<% if(lectureList.size() > 2){ %>
									<div class="course_another_btn course_relation_btn">
<%-- #003 강사 페이지 & 주소 변경 --%>
										<a href="/Instructors.le?m_nick=<%= lmdto.getM_nick() %>">+ 다른 강의 더보기</a>
									</div>
								<% } %>
								</div>
							<%-- 다른 강의 더보기 --%>
									
							</div>
						</div>
					</div>
				<%-- SideMenu --%>
					
				</div>
			</div>
		</section>
		<section class="course_description_container">
		
		<%-- 강의 상세 Navbar --%>
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
				<% if(mdto != null && ldto.getL_m_email().equals(mdto.getM_email())){ %>
					<li class="tabs_li modify ">
						<a href="updateLecture.in?num=<%=ldto.getL_number()%>">수정하기</a>
					</li>
				<% } %>
				</ul>
			</div>
		<%-- 강의 상세 Navbar --%>
		
			<div class="container">
				<div class="course_description">
					<div class="columns">
						<div class="column is-8">
							<div class="content">
							
							<%-- 강의 소개 --%>
								<article class="description" id="description">
								
						<!-- l_description -->
							<% if(!(ldto.getL_description()==null || ldto.getL_description().equals(""))){ %>
								<div class="course_summary description_sub">
									<h3 class="sub_heading has-icon">이 강의는 <i class="far fa-lightbulb"></i></h3>
									<%= ldto.getL_description() %>
								</div>
							<% } %>
							
						<!-- l_abilities -->
							<%
								if(!(ldto.getL_abilities()==null || ldto.getL_abilities().equals(""))){
									out.println("<div class='can_do description_sub'><h3 class='sub_heading has-icon'>이런 걸 배울 수 있어요 <i class='fa fa-smile-o'></i></h3><ul>");
									for(int i=0; i<ldto.getL_abilities().split("/").length; i++){
										out.println("<li><i class='fa fa-check'></i> " + ldto.getL_abilities().split("/")[i] + "</li>");
									}
									out.println("</ul></div>");
								}
							%>
		
						<!-- l_content -->
							<% if(!(ldto.getL_content()==null || ldto.getL_content() == "")){ %>
								<div class="body" itemprop="articleBody">
									<%= ldto.getL_content() %>
								</div>
							<% } %>
							
						<!-- l_targets -->
							<%
								if(!(ldto.getL_targets()==null || ldto.getL_targets() == "")){
									out.println("<div class='student_target description_sub'><h3 class='sub_heading has-icon'>도움 되는 분들 <i class='fa fa-smile-o'></i></h3><ul>");
									for(int i=0; i<ldto.getL_targets().split("/").length; i++){
										out.println("<li><i class='fa fa-check'></i> " + ldto.getL_targets().split("/")[i] + "</li>");
									}
									out.println("</ul></div>");
								}
							%>
							
						<!-- l_based -->
							<%
								if(!(ldto.getL_based()==null || ldto.getL_based().equals(""))){
									out.println("<div class='prerequisite description_sub'><h3 class='sub_heading has-icon'>선수 지식 <i class='fa fa-smile-o'></i></h3><ul>");
									for(int i=0; i<ldto.getL_based().split("/").length; i++){
										out.println("<li><i class='fa fa-check'></i> " + ldto.getL_based().split("/")[i] + "</li>");
									}
									out.println("</ul></div>");
								}
							%>

								</article>
							<%-- 강의 소개 --%>
								
							<%-- 강사 소개 페이지 --%>
								<article class="course_instructor">
									<h3 class="sub_heading">지식공유자 소개</h3>
									<div class="profile">
										<div class="course_instructor_profile">
											<figure class="image">
								<%-- #002 강사 아이콘 --%>
												<img class="is-rounded" src="./img/sunny.png">
											</figure>
										</div>
										<h4 class="name">
<%-- #003 강사 페이지 & 주소 변경 --%>
											<a href="/Instructors.le?m_nick=<%= lmdto.getM_nick() %>"><%= lmdto.getM_nick() %></a>
										</h4>
									</div>
									<p class="introduce"></p>
								</article>
							<%-- 강사 소개 페이지 --%>
								
							<%-- 교육 과정 --%>
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
									<%-- video count, playtime --%>
										
									<%-- section_content --%>
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
											
										<%-- video_play --%>
											<div class="lecture_cover">
											
											<%-- video --%>
											<%
											for(int j=0; j<fileSet.get(i).size(); j++){
											
											int col_Min = (int)(fileList.get(j).getF_playtime() / 60);
											int col_Sec = (int)(fileList.get(j).getF_playtime() - col_Min * 60);
											
											String cMin_Str = col_Min <= 10 ? "0" + Integer.toString(col_Min) : Integer.toString(col_Min);
											String cSec_Str = col_Sec <= 10 ? "0" + Integer.toString(col_Sec) : Integer.toString(col_Sec);
											
												if(payCheck){
											%>
<<<<<<< HEAD
<%-- #004 영상 재생 페이지 이동 주소 확인 --%>
												<a class="unit_item" href="./LectureVideo.le?l_number=<%= ldto.getL_number() %>&f_num=<%= fileList.get(j).getF_num() %>">

=======
												<a class="unit_item" href="./LectureVideo.le?l_number=<%= ldto.getL_number() %>&f_num=<%= fileList.get(j).getF_num() %>">
>>>>>>> branch 'Team2' of https://github.com/Itwill7-3team/CodeFarm.git
													<div class="unit_item_left">
														<i class="fa fa-play-circle-o"></i><span class="unit_title"><%= fileList.get(j).getF_col_name() %></span>
													</div>
													<div class="unit_item_right">
														<span class="unit_preview">
															<button class="button is-link is-small">
																<span class="is-hidden-mobile">강의보기</span>
																<span class="is-hidden-tablet"><i class="fa fa-smile-o"></i></span>
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
														<span class="unit_time is-hidden-mobile"><i class="far fa-clock"></i><% out.println(cMin_Str + " : " + cSec_Str); %></span>
													</div>
												</div>
												<% } %>
											<%-- video --%>
											<% fileCount++; } %>
										
											</div>
										<%-- video_play --%>
										</div>
									<% } %>
									<%-- section_content --%>
									
									</div>
								</article>
							<%-- 교육 과정 --%>
							
							<%-- 수강 후기 --%>
								<article class="course_date">
									<h4 class="sub_heading">공개 일자</h4>
									<div>
										<fmt:formatDate value="<%= ldto.getL_reg_date() %>" type="date" pattern="yyyy년 MM월 dd일"/>
										<span class="last_update_date"> (마지막 업데이트 일자 : <fmt:formatDate value="<%= ldto.getPct_date() %>" type="date" pattern="yyyy년 MM월 dd일"/>)</span>
									</div>
								</article>
								
							<%-- 수강 후기 --%>
								<article class="reviews" id="reviews">
									<h4 class="sub_heading">수강 후기</h4>
									<div class="review_summary">
									
									<% if(reviewList.size() != 0){ %>
									<%-- (위쪽과 동일) 수강 후기  review 평점  --%>
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
									<%-- (위쪽과 동일) 수강 후기  review 평점  --%>
										
									<%-- 평점 progress_bar --%>
										<div class="progress_bars">
										<% for(int i=5; i>0; i--){ %>
											<div class="review_counting">
												<label><%= i %>점</label>
												<progress class="progress is-link" max="<%= ratingList.get(ldto.getL_number()).get("reviewAll") %>" value="<%= ratingList.get(ldto.getL_number()).get("rating_" + i) %>"></progress>
											</div>
										<% } %>
										</div>
									<%-- 평점 progress_bar --%>
									
									<% } else { %>
										<p class="not_yet_reviews">아직 평가를 충분히 받지 못한 강의 입니다.<br>모두에게 도움이 되는 수강평의 주인공이 되어주세요!😄️️</p>
									<% } %>
									</div>
									<div class="review_list">
									
								<%-- review_container --%>
									<%
									int rSize = 0;
									if(reviewList.size() >= 2){ rSize = 2; }
									else if(reviewList.size() == 1){ rSize = 1; }
									else{ rSize = 0; }
									if(reviewList.size() != 0){
										for(int r_loop=0; r_loop<rSize; r_loop++){
									%>
										<div class="article_container">
											<article class="media review_item">
										<% 
											if(rSize == 2 && reviewList.get(r_loop).getR_re_lev() == 1){
												r_loop += 1;
											}
											if(reviewList.get(r_loop).getR_re_lev() == 0){
										%>
											<%-- 회원 아이콘 등록 --%>
												<figure class="media-left image is-64x64">
											<%-- #001 회원 아이콘 --%>
													<img src='./img/carrotIcon.png' class='is-rounded' alt='<%= reviewList.get(r_loop).getR_writer() %>'>
												</figure>
											
												<div class="media-content">
													<div class="content">
													
													<%-- 회원별 별점 정보 --%>
														<span>
															<div class='rating_star'>
																<div class='star_solid'>
																<% for(int i=1; i<reviewList.get(r_loop).getR_rating() + 1; i++){ %><i class="fa fa-star"  data-value="<%= i %>"></i><% } %>
																</div>
																<% for(int i=5; i>0; i--){ %><i class="far fa-star" data-value="<%= i %>"></i><% } %>
															</div>
														</span>
											
													<%-- 회원 이름 --%>
														<strong><%= reviewList.get(r_loop).getR_writer() %></strong>
													
													<%-- 작성 일자 --%>
														<small class="review updated_at">
															<span>
																<fmt:formatDate value="<%= reviewList.get(r_loop).getR_reg_date() %>" type="date" pattern="yyyy-MM-dd"/>
															</span>
															<span class="option"></span>
														</small><br>
														
													<%-- 리뷰 내용 --%>
														<div class="review_body">
															<%= reviewList.get(r_loop).getR_content() %>
														</div>
													
													<%-- 답글 등록 버튼 --%>
													<% if(mdto != null && (mdto.getM_email().equals(lmdto.getM_email()) || mdto.getM_rank() >= 3)){ %>
														<% if(!(r_loop + 1 >= reviewList.size())){ %>
															<% if(!(reviewList.get(r_loop).getR_re_ref() == reviewList.get(r_loop + 1).getR_re_ref())){ %>
														<div class="reactions">
														<input type="hidden" class="r_re_lev" value="<%= reviewList.get(r_loop).getR_re_lev() %>">
														<input type="hidden" class="r_re_ref" value="<%= reviewList.get(r_loop).getR_re_ref() %>">
														<input type="hidden" class="r_re_seq" value="<%= reviewList.get(r_loop).getR_re_seq() %>">
														<textarea class='comment_area' style="display: none"></textarea>
															<button class="button is-link is-small commentBtn">
																<span class="is-hidden-mobile">답글 쓰기</span>
																<span class="is-hidden-tablet"><i class="fa fa-commenting-o"></i></span>
															</button>
															<button class="button is-link is-small sendComment" style="display: none">
																<span class="is-hidden-mobile">답글 쓰기</span>
																<span class="is-hidden-tablet"><i class="fa fa-commenting-o"></i></span>
															</button>
														</div>
															<%  } %>
														<%  } %>
													<%  } %>
													
													</div>
											<%
											if(!(r_loop + 1 >= reviewList.size())){
												if(reviewList.get(r_loop + 1).getR_re_lev() == 1 && reviewList.get(r_loop).getR_re_ref() == reviewList.get(r_loop + 1).getR_re_ref()){ %>
												<%-- review_comment --%>
													<div class="review_comments">
														<div class="article_container">
															<article class="media comment">
																<figure class="media-left image is-32x32">
															<%-- #002 강사 아이콘 --%>
																	<img src="./img/sunny.png" alt="<%= reviewList.get(r_loop + 1).getR_writer() %>">
																</figure>
																<div class="media-content">
																	<div class="content">
																		<p>
																		<%-- 회원 이름, 작성 일자, 내용 --%>
																			<small>
																				<span class="author"><strong><%= reviewList.get(r_loop + 1).getR_writer() %></strong></span>
																				<span class="updated_at">
																					<fmt:formatDate value="<%= reviewList.get(r_loop + 1).getR_reg_date() %>" type="date" pattern="yyyy-MM-dd"/>
																				</span>
																			</small><br>
																			<span class="article_body">
																				<%= reviewList.get(r_loop + 1).getR_content() %>
																			</span>
																		<%-- 회원 이름, 작성 일자, 내용 --%>
																		</p>
																	</div>
																</div>
															</article>
														</div>
													</div>
												<%-- review_comment --%>
											<%
												}
											 }
											 %>
												</div>
											</article>
										</div>
									<%
											} //if(reviewList.get(r_loop).getR_re_lev() == 0){
										} //for(int r_loop=0; r_loop<reviewList.size(); r_loop++)
									} //if(reviewList.size() != 0)
									%>
								<%-- review_container --%>
										
									</div>
								</article>
							<%-- 수강 후기 --%>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		</main>
	</div>
	<div style="height:66px;"></div>
	
	<script type="text/javascript">
		
	$(document).ready(function(){
	
	<%-- 스크롤 변경시 Navbar_sticky & 주소 변경 --%>
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
	<%-- 스크롤 변경시 Navbar_sticky & 주소 변경 --%>
	
	<%-- 영상 링크 사용시 style변경 --%>
		$('iframe').removeAttr('width').removeAttr('height').css({
			position : 'absolute',
			top      : '0',
			width    : '100%',
			height   : '100%'
	 	});
		$('iframe').parent().addClass('iframe_container').css({
			padding  : '56.25% 0 0 0',
			position : 'relative',
			margin   : '20px 0',
			height   : '0'
		});
	<%-- 영상 링크 사용시 style변경 --%>
	
	<%-- 강의 목록 opne --%>
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
    <%-- 강의 목록 opne --%>
	
	<%-- 위시리스트 & 수강바구니 아이콘 로드 --%>
		var hIcon = $(".wish > i");
		var cIcon = $(".cartBtn > i");
		
		if(${ wdto != null && wdto.getW_l_num() == ldto.getL_number() }){
			hIcon.addClass('fa fa-heart').removeClass("fa-heart-o");
		} else {
			hIcon.addClass('fa fa-heart-o').removeClass("fa-heart");
		}
		
		if(${ bCheck != 0 }){
			cIcon.addClass('fa fa-shopping-cart').removeClass("fa-cart-plus");
		} else {
			cIcon.addClass('fa fa-cart-plus').removeClass("fa-shopping-cart");
		}
	<%-- 위시리스트 & 수강바구니 아이콘 로드 --%>
		
	<%-- 위시리스트 --%>
		$(".wishBtn").click(function(){
			var w_cnt = $(".wish > span");
			if(${ mdto != null && mdto.getM_email() != null }){
				$.ajax({
					url      : "./WishListReg.wi",
					type     : "POST",
					dataType : "json",
					data: {
						l_number : ${ ldto.getL_number() },
						m_email  : "${ mdto.getM_email() }"
					},
					success: function(data){
						if(data.wishCheck == "insert"){
							hIcon.addClass("fa-heart").removeClass("fa-heart-o");
							w_cnt.text(data.wishCount);
						} else {
							hIcon.addClass("fa-heart-o").removeClass("fa-heart");
							w_cnt.text(data.wishCount);
						}
					}
				});
			} else {
				$.ajax({
					url  : "./MemberLogin.me",
					type : "POST",
					success : function(data) {
						$(".login_form").html(data);
					},
				});
			}
		});
	<%-- 위시리스트 --%>
	
	<%-- 장바구니 --%>
		$(".cartBtn").click(function(){
			if(${ mdto != null && mdto.getM_email() != null }){
				$.ajax({
					url      : "./BasketReg.ba",
					type     : "POST",
					dataType : "text",
					data: {
						l_number : ${ ldto.getL_number() },
						l_price  : ${ ldto.getL_price() },
						l_title  : "${ ldto.getL_title() }",
						m_email  : "${ mdto.getM_email() }"
					},
					success : function(data){
						if(data == "insert"){
							cIcon.addClass("fa-shopping-cart").removeClass("fa-cart-plus");
						} else {
							cIcon.addClass("fa-cart-plus").removeClass("fa-shopping-cart");
						}
					}
				});
			} else {
				$.ajax({
					url  : "./MemberLogin.me",
					type : "POST",
					success : function(data) {
						$(".login_form").html(data);
					},
				});
			}
		});
	<%-- 장바구니 --%>
	
	<%-- 수강신청 --%>
	$(".learn_btn.purchase_btn").click(function(){
		if(${ mdto == null }){
			$.ajax({
				url  : "./MemberLogin.me",
				type : "POST",
				data : { },
				success : function(data) {
					$(".login_form").html(data);
				},
				error : function(xhr, status, error) {
					alert("error: " + error);
				}
			});
		} else {
			location.href = "BasketIn.ba?num=<%=ldto.getL_number() %>";
		}
	});
	<%-- 수강신청 --%>
	
	<%-- 댓글 작성 폼 --%>
		$(document).on("click", ".reactions > .commentBtn", function(){
			$(this).css('display', 'none');
			$(this).parent().css('margin-top', '15px');
			$(this).nextAll(".sendComment").removeAttr('style');
			$(this).prevAll(".comment_area").removeAttr('style');
		});
	<%-- 댓글 작성 폼 --%>
	
	<%-- 댓글 작성 --%>
		$(document).on("click", ".reactions > .sendComment", function(){
			var lev    = $(this).prevAll('.r_re_lev');
			var ref    = $(this).prevAll('.r_re_ref');
			var seq    = $(this).prevAll('.r_re_seq');
			var area   = $(this).prevAll('.comment_area');
			var addCom = $(this).parents('.media-content').children().last();
			if(area.val().trim() == null || area.val().trim() == ""){
				alert("내용을 입력하세요");
				return;
			}
			$(this).css('display', 'none');
			$(this).parent().removeAttr('style');
			$(this).prevAll(".commentBtn").removeAttr('style');
			$(this).prevAll(".comment_area").css('display', 'none');
			$.ajax({
				url      : "./ReviewComment.bo",
				type     : "POST",
				dataType : "json",
				data : {
					r_l_num   : ${ ldto.getL_number() },
					r_content : area.val(),
					r_writer  : "${ lmdto.getM_nick() }",
					r_rating  : 0,
					r_re_lev  : lev.val(),
					r_re_ref  : ref.val(),
					r_re_seq  : seq.val()
				},
				success : function(json){
					var addComment = "";
					addComment += "<div class='review_comments'><div class='article_container'><article class='media comment'>"
									+ "  <figure class='media-left image is-32x32'>"
						<%-- #002 강사 아이콘 --%>
									+ "    <img src='./img/sunny.png' alt='" + json.r_writer + "'>"
									+ "  </figure>"
									+ "  <div class='media-content'><div class='content'><p>"
									+ "    <small>"
									+ "      <span class='author'><strong>" + json.r_writer + "</strong></span>"
									+ "      <span class='updated_at'>" + json.r_reg_date + "</span>"
									+ "    </small><br>"
									+ "    <span class='article_body'>" + json.r_content + "</span>"
									+ "  </p></div></div>"
									+ "</article></div></div>";
					addCom.after(addComment);
					$(this).prevAll(".commentBtn").css('display', 'none');
				}
			});
		});
	<%-- 댓글 작성 --%>
	
	<%-- 수강평 더 보기 버튼 생성 --%>
		var review_cnt = $(".review_list .article_container").length;
		if(review_cnt < ${ fn:length(reviewList) }){
			$("<button class='is-fullwidth button is-link e_show_more_review'>다른 수강평 보기</button>").appendTo(".review_list");
		}
	<%-- 수강평 더 보기 버튼 생성 --%>
		
	<%-- 수강평 로드 --%>
		$(document).on('click', '.e_show_more_review', function(){
			$.ajax({
				url      : "./DetailReview.le",
				type     : "POST",
				dataType : "json",
				data: {
					l_number : ${ ldto.getL_number() }
				},
				success: function (json){
					console.log(json);
					var output = "";
					var pre_count = $(".review_list>.article_container").length;
					for(var i=pre_count; i<json.length; i++){
						if(json[i].r_re_lev == 0){
						output += "<div class='article_container'><article class='media review_item'>"
								+ "  <figure class='media-left image is-64x64'>"
					<%-- #001 회원 아이콘 --%>
								+ "    <img src='./img/carrotIcon.png' class='is-rounded' alt='default_profile.png'>"
								+ "  </figure>"
								+ "  <div class='media-content'>"
								+ "    <div class='content'>"
								+ "      <span><div class='rating_star'>"
								+ "        <div class='star_solid'>";
							for(var innerStar=1; innerStar<json[i].r_rating + 1; innerStar++){
								output += "<i class='fa fa-star' data-value=" + innerStar + "></i>";
							}
						output += "          </div>"
							for(var outerStar=5; outerStar>0; outerStar--){
								output += "<i class='far fa-star' data-value=" + outerStar + "></i>";
							}
						output += "      </div></span>"
								+ "      <strong>" + json[i].r_writer + "</strong>"
								+ "      <small class='review updated_at'>"
								+ "        <span>" + json[i].r_reg_date + "</span><span class='option'></span>"
								+ "      </small><br>"
								+ "      <div class='review_body'>" + json[i].r_content + "</div>";
							if(${ mdto != null && mdto.getM_email() != null && mdto.getM_rank() == 2 }){
								if(!(i + 1 >= json.length)){
									if(!(json[i].r_re_ref == json[i + 1].r_re_ref)){
							output += "      <div class='reactions'>"
									+ "        <input type='hidden' class='r_re_lev' value='" + json[i].r_re_lev + "'>"
									+ "        <input type='hidden' class='r_re_ref' value='" + json[i].r_re_ref + "'>"
									+ "        <input type='hidden' class='r_re_seq' value='" + json[i].r_re_seq + "'>"
									+ "        <textarea class='comment_area' style='display: none'></textarea>"
									+ "        <button class='button is-link is-small commentBtn'>"
									+ "          <span class='is-hidden-mobile'>답글 쓰기</span>"
									+ "          <span class='is-hidden-tablet'><i class='fa fa-commenting-o'></i></span>"
									+ "        </button>"
									+ "	       <button class='button is-link is-small sendComment' style='display: none'>"
									+ "	         <span class='is-hidden-mobile'>답글 쓰기</span>"
									+ "	         <span class='is-hidden-tablet'><i class='fa fa-commenting-o'></i></span>"
									+ "        </button>"
									+ "      </div>";
									}
								}
							}
						 	if(i<json.length - 1 && json[i + 1].r_re_lev == 1 && json[i].r_re_ref == json[i + 1].r_re_ref) {
							output += "<div class='review_comments'><div class='article_container'><article class='media comment'>"
									+ "  <figure class='media-left image is-32x32'>"
					<%-- #002 강사 아이콘 --%>
									+ "    <img src='./img/sunny.png' alt='" + json[i + 1].r_writer + "'>"
									+ "  </figure>"
									+ "  <div class='media-content'><div class='content'><p>"
									+ "    <small>"
									+ "      <span class='author'><strong>" + json[i + 1].r_writer + "</strong></span>"
									+ "      <span class='updated_at'>" + json[i + 1].r_reg_date + "</span>"
									+ "    </small><br>"
									+ "    <span class='article_body'>" + json[i + 1].r_content + "</span>"
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
	<%-- 수강평 로드 --%>
	
	});
	
	</script>
	
</body>
</html>