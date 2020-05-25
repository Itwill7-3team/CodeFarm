   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- aside 영역 -->
<%
String loginEmail="";
if(session.getAttribute("m_email")!=null){
	 loginEmail=(String)session.getAttribute("m_email");
}
%>

<aside class="profile_aside">
		<ul class="menu-list">
		  <li class="menu1
		  is-active">
		    <a href="DashBoard.bo">대시보드</a>
		  </li>
		  <li class="menu1">
<!-- 		    <a href="#">알람</a> -->
		  </li>
		  <li class="menu1">
		    <a href="#">내 학습</a>
		    <ul>
		      <li class="menu2 "><a href="MyLecture.bo">수강중인 강의</a></li>
<!-- 		      <li class="menu2 "><a href="#">참여중인 로드맵</a></li> -->
		      <li class="menu2 "><a href="MyaskAction.bo">내 질문</a></li>
		    </ul>
		  </li>
		  <li class="menu1">
		    <a href="#">내 결제</a>
		    <ul>
		      <li class="menu2 "><a href="WishList.wi">위시리스트</a></li>
		      <li class="menu2 "><a href="BasketList.ba">수강 바구니</a></li>
<!-- 		      <li class="menu2 "><a href="#">내 쿠폰함</a></li> -->
		      <li class="menu2 "><a href="OrderList.or">구매 내역</a></li>
<!-- 		      <li class="menu2 "><a href="#">내 포인트</a></li> -->
		    </ul>
		  </li>
<!-- 		  <li class="menu1"> -->
<!-- 		    <a href="#">모든 알림</a> -->
<!-- 		  </li> -->
		  <li class="menu1">
		    <a href="#">설정</a>
		    <ul>
		      <li class="menu2 "><a href="MemberInfo.me">프로필 설정</a></li>
<!-- 		      <li class="menu2 "><a href="#">알림 설정</a></li> -->
		    </ul>
		  </li>
		  <%
		  
		  if( loginEmail != null &&  loginEmail.equals("admin@naver.com") ){
		  
		  %>
		  
		  <li class="adminstyle">
		    <a href="#">관리자</a>
		    <ul>
		      <li class="menu2 "><a href="MemberAdmin.me">회원 관리</a></li>
		      <li class="menu2 "><a href="requestView.bo">요청 사항</a></li>
		    </ul>
		  </li>
		  <%
		  }
		  %>
		</ul>
</aside>
<!-- aside 영역 -->