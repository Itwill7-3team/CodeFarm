<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<section class="email_form">
	<div>
	<img alt="" src="./img/logo.png">
		<p>
		비밀번호를 잃어버리셨나요?<br>
인프런에 가입한 이메일을 정확히 입력해 주세요.<br>
이메일을 통해 비밀번호 수정 링크가 전송됩니다.
		</p>
		<form action="./MemberPwAction.me" method="post">
	<input type="email" name="m_email" class="input_email" placeholder="가입한 이메일을 입력해주세요.">
	<br>
	<input type="submit" class="btn_pw" value="비밀번호 찾기">
	
	</form>
	</div>

</section>

 <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>