<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name = "google-signin-client_id"content = "82824441748-b31f99jjaemf8p813v0qgd9igdtmcul7.apps.googleusercontent.com">
<script type="text/javascript">
Kakao.init('c95ddde2f236e0f76a1f9ee16378769a');
gapi.auth2.init (
		{
			client_id : '82824441748-b31f99jjaemf8p813v0qgd9igdtmcul7.apps.googleusercontent.com'
		});
</script>
</head>
<body>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naverIdLogin"></div>
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<div id="kakaoLogin"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->
<a data-type="google" href="https://accounts.google.com/o/oauth2/v2/auth?access_type=offline&amp;prompt=consent&amp;scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&amp;response_type=code&amp;client_id=887875630717-ror9t8ig4obhvokdij07eoochpqbu5kf.apps.googleusercontent.com&amp;redirect_uri=https%3A%2F%2Flocalhost:8090/CodeFarm/test.me%2Fauth%2Fgoogle" class="button google_auth oauth2" rel="noreferrer noopener">
              <i class="fab fa-google"></i>
              <span>구글 로그인</span>
<form class="apiAction" action="./apiLoginAction.me" method="post">
<input type="hidden" id="m_email" name="m_email" value="a">
<input type="hidden" id="m_pw" name="m_pw" value="a">
<input type="hidden" id="m_nick" name="m_nick" value="a">
</form>
<script type="text/javascript">


Kakao.Auth.createLoginButton({
  container: '#kakaoLogin',
  success: function(response) {
  
    Kakao.API.request({
        url: '/v2/user/me',
        success: function(response) {
            console.log(response);
            alert(response.kakao_account.email);
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




</script>

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "n1A2gvk1H0li6JGsisBI",
			callbackUrl: "http://localhost:8090/CodeFarm/naverLogin.me",
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>

<script type="text/javascript">
naverLogin.getLoginStatus(function (status) {
	if (status) {
		var email = naverLogin.user.getEmail();
		var name = naverLogin.user.getNickName();
	
		var uniqId = naverLogin.user.getId();
		 alert(uniqId); 
		 $('#m_email').val(email);
         $('#m_pw').val(uniqId);
         $('#m_nick').val(name);
         $('.apiAction').submit();
        
		
			} else {
		console.log("AccessToken이 올바르지 않습니다.");
	}
});
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->

<script type="text/javascript">
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>
</body>
</html>