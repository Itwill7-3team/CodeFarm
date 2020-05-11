<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>

   <!-- 
     로그인 페이지 
     ID,PW를 입력받아서 전달페이지 
   -->

	
   <section class="signin_modal">
        <header class="header">
          <svg width="16" id="icon_brand_logo" class="brand_logo" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 433 90"><img src="./img/logo.png"></svg>

        </header>
        <form class="main_form" action="./MemeberLoginAction.me" method="post">
          
  <label class="atom_field">
    <span class="label visually_hidden">이메일</span>
    <input class="input email" name="m_email" type="email" autofocus="true" placeholder="이메일">
  </label>

          
  <label class="atom_field">
    <span class="label visually_hidden">비밀번호</span>
    <input class="input pwd" name="m_pw" type="password" placeholder="비밀번호">
  </label>

          
  <input type="submit" class="atom_button button signin e-confirm" value="로그인">


        </form>
        <div class="sub_form">
          <p>비밀번호를 잊어버리셨나요?</p>
          <a class="find_password">비밀번호 찾기</a>
        </div>

        <!-- <div class="footer_form">
          <div class="social">
            <a data-type="facebook" href="https://facebook.com/dialog/oauth?response_type=code&amp;client_id=1101702136522636&amp;redirect_uri=https%3A%2F%2Fwww.inflearn.com%2Fauth%2Ffacebook&amp;scope=email" class="button facebook_auth oauth2" rel="noreferrer noopener">
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
            </a>
          </div>
        </div> -->
        <div class="sub_form">
          <p>아직 인프런 회원이 아니신가요?</p>
          <a href="/signup">회원가입하기</a>
        </div>
      </section>
      
      
      
      
   
   
   
   
   
   <jsp:include page="/include/footer.jsp"></jsp:include>
   
   
   
   
   
   
   
   
   
</body>
</html>