<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js" ></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<link rel="stylesheet" href="./css/login.css">
   <!-- 
     로그인 페이지 
     ID,PW를 입력받아서 전달페이지 
   -->
   <div class="clear">
   <div class="back"></div>
   <div class="modal"><div class="dimmed"></div>
      <div class="dimmed"></div>
      <section class="signin_modal">
        <header class="header">
        <img id="icon_brand_logo" class="brand_logo"  src="./img/logo.png">
        
        </header>
        <form class="main_form" action="./MemberLoginAction.me" method="post"> 
          
  		<label class="atom_field">
   		 <span class="label visually_hidden">이메일</span>
    		<input class="login_input email" type="email"  name="m_email" autofocus="true" placeholder="이메일">
  </label>

          
  <label class="atom_field">
    <span class="label visually_hidden">비밀번호</span>
    <input class="login_input pwd" type="password" name="m_pw" placeholder="비밀번호">
  </label>

          
  <input class="atom_button button signin e-confirm" value="로그인" type="submit">

        </form>
        <div class="sub_form">
          <p>비밀번호를 잊어버리셨나요?</p>
          <a class="find_password">비밀번호 찾기</a>
        </div>

       <div class="footer_form">
       
          <div class="social">
          <div class="kakao_btn" id="kakaoLogin"></div>
          <div class="naver_btn" id="naverIdLogin"></div>
          

           <!--  <a data-type="facebook" href="https://facebook.com/dialog/oauth?response_type=code&amp;client_id=1101702136522636&amp;redirect_uri=https%3A%2F%2Fwww.inflearn.com%2Fauth%2Ffacebook&amp;scope=email" class="button facebook_auth oauth2" rel="noreferrer noopener">
              <i class="fab fa-facebook-f"></i>
              <span>페이스북 로그인</span>
            </a>
            <a data-type="google" href="https://accounts.google.com/o/oauth2/v2/auth?access_type=offline&amp;prompt=consent&amp;scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&amp;response_type=code&amp;client_id=887875630717-ror9t8ig4obhvokdij07eoochpqbu5kf.apps.googleusercontent.com&amp;redirect_uri=https%3A%2F%2Fwww.inflearn.com%2Fauth%2Fgoogle" class="button google_auth oauth2" rel="noreferrer noopener">
              <i class="fab fa-google"></i>
              <span>구글 로그인</span>
            </a>
            <a data-type="github" href="https://github.com/login/oauth/authorize?response_type=code&amp;client_id=5fd8e44b142806d9cbea&amp;redirect_uri=https%3A%2F%2Fwww.inflearn.com%2Fauth%2Fgithub&amp;scope=user%3Aemail" class="button github_auth" rel="noreferrer noopener">
              <i class="fab fa-github"></i>
              <span>깃허브 로그인</span>
            </a> -->
          </div>
        </div> 
        <div class="sub_form">
          <p>아직 코딩팜 회원이 아니신가요?</p>
          <a href="MemberJoin.me">회원가입하기</a>
        </div>
      </section>
    </div>      
</div>


<script type="text/javascript">
	

	$(".back").click(function(){
		
		$(".login_form").html(" ");
	});
</script>

<form class="apiAction" action="./apiLoginAction.me" method="post">
<input type="hidden" id="m_email" name="m_email" value="a">
<input type="hidden" id="m_pw" name="m_pw" value="a">
<input type="hidden" id="m_nick" name="m_nick" value="a">
</form>
<script type="text/javascript">
$(document).ready(function(){
	
Kakao.init('c95ddde2f236e0f76a1f9ee16378769a');
Kakao.Auth.createLoginButton({
	  container: '#kakaoLogin',
	  success: function(response) {
	  
	    Kakao.API.request({
	        url: '/v2/user/me',
	        success: function(response) {
	            console.log(response);
	         
	            $('#m_email').val(response.kakao_account.email);
	            $('#m_pw').val(response.id);
	            $('#m_nick').val(response.properties.nickname);
	            $('.apiAction').submit();
	            
	        },
	        fail: function(error) {
	            console.log(error);
	        }
	    });
	  },
	  fail: function(error) {
	    console.log(error);
	  },
	});
});




	</script>
<script>
		
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "n1A2gvk1H0li6JGsisBI",
			callbackUrl: "http://localhost:8090/CodeFarm/naverLogin.me",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 50} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
		
		
		
	</script> 


