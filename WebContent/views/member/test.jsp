<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
Kakao.init('c95ddde2f236e0f76a1f9ee16378769a');

</script>
</head>
<body>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naverIdLogin"></div>

<div id="kakaoLogin"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

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
<!-- // 네이버아이디로로그인 초기화 Script -->
</body>
</html>