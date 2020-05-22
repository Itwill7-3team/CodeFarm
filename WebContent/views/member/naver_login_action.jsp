<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<form class="apiAction" action="./apiLoginAction.me" method="post">
<input type="hidden" id="m_email" name="m_email" value="a">
<input type="hidden" id="m_pw" name="m_pw" value="a">
<input type="hidden" id="m_nick" name="m_nick" value="a">
</form>

<script type="text/javascript">
var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "n1A2gvk1H0li6JGsisBI",
			callbackUrl: "http://localhost:8090/CodeFarm/MemberLogin.me",
			isPopup: false,
			callbackHandle: false
		}
	);


	
naverLogin.getLoginStatus(function (status) {
	if (status) {
		var email = naverLogin.user.getEmail();
		var name = naverLogin.user.getName();
	
		var uniqId = naverLogin.user.getId();

		 $('#m_email').val(email);
         $('#m_pw').val(uniqId);
         $('#m_nick').val(name);
         $('.apiAction').submit();
        
		
			} else {
		console.log("AccessToken이 올바르지 않습니다.");
	}
});
</script>
</body>
</html>