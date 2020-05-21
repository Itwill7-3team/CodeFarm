<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./css/tech_request.css">
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
        <form class="main_form" action="./MemberTechRequestAction.me" method="post"> 
        
          
  		<label class="atom_field">
   		 <span class="label visually_hidden">이름(실명)</span>
    		<input class="input name" type="text"  name="m_name" autofocus="true" placeholder="이름">
  </label>

          
  <label class="atom_ph">
  <span class="label visually_hidden">전화번호</span>
  
    <div class="ph_input">
    <input class="input phone1" type="text" name="m_phone" placeholder="010">-
    <input class="input phone" type="text" name="m_phone2" placeholder="1234">-
    <input class="input phone" type="text" name="m_phone3" placeholder="6578">
    </div>
    
  </label>
  
  <label class="atom_field">
    <span class="label visually_hidden">깃,블로그 주소</span>
    <input class="input addr" type="text" name="m_addr" placeholder="ex) asdf@naver.com, asd@github.com">
  
  </label>
  
  <label class="atom_field">
    <span class="label visually_hidden">자기소개</span>
	<textarea rows="20" cols="10" placeholder="간단한 자기소개를 해주세요."></textarea>  
  </label>

          
  <input class="atom_button button signin e-confirm" value="강사 신청하기" type="submit">

        </form>
       
      </section>
    </div>      
</div>


<script type="text/javascript">
	$(".back").click(function(){
		
		$(".clear").html(" ");
	});
</script>