<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>

<link rel="stylesheet" href="./css/dashboard.css">
</head>

<%
	String loginEmail="";
	String nick="";
	if(session.getAttribute("m_email")!=null){
	 loginEmail=(String)session.getAttribute("m_email");
	 nick=(String)session.getAttribute("nick");
	}
%>


<body class="profile dashboard is_logged_in " >

    
<div id="root">
 <jsp:include page="/include/header.jsp"/>     
<section>
  <div class="container">
    <div class="columns">
    
<!-- aside 영역 -->
<jsp:include page="/include/dash-aside.jsp"/>

<!-- aside 영역 -->

<!-- 대시보드 -->
      <div class="main_container">
        <small class="is-hidden-mobile">
<nav class="breadcrumb" aria-label="breadcrumbs">
  <ul>
    <li><a href="#">대시보드</a></li>
  </ul>
</nav></small>
        <h3 class="heading is-hidden-mobile">대시보드</h3>
        <div class="is-multiline">
          <div class="is-half">
            <div class="box profile">
              <div class="box_title">
                <p>내 프로필</p>
              </div>
              <div class="box_content">
                <div class="media">
                  <div class="media-left">
                      <img src="./img/carrotIcon.png" alt="@@@님의 프로필">
                  </div>
                  <div class="media-content">
                    <h5> <%=nick %>님, 즐거운 하루 보내세요 🌟</h5> <!-- 인사말 -->
                    <span>닉네임:<%=nick %> </span><br> <!-- 유저 닉네임 -->
                    <span>이메일:<%=loginEmail %></span><br> <!-- 유저 이메일 -->
                  </div>
                  <a class="bottom_right" href="MemberInfo.me">프로필 수정하기</a>
                </div>
              </div>
            </div>
          </div>
<!-- 대시보드 -->
          
          
          
<!-- 최근학습강의 -->          
          <div class="is-half">
            <div class="box recent_course">
              <div class="box_title"><p>최근 학습 강의</p></div>
              <div class="box_content">
<p class="course_title">자바 프로그래밍 입문 강좌 (renew ver.) - 초보부터 개발자 취업까지!!</p> <!-- 강의제목 -->

  <div class="inf_progress">
<!--     <label>진도율 : 9강/29강 (31.03%)</label> 진도율
    <progress class="progress is-link" value="31.03" max="100">31.03%</progress>  --><!-- 프로그래스바 -->
  </div>
<div class="buttons bottom_right">
  <a href="MyLecture.bo" class="button is-link">내 모든 강의</a>
  <a class="button is-primary" href="LectureVideo.le">이어서 학습하기</a>
</div></div>
            </div>
          </div>
<!-- 최근학습강의 -->             
          
<!-- 내통계 -->          
          <div class="column is-half">
            <div class="box statistics">
              <div class="box_title"><p>내 통계</p></div>
              <div class="box_content">
                <div class="columns is-mobile">
                
                  <div class="stat">
                    <div class="status_value">
                      <span>0</span>				 <!-- 데이터 -->
                    </div>
                    <div class="status_label">완료 강의수</div>
                  </div>
                  
                  <div class="stat">
                    <div class="status_value">
                      <span>0</span>				<!-- 데이터 -->
                    </div>
                    <div class="status_label">완료 수업수</div>
                  </div>
                  
                  <div class="stat">
                    <div class="status_value">
                      <span>0</span> 				<!-- 데이터 -->
                    </div>
                    <div class="status_label">획득 수료증</div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
<!-- 내통계 -->            
<!-- My Skills -->          
          <div class="is-half">
            <div class="box skills">
              <div class="box_title"><p>My Skills</p></div>
              <div class="box_content">
                <div class="field is-grouped is-grouped-multiline">
                  
						<div class="control">
						  <div class="tags has-addons">
						    <span class="tag is-rounded" style="background-color: hsl(124.47777942317997,35.45271232368138%,89.47553586276383%)">
						      Back-End</span><!-- 데이터 -->
						    <span class="tag is-rounded">1</span><!-- 데이터 -->
						  </div>
						</div>
						<div class="control">
						  <div class="tags has-addons">
						    <span class="tag is-rounded" style="background-color: hsl(235.9804232030238,95.58946218818052%,88.66094714306371%)">
						      Java</span><!-- 데이터 -->
						    <span class="tag is-rounded">1</span><!-- 데이터 -->
						  </div>
						</div>
						<div class="control">
						  <div class="tags has-addons">
						    <span class="tag is-rounded" style="background-color: hsl(135.99095611173172,76.9016703983524%,92.6480736520283%)">
						      JSP</span><!-- 데이터 -->
						    <span class="tag is-rounded">1</span><!-- 데이터 -->
						  </div>
						</div>
                </div>
              </div>
            </div>
          </div>
<!-- My Skills -->          
<!-- My Certificates -->          
        <!--   <div class="is-half">
            <div class="box certificates">
              <div class="box_title">
                <p>My Certificates <a href="#" class="has-text-grey text is-4">(시리얼코드 확인)</a></p>
              </div>
              <div class="box_content">
                <div class="horizen_items">
                  
                  <div class="certificate_list_item">
                    <div class="status_value"><span>
                    
                    증명서 모양
                    <svg width="16" aria-hidden="true" data-prefix="fal" data-icon="file-certificate" class="svg-inline--fa fa-file-certificate fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <path fill="currentColor" d="M497.9 97.98L414.02 14.1c-9-9-21.19-14.1-33.89-14.1H176c-26.5.1-47.99 21.6-47.99 48.09V165.7c-5.97 0-11.94-1.68-24.13-5.03-1.7-.46-3.36-.66-4.96-.66-5.56 0-10.43 2.5-13.66 5.79-17.95 18.26-17.07 17.77-41.7 24.5-6.7 1.81-11.97 7.21-13.78 14.07-6.47 24.67-6.09 24.16-24.02 42.32-4.95 5.04-6.9 12.48-5.08 19.43 6.56 24.38 6.52 24.39 0 48.76-1.82 6.95.12 14.4 5.08 19.45 18 18.15 17.58 17.79 24.02 42.29 1.8 6.88 7.08 12.27 13.78 14.1 1.8.48 2.92.8 4.46 1.21V496c0 5.55 2.87 10.69 7.59 13.61 4.66 2.91 10.59 3.16 15.56.7l56.84-28.42 56.84 28.42c2.25 1.12 4.72 1.69 7.16 1.69h272c26.49 0 47.99-21.5 47.99-47.99V131.97c0-12.69-5.1-24.99-14.1-33.99zM384.03 32.59c2.8.7 5.3 2.1 7.4 4.2l83.88 83.88c2.1 2.1 3.5 4.6 4.2 7.4h-95.48V32.59zM33.28 316.68c5.7-22.3 5.7-30.23.01-52.39 15.65-16.2 19.56-22.98 25.63-45.06 21.57-6.13 28.06-9.92 43.88-25.69 9.8 2.62 16.82 4.15 25.21 4.15 8.28 0 15.25-1.49 25.19-4.16 15.56 15.51 22.49 19.58 43.86 25.68 5.98 21.95 9.71 28.63 25.65 45.07-5.77 22.45-5.76 30 0 52.4-15.62 16.17-19.55 22.96-25.61 44.96-14.63 3.92-24 7.36-37.25 19.36-9.94-4.53-20.78-6.89-31.85-6.89s-21.9 2.36-31.85 6.9c-13.18-11.88-22.56-15.34-37.23-19.33-5.97-21.89-9.72-28.57-25.64-45zm101.89 133.01c-4.5-2.25-9.81-2.25-14.31 0l-40.84 20.42V409.9c.12.12.19.17.31.29 3.75 3.82 8.68 5.79 13.64 5.79 3.5 0 7.02-.98 10.16-2.97 7.25-4.59 15.56-6.88 23.87-6.88s16.62 2.29 23.87 6.86c3.16 2.02 6.68 3.01 10.17 3.01 4.96 0 9.87-1.99 13.63-5.79.13-.13.21-.18.34-.32v60.22l-40.84-20.42zm344.84 14.32c0 8.8-7.2 16-16 16h-256V391.9c1.54-.4 2.65-.71 4.44-1.19 6.7-1.82 11.97-7.22 13.77-14.08 6.47-24.68 6.09-24.16 24.03-42.32 4.95-5.04 6.9-12.49 5.07-19.44-6.53-24.33-6.55-24.34 0-48.76 1.83-6.95-.12-14.4-5.07-19.45-18-18.15-17.58-17.79-24.03-42.29-1.8-6.87-7.07-12.27-13.75-14.09-24.23-6.57-23.89-6.23-41.72-24.52-2.94-2.97-6.78-4.52-10.74-5.16V48.09c0-8.8 7.2-16.09 16-16.09h176.03v104.07c0 13.3 10.7 23.93 24 23.93h103.98v304.01z"></path></svg></span></div>
                    증명서 모양
                    
                    <div class="status_label">
                    실전 JSP (renew ver.) - 신입 프로그래머를 위한 강좌
                    </div> 강의명
                  </div>
                </div>
                <a class="bottom_right is-hidden-mobile" href="#">인증서 전체 보기</a>
              </div>
            </div>
          </div> -->
<!-- My Certificates -->          
          
<!-- 최근학습강의 -->          
          <div class="is-half">
            <div class="box recent_courses">
              <div class="box_title"><p>최근 학습중인 강의들</p></div>
              <div class="box_content">
                <div class="courses_container">
                  
                  <a href="#" class="course_item"> <!-- 링크주소  -->
                    <div class="course_title"><!-- 자바 프로그래밍 입문 강좌 (renew ver.) - 초보부터 개발자 취업까지!! --></div> <!-- 타이틀 -->
                    <time class="finished_time" datetime="Sun Apr 26 2020 23:39:27 GMT+0900 (GMT+09:00)"><!-- 13일 전 --></time> <!-- 수강시간 -->
                  </a>
               
                </div>         
                <a class="bottom_right" href="#">내강의 전체보기</a>
              </div>
            </div>
          </div>
<!-- 최근학습강의 -->          
          
          
 <!-- 완료강의 -->       
          <div class="is-half">          
            <div class="box finished_courses">
              <div class="box_title"><p>완료한 강의</p></div>
              <div class="box_content">
                <div class="courses_container">
                  
                  <a href="#" class="course_item"><!-- 링크주소 -->
                    <div class="course_title"><!-- 실전 JSP (renew ver.) - 신입 프로그래머를 위한 강좌 --></div><!-- 타이틀 -->
                    <time class="finished_time" datetime="Sun Apr 26 2020 20:16:14 GMT+0900 (GMT+09:00)"><!-- 13일 전 --></time> <!-- 수강시간 -->
                  </a>
                </div>
                <a class="bottom_right" href="#">내강의 전체보기</a>
              </div>
            </div>
          </div>
 <!-- 완료강의 -->       
          
          
          
        </div>
      </div>
    </div>
  </div>
 </section>

<!-- 대시보드 -->
      
<jsp:include page="/include/footer.jsp"/>
    
</div>

</iframe>



</body>

</html>