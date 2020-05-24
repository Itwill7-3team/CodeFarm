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

@media screen and (max-width: 1085px) {

.main_container {
    margin-left: 2em !important; 
}

}

.profile_aside {
    display: inline-block;
    width: 15%;
    min-width: 230px;
    height: 900px;
    vertical-align: top;
    margin-left: 1em;
    /* border: 1px solid; */
}

.container{
/*     display: inline-block; */
    width: 70% !important;
    margin: 0 auto;
    }
    
.main_container {
    display: inline-block;
    width: 55% !important;
    height: 100%;
    margin: 0 auto;
    margin-top: 60px;
/*     margin-left: 3em !important; */
    /* border: 1px solid red; */
}

.main_container h6{
margin: 0 2em;
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

/* .file-label{ */
/* cursor: pointer; */
/* } */

input[type="text" i], textarea {
    padding: 0.5em 1em;
    width: 200px;
    border-radius: 5px;
}
input[type="password" i]{
    -webkit-text-security: disc !important;
    display: block;
    text-align: left;
    margin: 0;
    padding: 0.5em 1em;
    width: 200px;
    border-radius: 5px;
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

.breadcrumb li,.tabs li{
float: left;
margin: 0 0.5em;
}
.profile_edit_container,.password_edit,.secession{
    clear: both;
    max-width:280px;
    margin: 2em auto;
    padding: 2em;
    border: 5px pink dotted;
/*     border: 1px solid; */
}

.password_edit{
    padding: 2em 2em 3em 2em;
}

.button.is-primary {
   width: 200px;
   text-align: center;
   padding-left: 4em;
}

.optional{
display: none;
}

 .profile_setting{
/* border: 1px pink solid; */
    min-width: 570px;
    max-width: 600px;
} 
.body{
display:flex;
}
.profile_edit_container{
flex:1;
/* border: 1px pink solid; */
}

.secession{
    border: 5px #f5e0e0 dotted !important;
    padding: 1em 2em 12em 2em !important; 
/* 	margin-top:11em; */
    line-height: 3;
}

.notice{
    font-size: 12px;
}

.email_pwd_container{
    flex: 1;
/*     border: 1px solid; */
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
<jsp:include page="/include/header.jsp"/>   

    
<div id="root">
  
<div class="container">
<!-- 대시보드 -->
<!-- aside 영역 -->
<jsp:include page="/include/dash-aside.jsp"/>
<!-- aside 영역 -->
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
          </div>
        <div class="tab_content">
<section class="hero profile_setting">
  <div class="body">

  <div class="profile_edit_container">
      <div class="profile_edit">
        <form class="field profile_upload">
          <div class="file is-boxed">
            <label class="file-label">
              <span class="file-cta">
                <img class="thumbnail_image" 
				src="./img/carrotIcon.png" style="width: 200px; height: 200px; opacity: 0.8;" alt="<%=mdto.getM_nick() %>님의 프로필"> <!-- 당근이미지 -->
              </span>
            </label>
          </div>
          <small class="warning"></small>
        </form>
        
	<form action="./IntroUpdateAction.me" method="post">
        <div class="right">
          <label for="name" class="label input_label">
            <span>닉네임</span>
            <input id="name" type="text" name="m_nick" class="input" placeholder="닉네임을 입력해주세요"<%if(mdto.getM_nick() != null){%>value="<%=mdto.getM_nick() %>"<%} %> >
          </label>
          <label for="introduce" class="label input_label">
            <span>자기소개</span>
            <textarea name="m_intro" class="tinymce" id="mce_0" aria-hidden="true" cols="25" rows="8" 
            <%if(mdto.getM_intro() == null){%>
            placeholder="자기소개를 해주세요"<%}%>><%if(mdto.getM_intro() != null){%><%=mdto.getM_intro()%><%}%></textarea>
		
		  </label>
        </div>
      </div>
      <input type="submit" class="button is-primary"  value="저장하기">
    </div>
</form>
    <div class="email_pwd_container">
	<form class="pw_form" action="./PwUpdateAction.me" method="post">
	
      <div class="password_edit">
        <label for="new_password" class="label input_label"><span>비밀번호</span></label>
        <input id="m_pw" name="Oldm_pw" type="password" data-type="current" class="input" placeholder="현재 비밀번호">
        
        <input class="text_input" type="password" id="password"
						name="m_pw" placeholder="새 비밀번호">
        <p class="error_msg1" ></p>
        <input  class="text_input" type="password" id="password_check"
							name="m_pwCheck" placeholder="새 비밀번호 확인">
        <p class="error_msg2" ></p>
        <small class="invalid"></small>
        <div class="button_container">
          <input type="submit" class="button is-primary" value="저장하기">
        </div>
      </div>
</form>
      <div class="secession">
        <div class="label_wrap">
          <label class="Dlabel input_label"><span>탈퇴
            <i class="fas fa-minus-circle"></i>
          </span></label><!-- 토글  -->
        </div>
        <div class="optional">
          <div class="notice">
          <br>
            <h3>탈퇴 안내 사항</h3>
            <p>코딩팜에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요? 그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!</p>
            <p>🙇🏻&zwj;♂️ 감사합니다 🙇🏻&zwj;♀️</p><br>
            <p>1. 회원이 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동적으로 삭제되지 않으며, 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.</p>
            <p>2. 탈퇴 후 동일한 메일로 재가입이 가능하지만, 탈퇴 한 계정과 연동되지 않습니다.</p>
            <p>3. 탈퇴 후 연동된 소셜 계정 정보도 사라지며, 소셜 로그인으로 기존 계정 이용이 불가능합니다.</p>
            <p>4. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.</p>
          <br>
          </div>
          <form class="delete_form" method="post">
          <input class="input" name="m_pw" type="password" placeholder="현재 비밀번호">
          <small class="invalid"></small>
          <div class="button_container">
            <button class="delete_btn">탈퇴하기</button>
          </div>
          </form>
        </div>
      </div>
    </div>
</div>
</section>

</div>
</div>
</div>
<script type="text/javascript">
$(".Dlabel").click(function(){
  $(".optional").toggle();
});
</script>

<!-- 대시보드 -->
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
<script type="text/javascript">

var pwcheck=false;
var pwcheck2=false;
var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,15}$/;
var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	$(".btn_sub").click(function() {
		if(pwcheck && pwcheck2)
		$(".pw_form").attr("action","./PwUpdate.me"); //action 생성
		else{
			alert("양식을 맞춰주세요");
		}
	});


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
	
	$(".delete_btn").click(function(){
		if(confirm("정말 회원탈퇴를 하시겠습니까?")){
			$(".delete_form").attr("action","./MemberDeleteAction.me");
		}
	});
</script>
</html>
