<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String m_email = (String)session.getAttribute("m_email");
if(m_email == null){
	%>
	<script type="text/javascript">
		alert("로그인 후 이용해주세요.");
		location.reload(true);
		location.href = location.href;
		history.go(0);
	
	</script>
	<%
}
%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./css/tech_request.css?ver=1">
   <!-- 
     로그인 페이지 
     ID,PW를 입력받아서 전달페이지 
   -->
   <div class="clear">
   <div class="back"></div>
   <div class="request_modal"><div class="dimmed"></div>
      <div class="dimmed"></div>
      <section class="signin_modal">
        <header class="request_header">
        <img id="icon_brand_logo" class="brand_logo"  src="./img/logo.png">
        
        </header>
        <form class="main_form" action="./MemberTechRequestAction.me" method="post"> 
        
          
  		<label class="atom_field">
   		 <span class="modal_label visually_hidden">이름(실명)</span>
    		<input class="input name" type="text"  name="m_name" autofocus="true" placeholder="이름">
  </label>

          
  <label class="atom_ph">
  <span class="modal_label visually_hidden">전화번호</span>
  
    <div class="ph_input">
    <input class="modal_input phone1" type="text" name="m_phone" placeholder="010">-
    <input class="modal_input phone" type="text" name="m_phone2" placeholder="0000">-
    <input class="modal_input phone" type="text" name="m_phone3" placeholder="0000">
    </div>
    
  </label>
  
  <label class="atom_field">
    <span class="modal_label visually_hidden">깃,블로그 주소</span>
    <input class="modal_input addr" type="text" name="m_addr" placeholder="ex) asdf@naver.com, asd@github.com">
  
  </label>
  
  <label class="atom_field">
    <span class="modal_label visually_hidden">자기소개</span>
	<textarea rows="15" cols="10" placeholder="간단한 자기소개를 해주세요."></textarea>  
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