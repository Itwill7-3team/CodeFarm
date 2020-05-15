<%@page import="com.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="./img/logo.ico" rel="shortcut icon" type="image/x-icon">
<title>코딩팜</title>
<style type="text/css">

.profile_aside {
    display: inline-block;
    width: 15%;
    min-width: 230px;
    height: 900px;
    vertical-align: top;
    margin-left: 19em;
    /* border: 1px solid; */
}

.container{
    display: inline-block;
    width: 65% !important;
    }
    
.main_container {
    display: inline-block;
    width: 60% !important;
    height: 100%;
    margin: 0 auto;
    margin-top: 60px;
    /* border: 1px solid red; */
}

input[type="file" i] {
    -webkit-appearance: initial;
    background-color: initial;
    cursor: default;
    align-items: baseline;
    color: inherit;
    text-align: start !important;
    padding: initial;
    border: initial;
    display: none;
}

.file-label{
cursor: pointer;
}

input[type="password" i] {
    -webkit-text-security: disc !important;
    display: block;
    text-align: left;
    margin: 0;
}
label {
    cursor: default;
    display: block;
}

span {
    display: block;
    font-weight: inherit;
    font-style: inherit;
}

</style>


<link rel="stylesheet" href="./css/dashboard.css">
</head>
<link rel="stylesheet" href="./css/admin.css">
<body class="profile dashboard is_logged_in " >

<% 
 	String m_email = (String)session.getAttribute("m_email");
	if(m_email == null){
		response.sendRedirect("Main.le");
	}
	MemberDTO mdto = (MemberDTO)request.getAttribute("mdto");
%>
    
<div id="root">
<jsp:include page="/include/header.jsp"/>     
<!-- aside 영역 -->
<jsp:include page="/include/dash-aside.jsp"/>
<!-- aside 영역 -->
<div class="container">
<!-- 대시보드 -->
      <div class="main_container">
<small class="is-hidden-mobile">
<nav class="breadcrumb" aria-label="breadcrumbs">
  <ul>
    <li><a href="#">설정</a></li>
    <li><a href="#">프로필 설정</a></li>
  </ul>
</nav>
</small>
        <h6>계정 설정</h6>
          <div class="tabs">
            <ul>
              <li class="is-active"><a href="#">프로필 설정</a></li>
              <li><a href="#">알림 설정</a></li>
            </ul>
          </div>
        <div class="tab_content">
<section class="hero profile_setting">
  <div class="body">

  <div class="profile_edit_container">
      <div class="profile_edit">
        <form class="field profile_upload">
          <div class="file is-boxed">
            <label class="file-label">
<!--               <input type="file" class="file-input" name="profile_image"> -->
              <span class="file-cta">
                <img class="thumbnail_image" 
				src="./img/carrotIcon.png" style="width: 200px; height: 200px; opacity: 0.8;" alt="@@@님의 프로필"> <!-- 당근이미지 -->
              </span>
            </label>
          </div>
          <small class="warning"></small>
        </form>
        
	<form action="./IntroUpdateAction.me" method="post">
        <div class="right">
          <label for="name" class="label input_label">
            <span>닉네임</span>
            <input id="name" type="text" class="input" value="<%=mdto.getM_nick() %>" placeholder="변경할 닉네임을 입력해주세요">
          </label>
          <label for="introduce" class="label input_label">
            <span>자기소개</span>
            <textarea name="n_intro" class="tinymce" id="mce_0" aria-hidden="true" cols="40" rows="10" placeholder="자기소개를 해주세요"><%
            if(mdto.getM_intro() == null){
            	%>자신을 소개를 해주세요.
            	<%
            }else if(mdto.getM_intro() != null){
            	out.print(mdto.getM_intro());
            }
            %></textarea>
		
		  </label>
        </div>
      </div>
      <input type="submit" class="button is-primary"  value="저장하기">
    </div>
</form>
    <div class="email_pwd_container">
	<form action="./PwUpdateAction.me">
      <div class="password_edit">
        <label for="new_password" class="label input_label"><span>비밀번호</span></label>
        <input id="m_pw" type="password" data-type="current" class="input" placeholder="현재 비밀번호">
        <input id="new_pw" type="password" data-type="new" class="input" placeholder="새 비밀번호">
        <input id="confirm_password" type="password" data-type="confirm" class="input" placeholder="새 비밀번호 확인">
        <small class="invalid"></small>
        <div class="button_container">
          <input type="submit" class="button is-primary" value="저장하기">
        </div>
      </div>
</form>
      <div class="secession">
        <div class="label_wrap">
          <label class="label input_label"><span>탈퇴</span></label> <!-- 토글  -->
          <span class="toggle_btn">
            <i class="fal fa-chevron-right"></i>
          </span>
        </div>
        <div class="optional">
          <div class="notice">
            <h3>탈퇴 안내 사항</h3>
            <p>코딩팜에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요? 그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!</p>
            <p>🙇🏻&zwj;♂️ 감사합니다 🙇🏻&zwj;♀️</p><br>
            <p>1. 회원이 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동적으로 삭제되지 않으며, 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.</p>
            <p>2. 탈퇴 후 동일한 메일로 재가입이 가능하지만, 탈퇴 한 계정과 연동되지 않습니다.</p>
            <p>3. 탈퇴 후 연동된 소셜 계정 정보도 사라지며, 소셜 로그인으로 기존 계정 이용이 불가능합니다.</p>
            <p>4. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.</p>
          </div>
          <input class="input" type="password" placeholder="현재 비밀번호">
          <small class="invalid"></small>
          <div class="button_container">
            <button class="button">탈퇴하기</button>
          </div>
        </div>
      </div>
    </div>
</div>
</section>

</div>
</div>
</div>
<!-- 대시보드 -->
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
<script type="text/javascript">
$("#password").on("input propertychange paste",function() { //값을 입력하거나 값이 바뀌었을경우
	if (!regExpPw.test($("#password").val())) {
		$(".error_msg1").text("숫자와 영문자 특수문자(선택) 조합으로 8~15자리를 사용해야 합니다.");
		$(".error_msg1").css("color", "red");
		pwcheck=false;
		return false;
	} else {
		$(".error_msg1").text("사용가능");
		$(".error_msg1").css("color", "blue");
		pwcheck=true;
	}

});
$("#password_check").on("input propertychange paste",function() { //값을 입력하거나 값이 바뀌었을경우
	if ($("#password").val() == $("#password_check").val()) {
		$(".error_msg2").text("비밀번호가 일치합니다.");
		$(".error_msg2").css("color", "blue");
		pwcheck2=true;

	} else {
		$(".error_msg2").text("비밀번호가 일치하지 않습니다.");
		$(".error_msg2").css("color", "red");
		pwcheck2=false;
	}
});
</script>
</html>
