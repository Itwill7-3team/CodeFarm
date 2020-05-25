<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="./css/footer.css" rel="stylesheet">
<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<footer>
<div class="container">
  <div class="footer_top menu_list_cover">
	<div class="menu_list">
          <div class="list_title">코딩팜</div>
          <div class="menu_sublist">
            <a href="#" class="list_link">공지사항</a>
            <a href="#" class="list_link">코딩팜 소개</a>
            <a href="#" class="list_link">코딩팜 이야기</a>
           
          </div>
       </div>
       
       <div class="menu_list">
          <div class="list_title">고객센터</div>
          <div class="menu_sublist">
            <a href="#" class="list_link">자주 묻는 질문</a>
            <a href="#" class="list_link">이용약관 </a>
            <a href="#" class="list_link">개인정보취급방침</a>
           
          </div>
       </div>
       
       <div class="menu_list">
          <div class="list_title">신청하기</div>
          <div class="menu_sublist">
            <a href="#" id="fot_tech" class="list_link">지식공유참여</a>

           
          </div>
       </div>
       
       <div class="menu_list">
          <div class="list_title">학습하기</div>
          <div class="menu_sublist">
            <a href="#" class="list_link">IT 프로그래밍</a>
            <a href="#" class="list_link">크리에이티브</a>
            <a href="#" class="list_link">업무스킬</a>
           
          </div>
       </div>
       
        <div class="menu_list">
          <div class="list_title">커뮤니티</div>
          <div class="menu_sublist">
            <a href="#" class="list_link">묻고 답하기</a>
            <a href="#" class="list_link">수강평 모아보기</a>
            <a href="#" class="list_link">강의/기능 요청</a>
           
          </div>
       </div>
  </div>
  <hr>
  
  <div class="footer_bottom">
  <div class="footer_info_top">
           <img class="foot_logo" src="./img/logo.png">|
            <span><a class="foot_info" href="#">개인정보취급방침</a></span>|
            <span><a class="foot_info" href="#">이용약관</a></span>
          </div>
  <div class="footer_info_bottom">
            <div class="first">
              (주)코딩팜 사업자 정보
            </div>
            <div class="center">
              <span>(주)코딩팜 |</span>
              <span>대표자 : 변재정 |</span> <span>사업자번호 : 000-00-00000 |</span><br>
              <span>개인정보보호책임자 : 이소영 |</span> <span>개발자 : 김홍준, 최우영, 이소영, 조수아, 정민수, 변재정 </span><br>
              <span>주소 :부산광역시 부산진구 부전동 112-3번지 삼한골든게이트 7층 ㅣ</span> 이메일: qsz78547@naver.com
            </div>
            ©INFLAB. ALL RIGHTS RESERVED
          </div>
  
  
  </div>
</div>
<script type="text/javascript">
//강사 신청 폼
	$("#fot_tech").click(function(){
	
		$.ajax({
			type : "POST",
			url : "./TechRequest.me",

			success : function(data) {

				$(".login_form").html(data);
			},
			error : function(xhr, status, error) {
				alert("error: " + error);
			}

		});
	});
	
	</script>
</footer>